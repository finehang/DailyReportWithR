pacman::p_load("tidyverse", "multidplyr", "DBI", "lubridate", "httr", "tictoc")
setwd("C:/Share")
message("Initializing......")
tic()
cluster <- new_cluster(10) # 建立50核心的集群
cluster_library(cluster, c("tidyverse", "httr", "lubridate")) # 向集群加载包

# 导入口令
DBPWD <- Sys.getenv("MYSQL_PWD")
TOKEN <- Sys.getenv("FB_TOKEN")
BMID <- "1087814654714815"

# 使用本地ODBC建立数据库连接
connfb_local <- dbConnect(odbc::odbc(), "spend_local", timeout = 10)
# connfb_remote <- dbConnect(odbc::odbc(), "spend_remote", timeout = 10)

# 账户状态探测函数, 使用向量化编程, 使用map_*
statusDetect <- function(id, since, until) {
  range <- str_c("{'since':'", as.character(since), "','until':'", as.character(until), "'}") # 组合时间范围
  str_c("https://graph.facebook.com/v10.0/act_", as_vector(id), "/insights") %>% # 组合向量化URL头部
    map_dbl(~ GET(url = .x, query = list(fields = "spend", time_range = range, access_token = TOKEN)) %>% # 向量化GET消耗数据
      content() %>% # 获取结果内容
      `$`(data) %>%
      length()) %>% # 获取spend长度, 无消耗为0, 有消耗为1
    return() # 并返回
}

get_spend <- function(id, since, until) {
  date_range <- str_c("{'since':'", as.character(since), "','until':'", as.character(until), "'}") # 组合时间范围
  spendcontent <- str_c("https://graph.facebook.com/v10.0/act_", as_vector(id), "/insights/") %>%
    map_dfr(~ GET(url = .x, query = list(level = "account", fields = "spend,account_id,account_name", time_range = date_range, access_token = TOKEN)) %>%
      content())
  spendcontent$data %>%
    map_dfr(~ as_tibble(.)) %>%
    return()
}

# 将自定义函数及数据复制进各个线程内
cluster_copy(cluster, c("statusDetect", "TOKEN", "get_spend"))
message("Initialization complete, Time Spent:")
toc()

message("Loop Start!")

while (T) {
  tryCatch(
    error = function(cnd) {
      cndMessage <- as.character(conditionMessage(cnd))
      message("Fatel Error!!!")
      paste0("--", cndMessage, "--")
      beepr::beep(sound = sample(c(1:11), 1))
    },
    if (T) {
      message("Mession Start!")
      # 开始获取所有账户
      # 设定初始链接
      nexturl <- str_c("https://graph.facebook.com/v10.0/", BMID, "/owned_ad_accounts")
      # 初始化账户变量
      all_account <- tibble()
      # 循环标志
      flag <- T
      n <- 1

      # 开始获取所有账户
      message("Start to Get All Accounts, 40s are required! ")
      tic()
      while (flag & n <= 20) {
        n <- n + 1
        content <- GET(nexturl, query = list(fields = "account_id,created_time", access_token = TOKEN, limit = 5000)) %>%
          content() # 获取URL的内容
        all_account <- content$data %>% # 将URL内容的data部分转为tibble与all_account合并, 再赋给all_account
          map_dfr(~ as_tibble(.)) %>%
          bind_rows(all_account)
        if (!is_null(content$paging$`next`)) { # next有值则有下页, 更新URL, 否则没有下页, 将标志置否
          nexturl <- content$paging$`next`
        } else {
          flag <- F
        }
        print(str_c("Get ", nrow(all_account), " Accounts"))
      }
      message("Account Acquisition is Complete! Time Spent: ")
      toc()

      if (!exists("db_data_120")) {
        # 将所有账户ID分给集群
        cluster_data_all <- all_account["account_id"] %>%
          partition(cluster)
        # 集群开始工作, 使用自定义函数操作cluster_data集群数据, 并保存为result数据
        message("Start to Deal With 120IDs, 480s are required!")
        tic()
        message(str_c("Now is ", now()))
        db_data_120 <- cluster_data_all %>%
          mutate(status_code = statusDetect(account_id, Sys.Date() - 120, Sys.Date())) %>%
          collect() %>%
          # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          left_join(all_account, by = "account_id")

        dbWriteTable(connfb_local, "account_120_status", db_data_120, overwrite = T) # 向account_status表中追加数据
        readr::write_excel_csv(db_data_120, file = "./account_120_status.csv")
        start_length <- nrow(db_data_120)
        rm(cluster_data_all)
        gc()
        message("120IDs Complete! Time Spent: ")
        toc()
      } else if (nrow(all_account) != nrow(db_data_120)) {
        message(str_c("Find ", nrow(all_account) - nrow(db_data_120), " New IDs"))
        # 反连接, 找出2表有, 1表没有的
        diff_id <- all_account %>%
          anti_join(db_data_120, by = "account_id") %>%
          select(account_id)

        cluster_diff <- diff_id["account_id"] %>%
          partition(cluster)

        diff_id_data <- cluster_diff %>%
          mutate(status_code = statusDetect(account_id, Sys.Date() - 120, Sys.Date())) %>%
          collect() %>%
          # 以all_account为准
          left_join(all_account, by = "account_id") %>%
          bind_rows(db_data_120)

        message(str_c("Adding ", nrow(diff_id), " Accounts"))
        dbWriteTable(connfb_local, "account_120_status", diff_id_data, overwrite = T) # 向account_status表中追加数据
        readr::write_excel_csv(diff_id_data, file = "./account_120_status.csv")
      } else {
        message("Do Not Need to Refresh")
      }
      # 新增户数超过200, 则重新统计
      if (nrow(all_account) - start_length > 200) {
        rm(db_data_120)
      }

      # last 100 days need 133s -------------------------------------------------

      message("Start to Deal With 100IDs,  120s are required!")
      message(str_c("Now is ", now()))
      # true_ID_120 <- readr::read_csv("./account_120_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      true_ID_120 <- dbGetQuery(connfb_local, "select account_id from account_120_status where status_code = 1")

      cluster_data_120 <- true_ID_120 %>%
        partition(cluster)

      tic()
      db_data_100 <- cluster_data_120 %>%
        mutate(status_code = statusDetect(account_id, Sys.Date() - 100, Sys.Date())) %>%
        collect() %>%
        # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
        left_join(all_account, by = "account_id")
      dbWriteTable(connfb_local, "account_100_status", db_data_100, overwrite = T) # 向account_status表中追加数据
      readr::write_excel_csv(db_data_100, file = "./account_100_status.csv")
      rm(cluster_data_120)
      gc()
      message("100IDs Complete! Time Spent: ")
      toc()

      # last 35 days need 80s  --------------------------------------------------

      message("Start to Deal With 30IDs, 80s are required!")
      message(str_c("Now is ", now()))
      # true_ID_100 <- readr::read_csv("./account_100_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      true_ID_100 <- dbGetQuery(connfb_local, "select account_id from account_100_status where status_code = 1")

      cluster_data_100 <- true_ID_100 %>%
        partition(cluster)

      tic()
      result_data_35 <- cluster_data_100 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 35, Sys.Date()))
      db_data_35 <- result_data_35 %>%
        collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
        left_join(all_account, by = "account_id")
      dbWriteTable(connfb_local, "account_35_status", db_data_35, overwrite = T) # 向account_status表中追加数据
      readr::write_excel_csv(db_data_35, file = "./account_35_status.csv")
      rm(cluster_data_100)
      rm(result_data_35)
      gc()
      message("30IDs Complete! Time Spent: ")
      toc()

      # last 3 days need 32s -------------------------------------------------------------
      message("Start to Deal With 3IDs, 40s are required!")
      message(str_c("Now is ", now()))
      # true_ID_10 <- readr::read_csv("./account_35_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      true_ID_10 <- dbGetQuery(connfb_local, "select account_id from account_35_status where status_code = 1")

      cluster_data_10 <- true_ID_10 %>%
        partition(cluster)

      tic()
      result_data_3 <- cluster_data_10 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 3, Sys.Date()))
      db_data_3 <- result_data_3 %>%
        collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
        # mutate(detect_time = now()) %>%
        left_join(all_account, by = "account_id")

      dbWriteTable(connfb_local, "account_3_status", db_data_3, overwrite = T) # 向account_status表中追加数据
      readr::write_excel_csv(db_data_3, file = "./account_3_status.csv")
      rm(cluster_data_10)
      rm(result_data_3)
      gc()
      message("3IDs Complete! Time Spent: ")
      toc()

      # 获取季度消耗 need 154s ------------------------------------------------------------------
      message("Start to Get Quarter Spend, 80s are required!")
      message(str_c("Now is ", now()))
      tic()
      # spendID_90 <- readr::read_csv("./account_100_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      spendID_90 <- dbGetQuery(connfb_local, "select account_id from account_100_status where status_code = 1")

      cluster_spend_90 <- spendID_90 %>%
        partition(cluster = cluster)

      Spend_90 <- cluster_spend_90 %>% # 对集群进行操作注意使用mutate以及map
        mutate(spend_data = map(.x = account_id, ~ get_spend(.x, switch(quarter(now()),
          "1" = "2021-1-1",
          "2" = "2021-4-1",
          "3" = "2021-7-1",
          "4" = "2021-10-1"
        ), Sys.Date())))
      df_90 <- Spend_90 %>%
        collect() %>%
        as_tibble() %>%
        select(-account_id) %>%
        unnest(cols = c(spend_data)) %>%
        mutate(
          spend = as.double(spend),
          update_time = as.character(now())
        )
      dbWriteTable(connfb_local, "spend_quarter", df_90, overwrite = T)
      readr::write_excel_csv(df_90, file = "./spend_quarter.csv")
      rm(cluster_spend_90)
      gc()
      message("Get Quarter Spend Complete! Time Spent: ")
      toc()

      # 获取月度消耗 need 154s ------------------------------------------------------------------

      if (month(now()) %in% c(1, 4, 7, 9)) {
        message("First Month of Quarter, Don't need to Refresh")
        df_30 <- df_90
      } else {
        message("Start to Get Month Spend, 60s are required!")
        message(str_c("Now is ", now()))
        tic()
        # spendID_30 <- readr::read_csv("./account_35_status.csv", col_types = "cdTc") %>%
        #   filter(status_code == 1) %>%
        #   select(account_id)

        spendID_30 <- dbGetQuery(connfb_local, "select account_id from account_35_status where status_code = 1")

        cluster_spend_30 <- spendID_30 %>%
          partition(cluster = cluster)

        Spend_30 <- cluster_spend_30 %>% # 对集群进行操作注意使用mutate以及map
          mutate(spend_data = map(.x = account_id, ~ get_spend(.x, str_c(year(now()), "-", month(now()), "-1"), Sys.Date())))
        df_30 <- Spend_30 %>%
          collect() %>%
          as_tibble() %>%
          select(-account_id) %>%
          unnest(cols = c(spend_data)) %>%
          mutate(
            spend = as.double(spend),
            update_time = as.character(now())
          )
      }
      dbWriteTable(connfb_local, "spend_month", df_30, overwrite = T)
      readr::write_excel_csv(df_30, file = "./spend_month.csv")
      rm(cluster_spend_30)
      gc()
      message("Get Month Spend Complete! Time Spent: ")
      toc()

      # 获取昨日消耗 need 36s -----------------------------------------------------------------
      message("Start to Get Yesterday Spend, 40s are required!")
      message(str_c("Now is ", now()))
      tic()
      # spendID_3 <- readr::read_csv("./account_3_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      spendID_3 <- dbGetQuery(connfb_local, "select account_id from account_3_status where status_code = 1")

      cluster_spend_3 <- spendID_3 %>%
        partition(cluster = cluster)

      Spend_1 <- cluster_spend_3 %>% # 对集群进行操作注意使用mutate以及map
        mutate(spend_data = map(.x = account_id, ~ get_spend(.x, Sys.Date() - 1, Sys.Date() - 1)))

      df_1 <- Spend_1 %>%
        collect() %>%
        as_tibble() %>%
        select(-account_id) %>%
        unnest(cols = c(spend_data)) %>%
        mutate(
          spend = as.double(spend),
          update_time = as.character(now())
        )
      dbWriteTable(connfb_local, "spend_yesterday", df_1, overwrite = T)
      dbWriteTable(connfb_local, "spend_history", df_1, append = T)
      readr::write_excel_csv(df_1, file = "./spend_yesterday.csv")
      rm(cluster_spend_3)
      gc()
      message("Get Yesterday Spend Complete! Time Spent: ")
      toc()

      # 获取今日消耗 need 36s -----------------------------------------------------------------
      message("Start to Get Today Spend, 30s are required!")
      message(str_c("Now is ", now()))
      tic()
      # spendID_0 <- readr::read_csv("./account_3_status.csv", col_types = "cdTc") %>%
      #   filter(status_code == 1) %>%
      #   select(account_id)

      spendID_0 <- dbGetQuery(connfb_local, "select account_id from account_3_status where status_code = 1")

      cluster_spend_0 <- spendID_0 %>%
        partition(cluster = cluster)

      Spend_0 <- cluster_spend_0 %>% # 对集群进行操作注意使用mutate以及map
        mutate(spend_data = map(.x = account_id, ~ get_spend(.x, Sys.Date(), Sys.Date())))

      df_0 <- Spend_0 %>%
        collect() %>%
        as_tibble() %>%
        select(-account_id) %>%
        unnest(cols = c(spend_data)) %>%
        mutate(
          spend = as.double(spend),
          update_time = as.character(now())
        )

      dbWriteTable(connfb_local, "spend_today", df_0, append = T)
      readr::write_excel_csv(df_0, file = "./spend_today.csv")
      rm(cluster_spend_0)
      gc()
      message("Get today Spend Complete! Time Spent: ")
      toc()
      message("Now Waiting 600s")
      Sys.sleep(600)
    } else {
      message(str_c("Now is ", now()))
      message("Standing by....")
      Sys.sleep(60)
    }
  )
}
