library(multidplyr)
cluster <- new_cluster(6)
cluster_library(cluster, c("dplyr", "tidyverse"))

DBPWD <- Sys.getenv("MYSQL_PWD")
TOKEN <- Sys.getenv("FB_TOKEN")
BMID <- "1087814654714815"

connf <- dbConnect(odbc::odbc(), .connection_string = str_c("Driver={MySQL ODBC 8.0 Unicode Driver};Driver={MySQL ODBC 8.0 Unicode Driver};Server={127.0.0.1};Database={facebookaccount};UID={root};PWD=", DBPWD, ";Port=3306"), timeout = 10)
since <- today() - 183
until <- today()

# todo 需要写成适合多线程调用的模式, 且线程内已有URL了, 函数内不需要重新组合

statusDetect <- function(id, since, until) {
  print(nrow(id))
  range <- str_c("{'since':'", as.character(since), "','until':'", as.character(until), "'}")
  spendurl <- str_c("https://graph.facebook.com/v10.0/act_", id, "/insights")
  data <- id %>%
    mutate(url = spendurl) %>%
    group_split(account_id) %>%
    map_dfr(~ tibble(status_code = GET(url = .$url, query = list(fields = "spend", time_range = range, access_token = TOKEN)) %>%
      content() %>%
      `$`(data) %>%
      length()))
  return(data)
}

# "498023791194376" %>% statusDetect(since, until)


# account_data[1:10,]["account_id"] %>% statusDetect(since = since, until = until)

nexturl <- str_c("https://graph.facebook.com/v10.0/", BMID, "/owned_ad_accounts")

account_data <- tibble()

flag <- T

while (flag) {
    content <- GET(nexturl, query = list(fields = "account_id,created_time", access_token = TOKEN, limit = 5000)) %>%
        content()
    datatemp <- content$data %>%
        map_dfr(~ as_tibble(.))
    account_data <- bind_rows(account_data, datatemp)
    nexturl <- content$paging$`next`
    flag <- flag + 1
    if (!is_null(content$paging$`next`)) {
        nexturl <- content$paging$`next`
    } else {
        flag <- F
    }
    print(str_c("Get ", nrow(account_data), " Accounts"))
}

db_data <- account_data["account_id"][1:1200,] %>% 
    partition(cluster)

# 将自定义函数复制进各个线程内
cluster_copy(cluster, "statusDetect")
# cluster_call(cluster, search())

range <- str_c("{'since':'", as.character(since), "','until':'", as.character(until), "'}")

# 组合url
# cluster_call(cluster, ls())
data_url <- db_data %>% 
    mutate(url = str_c("https://graph.facebook.com/v10.0/act_", account_id, "/insights"))

alldata <- data_url %>% mutate(code = statusDetect(account_id, Sys.Date() - 183, Sys.Date()))

db_data %>% mutate(code = statusDetect(account_id, Sys.Date() - 183, Sys.Date()))

account_data["account_id"][1:1200,] %>% statusDetect(Sys.Date() - 183, Sys.Date())

dbWriteTable(connf, "account_1", db_data, append = T)

message("Complete")

nn <- account_data[1:10,]["account_id"]

nn %>%
  mutate(url = spendurl) %>%
  group_split(account_id) %>%
  map_dfr(~ tibble(status_code = GET(url = .$url, query = list(fields = "spend", time_range = range, access_token = TOKEN)) %>%
    content() %>%
    `$`(data) %>%
    length()))


