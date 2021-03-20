pacman::p_load("tidyverse", "multidplyr", "DBI", "lubridate", "httr", "tictoc")

cluster <- new_cluster(15) # 建立15核心的集群
cluster_library(cluster, c("tidyverse", "httr")) # 向集群加载包

# 导入口令
DBPWD <- Sys.getenv("MYSQL_PWD")
TOKEN <- Sys.getenv("FB_TOKEN")
BMID <- "1087814654714815"

# 使用本地ODBC建立数据库连接
connfb <- dbConnect(odbc::odbc(), "FacebookAccount")

# since <- today() - 183 # 默认起始日期
# until <- today() # 默认结束日期

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


# id %>% get_spend(yesterday, yesterday)

# 开始获取所有账户
# 设定初始链接
nexturl <- str_c("https://graph.facebook.com/v10.0/", BMID, "/owned_ad_accounts")

# 初始化账户变量
all_account <- tibble()
# 循环标志
flag <- T

# 获取所有账户
tic()
while (flag) {
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
toc()

# 测试
# all_account["account_id"][1:10, ] %>%
#   statusDetect(since = since, until = until) %>%
#   bind_cols(all_account["account_id"][1:10, ])

# 将自定义函数及数据复制进各个线程内
cluster_copy(cluster, c("statusDetect", "TOKEN", "get_spend"))

# 将所有账户ID分给集群
cluster_data <- all_account["account_id"] %>%
  partition(cluster)
  

# 集群开始工作, 使用自定义函数操作cluster_data集群数据, 并保存为result数据
tic()
result_data <- cluster_data %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 183, Sys.Date()))
db_data <- result_data %>%
  collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
  mutate(detect_time = now()) %>%
  left_join(all_account, by = "account_id")
dbWriteTable(connfb, "account_status", db_data, append = T) # 向account_status表中追加数据
toc()

# cluster_call(cluster, search())
# cluster_call(cluster, ls())

true_ID <- dbReadTable(connfb, "account_status") %>% 
  filter(status_code == 1, detect_time == max(unique(detect_time))) %>% 
  select(account_id)

yesterday <- today() - 1

cluster_spend_data <- true_ID %>%
  partition(cluster = cluster)



tic()
true_spend <- cluster_spend_data %>% # 对集群进行操作注意使用mutate以及map
  mutate(spend_data = map(.x = account_id, ~get_spend(.x, Sys.Date() - 1, Sys.Date() - 1)))
toc()

df <- true_spend %>% collect() %>% 
  as_tibble() %>%
  select(-account_id) %>% 
  unnest(cols = c(spend_data)) %>% 
  mutate(spend = as.double(spend))

df %>% 
  summary()

sum(df$spend)
