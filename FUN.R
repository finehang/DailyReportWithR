pacman::p_load("tidyverse", "lubridate", "devtools", "httr", "DBI", "multidplyr", "janitor")

add_col <- tibble(a = 0, b = 0, c = 0, d = 0, e = 0, f = 0)

full_name <- c("开始时间","结束时间","广告账户ID","广告账户名称","广告系列名称","地区","操作系统","安装量","点击量","展示次数","花费","购物转化值","完成注册","购买次数","独立购买人数", "移动端完成注册", "非移动端完成注册")

col_fix <- function(data){
  diff <- full_name |> setdiff(names(data)) 
  if (length(diff) == 0) {
    message("no fix")
  }else{
    add_col <- add_col[1:length(diff)]
    colnames(add_col) <- diff
    data <- bind_cols(data, add_col) |> 
      select(-contains("..."))
  }
  return(data)
}

rename_me <- function() {
  path <- "C:/Users/fanhang/OneDrive/Work/Report/0在用"
  filenames <- list.files(path)
  if (unique(str_sub(filenames, start = -10, end = -6)) == str_sub(today() - 1, start = -5)) {
    message("RenamePass!")
  } else {
    newnames <- paste0(str_sub(filenames, end = -11), str_sub(today() - 1, start = -5), ".xlsx")
    file.rename(paste0(path, "/", filenames), paste0(path, "/", newnames))
    filenames <- list.files(path)
    if (unique(str_sub(filenames, start = -10, end = -6)) == str_sub(today() - 1, start = -5)) {
      message("RenameDone!")
    } else {
      message("Error!")
    }
  }
}

with_group2 <- function(data, gro = "group", gro2 = "group2") {
  data <- data |>
    mutate_all(replace_na, replace = 0) |>
    mutate(group = gro, group2 = gro2) |>
    filter(地区 != "unknown") |>
    group_by(group, group2) |>
    summarise(
      日期 = as.character(unique(开始时间)),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(花费)),
      回收 = sum(as.numeric(购物转化值)),
      移动端完成注册 = sum(as.numeric(移动端完成注册)),
      购买次数 = sum(as.numeric(购买次数)),
      独立购买人数 = sum(as.numeric(独立购买人数)), 
      非移动端完成注册册 = sum(as.numeric(非移动端完成注册))
    ) |>
    select(日期, group, group2, everything())
  return(data)
}

with_os2 <- function(data) {
  data <- data |>
  mutate_all(replace_na, replace = 0) |>
  dplyr::filter(地区 != "unknown") |>
  mutate(
    广告系列名称 = toupper(广告系列名称),
    操作系统 = if_else(str_detect(广告系列名称, "IOS"), "IOS",
      if_else(str_detect(广告系列名称, "安卓"), "AND",
        if_else(str_detect(广告系列名称, "_AND"), "AND",
          if_else(str_detect(广告系列名称, "-AND"), "AND",
            "PC"
          )
        )
      )
    )
  )
  return(data)
}

bai_jing <- function(data) {
  data <- data |>
  select(日期, 产品, 地区, 版本, 安装) |>
  dplyr::filter(地区 != "unknown")
  if (nrow(data) == 0) {
    data <- tibble(地区 = "NNN")
  }
  return(data)
}

zhang_yue <- function(data) {
  data <- data |>
  mutate(
    日期 = as.character(Sys.Date() - 1),
    千次展示费用 = 花费金额 / 展示次数 * 1000,
    点击率 = 点击 / 展示次数,
    ROI = 回收 / 花费金额,
    CPI = 花费金额 / 应用安装
  ) |>
  arrange(系统)
  return(data)
}

with_go_xinmo <- function(data) {
  data <- data |>
  mutate_all(replace_na, replace = 0) |>
  dplyr::filter(`国家/地区` != "unknown") |>
  group_by(优化, 系统, `国家/地区`) |>
  summarise(
    日期 = as.character(Sys.Date() - 1),
    安装 = sum(应用安装),
    点击 = sum(`点击量（全部）`),
    展示 = sum(展示次数),
    花费 = sum(`花费金额 (USD)`),
    回收 = sum(移动应用购物转化价值),
  ) |>
  select(日期, everything())
  return(data)
}

fix_xinmo <- function(data) {
  data <- data |>
  mutate(`国家/地区` = as.character(fct_other(as_factor(`国家/地区`),
    keep = c("MY", "PH", "SG", "US"),
    other_level = "Global"
  )))
}

dream <- function(data) {
  data <- data |>
  mutate(地区 = as.character(fct_other(as_factor(地区), keep = c("ID", "US"), other_level = "全球")))
  return(data)
}

fix_fb_name <- function(data) {
  if ("花费金额 (USD)" %in% names(data)) {
    data <- data |> mutate(花费金额 = `花费金额 (USD)`)
    return(data)
  } else {
    return(data)
  }
}

car_fb <- function(data) {
  data <- data |>
  mutate_all(replace_na, replace = 0) |>
  mutate(
    国家 = `国家/地区`,
    广告系列名称 = toupper(广告系列名称),
    平台 = if_else(str_detect(广告系列名称, "AND"), "AND",
      if_else(str_detect(广告系列名称, "IOS"), "IOS",
        "PC"
      )
    )
  ) |>
  group_by(日期, 平台, 国家) |>
  summarise(
    代投渠道 = "Gath",
    媒体 = "FB",
    安装量 = sum(as.numeric(应用安装)),
    点击量 = sum(as.numeric(`点击量（全部）`)),
    展示次数 = sum(as.numeric(展示次数)),
    花费金额 = sum(as.numeric(花费金额))
  ) |>
  select(代投渠道, 日期, 媒体, 平台, 国家, everything())

  return(data)
}

car_gg <- function(data) {
  data <- data |>
  na.omit() |>
  mutate(
    日期 = 天,
    国家 = str_split(str_replace(广告系列, "USA", "US"), "_", simplify = T)[, 4],
    广告系列 = toupper(广告系列),
    平台 = if_else(str_detect(广告系列, "AND"), "AND",
      if_else(str_detect(广告系列, "IOS"), "IOS",
        "PC"
      )
    )
  ) |>
  group_by(日期, 平台, 国家) |>
  summarise(
    代投渠道 = "Gath",
    媒体 = "GG",
    安装量 = sum(as.numeric(安装次数)),
    点击量 = sum(as.numeric(点击次数)),
    展示次数 = sum(as.numeric(展示次数)),
    花费金额 = sum(as.numeric(费用))
  ) |>
  select(代投渠道, 日期, 媒体, 平台, 国家, everything())
  return(data)
}

li_ao <- function(data) {
  data <- data |>
  mutate_all(replace_na, replace = 0) |>
  mutate(产品 = if_else(str_detect(广告账户名称, "44"), "Vungo44",
    if_else(str_detect(广告账户名称, "FunRummy"), "FunRummy",
      if_else(str_detect(广告账户名称, "48"), "3Patti-48",
        if_else(str_detect(广告账户名称, "GinRummy"), "GinRummy",
          if_else(str_detect(广告账户名称, "40"), "3patti-40",
            if_else(str_detect(广告账户名称, "30"), "3patti-30",
              if_else(str_detect(广告账户名称, "47"), "3patti-47",
                if_else(str_detect(广告账户名称, "63"), "3patti-63",
                  if_else(str_detect(广告账户名称, "29"), "3patti-29",
                    if_else(str_detect(广告账户名称, "52"), "3patti-52",
                      "None"
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )) |>
  group_by(产品) |>
  summarise(
    日期 = as.character(unique(开始时间)),
    地区 = "IN",
    花费 = sum(as.numeric(金额)),
    点击 = sum(as.numeric(点击量)),
    安装 = sum(as.numeric(安装量)),
  )
  return(data)
}

ji_dao <- function(data) {
  data <- data |>
  filter(!is.na(广告系列)) |>
  mutate_all(replace_na, replace = 0) |>
  mutate(地区 = str_sub(广告系列, 25, 26)) |>
  group_by(地区) |>
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
  filenames <- list.files(getwd())
  if (!missing(filename)) {
    append <- F
  }
  if (paste0(filename, ".csv") %in% filenames) {
    append <- T
  }
  readr::write_excel_csv(tibble(blankLine = c(" ")), file = paste0("./", filename, ".csv"), col_names = F, append = append)
  readr::write_excel_csv(tibble(name), file = paste0("./", filename, ".csv"), col_names = F, append = T)
  readr::write_excel_csv(data, file = paste0("./", filename, ".csv"), col_names = T, append = T)
}
