pacman::p_load("tidyverse", "multidplyr", "DBI", "lubridate", "httr", "tictoc")

cluster <- new_cluster(50) # 建立50核心的集群
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

# 将自定义函数及数据复制进各个线程内
cluster_copy(cluster, c("statusDetect", "TOKEN", "get_spend"))