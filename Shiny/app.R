pacman::p_load("tidyverse", "ggrepel", "shinydashboard", "shiny", "DBI", "lubridate", "pastecs")
setwd("C:/Share")

get_summary <- function(data) {
  data <- data %>%
    stat.desc(basic = T, desc = T, norm = F, p = 0.95) %>%
    as_tibble_row() %>%
    transmute(总数 = nbr.val, 总和 = sum, 最大值 = max, 均值 = mean, 方差 = var, 标准差 = std.dev, 中位数 = median, 标准误 = SE.mean, `95%置信区间` = CI.mean.0.95, 变异系数 = coef.var, )
  return(data)
}

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
  downloadButton("download", "Punch me to download~"),
  sidebarLayout(
    sidebarPanel(
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
      plotOutput("p2"),
      tableOutput("t1"),
      dataTableOutput("t2")
    )
  )
)

server <- function(input, output) {
  connfb_local <- dbConnect(odbc::odbc(), "spend_local", timeout = 10)

  Quarter <- dbGetQuery(connfb_local, "select * from spend_quarter order by spend DESC")

  Month <- dbGetQuery(connfb_local, "select * from spend_month order by spend DESC")

  Yesterday <- dbGetQuery(connfb_local, "select * from spend_yesterday order by spend DESC")

  Today <- dbGetQuery(connfb_local, "select * from spend.spend_today where update_time = (select distinct(update_time) as date_time from spend.spend_today order by date_time desc limit 1) order by spend DESC")

  TodayTrend <- dbGetQuery(connfb_local, "select max(`sum`) as `sum`, update_time from (SELECT sum(spend) as `sum`, update_time FROM spend.spend_today where DATE(update_time) = CURDATE() group by update_time) as `all` group by update_time") %>%
    mutate(
      sum = round(sum, 2),
      update_time = hour(update_time) + minute(update_time) / 60
    )

  HistoryTrend <- dbGetQuery(connfb_local, "SELECT max(a) as spend, DAY(`update_time`) - 1 as date FROM ( SELECT sum(`spend`) AS a, `update_time` FROM spend.spend_history GROUP BY `update_time`) AS b GROUP BY DAY(`update_time`)") %>%
    mutate(spend = round(spend, 2))

  data_all <- list(Quarter = Quarter$spend, Month = Month$spend, Yesterday = Yesterday$spend, Today = Today$spend) %>%
    map_df(~ get_summary(.))

  output$t1 <- renderTable(switch(input$date,
    "Quarter" = data_all[1, ],
    "Month" = data_all[2, ],
    "Yesterday" = data_all[3, ],
    "Today" = data_all[4, ]
  ))

  output$t2 <- renderDataTable(switch(input$date,
    "Quarter" = Quarter,
    "Month" = Month,
    "Yesterday" = Yesterday,
    "Today" = Today
  ))

  output$p1 <- renderPlot(
    HistoryTrend %>%
      ggplot(mapping = aes(x = date, y = spend)) +
      geom_line() +
      geom_point() +
      xlab("Date") +
      ylab("Spend") +
      scale_y_continuous(limits = c(min(HistoryTrend$spend) - 30000, max(HistoryTrend$spend)), breaks = seq(0, max(HistoryTrend$spend), 30000)) +
      # scale_x_continuous(limits = c(0, 24), breaks = seq(0, 24, 2)) +
      geom_label_repel(aes(label = spend)) +
      ggtitle("历史消耗趋势")
  )

  output$p2 <- renderPlot(
    TodayTrend %>%
      ggplot(mapping = aes(x = update_time, y = sum)) +
      geom_line() +
      geom_point() +
      xlab("Time") +
      ylab("Spend") +
      scale_y_continuous(limits = c(0, max(TodayTrend$sum)), breaks = seq(0, max(TodayTrend$sum), 30000)) +
      scale_x_continuous(limits = c(0, 24), breaks = seq(0, 24, 2)) +
      geom_label_repel(aes(label = sum)) +
      ggtitle("今日消耗增长趋势")
  )

  data <- reactive({
    out <- switch(input$date,
      "Quarter" = Quarter,
      "Month" = Month,
      "Yesterday" = Yesterday,
      "Today" = Today
    )
    out
  })

  output$download <- downloadHandler(
    filename = function() {
      paste0(input$date, ".xlsx")
    },
    content = function(file) {
      xlsx::write.xlsx(data(), file, row.names = F)
    }
  )
}

app <- shinyApp(ui, server)
runApp(app, host = "0.0.0.0", port = 9999)
