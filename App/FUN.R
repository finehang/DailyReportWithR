library(httr)
BMID <- "1087814654714815"

TOKEN <- Sys.getenv("FB_TOKEN")

url <- str_c("https://graph.facebook.com/v10.0/", BMID, "/owned_ad_accounts")

flag <- T
data <- tibble()
nexturl <- url
while (flag) {
  content <- GET(nexturl, query = list(fields = "account_id,name,created_time", access_token = TOKEN, limit = 5000)) %>%
    content()
  datatemp <- content$data %>%
    map_dfr(~ as_tibble(.))
  data <- bind_rows(data, datatemp)
  nexturl <- content$paging$`next`
  flag <- flag + 1
  if (!is_null(content$paging$`next`)) {
    nexturl <- content$paging$`next`
  } else {
    flag <- F
  }
  print(str_c("现已获取", nrow(data), "个账户"))
}

statusDetect <- function(id) {
  print(id)
  since <- today() - 183
  until <- today()
  range <- str_c("{'since':'", since, "','until':'", until, "'}")
  spendurl <- str_c("https://graph.facebook.com/v10.0/act_", id, "/insights")
  spendcontent <- GET(url = spendurl, query = list(fields = "spend", time_range = range, access_token = TOKEN)) %>%
    content() %>%
    `$`(data)
  return(length(spendcontent))
}

since <- "2021-2-17"
until <- "2021-3-17"

id <- "629058350841744"
get_spend(id, since = "2021-3-17", until = "2021-3-17")

get_spend(id, since, until)

get_spend <- function(id, since, until) {
  range <- str_c("{'since':'", since, "','until':'", until, "'}")
  spendurl <- str_c("https://graph.facebook.com/v10.0/act_", id, "/insights")
  spendcontent <- GET(url = spendurl, query = list(level = "account", fields = "spend, account_id, account_name", time_range = range, access_token = TOKEN)) %>%
    content()
  spendtemp <- spendcontent$data %>%
    map_dfr(~ as_tibble(.))
  if (length(spendtemp) == 0) {
    print("Miss")
    return(tibble())
  } else {
    print("Hit")
    print(id)
    return(spendtemp)
  }
}

make_url <- function(id) {
  since <- "2021-3-17"
  until <- "2021-3-17"
  range <- str_c("{'since':'", since, "','until':'", until, "'}")
  data <- map_dfr(id, ~ tibble(url = str_c("https://graph.facebook.com/v10.0/act_", ., "/insights?level=account&fields=spend,account_id,account_name&time_range=", range, "&access_token=", TOKEN)))
  return(data)
}

urlset <- data %>%
  select(account_id) %>%
  group_by(account_id) %>%
  group_split() %>%
  make_url()

a <- GET(url = as.character(urlset[1, ]))

urlset[1, ] %>% GET()

map(url_set, GET())


range <- str_c("{'since':'", since, "','until':'", until, "'}")
str_c("https://graph.facebook.com/v10.0/act_", id, "/insights?level=account&fields=spend,account_id,account_name&time_range=", range, "&access_token=", TOKEN)


dbWriteTable(confb, "account", data)

q <- dbSendQuery(confb, "select * from accoumt order by created_time")
