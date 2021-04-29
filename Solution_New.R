with_go <- function(data) {
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

fix_geo <- function(data) {
    data <- data %>%
        mutate(`国家/地区` = as.character(fct_other(as_factor(`国家/地区`),
                                                keep = c("MY", "PH", "SG", "US"),
                                                other_level = "Global"
        )))
}

# 数据导入 --------------------------------------------------------------------
{
    setwd("C:/Users/fanhang/Desktop/Datadownload")
    source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

    xin_mo <- readxl::read_xlsx("./新陌_CatFox.xlsx") %>% filter(!is.na(帐户名称))
    
}

{
    xin_mo_1 <- xin_mo %>%
        mutate(
            帐户名称 = toupper(帐户名称),
            产品 = if_else(str_detect(帐户名称, "NOVELCAT"), "NovelCat", "FoxNovel")
        )
    
    xin_mo_1 %>%
        filter(产品 == "NovelCat") %>%
        fix_geo() %>%
        with_go() %>%
        mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) %>%
        save_csv(name = "NovelCat")
    
    xin_mo_1 %>%
        filter(产品 == "FoxNovel") %>%
        fix_geo() %>%
        with_go() %>%
        mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) %>%
        save_csv(name = "FoxNovel")
}
