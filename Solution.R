# 数据导入 --------------------------------------------------------------------
{
  setwd("C:/Users/fanhang/Desktop/Datadownload")
  source("C:/Users/fanhang/OneDrive/Code/DailyReport/FUN.R", encoding = "utf-8")
  rename_me()

  dataHaiNan <- readxl::read_xlsx("新海南领麦.xlsx")
  data_Live95 <- readxl::read_xlsx("./Live95.xlsx")
  data_NB <- readxl::read_xlsx("./新NB.xlsx")
  # data_BaiJing <- readxl::read_xlsx("./新白鲸.xlsx")
  data_KaiLiJin <- readxl::read_xlsx("./新凯丽金.xlsx")
  data_JiangSu <- readxl::read_xlsx("./江苏明通新墨香.xlsx")
  data_Dreame <- readxl::read_xlsx("./新Dreame.xlsx")
  data_LiAo <- readxl::read_xlsx("./新深圳理奥.xlsx")
  data_MiYi <- readxl::read_xlsx("./新米易.xlsx")
  data_LingFen <- readxl::read_xlsx("./新灵分.xlsx")
  data_LiangZi <- readxl::read_xlsx("./新量子_Dop.xlsx")
  data_YouLiang <- readxl::read_xlsx("./新杭州优量.xlsx")
  data_ShiJi <- readxl::read_xlsx("./新世纪欢腾.xlsx")
  data_MiCo <- readxl::read_xlsx("./新MiCoLive.xlsx")
  data_KuWan <- readxl::read_xlsx("./新酷玩_Jane.xlsx")
  data_JieYi <- readxl::read_xlsx("./新捷奕.xlsx")
  data_ZhuoYi <- readxl::read_xlsx("./新卓易.xlsx")
  data_XiaoTang <- readxl::read_xlsx("./新小糖.xlsx")
  data_MaCash <- readxl::read_xlsx("./新MaCash.xlsx")
  data_MoCa <- readxl::read_xlsx("./新moca.xlsx")
  data_LiRan <- readxl::read_xlsx("./新李冉.xlsx")
  data_QuZhong <- readxl::read_xlsx("./新趣众.xlsx")
  data_MuZiShao <- readxl::read_xlsx("./新木子少.xlsx")
  data_GuangNian <- readxl::read_xlsx("./新光年游戏.xlsx")
  data_ChuYin <- readxl::read_xlsx("./新刍音.xlsx")
  data_Link <- readxl::read_xlsx("./新Link.xlsx")
  data_HuaEn <- readxl::read_xlsx("./新华恩.xlsx")
  data_Blustar <- readxl::read_xlsx("./新BluStar.xlsx")
  data_HeMa <- readxl::read_xlsx("./新河马.xlsx")
  data_NiuNiu <- readxl::read_xlsx("./新妞妞.xlsx")
  data_HuaShu <- readxl::read_xlsx("./新华述.xlsx")
  data_LongNv <- readxl::read_xlsx("./新龙女港台.xlsx")
  data_XianPan <- readxl::read_xlsx("./新仙磐.xlsx")
  data_ShangLi <- readxl::read_xlsx("./新商砾.xlsx")
  data_ZhuNuo <- readxl::read_xlsx("./新茱诺.xlsx")
  data_BuTong <- readxl::read_xlsx("./新布桐.xlsx")
  data_BoKeLai <- readxl::read_xlsx("./新博客来.xlsx")
  data_XingQi <- readxl::read_xlsx("./新星奇畅想.xlsx")
  data_YiShi <- readxl::read_xlsx("./新上海屹视.xlsx")
  data_XingChao <- readxl::read_xlsx("./新杭州星巢.xlsx")
  data_XiaoYu <- readxl::read_xlsx("./新小鱼儿.xlsx")
  data_DaoDao <- readxl::read_xlsx("./新叨叨叨.xlsx")
  data_YunLe <- readxl::read_xlsx("./新云乐.xlsx")
  data_WangJi <- readxl::read_xlsx("./新杭州网迹.xlsx")
  data_FuYu <- readxl::read_xlsx("./复娱.xlsx")
  data_XiaoDouAi <- readxl::read_xlsx("./新小逗爱.xlsx")
  data_GeZi <- readxl::read_xlsx("./新快乐格子.xlsx")
  data_AiShen <- readxl::read_xlsx("./新艾深.xlsx")


  dataJieYiGG1 <- readxl::read_xlsx("捷奕1.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataJieYiGG2 <- readxl::read_xlsx("捷奕2.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataYunLeGG <- readxl::read_xlsx("云乐.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataGuangNian5122 <- readxl::read_xlsx("光年5122.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataGuangNian5124 <- readxl::read_xlsx("光年5124.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataGuangNian0156 <- readxl::read_xlsx("光年0156.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataYiShiGG <- readxl::read_xlsx("屹视.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataJiDao <- readxl::read_xlsx("./吉道.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataLiAoGG <- readxl::read_xlsx("理奥GG.xlsx", skip = 2, col_names = T) |> filter(!is.na(帐号名))
  dataChuYinGG <- readxl::read_xlsx("刍音.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))

  xin_mo <- readxl::read_xlsx("./新陌.xlsx") |> filter(!is.na(帐户名称))
  dataZhangYue <- readxl::read_xlsx("./掌阅.xlsx") |> filter(!is.na(帐户名称))

  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
}

# 白鲸 ----------------------------------------------------------------------

{
  # data_BaiJing |>
  #   col_fix() |>
  #   mutate(
  #     广告账户名称 = toupper(广告账户名称),
  #     产品 = if_else(str_detect(广告账户名称, "YOUNG"), "白鲸YoungRadioPro",
  #                  if_else(str_detect(广告账户名称, "VIDIDI"), "白鲸Vididi",
  #                          if_else(str_detect(广告账户名称, "ZIVBO"), "白鲸Zivbo",
  #                                  "None")
  #                  )
  #     )
  #   ) |>

  # dataBai3_1 <- dataBai3 |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   产品 = if_else(str_detect(广告账户名称, "ZIVSY"), "白鲸Zivsy",
  #     if_else(str_detect(广告账户名称, "VIDIDI"), "白鲸Vididi",
  #       if_else(str_detect(广告账户名称, "ZIVBO"), "白鲸Zivbo", "None")
  #     )
  #   )
  # ) |>
  # group_by(产品) |>
  # group_split() |>
  # map(~ with_go(.)) |>
  # bind_rows() |>
  # bai_jing()
  #
  # dataBaiYoung1 <- dataBaiYoung |>
  # with_go() |>
  # mutate(产品 = "白鲸YoungRadioPro") |>
  # bai_jing()
  #
  # dataBaiMovzy1 <- dataBaiMovzy |>
  # with_go() |>
  # mutate(产品 = "白鲸Movzy") |>
  # bai_jing()
  #
  # dataBaiPlayer1 <- dataBaiPlayer |>
  # with_go() |>
  # mutate(产品 = "白鲸video player") |>
  # bai_jing()
  #
  # dataBaiVidman1 <- dataBaiVidman |>
  # with_go() |>
  # mutate(产品 = "白鲸Vidman") |>
  # bai_jing()
  #
  # dataBaiJogsy1 <- dataBaiJogsy |>
  # with_go() |>
  # mutate(产品 = "白鲸Jogsy") |>
  # bai_jing()
  #
  # dataBaiSharpi1 <- dataBaiSharpi |>
  # with_go() |>
  # mutate(产品 = "白鲸Sharpi") |>
  # bai_jing()
  #
  # dataBaiKlede1 <- dataBaiKlede |>
  # with_go() |>
  # mutate(产品 = "白鲸Klede") |>
  # bai_jing()
  #
  # dataBaiPlayerIOS14 <- tibble(
  #   日期 = as.character(Sys.Date() - 1),
  #   产品 = "白鲸video player",
  #   地区 = c("AU", "CA", "NL", "GB", "PH", "US"),
  #   版本 = "IOS14",
  #   安装 = 0
  # )
  #
  # dataBaiVidman14 <- tibble(
  #   日期 = as.character(Sys.Date() - 1),
  #   产品 = "白鲸Vidman",
  #   地区 = c("AU", "CA", "NL", "GB", "PH", "US"),
  #   版本 = "IOS14",
  #   安装 = 0
  # )
  # # , dataBai3_1
  # bind_rows(dataBaiPlayerIOS14, dataBaiVidman14, dataBaiYoung1, dataBaiSharpi1, dataBaiPlayer1, dataBaiVidman1, dataBaiKlede1) |>
  # save_csv(name = "白鲸")
}

# 酷玩 ----------------------------------------------------------------------

{
  data_KuWan |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "1889002"), "1889002",
      if_else(str_detect(广告账户名称, "1889007"), "1889007",
        if_else(str_detect(广告账户名称, "620001"), "620001",
          if_else(str_detect(广告账户名称, "6200001"), "620001",
            if_else(str_detect(广告账户名称, "VEGAS"), "Vegas",
              "None"
            )
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "酷玩Jane")
}

# 95Live ------------------------------------------------------------------

{
  data_Live95 |>
  col_fix() |>
  group_split(地区) |>
  map_dfr(~ with_group2(., gro = .$地区)) |>
  save_csv(filename = "095")
}

# 星奇畅想 --------------------------------------------------------------------

{
  data_XingQi |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "POOL"), "Pool Master",
      if_else(str_detect(广告账户名称, "ZUMBA"), "Zumba",
        "None"
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "星奇畅想")
}

# 复娱 ----------------------------------------------------------------------

{
  data_FuYu |>
  col_fix() |>
  group_split(操作系统) |>
  map_dfr(~ with_group2(., gro = .$操作系统)) |>
  mutate(
    产品 = "复娱",
    曝光 = 展示次数,
    CTR = 点击 / 曝光,
    点击量 = 点击,
    点击成本 = 花费 / 点击,
    CVR = 安装 / 点击,
    转化量 = 安装,
    CPA = 花费 / 安装,
  ) |>
  select(产品, group, 曝光, CTR, 点击量, 点击成本, CVR, 转化量, CPA, 花费) |>
  save_csv(name = "复娱")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhangYue |>
  filter(!is.na(帐户名称)) |>
  mutate_all(replace_na, replace = 0) |>
  fix_fb_name() |>
  group_by(系统) |>
  summarise(
    应用安装 = sum(应用安装),
    点击 = sum(`点击量（全部）`),
    展示次数 = sum(展示次数),
    花费金额 = sum(花费金额),
    回收 = sum(移动应用购物转化价值),
    购买 = sum(购买)
  ) |>
  zhang_yue() |>
  select(日期, 系统, 应用安装, 点击, 展示次数, 花费金额, 回收, 购买, 千次展示费用, 点击率, ROI, CPI) |>
  save_csv(name = "掌阅")
}

# 领麦TopRummy -----------------------------------------------------------------

{
  dataHaiNan |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    广告系列名称 = toupper(广告系列名称),
    产品 = if_else(str_detect(广告账户名称, "TEEN") & str_detect(广告系列名称, "DREAM"), "DREAM",
      if_else(str_detect(广告账户名称, "TEEN") & str_detect(广告系列名称, "PRO"), "TPpro",
        if_else(str_detect(广告账户名称, "TEEN") & str_detect(广告系列名称, "CHAMPION"), "Teen Patti CHAMPION",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  select(-c(group2, 回收, 购买次数, 独立购买人数)) |>
  save_csv(name = "领麦")
}

# 米易 ----------------------------------------------------------------------

{
  data_MiYi |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "ONLINE"), "Fast",
      if_else(str_detect(广告账户名称, "PONDO"), "Pondo Cash",
        if_else(str_detect(广告账户名称, "FAST"), "Fast",
          if_else(str_detect(广告账户名称, "LOAN"), "LoanCash",
            "None"
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  select(-回收) |>
  save_csv(name = "米易")
}

# 吉道 ----------------------------------------------------------------------

{
  dataJiDao |>
  ji_dao() |>
  select(日期, everything()) |>
  save_csv(name = "吉道")
}

# 屹视 ----------------------------------------------------------------------

{
  dataYiShiGG |>
  summarise(
    产品 = "屹视GG",
    日期 = Sys.Date(),
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用)
  ) |>
  save_csv(name = "屹视GG")

  data_YiShi |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "屹视")) |>
  save_csv(name = "屹视")
}

# 新陌 ----------------------------------------------------------------------

{
  xin_mo_1 <- xin_mo |>
  mutate(
    帐户名称 = toupper(帐户名称),
    优化 = if_else(str_detect(帐户名称, "贰壹W"), "Monika", "Jane"),
    产品 = if_else(str_detect(帐户名称, "NOVELCAT"), "NovelCat", "FoxNovel")
  )

  xin_mo_1 |>
  filter(产品 == "NovelCat") |>
  fix_xinmo() |>
  with_go_xinmo() |>
  mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) |>
  save_csv(name = "NovelCat")

  xin_mo_1 |>
  filter(产品 == "FoxNovel") |>
  fix_xinmo() |>
  with_go_xinmo() |>
  mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) |>
  save_csv(name = "FoxNovel")
}

# 江苏明通新墨香 -------------------------------------------------------------

{
  data_Jiang <- data_JiangSu |>
  col_fix() |>
  group_split(地区) |>
  map_dfr(~ with_group2(., gro = .$操作系统, gro2 = .$地区)) |>
  select(-c(回收, 完成注册, 购买次数, 独立购买人数)) |>
  janitor::adorn_totals() |>
  mutate(CPI = 花费 / 安装) |>
  save_csv(name = "江苏明通新墨香")
}

# dreame -----------------------------------------------------------------

{
  data_Dreame |>
  col_fix() |>
  dream() |>
  group_split(地区, 操作系统) |>
  map_dfr(~ with_group2(., gro = .$操作系统, gro2 = .$地区)) |>
  select(-c(完成注册, 购买次数, 独立购买人数)) |>
  arrange(group) |>
  save_csv(name = "Dreame")
}

# Link --------------------------------------------------------------------

{
  data_Link |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "Link")) |>
  select(group, 日期, 安装, 花费, 独立购买人数) |>
  save_csv(name = "Link")
}

# MaCash ------------------------------------------------------------------

{
  data_MaCash |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "MA"), "MaCash",
      if_else(str_detect(广告账户名称, "KN"), "KnCash",
        if_else(str_detect(广告账户名称, "MC"), "McCash",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "MaCash")
}

# MiCoLive ----------------------------------------------------------------

{
  data_MiCo |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "REALIVE"), "Realive",
      if_else(str_detect(广告账户名称, "MICO"), "Mico",
        if_else(str_detect(广告账户名称, "LAMOU"), "Lamou",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  # select(group, 日期, 安装, 花费, 回收) |>
  save_csv(name = "MiCoLive")
}

# 博客来 J+M -----------------------------------------------------------

{
  dataBoKeLai <- readxl::read_xlsx("./新博客来.xlsx")

  dataBoKeLai |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子", "Monika"),
    产品 = if_else(str_detect(广告账户名称, "REAL") & str_detect(广告账户名称, "IOS"), "TPReal-IOS",
      if_else(str_detect(广告账户名称, "WIN") & str_detect(广告账户名称, "IOS"), "WIN-IOS",
        if_else(str_detect(广告账户名称, "TPUP"), "TPUp",
          if_else(str_detect(广告账户名称, "TPSTAR"), "TPStar",
            if_else(str_detect(广告账户名称, "TPWIN"), "TPWin",
              if_else(str_detect(广告账户名称, "TPFIND"), "TPFind",
                if_else(str_detect(广告账户名称, "BEGIN"), "TPBeginWin",
                  "None"
                )
              )
            )
          )
        )
      )
    )
  ) |>
  group_split(产品, 优化) |>
  map_dfr(~ with_group2(., gro = .$优化, gro2 = .$产品)) |>
  arrange(group) |>
  select(日期, group, group2, 展示次数, 点击, 花费) |>
  save_csv(name = "博客来")
}

# 使用walk保存数据 --------------------------------------------------------------

{
  # Rummy <- list(dataRummyIOSJ1, dataRummyIOSM1, dataRummyANDJ1, dataRummyANDM1)

  # walk(Rummy, ~save_csv(.,name = .$group))
}

# 妞妞 ----------------------------------------------------------------------

{
  data_NiuNiu |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "成都"), "成都Rummy",
      (if_else(str_detect(广告账户名称, "广州"), "广州Rummy",
        (if_else(str_detect(广告账户名称, "KOIN"), "Koin",
          (if_else(str_detect(广告账户名称, "BRICK"), "brick",
            "None"
          )
          )
        )
        )
      )
      )
    )
  ) |>
  group_split(产品, 地区) |>
  map_dfr(~ with_group2(., gro = .$产品, gro2 = .$地区)) |>
  select(日期, group, group2, 花费, 安装, 独立购买人数) |>
  save_csv(name = "妞妞")
}

# Moca --------------------------------------------------------------------

{
  data_MoCa |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "Moca")) |>
  select(group, 日期, 花费, 展示次数, 点击, 安装) |>
  save_csv(name = "Moca")
}

# 叨叨叨 ---------------------------------------------------------------------

{
  data_DaoDao |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "叨叨叨")) |>
  save_csv(name = "叨叨叨")
}

# 凯丽金videochat -------------------------------------------------------------

{
  data_KaiLiJin |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "TAKTAK"), "TakTak",
      if_else(str_detect(广告账户名称, "HALLO"), "Hallo",
        if_else(str_detect(广告账户名称, "VIDEO") | str_detect(广告账户名称, "VC"), "VideoChat",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "凯丽金")
}


# 艾深 ----------------------------------------------------------------------

{
  data_AiShen |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "艾深")) |>
  save_csv(name = "艾深")
}

# 布桐 ----------------------------------------------------------------------

{
  data_BuTong |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "布桐")) |>
  save_csv(name = "布桐")
}

# 刍音 ----------------------------------------------------------------------

{
  data_ChuYin |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "刍音")) |>
  save_csv(name = "刍音")

  dataChuYinGG |>
  summarise(
    产品 = "刍音GG",
    日期 = Sys.Date(),
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用)
  ) |>
  save_csv(name = "刍音GG")
}

# 光年游戏 --------------------------------------------------------------------

{
  data_GuangNian |>
  col_fix() |>
  mutate(产品 = if_else(str_detect(广告账户名称, "1016"), "1016",
    if_else(str_detect(广告账户名称, "0016"), "1016",
      if_else(str_detect(广告账户名称, "9028"), "9028",
        if_else(str_detect(广告账户名称, "5122"), "5122",
          if_else(str_detect(广告账户名称, "0004"), "'0004",
            if_else(str_detect(广告账户名称, "0124"), "'0124",
              if_else(str_detect(广告账户名称, "0156"), "'0156",
                if_else(str_detect(广告账户名称, "0160"), "'0160",
                  if_else(str_detect(广告账户名称, "148"), "148",
                    "None"
                  )
                )
              )
            )
          )
        )
      )
    )
  )) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "光年游戏")

  dataGuangNian5122 |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    group = "光年5122",
    日期 = Sys.Date() - 1,
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    回收 = sum(所有转化价值)
  ) |>
  save_csv(name = "光年5122")

  dataGuangNian5124 |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    group = "光年5124",
    日期 = Sys.Date() - 1,
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    回收 = sum(所有转化价值)
  ) |>
  save_csv(name = "光年5124")

  dataGuangNian0156 |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    group = "光年5124",
    日期 = Sys.Date() - 1,
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    回收 = sum(所有转化价值)
  ) |>
  save_csv(name = "光年0156")
}


# 杭州网迹 --------------------------------------------------------------------

{
  data_WangJi |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "杭州网迹")) |>
  save_csv(name = "杭州网迹")
}

# 杭州星巢 --------------------------------------------------------------------

{
  data_XingChao |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "杭州星巢")) |>
  save_csv(name = "杭州星巢")
}
# 优量 ----------------------------------------------------------------------

{
  data_YouLiang |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(.)) |>
  save_csv(name = "优量")
}

# 河马 ----------------------------------------------------------------------

{
  data_HeMa |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "河马")) |>
  save_csv(name = "河马")
}

# 华述 ----------------------------------------------------------------------

{
  data_HuaShu |>
  col_fix() |>
  with_os2() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "RUMMY"), "Rummy",
      if_else(str_detect(广告账户名称, "TEENPATTIIKKA"), "TeenPattiIkka",
        if_else(str_detect(广告账户名称, "TP"), "TeenPatti",
          if_else(str_detect(广告账户名称, "TEEN"), "TeenPatti",
            if_else(str_detect(广告账户名称, "RAAJY"), "RAAJY",
              if_else(str_detect(广告账户名称, "明远"), "RAAJY",
                "NONE"
              )
            )
          )
        )
      )
    )
  ) |>
  group_split(操作系统, 产品) |>
  map_dfr(~ with_group2(., gro = .$操作系统, .$产品)) |>
  save_csv(name = "华述")
}

# 华恩 ----------------------------------------------------------------------

{
  data_HuaEn |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "KEY"), "Naira Key",
      if_else(str_detect(广告账户名称, "NOW"), "Naira Now",
        if_else(str_detect(广告账户名称, "CASH"), "Naira Cash",
          if_else(str_detect(广告账户名称, "WAY"), "Naira Way",
            if_else(str_detect(广告账户名称, "LUCKY"), "Naira Lucky",
              if_else(str_detect(广告账户名称, "LAND"), "Naira Land",
                if_else(str_detect(广告账户名称, "LOAN"), "Loan",
                  "None"
                )
              )
            )
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "华恩")
}

# 捷奕 ----------------------------------------------------------------------

{
  data_JieYi |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "EASYBORROW"), "Easyborrow", "0609")
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., .$产品)) |>
  save_csv(name = "捷奕")

  dataJieYiGG1 |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    name = 广告系列,
    日期 = Sys.Date() - 1,
    group = "捷奕GG",
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用)
  ) |>
  save_csv(name = "捷奕GG1")

  dataJieYiGG2 |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    name = 广告系列,
    日期 = Sys.Date() - 1,
    group = "捷奕GG",
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用)
  ) |>
  save_csv(name = "捷奕GG2")
}

# 快乐格子 --------------------------------------------------------------------

{
  data_GeZi %>%
    col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "RUPEE"), "Rupee",
      if_else(str_detect(广告账户名称, "LOAN"), "Loan Wallet",
        if_else(str_detect(广告账户名称, "KRAZY"), "Krazy",
          "NONE"
        )
      )
    )
  ) %>%
    group_split(产品) %>%
    map_dfr(~ with_group2(., .$产品)) %>%
    mutate(CPI = 花费 / 安装, 购买单价 = 花费 / 独立购买人数) %>%
    select(group, 日期, 安装, CPI, 独立购买人数, 购买单价, 花费) %>%
    save_csv(name = "格子")
}

# 量子Dop -------------------------------------------------------------------

{
  data_LiangZi |>
  col_fix() |>
  mutate(
    广告系列名称 = toupper(广告系列名称),
    产品 = if_else(str_detect(广告系列名称, "DOP"), "DOP",
      if_else(str_detect(广告系列名称, "CROWN"), "Crown", "None")
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "量子Dop")
}

# 灵分 ----------------------------------------------------------------------

{
  data_LingFen |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "KEY"), "Key",
      if_else(str_detect(广告账户名称, "PAY"), "Pay",
        if_else(str_detect(广告账户名称, "CUBE"), "Cube",
          if_else(str_detect(广告账户名称, "MOMO"), "MoMoCash",
            if_else(str_detect(广告账户名称, "CREDATM"), "CredATM",
              if_else(str_detect(广告账户名称, "ESTARRUPEE"), "EstarRupee",
                "None"
              )
            )
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "灵分Key_Pay_Cube")
}

# 木子少 ---------------------------------------------------------------------

{
  data_MuZiShao |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "木子少")) |>
  save_csv(name = "木子少")
}

# 趣众 ----------------------------------------------------------------------

{
  data_QuZhong |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "JOSH"), "Josh",
      if_else(str_detect(广告账户名称, "BUFFETT"), "Buffett", "None")
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "趣众")
}

# 商砾 ----------------------------------------------------------------------

{
  data_ShangLi |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "LUCKY"), "Lucky",
      if_else(str_detect(广告账户名称, "TEEN"), "Teen",
        if_else(str_detect(广告账户名称, "PATTICARD"), "Patticard",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  select(group, 日期, 安装, 花费) |>
  save_csv(name = "商砾")
}

# 世纪欢腾 --------------------------------------------------------------------

{
  data_ShiJi |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "GLORY"), "GloryFish",
      if_else(str_detect(广告账户名称, "CRAZY"), "CrazyFun", "None")
    )
  ) |>
  with_os2() |>
  group_split(操作系统, 产品) |>
  map_dfr(~ with_group2(., gro = .$操作系统, gro2 = .$产品)) |>
  select(日期, group2, group, 安装, 花费) |>
  save_csv(name = "世纪欢腾")
}

# 深圳小逗爱 -------------------------------------------------------------------

{
  data_XiaoDouAi |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "小逗爱")) |>
  select(日期, 安装, 花费, 回收, 完成注册) |>
  save_csv(name = "小逗爱")
}

# 李冉 --------------------------------------------------------------------

{
  data_LiRan |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "李冉")) |>
  select(日期, 安装, 花费) |>
  save_csv(name = "李冉")
}

# 仙磐 ----------------------------------------------------------------------

{
  data_XianPan |>
  col_fix() |>
  group_split(地区) |>
  map_dfr(~ with_group2(., gro = .$地区)) |>
  select(日期, group, 安装, 花费) |>
  save_csv(name = "仙磐")
}

# 小糖 ----------------------------------------------------------------------

{
  data_XiaoTang |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "小糖")) |>
  save_csv(name = "小糖")
}


# 小鱼儿 ---------------------------------------------------------------------

{
  data_XiaoYu |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    # 优化 = if_else(str_detect(广告账户名称, "贰壹W"), "Monika", "Jane"),
    产品 = if_else(str_detect(广告账户名称, "VUNGO") & str_detect(广告账户名称, "310036"), "Vungo310036",
      if_else(str_detect(广告账户名称, "VUNGO") & str_detect(广告账户名称, "3140172"), "Vungo3140172",
        if_else(str_detect(广告账户名称, "ROYAL"), "Royal",
          "None",
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  save_csv(name = "小鱼儿")
}

# 深圳理奥 --------------------------------------------------------------------

{
  data_LiAo |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "124"), "124",
      if_else(str_detect(广告账户名称, "122"), "122",
        if_else(str_detect(广告账户名称, "123"), "123",
          if_else(str_detect(广告账户名称, "138"), "138",
            "None"
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  select(group, 日期, 花费, 点击, 安装) |>
  save_csv(name = "深圳理奥")

  dataLiAoGG |>
  mutate(
    帐号名 = toupper(帐号名),
    产品 = if_else(str_detect(帐号名, "122"), "GG_122",
      if_else(str_detect(帐号名, "123"), "GG_123",
        if_else(str_detect(帐号名, "124"), "GG_124",
          if_else(str_detect(帐号名, "WEB"), "H5",
            if_else(str_detect(帐号名, "白名单"), "H5",
              if_else(str_detect(帐号名, "0127"), "H5",
                if_else(str_detect(帐号名, "1207"), "H5",
                  if_else(str_detect(帐号名, "1207"), "H5",
                    if_else(str_detect(帐号名, "0304"), "H5",
                      if_else(str_detect(帐号名, "902"), "GG_902",
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
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ summarise(.,
    产品 = unique(.$产品),
    费用 = sum(费用),
    点击次数 = sum(点击次数),
    转化次数 = sum(转化次数)
  )) |>
  save_csv(name = "理奥GG")
}

# 云乐 ----------------------------------------------------------------------

{
  data_YunLe |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "云乐")) |>
  save_csv(name = "云乐FB")

  dataYunLeGG |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "云乐GG",
    安装 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    所有转化价值 = sum(所有转化价值)
  ) |>
  save_csv(name = "云乐GG")
}

# 茱诺 ----------------------------------------------------------------------

{
  data_ZhuNuo |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "茱诺")) |>
  select(-回收) |>
  save_csv(name = "茱诺")
}

# 卓易 ----------------------------------------------------------------------

{
  data_ZhuoYi |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "卓易")) |>
  # select(-回收) |>
  save_csv(name = "卓易")
}

# NB ----------------------------------------------------------------

{
  data_NB |>
  col_fix() |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "SAN"), "Sancamap",
      if_else(str_detect(广告账户名称, "POKER"), "BaCayPoker",
        if_else(str_detect(广告账户名称, "CLUB"), "Fortune Club",
          if_else(str_detect(广告账户名称, "KING"), "Bau Cua King",
            if_else(str_detect(广告账户名称, "WIN"), "Bau Cua Win",
              "None"
            )
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ with_group2(., gro = .$产品)) |>
  select(-c(group2, 回收, 购买次数, 独立购买人数)) |>
  save_csv(name = "NB")
}


# dataSan1 <- dataSan |>
# no_group(gro = "Sancamap")
#
# dataBaCay1 <- dataBaCay |>
# no_group(gro = "BaCay")
#
# dataFortune1 <- dataFortune |>
# no_group(gro = "Fortune")
#
# dataBauCuaKing1 <- dataBauCuaKing |>
# no_group(gro = "BauCuaKing")
#
# dataSlotsMaster1 <- dataSlotsMaster |>
# no_group(gro = "SlotsMaster")
#
# dataCaesarsClub1 <- dataCaesarsClub |>
# no_group(gro = "CaesarsClub")
#
# dataBauCuaWin1 <- dataBauCuaWin |>
# no_group(gro = "BauCuaWin")
#
# dataMegaWin1 <- dataMegaWin |>
# mutate(产品 = if_else(str_detect(广告账户名称, "Mega"), "Mega", "POP")) |>
# group_split(产品) |>
# map_dfr(~ no_group(., gro = .$产品))
#
# dataHuanLe1 <- dataHuanLe |>
# with_os() |>
# mutate(group = "欢乐语音") |>
# select(日期, group, 版本, 安装, 点击, 展示次数, 花费)
#
# bind_rows(dataSan1, dataBaCay1, dataFortune1, dataBauCuaKing1, dataMegaWin1, dataSlotsMaster1, dataHuanLe1, dataCaesarsClub1, dataBauCuaWin1) |>
# select(group, 日期, 版本, everything()) |>
# select(-回收) |>
# save_csv(name = "领麦Sancamap")

# BluStar ----------------------------------------------------------------------

{
  data_Blustar |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "BluStar")) |>
  save_csv(name = "BluStar")
}

# 龙女港台 --------------------------------------------------------------------

{
  data_LongNv |>
  col_fix() |>
  group_split(开始时间) |>
  map_dfr(~ with_group2(., gro = "龙女港台")) |>
  save_csv(name = "龙女港台")
}

# 二手车 ---------------------------------------------------------------------

{
  # if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 17)) {
  #   # dataCarFB <- readxl::read_xlsx("二手车FB.xlsx", col_names = T)
  #   # dataCarGG <- readxl::read_xlsx("二手车GG.xlsx", skip = 2, col_names = T)
  #   dataFixFB <- readxl::read_xlsx("修车FB.xlsx", col_names = T)
  #   dataFixGG <- readxl::read_xlsx("修车GG.xlsx", skip = 2, col_names = T)
  #
  #   # dataCarFB1 <- dataCarFB |>
  #   #   car_fix_fb() |>
  #   #   CarFB()
  #
  #   # dataCarGG1 <- dataCarGG |> car_gg()
  #
  #   dataFixFB1 <- dataFixFB |>
  #     filter(!is.na(日期)) |>
  #     fix_fb_name() |>
  #     car_fb()
  #
  #   dataFixGG1 <- dataFixGG |> car_gg()
  #
  #   # bind_rows(dataCarFB1, dataCarGG1) |>
  #   #   arrange(日期) |>
  #   #   save_csv(name = "Car", filename = "0二手车", append = F)
  #   bind_rows( dataFixGG1) |>
  #     arrange(日期) |>
  #     save_csv(name = "Fix", filename = "00二手车")
  # } else {
  #   message("NotNow!")
  # }
}

# 下午 ---------------------------------------------------------------------

{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 12)) {
    # dataCasa <- readxl::read_xls("./新Casa.xls")
    # 
    # dataCasa |>
    # no_group(gro = "Casa") |>
    # save_csv(name = "Casa", filename = "00下午")

    # dataCashBox <- readxl::read_xlsx("cashbox.xlsx", col_names = T)
    # dataZhuLi <- readxl::read_xls("新朱礼.xls")
    # dataDaYu <- readxl::read_xls("新大鱼_BingoWild.xls")
    # dataJinGuo <- readxl::read_xls("新金果.xls")

    # dataCashBox1 <- dataCashBox |>
    # filter(!is.na(日期)) |>
    # fix_fb_name() |>
    # mutate_all(replace_na, replace = 0) |>
    # mutate(
    #   方式 = if_else(str_detect(广告系列名称, "注册"), "注册", "AEO"),
    #   花费 = `花费金额`,
    #   安装 = 应用安装,
    #   注册 = 完成注册,
    #   申请 = 完成关卡
    # ) |>
    # group_by(方式) |>
    # summarize(
    #   日期 = as.character(Sys.Date() - 1),
    #   花费 = sum(as.numeric(花费)),
    #   安装 = sum(as.numeric(安装)),
    #   注册 = sum(as.numeric(注册)),
    #   申请 = sum(as.numeric(申请))
    # ) |>
    # arrange(desc(方式))
    #
    # dataCashBox2 <- tibble(
    #   方式 = "",
    #   日期 = as.character(Sys.Date() - 1),
    #   花费 = sum(dataCashBox1$花费),
    #   安装 = sum(dataCashBox1$安装),
    #   注册 = sum(dataCashBox1$注册),
    #   申请 = sum(dataCashBox1$申请)
    # )
    # bind_rows(dataCashBox2, dataCashBox1) |>
    # save_csv(name = "爆发户", filename = "00下午")

    # dataZhuLi |>
    # no_group(gro = "朱礼") |>
    # save_csv(name = "朱礼", filename = "00下午", append = T)

    # dataJinGuo |>
    # no_group(gro = "金果") |>
    # select(日期, 安装, 花费) |>
    # save_csv(name = "金果", filename = "00下午", append = T)
  } else {
    message("NotNow!")
  }

  # dataDaYu |>
  # mutate(优化 = if_else(str_detect(系列名称, "AEO"), "AEO", "VO")) |>
  # group_split(优化) |>
  # map_dfr(~ with_os(.)) |>
  # select(日期, 优化, 版本, 花费) |>
  # save_csv(name = "大鱼", filename = "00下午", append = T)
}

gc()
message("任務終了")
