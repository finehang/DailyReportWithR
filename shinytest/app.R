library(maps)
library(mapproj)

source("FUN.R", encoding = "UTF8")

# 开始获取所有账户
# 设定初始链接
nexturl <- str_c("https://graph.facebook.com/v10.0/", BMID, "/owned_ad_accounts")
# 初始化账户变量
all_account <- tibble()
# 循环标志
flag <- T

# 开始获取所有账户
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



# 将所有账户ID分给集群
cluster_data_all <- all_account["account_id"] %>%
  partition(cluster)

# 集群开始工作, 使用自定义函数操作cluster_data集群数据, 并保存为result数据
tic()
result_data_183 <- cluster_data_all %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 183, Sys.Date()))
db_data_183 <- result_data_183 %>%
  collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
  mutate(detect_time = now()) %>%
  left_join(all_account, by = "account_id")
dbWriteTable(connfb, "account_183_status", db_data_183, overwrite = T) # 向account_status表中追加数据
rm(cluster_data_all)
rm(result_data_183)
gc()
toc()

# last 100 days need 133s -----------------------------------------------------------

true_ID_183 <- dbReadTable(connfb, "account_183_status") %>%
  filter(status_code == 1, detect_time == max(unique(detect_time))) %>%
  select(account_id)

cluster_data_183 <- true_ID_183 %>%
  partition(cluster)

tic()
result_data_100 <- cluster_data_183 %>% mutate(status_code = statusDetect(account_id, Sys.Date() - 100, Sys.Date()))
db_data_100 <- result_data_100 %>%
  collect() %>% # 从result数据中收集所需并与all_account连接组合, 准备写入数据库
  mutate(detect_time = now()) %>%
  left_join(all_account, by = "account_id")
dbWriteTable(connfb, "account_100_status", db_data_100, overwrite = T) # 向account_status表中追加数据
rm(cluster_data_183)
rm(result_data_100)
gc()
toc()




# 获取昨日消耗 need 36s -----------------------------------------------------------------

tic()
spendID_3 <- dbReadTable(connfb, "account_3_status") %>%
  filter(status_code == 1, detect_time == max(unique(detect_time))) %>%
  select(account_id)

cluster_spend_1 <- spendID_3 %>%
  partition(cluster = cluster)

Spend_1 <- cluster_spend_1 %>% # 对集群进行操作注意使用mutate以及map
  mutate(spend_data = map(.x = account_id, ~ get_spend(.x, Sys.Date() - 1, Sys.Date() - 1)))

df_1 <- Spend_1 %>%
  collect() %>%
  as_tibble() %>%
  select(-account_id) %>%
  unnest(cols = c(spend_data)) %>%
  mutate(spend = as.double(spend))

rm(cluster_spend_1)
gc()

df_1 %>%
  summary()

sum(df_1$spend)
toc()



counties <- readRDS("data/counties.rds")

ui <- fluidPage(
  titlePanel("censusVis"),

  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2010 US Census."),

      selectInput("var",
        label = "Choose a variable to display",
        choices = c(
          "Percent White", "Percent Black",
          "Percent Hispanic", "Percent Asian"
        ),
        selected = "Percent White"
      ),

      sliderInput("range",
        label = "Range of interest:",
        min = 0, max = 100, value = c(0, 100)
      )
    ),

    mainPanel(plotOutput("map"))
  )
)

server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var,
      "Percent White" = counties$white,
      "Percent Black" = counties$black,
      "Percent Hispanic" = counties$hispanic,
      "Percent Asian" = counties$asian
    )

    color <- switch(input$var,
      "Percent White" = "darkgreen",
      "Percent Black" = "black",
      "Percent Hispanic" = "darkorange",
      "Percent Asian" = "darkviolet"
    )

    legend <- switch(input$var,
      "Percent White" = "% White",
      "Percent Black" = "% Black",
      "Percent Hispanic" = "% Hispanic",
      "Percent Asian" = "% Asian"
    )

    percent_map(data, color, legend, input$range[1], input$range[2])
  })
}

shinyApp(ui, server)
