pacman::p_load("tidyverse", "shinydashboard", "shiny", "DBI", "lubridate", "pastecs")
setwd("C:/Share")
connfb_local <- dbConnect(odbc::odbc(), "spend_local", timeout = 10)

# Yesterday <- readr::read_csv("./spend_yesterday.csv", col_types = "dccccc") %>%
#   arrange(-spend)
# Quarter <- readr::read_csv("./spend_quarter.csv", col_types = "dccccc") %>%
#   arrange(-spend)
# Month <- readr::read_csv("./spend_month.csv", col_types = "dccccc") %>%
#   arrange(-spend)
# Today <- readr::read_csv("./spend_today.csv", col_types = "dccccc") %>%
#   arrange(-spend)


ui <- fluidPage(
  titlePanel("Welcome to GatherOne"),
  sidebarLayout(
    sidebarPanel(
      helpText("Welcome"),
      selectInput("date",
        label = "Choose Date",
        choices = c(
          "Quarter", "Quarter",
          "Month", "Month",
          "Yesterday", "Yesterday",
          "Today", "Today"
        ),
        selected = "Yesterday"
      )
    ),
    mainPanel(
      plotOutput("p1"), 
      tableOutput("t0"),
      tableOutput("t1")
    )
  )
)

server <- function(input, output) {
  Quarter <- dbGetQuery(connfb_local, "select * from spend_quarter order by spend DESC")

  Month <- dbGetQuery(connfb_local, "select * from spend_month order by spend DESC")

  Yesterday <- dbGetQuery(connfb_local, "select * from spend_yesterday order by spend DESC")

  Today <- dbGetQuery(connfb_local, "select * from spend.spend_today where update_time = (select distinct(update_time) as date_time from spend.spend_today order by date_time desc limit 1)")

  History <- dbGetQuery(connfb_local, "select max(`sum`) as `sum`, `hour` from (SELECT sum(spend) as `sum`, hour(update_time) as `hour`  FROM spend.spend_today where DATE(update_time) = CURDATE() group by update_time) as `all` group by hour")


  Quarter_s <- Quarter$spend %>%
    stat.desc(basic = T, desc = T, norm = F, p = 0.95) %>%
    as_tibble_row() %>%
    transmute(总数 = nbr.val, 总和 = sum, 最大值 = max, 均值 = mean, 方差 = var, 标准差 = std.dev, 中位数 = median, 标准误 = SE.mean, `95%置信区间` = CI.mean.0.95, 变异系数 = coef.var, )
  Month_s <- Month$spend %>%
    stat.desc(basic = T, desc = T, norm = F, p = 0.95) %>%
    as_tibble_row() %>%
    transmute(总数 = nbr.val, 总和 = sum, 最大值 = max, 均值 = mean, 方差 = var, 标准差 = std.dev, 中位数 = median, 标准误 = SE.mean, `95%置信区间` = CI.mean.0.95, 变异系数 = coef.var, )
  Yesterday_s <- Yesterday$spend %>%
    stat.desc(basic = T, desc = T, norm = F, p = 0.95) %>%
    as_tibble_row() %>%
    transmute(总数 = nbr.val, 总和 = sum, 最大值 = max, 均值 = mean, 方差 = var, 标准差 = std.dev, 中位数 = median, 标准误 = SE.mean, `95%置信区间` = CI.mean.0.95, 变异系数 = coef.var, )
  Today_s <- Today$spend %>%
    stat.desc(basic = T, desc = T, norm = F, p = 0.95) %>%
    as_tibble_row() %>%
    transmute(总数 = nbr.val, 总和 = sum, 最大值 = max, 均值 = mean, 方差 = var, 标准差 = std.dev, 中位数 = median, 标准误 = SE.mean, `95%置信区间` = CI.mean.0.95, 变异系数 = coef.var, )

  output$t0 <- renderTable(switch(input$date,
    "Quarter" = Quarter_s,
    "Month" = Month_s,
    "Yesterday" = Yesterday_s,
    "Today" = Today_s
  ))
  output$t1 <- renderTable(switch(input$date,
    "Quarter" = Quarter,
    "Month" = Month,
    "Yesterday" = Yesterday,
    "Today" = Today
  ))
  
  output$p1 <- renderPlot(
    History %>% 
      ggplot(mapping = aes(x = hour, y = sum)) +
      geom_line()
  )
}

app <- shinyApp(ui, server)
runApp(app, host = "0.0.0.0", port = 9999)
