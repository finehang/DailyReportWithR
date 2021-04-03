pacman::p_load("tidyverse", "multidplyr", "DBI", "lubridate", "httr", "tictoc")
setwd("C:/Share")
message("Initializing......")
tic()
cluster <- new_cluster(40) # 建立50核心的集群
cluster_library(cluster, c("tidyverse", "httr", "lubridate")) # 向集群加载包

# 导入口令
DBPWD <- Sys.getenv("MYSQL_PWD")
TOKEN <- Sys.getenv("FB_TOKEN")
BMID <- "1087814654714815"

# 使用本地ODBC建立数据库连接, 使用SQLite
confb <- dbConnect(odbc::odbc(), "account", timeout = 10)

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
    return(temp)
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
      # Sys.sleep(60)
      message("Fatel Error!!!")
      paste0("--", cndMessage, "--")
      beepr::beep(sound = sample(c(1:11), 1))
    },
    while (T) {
      while (hour(now()) >= 9 & hour(now()) <= 18) {
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
        while (flag & n <= 10) {
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

        # 将所有账户ID分给集群
        cluster_data_all <- all_account["account_id"] %>%
          partition(cluster)

        # 集群开始工作, 使用自定义函数操作cluster_data集群数据, 并保存为result数据
        message("Start to Deal With 183IDs, 480s are required!")
        tic()
        message(str_c("Now is ", now()))
        result_data_183 <- cluster_data_all %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 183, Sys.Date()))
        db_data_183 <- result_data_183 %>%
          collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          left_join(all_account, by = "account_id") %>% 
          mutate(detect_time = now())
        
        dbWriteTable(connfb, "account_183_status", db_data_183, append = T) # 向account_status表中追加数据
        readr::write_excel_csv(db_data_183, file = "./account_183_status.csv")
        rm(cluster_data_all)
        rm(result_data_183)
        gc()
        message("183IDs Complete! Time Spent: ")
        toc()

        # last 100 days need 133s -------------------------------------------------

        message("Start to Deal With 100IDs,  120s are required!")
        message(str_c("Now is ", now()))
        true_ID_183 <- readr::read_csv("./account_183_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

        true_ID_183 <- dbGetQuery(connfb, "select account_id from account_183_status where status_code == 1 and detect_time == ")
        
        cluster_data_183 <- true_ID_183 %>%
          partition(cluster)

        tic()
        result_data_100 <- cluster_data_183 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 100, Sys.Date()))
        db_data_100 <- result_data_100 %>%
          collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          # mutate(detect_time = now()) %>%
          left_join(all_account, by = "account_id")
        # dbWriteTable(connfb, "account_100_status", db_data_100, overwrite = T) # 向account_status表中追加数据
        readr::write_excel_csv(db_data_100, file = "./account_100_status.csv")
        rm(cluster_data_183)
        rm(result_data_100)
        gc()
        message("100IDs Complete! Time Spent: ")
        toc()

        # last 35 days need 80s ------------------------------------------------------------
        message("Start to Deal With 30IDs, 80s are required!")
        message(str_c("Now is ", now()))
        true_ID_100 <- readr::read_csv("./account_100_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

        cluster_data_100 <- true_ID_100 %>%
          partition(cluster)

        tic()
        result_data_35 <- cluster_data_100 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 35, Sys.Date()))
        db_data_35 <- result_data_35 %>%
          collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          # mutate(detect_time = now()) %>%
          left_join(all_account, by = "account_id")
        # dbWriteTable(connfb, "account_35_status", db_data_35, overwrite = T) # 向account_status表中追加数据
        readr::write_excel_csv(db_data_35, file = "./account_35_status.csv")
        rm(cluster_data_100)
        rm(result_data_35)
        gc()
        message("30IDs Complete! Time Spent: ")
        toc()

        # last 10 days need 49s ------------------------------------------------------------
        message("Start to Deal With 10IDs,  60s are required!")
        message(str_c("Now is ", now()))
        true_ID_35 <- readr::read_csv("./account_35_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

        cluster_data_35 <- true_ID_35 %>%
          partition(cluster)

        tic()
        result_data_10 <- cluster_data_35 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 10, Sys.Date()))
        db_data_10 <- result_data_10 %>%
          collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          # mutate(detect_time = now()) %>%
          left_join(all_account, by = "account_id")
        # dbWriteTable(connfb, "account_10_status", db_data_10, overwrite = T) # 向account_status表中追加数据
        readr::write_excel_csv(db_data_10, file = "./account_10_status.csv")
        rm(cluster_data_35)
        rm(result_data_10)
        gc()
        message("10IDs Complete! Time Spent: ")
        toc()

        # last 3 days need 32s -------------------------------------------------------------
        message("Start to Deal With 3IDs, 40s are required!")
        message(str_c("Now is ", now()))
        true_ID_10 <- readr::read_csv("./account_10_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

        cluster_data_10 <- true_ID_10 %>%
          partition(cluster)

        tic()
        result_data_3 <- cluster_data_10 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 3, Sys.Date()))
        db_data_3 <- result_data_3 %>%
          collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
          # mutate(detect_time = now()) %>%
          left_join(all_account, by = "account_id")
        # dbWriteTable(connfb, "account_3_status", db_data_3, overwrite = T) # 向account_status表中追加数据
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
        spendID_90 <- readr::read_csv("./account_100_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)
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
            updateTime = as.character(now())
          )
        # dbWriteTable(connfb, "spend_quarter", df_90, overwrite = T)
        readr::write_excel_csv(df_90, file = "./spend_quarter.csv")
        rm(cluster_spend_90)
        gc()
        message("Get Quarter Spend Complete! Time Spent: ")
        toc()

        # 获取月度消耗 need 154s ------------------------------------------------------------------
        message("Start to Get Month Spend, 60s are required!")
        message(str_c("Now is ", now()))
        tic()
        spendID_30 <- readr::read_csv("./account_35_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)
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
            updateTime = as.character(now())
          )
        # dbWriteTable(connfb, "spend_month", df_30, overwrite = T)
        readr::write_excel_csv(df_30, file = "./spend_month.csv")
        rm(cluster_spend_30)
        gc()
        message("Get Month Spend Complete! Time Spent: ")
        toc()

        # 获取昨日消耗 need 36s -----------------------------------------------------------------
        message("Start to Get Yesterday Spend, 40s are required!")
        message(str_c("Now is ", now()))
        tic()
        spendID_3 <- readr::read_csv("./account_3_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

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
            updateTime = as.character(now())
          )
        # dbWriteTable(connfb, "spend_yesterday", df_1, overwrite = T)
        readr::write_excel_csv(df_1, file = "./spend_yesterday.csv")
        rm(cluster_spend_3)
        gc()
        message("Get Yesterday Spend Complete! Time Spent: ")
        toc()

        # 获取今日消耗 need 36s -----------------------------------------------------------------
        message("Start to Get Today Spend, 30s are required!")
        message(str_c("Now is ", now()))
        tic()
        spendID_0 <- readr::read_csv("./account_3_status.csv", col_types = "cdTc") %>%
          filter(status_code == 1) %>%
          select(account_id)

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
            updateTime = as.character(now())
          )
        # dbWriteTable(connfb, "spend_yesterday", df_1, overwrite = T)
        readr::write_excel_csv(df_0, file = "./spend_today.csv")
        rm(cluster_spend_0)
        gc()
        message("Get today Spend Complete! Time Spent: ")
        toc()
        
        for (i in c(1:700)) {
          Sys.sleep(2)
          message(str_c("Now is ", now()))
          message("Standing By......")
          message(praise::praise())
        }
      }
    }
  )
}