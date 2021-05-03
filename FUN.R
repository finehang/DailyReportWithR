pacman::p_load("tidyverse", "lubridate", "devtools", "httr", "DBI", "multidplyr", "janitor")

no_group <- function(data, gro = "group") {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(group = gro) %>%
    filter(地区 != "unknown") %>%
    group_by(group) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值))
    ) %>%
    select(group, 日期, everything())
  return(data)
}

with_geo <- function(data, gro = "Gro") {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    dplyr::filter(地区 != "unknown") %>%
    group_by(地区) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值))
    ) %>%
    mutate(Group = gro, ) %>%
    select(Group, 日期, everything())
  return(data)
}

with_os <- function(data) {
  flag <- isTRUE("优化" %in% names(data))
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    dplyr::filter(地区 != "unknown") %>%
    mutate(
      系列名称 = toupper(系列名称),
      版本 = if_else(str_detect(系列名称, "IOS"), "IOS",
        if_else(str_detect(系列名称, "安卓"), "AND",
          if_else(str_detect(系列名称, "_AND"), "AND",
            "PC"
          )
        )
      )
    )
  if (flag) {
    data <- data %>%
      group_by(优化, 版本) %>%
      summarise(
        日期 = as.character(Sys.Date() - 1),
        安装 = sum(as.numeric(安装量)),
        点击 = sum(as.numeric(点击量)),
        展示次数 = sum(as.numeric(展示次数)),
        花费 = sum(as.numeric(金额)),
        回收 = sum(as.numeric(购物转化值))
      ) %>%
      select(日期, everything())
  } else {
    data <- data %>%
      group_by(版本) %>%
      summarise(
        日期 = as.character(Sys.Date() - 1),
        安装 = sum(as.numeric(安装量)),
        点击 = sum(as.numeric(点击量)),
        展示次数 = sum(as.numeric(展示次数)),
        花费 = sum(as.numeric(金额)),
        回收 = sum(as.numeric(购物转化值))
      ) %>%
      select(日期, everything())
  }
  return(data)
}

with_go <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    dplyr::filter(地区 != "unknown") %>%
    mutate(
      系列名称 = toupper(系列名称),
      版本 = if_else(str_detect(系列名称, "IOS"), "IOS",
        if_else(str_detect(系列名称, "安卓"), "AND",
          if_else(str_detect(系列名称, "_AND"), "AND",
            "PC"
          )
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
      回收 = sum(as.numeric(购物转化值))
    ) %>%
    select(日期, everything())
  return(data)
}

bai_jing <- function(data) {
  data <- data %>%
    select(日期, 产品, 地区, 版本, 安装) %>%
    dplyr::filter(地区 != "unknown")
  return(data)
}

zhang_yue <- function(data) {
  data <- data %>%
    mutate(
      千次展示费用 = 花费 / 展示次数 * 1000,
      点击率 = 点击 / 展示次数,
      ROI = 回收 / 花费,
      CPI = 花费 / 安装
    )
  return(data)
}

with_go_xinmo <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    dplyr::filter(`国家/地区` != "unknown") %>%
    group_by(系统, `国家/地区`) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(应用安装),
      点击 = sum(`点击量（全部）`),
      展示 = sum(展示次数),
      花费 = sum(`花费金额 (USD)`),
      回收 = sum(移动应用购物转化价值),
    ) %>%
    select(日期, everything())
  return(data)
}

fix_xinmo <- function(data) {
  data <- data %>%
    mutate(`国家/地区` = as.character(fct_other(as_factor(`国家/地区`),
                                            keep = c("MY", "PH", "SG", "US"),
                                            other_level = "Global"
    )))
}

dream <- function(data) {
  data <- data %>%
    mutate(地区 = as.character(fct_other(as_factor(地区), keep = c("ID", "US"), other_level = "全球")))
  return(data)
}

fix_fb_name <- function(data) {
  if ("花费金额 (USD)" %in% names(data)) {
    data <- data %>% mutate(花费金额 = `花费金额 (USD)`)
    return(data)
  } else {
    return(data)
  }
}

car_fb <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      国家 = `国家/地区`,
      广告系列名称 = toupper(广告系列名称),
      平台 = if_else(str_detect(广告系列名称, "AND"), "AND",
        if_else(str_detect(广告系列名称, "IOS"), "IOS",
          "PC"
        )
      )
    ) %>%
    group_by(日期, 平台, 国家) %>%
    summarise(
      代投渠道 = "Gath",
      媒体 = "FB",
      安装量 = sum(as.numeric(应用安装)),
      点击量 = sum(as.numeric(`点击量（全部）`)),
      展示次数 = sum(as.numeric(展示次数)),
      花费金额 = sum(as.numeric(花费金额))
    ) %>%
    select(代投渠道, 日期, 媒体, 平台, 国家, everything())

  return(data)
}

car_gg <- function(data) {
  data <- data %>%
    na.omit() %>%
    mutate(
      日期 = 天,
      国家 = str_split(str_replace(广告系列, "USA", "US"), "_", simplify = T)[, 4],
      广告系列 = toupper(广告系列),
      平台 = if_else(str_detect(广告系列, "AND"), "AND",
        if_else(str_detect(广告系列, "IOS"), "IOS",
          "PC"
        )
      )
    ) %>%
    group_by(日期, 平台, 国家) %>%
    summarise(
      代投渠道 = "Gath",
      媒体 = "GG",
      安装量 = sum(as.numeric(安装次数)),
      点击量 = sum(as.numeric(点击次数)),
      展示次数 = sum(as.numeric(展示次数)),
      花费金额 = sum(as.numeric(费用))
    ) %>%
    select(代投渠道, 日期, 媒体, 平台, 国家, everything())

  return(data)
}

li_ao <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(产品 = if_else(str_detect(广告账户名称, "44"), "Vungo44",
      if_else(str_detect(广告账户名称, "FunRummy"), "FunRummy",
        if_else(str_detect(广告账户名称, "48"), "3Patti_48",
          if_else(str_detect(广告账户名称, "GinRummy"), "GinRummy",
            if_else(str_detect(广告账户名称, "40"), "3patti-40",
                    if_else(str_detect(广告账户名称, "30"), "3patti-30",
              "None"
            )
          )
        )
      )
    ))) %>%
    group_by(产品) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      地区 = "IN",
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      购物转化值 = sum(as.numeric(购物转化值)),
      CPI = 花费 / 安装
    )
  return(data)
}

you <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(产品 = if_else(str_detect(系列名称, "teen"), "Teen Patti",
      if_else(str_detect(系列名称, "Pop"), "Pop Solitaire",
        if_else(str_detect(系列名称, "Crazy"), "Crazy", "None")
      ),
    )) %>%
    group_by(产品) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      花费 = sum(as.numeric(金额))
    ) %>%
    select(日期, 产品, 花费)
  return(data)
}

luxury <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      系列名称 = toupper(系列名称),
      产品 = if_else(str_detect(系列名称, "1084"), "AEO",
        if_else(str_detect(系列名称, "1083"), "VO", "other")
      )
    ) %>%
    group_by(产品) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      花费 = sum(as.numeric(金额))
    )
  return(data)
}

fei <- function(data) {
  data <- data %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      平台 = if_else(str_detect(广告账户名称, "WEB"), "WEB", "APP")
    ) %>%
    group_by(平台) %>%
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      回收 = sum(as.numeric(购物转化值))
    )
  return(data)
}

ling <- function(data, name) {
  data <- data %>%
    no_group(gro = name) %>%
    select(group, 日期, 安装, 点击, 展示次数, 花费, 回收)
  return(data)
}

ji_dao <- function(data) {
  data <- data %>%
    filter(!is.na(广告系列)) %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(地区 = str_sub(广告系列, 25, 26)) %>%
    group_by(地区) %>%
    summarize(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装次数)),
      点击 = sum(as.numeric(点击次数)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(费用)),
      回收 = sum(as.numeric(转化价值))
    )
  return(data)
}

save_csv <- function(data, name = "name", filename = "result", append = T) {
  if (!missing(filename)) {
    append <- F
  }
  readr::write_excel_csv(tibble(blankLine = c(" ")), file = paste0("./", filename, ".csv"), col_names = F, append = append)
  readr::write_excel_csv(tibble(name), file = paste0("./", filename, ".csv"), col_names = F, append = T)
  readr::write_excel_csv(data, file = paste0("./", filename, ".csv"), col_names = T, append = T)
}
