pacman::p_load(tidyverse, readxl, lubridate)

MobanWithoutGroup <- function(data, gro="group") {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(group = gro) %>%
    group_by(group) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值)),
      购买 = sum(as.numeric(购买次数)),
      注册 = sum(as.numeric(完成注册))
    ) %>%
    select(日期, everything())
  return(data)
}


MobanWithGroupGeo <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    group_by(地区) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值)),
      购买 = sum(as.numeric(购买次数)),
      注册 = sum(as.numeric(完成注册))
    ) %>%
    select(日期, everything())
  return(data)
}


MobanWithGroupPlatform <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      系列名称 = toupper(系列名称),
      版本 = if_else(str_detect(系列名称, "_AND_"), "AND",
        if_else(str_detect(系列名称, "_IOS_"), "IOS",
          "PC"
        )
      )
    ) %>%
    group_by(版本) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值)),
      购买 = sum(as.numeric(购买次数)),
      注册 = sum(as.numeric(完成注册))
    ) %>%
    select(日期, everything())
  return(data)
}

MobanWithGroupGP <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      系列名称 = toupper(系列名称),
      版本 = if_else(str_detect(系列名称, "_AND"), "AND",
        if_else(str_detect(系列名称, "_IOS_"), "IOS",
          "PC"
        )
      )
    ) %>%
    group_by(版本, 地区) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值)),
      购买 = sum(as.numeric(购买次数)),
      注册 = sum(as.numeric(完成注册))
    ) %>%
    select(日期, everything())
  return(data)
}

MobanSelectDefault <- function(data, selection = NULL) {
  data <- data %>% select(c(日期, group, 安装, 点击, 展示次数, 花费, 回收, all_of(selection)))
  return(data)
}


BaiJing <- function(data) {
  data <- data %>%
    select(日期, 产品, 地区, 版本, 安装) %>%
    dplyr::filter(地区 != "unknown")
  return(data)
}

ZhangYue <- function(data) {
  data <- data %>%
    mutate(
      千次展示费用 = 花费 / 展示次数 * 1000,
      点击率 = 点击 / 展示次数,
      ROI = 回收 / 花费,
      CPI = 花费 / 安装
    ) %>%
    select(-注册)
  return(data)
}

Dream <- function(data) {
  data <- data %>%
    mutate(地区 = as.character(fct_other(as_factor(地区), keep = c("ID", "US"), other_level = "全球")))
  return(data)
}

Zx <- function(data){
  data <- data %>% 
    mutate_all(replace_na, replace = 0) %>%
    mutate(类别 = if_else(str_detect(系列名称, "_AEO_"), "AEO", "NOAEO")) %>% 
    group_by(类别) %>% 
    summarise(
      日期 = as.character(Sys.Date() - 1),
      金额 = sum(as.numeric(金额)),
      安装量 = sum(as.numeric(安装量)),
      购买次数 = sum(as.numeric(购买次数)),
    )
  return(data)
}

ZxAeo <- function(data){
  data <- data %>% filter(类别 == "AEO") %>% 
    select(日期, 类别, 金额, 购买次数)
}

ZxNoAeo <- function(data){
  data <- data %>% filter(类别 == "NOAEO") %>% 
    select(日期, 类别, 金额, 安装量)
}

Mao <- function(data){
  data <- data %>% 
    mutate_all(replace_na, replace = 0) %>%
    mutate(产品 = if_else(str_detect(广告账户名称, "避难所"), "避难所", "Immortal")) %>%
    mutate(平台 = if_else(str_detect(系列名称, "IOS"), "IOS", "AND")) %>%
    group_by(产品, 平台) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      金额 = sum(as.numeric(金额)),
      展示 = sum(as.numeric(展示次数)),
      点击 = sum(as.numeric(点击量)),
      安装 = sum(as.numeric(安装量)),
      购物转化值 = sum(as.numeric(购物转化值))
    ) %>%
    select(日期, everything())
  return(data)
}

NovelCat <- function(data) {
  data <- data %>%
    mutate(地区 = as.character(fct_other(as_factor(地区),
      keep = c("MY", "PH", "SG", "US"),
      other_level = "Global"
    )))
}


SaveCsv <- function(data, name = "name"){
      readr::write_excel_csv(tibble(blankLine = c(" ")), file = "./result.csv", append = T)
      readr::write_excel_csv(tibble(name), file = "./result.csv", col_names = F, append = T)
      readr::write_excel_csv(data, file = "./result.csv", col_names = T, append = T)
}