pacman::p_load("tidyverse", "ggrepel", "shinydashboard", "shiny", "DBI", "lubridate", "pastecs")
setwd("C:/Share")

get_summary <- function(data){
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
  
  connfb_local <- dbConnect(odbc::odbc(), "spend_local", timeout = 10)
  
  Quarter <- dbGetQuery(connfb_local, "select * from spend_quarter order by spend DESC")

  Month <- dbGetQuery(connfb_local, "select * from spend_month order by spend DESC")

  Yesterday <- dbGetQuery(connfb_local, "select * from spend_yesterday order by spend DESC")

  Today <- dbGetQuery(connfb_local, "select * from spend.spend_today where update_time = (select distinct(update_time) as date_time from spend.spend_today order by date_time desc limit 1)")

  History <- dbGetQuery(connfb_local, "select max(`sum`) as `sum`, `hour` from (SELECT sum(spend) as `sum`, hour(update_time) as `hour`  FROM spend.spend_today where DATE(update_time) = CURDATE() group by update_time) as `all` group by hour")

  data_all <- list(Quarter = Quarter$spend, Month = Month$spend, Yesterday = Yesterday$spend, Today = Today$spend) %>% 
    map_df(~get_summary(.))

  output$t0 <- renderTable(switch(input$date,
    "Quarter" = data_all[1,],
    "Month" = data_all[2,],
    "Yesterday" = data_all[3,],
    "Today" = data_all[4,]
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
      geom_line() +
      geom_point() + 
      xlab("Time") +
      ylab("Spend") +
      geom_smooth() +
      scale_y_continuous(limits = c(0, max(History$sum)), breaks = seq(0, max(History$sum), 30000)) +
      scale_x_continuous(limits = c(0, 24), breaks = seq(0, 24, 2)) +
      geom_label_repel(aes(label = sum)) +
      ggtitle("今日消耗增长趋势")
  )
}

app <- shinyApp(ui, server)
runApp(app, host = "0.0.0.0", port = 9999)
