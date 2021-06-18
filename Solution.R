# 数据导入 --------------------------------------------------------------------
{
  setwd("C:/Users/fanhang/Desktop/Datadownload")
  source("C:/Users/fanhang/OneDrive/Code/DailyReport/FUN.R", encoding = "utf-8")
  rename_me()

  # dataHaiKe <- readxl::read_xlsx("海科.xlsx") |> filter(!is.na(帐户名称))
  dataZhangYue <- readxl::read_xlsx("掌阅.xlsx") |> filter(!is.na(帐户名称))
  # dataHuaShu <- readxl::read_xlsx("./华述.xlsx") |> filter(!is.na(帐户名称))
  xin_mo <- readxl::read_xlsx("./新陌.xlsx") |> filter(!is.na(帐户名称))
  dataJieYi <- readxl::read_xlsx("./捷奕FB.xlsx") |> filter(!is.na(帐户名称))
  dataJieYiGG1 <- readxl::read_xlsx("捷奕1.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataJieYiGG2 <- readxl::read_xlsx("捷奕2.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataGeZi <- readxl::read_xlsx("./快乐格子.xlsx") |> filter(!is.na(帐户名称))
  # dataFench <- readxl::read_xlsx("./Fench.xlsx") |> filter(!is.na(帐户名称))
  # dataHuiXian <- readxl::read_xlsx("辉仙.xlsx") |> filter(!is.na(帐户名称))
  dataJiDao <- readxl::read_xlsx("./吉道.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataShuga <- readxl::read_xlsx("./shuga.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataChengFeng <- readxl::read_xlsx("乘风.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  # dataLongNv <- readxl::read_xlsx("龙女.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  # dataRuiDao <- readxl::read_xlsx("瑞道.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataMocaGG <- readxl::read_xlsx("moca.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  # dataXiaoTangGG <- readxl::read_xlsx("小糖.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataBuYu <- readxl::read_xlsx("捕鱼.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataMoJia <- readxl::read_xls("./新福州墨家.xls")
  dataDouAi <- readxl::read_xls("./新深圳小逗爱.xls")
  dataAiShen <- readxl::read_xls("./新北京艾深.xls")
  dataHiYa <- readxl::read_xls("./新HiYa.xls")
  dataLink <- readxl::read_xls("./新Link.xls")
  dataMuXing <- readxl::read_xls("./新木星.xls")
  dataHuaEn <- readxl::read_xls("./新华恩.xls")
  dataChuYin <- readxl::read_xls("./新刍音.xls")
  dataQuZhong <- readxl::read_xls("./新趣众.xls")
  dataGuangNian <- readxl::read_xls("./新光年游戏.xls")
  dataYouLiang <- readxl::read_xls("./新杭州优量.xls")
  dataMaCash <- readxl::read_xls("./新MaCash.xls")
  dataMocaJane <- readxl::read_xls("./新Moca_Jane.xls")
  dataMocaMonika <- readxl::read_xls("./新Moca_Monika.xls")
  dataXiaoTang <- readxl::read_xls("./新小糖.xls")
  # dataRuiXun <- readxl::read_xls("./新锐讯.xls")
  dataZhuoYi <- readxl::read_xls("./新卓易.xls")
  dataTap <- readxl::read_xls("./新心动Tap.xls")
  dataZhangMen <- readxl::read_xls("./新掌门.xls")
  # dataChengDu <- readxl::read_xls("./新成都极宝.xls")
  dataTPReal_IOS <- readxl::read_xls("新博客来_TPReal_IOS.xls")
  dataWin_IOS <- readxl::read_xls("新博客来_Win_IOS.xls")
  # dataCaiRun <- readxl::read_xls("新洛阳采润.xls")
  dataShiJi <- readxl::read_xls("新世纪欢腾.xls")
  # dataHaiWan <- readxl::read_xls("新HaiWan.xls")
  dataMiCoLive <- readxl::read_xls("新MiCoLive.xls")
  dataMiYi <- readxl::read_xls("新米易.xls")
  dataWanBei <- readxl::read_xls("新海南玩呗.xls")
  # dataXingQi <- readxl::read_xls("新星奇畅想.xls")
  # dataXinYa <- readxl::read_xls("新XinYa.xls")
  dataKuWanJane <- readxl::read_xls("新酷玩_Jane.xls")
  dataKuWanMonika <- readxl::read_xls("新酷玩_Monika.xls")
  dataLiangZiDop <- readxl::read_xls("新量子_Dop.xls")
  dataHuaCe <- readxl::read_xls("新华策天城.xls")
  dataYouQing <- readxl::read_xls("新杭州优擎.xls")
  dataHaiNan <- readxl::read_xls("新海南领麦.xls")
  dataSan <- readxl::read_xls("新海南翎麦Sancamap.xls")
  dataBauCuaKing <- readxl::read_xls("新海南翎麦_BauCuaKing.xls")
  dataHuanLe <- readxl::read_xls("新海南翎麦_欢乐语音.xls")
  dataFortune <- readxl::read_xls("新海南翎麦_FortuneClub.xls")
  dataBaCay <- readxl::read_xls("新海南翎麦_BaCayPoker.xls")
  dataSlotsMaster <- readxl::read_xls("新海南翎麦_SlotsMaster.xls")
  dataMegaWin <- readxl::read_xls("新海南翎麦_MegaWin.xls")
  dataLingKPC <- readxl::read_xls("新灵分_Key_Pay_Cube.xls")
  dataLingSo <- readxl::read_xls("新灵分_So_AB_ZX.xls")
  # dataMerlingen <- readxl::read_xls("新Merlingen.xls")
  dataBigWinner <- readxl::read_xls("新Merlingen_BigWinner.xls")
  dataLiAo <- readxl::read_xls("新深圳理奥.xls")
  dataKaiTakTak <- readxl::read_xls("新凯丽金_TakTak.xls")
  dataKaiStich <- readxl::read_xls("新凯丽金_Stich.xls")
  dataKaiVideo <- readxl::read_xls("新凯丽金_VideoChat.xls")
  dataKaiHaya <- readxl::read_xls("新凯丽金_Haya.xls")
  dataKaiHallo <- readxl::read_xls("新凯丽金_Hallo.xls")
  dataKaiWinnie <- readxl::read_xls("新凯丽金_Winnie.xls")
  dataBaiPlayer <- readxl::read_xls("新白鲸_VideoPlayer.xls")
  dataBaiMovzy <- readxl::read_xls("新白鲸_Movzy.xls")
  dataBaiVidman <- readxl::read_xls("新白鲸_Vidman.xls")
  dataBaiJogsy <- readxl::read_xls("新白鲸_Jogsy.xls")
  dataBaiSharpi <- readxl::read_xls("新白鲸_Sharpi.xls")
  dataBaiKlede <- readxl::read_xls("新白鲸_Klede.xls")
  dataBai3 <- readxl::read_xls("新白鲸_3.xls")
  dataDreame <- readxl::read_xls("新Dreame1.xls")
  dataJiang <- readxl::read_xls("江苏明通新墨香.xls")
  # dataFuYun <- readxl::read_xls("新福韵.xls")
  # dataLiRan <- readxl::read_xls("新李冉.xls")
  dataJunYi <- readxl::read_xls("新重庆君仪.xls")
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
}

# Shuga -------------------------------------------------------------------

{
  dataShuga |>
  select(广告系列, 安装次数, 点击次数, 展示次数, 费用) |>
  arrange(广告系列) |>
  save_csv(name = "Shuga")
}

# 白鲸 ----------------------------------------------------------------------

{
  dataBai3_1 <- dataBai3 |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "ZIVSY"), "白鲸Zivsy",
      if_else(str_detect(广告账户名称, "VIDIDI"), "白鲸Vididi",
        if_else(str_detect(广告账户名称, "ZIVBO"), "白鲸Zivbo", "None")
      )
    )
  ) |>
  group_by(产品) |>
  group_split() |>
  map(~ with_go(.)) |>
  bind_rows() |>
  bai_jing()

  dataBaiMovzy1 <- dataBaiMovzy |>
  with_go() |>
  mutate(产品 = "白鲸Movzy") |>
  bai_jing()

  dataBaiPlayer1 <- dataBaiPlayer |>
  with_go() |>
  mutate(产品 = "白鲸video player") |>
  bai_jing()

  dataBaiVidman1 <- dataBaiVidman |>
  with_go() |>
  mutate(产品 = "白鲸Vidman") |>
  bai_jing()

  dataBaiJogsy1 <- dataBaiJogsy |>
  with_go() |>
  mutate(产品 = "白鲸Jogsy") |>
  bai_jing()

  dataBaiSharpi1 <- dataBaiSharpi |>
  with_go() |>
  mutate(产品 = "白鲸Sharpi") |>
  bai_jing()

  dataBaiKlede1 <- dataBaiKlede |>
  with_go() |>
  mutate(产品 = "白鲸Klede") |>
  bai_jing()

  dataBaiPlayerIOS14 <- tibble(
    日期 = as.character(Sys.Date() - 1),
    产品 = "白鲸video player",
    地区 = c("AU", "CA", "NL", "GB", "PH", "US"),
    版本 = "IOS14",
    安装 = 0
  )

  dataBaiVidman14 <- tibble(
    日期 = as.character(Sys.Date() - 1),
    产品 = "白鲸Vidman",
    地区 = c("AU", "CA", "NL", "GB", "PH", "US"),
    版本 = "IOS14",
    安装 = 0
  )

  bind_rows(dataBaiPlayerIOS14, dataBaiVidman14, dataBaiSharpi1, dataBaiPlayer1, dataBaiVidman1, dataBaiKlede1, dataBai3_1) |>
  save_csv(name = "白鲸")
}

# 酷玩 ----------------------------------------------------------------------

{
  dataKuWanJane |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "1889002"), "1889002",
      if_else(str_detect(广告账户名称, "1889007"), "1889007",
        if_else(str_detect(广告账户名称, "620001"), "620001",
          if_else(str_detect(广告账户名称, "VEGAS"), "Vegas",
            "None"
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  save_csv(name = "酷玩Jane")

  dataKuWanMonika |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "1889002"), "1889002",
      if_else(str_detect(广告账户名称, "1889007"), "1889007",
        if_else(str_detect(广告账户名称, "1889008"), "1889008",
          if_else(str_detect(广告账户名称, "VEGAS"), "Vegas",
            "None"
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  save_csv(name = "酷玩Monika")
}

# 星奇畅想 --------------------------------------------------------------------

{
  # dataXingQi |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   产品 = if_else(str_detect(广告账户名称, "POOL"), "Pool Master", "ZumbaClassic")
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ no_group(., gro = .$产品)) |>
  # select(日期, group, 花费, 安装) |>
  # save_csv(name = "星奇畅想")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhangYue |>
  filter(!is.na(帐户名称)) |>
  fix_fb_name() |>
  zhang_yue() |>
  select(日期, 系统, 应用安装, `点击量（全部）`, 展示次数, 花费金额, 移动应用购物转化价值, 购买, 千次展示费用, 点击率, ROI, CPI) |>
  save_csv(name = "掌阅")
}

# 领麦TopRummy -----------------------------------------------------------------

{
  dataHaiNan |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    系列名称 = toupper(系列名称),
    产品 = if_else(str_detect(广告账户名称, "INDIAN"), "IndianTP",
      if_else(str_detect(广告账户名称, "CALLBREAK"), "Cellbreak",
        if_else(str_detect(广告账户名称, "RUMMY WIN"), "Rummy Win Facebook",
          if_else(str_detect(广告账户名称, "REAL TEEN"), "Real Teen Patti",
            if_else(str_detect(广告账户名称, "0429-RUMMY"), "kingrummy",
              if_else(str_detect(广告账户名称, "KING"), "kingrummy",
                if_else(str_detect(广告账户名称, "TEENPATTI"), "TeenPattiStar",
                  if_else(str_detect(广告账户名称, "晨非") & str_detect(系列名称, "VUNGO"), "VUNGO",
                    if_else(str_detect(广告账户名称, "TEEN") & str_detect(系列名称, "DREAM"), "DREAM",
                      if_else(str_detect(广告账户名称, "TEEN") & str_detect(系列名称, "PRO"), "TPpro",
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
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-c(回收)) |>
  save_csv(name = "领麦")
}

# HiYa --------------------------------------------------------------------

{
  dataHiYa |>
  with_go() |>
  select(版本, 日期, 地区, 花费, 安装, 回收) |>
  save_csv(name = "HiYa")
}

# Merlingen ------------------------------------------------------------------

{
  dataBigWinner |>
  no_group(gro = "BigWinner") |>
  select(group, 日期, 花费) |>
  save_csv(name = "Merlingen")
  # dataMerlingen1 <- dataMerlingen |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   产品 = if_else(str_detect(广告账户名称, "LUXURY"), "Luxury",
  #     if_else(str_detect(广告账户名称, "JEETOBADA"), "Jeetobada",
  #       if_else(str_detect(广告账户名称, "SPIN"), "SpinToWorld",
  #         if_else(str_detect(广告账户名称, "COOL"), "Rummy Cool Card",
  #           "None"
  #         )
  #       )
  #     )
  #   )
  # )
  #
  # dataMerlingen1 |>
  # filter(产品 == "Luxury") |>
  # luxury() |>
  # select(日期, 产品, 花费) |>
  # save_csv(name = "Luxury")
  #
  # dataMerlingen1 |>
  # filter(产品 == "Jeetobada") |>
  # no_group(gro = "Jeetobada") |>
  # select(group, 日期, 花费) |>
  # save_csv(name = "Jeetobada")
  #
  # dataMerlingen1 |>
  # filter(产品 == "SpinToWorld") |>
  # no_group(gro = "SpinToWorld") |>
  # select(group, 日期, 花费) |>
  # save_csv(name = "SpinToWorld")
  #
  # dataMerlingen1 |>
  # filter(产品 == "Rummy Cool Card") |>
  # no_group(gro = "Rummy Cool Card") |>
  # select(group, 日期, 花费) |>
  # save_csv(name = "Rummy Cool Card")
}

# 米易 ----------------------------------------------------------------------

{
  dataMiYi |>
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
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-回收) |>
  save_csv(name = "米易")
}

# Tap ---------------------------------------------------------------------

{
  dataTap |>
  no_group(gro = "Tap") |>
  select(group, 日期, 花费, 展示次数, 点击) |>
  save_csv(name = "Tap")
}

# XinYa -------------------------------------------------------------------

{
  # dataXinYa |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   产品 = if_else(str_detect(广告账户名称, "CITY"), "City",
  #     if_else(str_detect(广告账户名称, "CRAZY"), "crazy",
  #       if_else(str_detect(广告账户名称, "FAST"), "Fast",
  #         "None"
  #       )
  #     )
  #   )
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ no_group(., gro = .$产品)) |>
  # save_csv(name = "XinYa")
}

# 捕鱼 ----------------------------------------------------------------------

{
  dataBuYu |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "捕鱼",
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    转化价值 = sum(转化价值)
  ) |>
  save_csv(name = "捕鱼")
}

# 乘风御海 --------------------------------------------------------------------

{
  dataChengFeng |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "乘风",
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    转化价值 = sum(转化价值)
  ) |>
  save_csv(name = "乘风")
}

# 墨家 ----------------------------------------------------------------------

{
  # dataMoJia |>
  # summarise(
  #   日期 = Sys.Date() - 1,
  #   group = "墨家",
  #   安装次数 = sum(安装次数),
  #   点击次数 = sum(点击次数),
  #   展示次数 = sum(展示次数),
  #   费用 = sum(费用),
  #   转化价值 = sum(转化价值)
  # ) |>
  # save_csv(name = "墨家")
}

# 吉道 ----------------------------------------------------------------------

{
  dataJiDao |>
  ji_dao() |>
  select(日期, everything()) |>
  save_csv(name = "吉道")
}

# 瑞道 ----------------------------------------------------------------------

{
  # dataRuiDao |>
  # summarise(
  #   日期 = Sys.Date() - 1,
  #   group = "瑞道",
  #   花费 = sum(费用),
  #   安装 = sum(安装次数),
  #   操作 = sum(应用内操作),
  #   回收 = sum(所有转化价值)
  # ) |>
  # save_csv(name = "瑞道")
}

# 华策天城 --------------------------------------------------------------------

{
  dataHuaCe |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "OE"), "OE Tread",
      if_else(str_detect(广告账户名称, "UNI"), "Uni Trend", "Fire")
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-c(回收)) |>
  save_csv(name = "华策天城")
}

# 新陌 ----------------------------------------------------------------------

{
  xin_mo_1 <- xin_mo |>
  mutate(
    帐户名称 = toupper(帐户名称),
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
  dataJiang1 <- dataJiang |>
  with_go() |>
  select(-回收) |>
  mutate(CPI = 花费 / 安装)

  dataJiang2 <- tibble(
    日期 = "　", 版本 = " ", 地区 = "总计",
    安装 = sum(dataJiang1$安装),
    点击 = sum(dataJiang1$点击),
    展示次数 = sum(dataJiang1$展示次数),
    花费 = sum(dataJiang1$花费),
    CPI = 花费 / 安装
  )

  bind_rows(dataJiang1, dataJiang2) |> save_csv(name = "江苏明通新墨香")
}

# dreame -----------------------------------------------------------------

{
  dataDreame |>
  dream() |>
  with_go() |>
  save_csv(name = "Dreame")
}

# HaiWan ------------------------------------------------------------------

{
  # dataHaiWan |>
  # no_group(gro = "HaiWan") |>
  # save_csv(name = "HaiWan")
}

# Link --------------------------------------------------------------------

{
  dataLink |>
  no_group(gro = "Link") |>
  select(group, 日期, 安装, 花费) |>
  save_csv(name = "Link")
}

# MaCash ------------------------------------------------------------------

{
  dataMaCash |>
  no_group(gro = "MaCash") |>
  save_csv(name = "MaCash")
}

# MiCoLive ----------------------------------------------------------------

{
  dataMiCoLive |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "REALIVE"), "Realive",
      if_else(str_detect(广告账户名称, "MICO"), "Mico", "None")
    )
  ) |>
  group_split(优化) |>
  map_dfr(~ no_group(., gro = .$优化)) |>
  select(group, 日期, 安装, 花费, 回收) |>
  save_csv(name = "MiCoLive")
}

# 博客来 J+M -----------------------------------------------------------

{
  # dataTPReal_IOS |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子", "Monika")
  # ) |>
  # group_split(优化) |>
  # map_dfr(~ no_group(., gro = .$优化)) |>
  # select(日期, group, 展示次数, 点击, 花费) |>
  # save_csv(name = "TPReal_IOS")

  dataWin_IOS |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子", "Monika")
  ) |>
  group_split(优化) |>
  map_dfr(~ no_group(., gro = .$优化)) |>
  select(日期, group, 展示次数, 点击, 花费) |>
  save_csv(name = "Win_IOS")

  # dataRummyAND |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子",
  #     (if_else(str_detect(广告账户名称, "J代投"), "叶子",
  #       (if_else(str_detect(广告账户名称, "JANE代投"), "叶子", "Monika"))
  #     ))
  #   )
  # ) |>
  # group_split(优化) |>
  # map_dfr(~ no_group(., gro = .$优化)) |>
  # save_csv(name = "RummyAND")
  #
  # dataRummyReal |>
  # no_group(gro = "RummyReal") |>
  # select(日期, group, 展示次数, 点击, 花费) |>
  # save_csv(name = "RummyReal")
}

# 使用walk保存数据 --------------------------------------------------------------

{
  # Rummy <- list(dataRummyIOSJ1, dataRummyIOSM1, dataRummyANDJ1, dataRummyANDM1)

  # walk(Rummy, ~save_csv(.,name = .$group))
}

# Moca --------------------------------------------------------------------

{
  dataMocaMonika |>
  no_group(gro = "MocaMonika") |>
  select(group, 日期, 花费, 展示次数, 点击, 安装) |>
  save_csv(name = "MocaMonika")

  dataMocaGG |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "MocaGG",
    花费 = sum(费用),
    展示次数 = sum(展示次数),
    点击次数 = sum(点击次数),
    安装次数 = sum(安装次数)
  ) |>
  save_csv(name = "Moca_GG")

  dataMocaJane |>
  no_group(gro = "MocaJane") |>
  select(group, 日期, 花费, 展示次数, 点击, 安装) |>
  save_csv(name = "MocaJane")
}

# 凯丽金videochat -------------------------------------------------------------

{
  dataKaiHaya1 <- dataKaiHaya |>
  no_group(gro = "Haya")

  dataKaiStich1 <- dataKaiStich |>
  no_group(gro = "Stich")

  dataKaiVideo1 <- dataKaiVideo |>
  no_group(gro = "Video")

  dataKaiWinnie1 <- dataKaiWinnie |>
  no_group(gro = "Winnie")

  dataKaiTakTak1 <- dataKaiTakTak |>
  no_group(gro = "TakTak")

  bind_rows(dataKaiHaya1, dataKaiStich1, dataKaiVideo1, dataKaiWinnie1, dataKaiTakTak1) |>
  save_csv(name = "Videochat")

  dataKaiHallo |>
  with_geo(gro = "Hallo") |>
  save_csv(name = "Videochat_Hallo")
}


# 艾深 ----------------------------------------------------------------------

{
  dataAiShen |>
  no_group(gro = "艾深") |>
  save_csv(name = "艾深")
}
# 刍音 ----------------------------------------------------------------------

{
  dataChuYin |>
  no_group(gro = "刍音") |>
  save_csv(name = "刍音")
}

# 成都极宝 --------------------------------------------------------------------

{
  # dataChengDu |>
  # no_group(gro = "成都极宝") |>
  #   select(-回收) |>
  # save_csv(name = "成都极宝")
}

# 福韵 ----------------------------------------------------------------------

{
  # dataFuYun |>
  # mutate(
  #   广告账户名称 = toupper(广告账户名称),
  #   产品 = if_else(str_detect(广告账户名称, "BETFAIR"), "Betfair",
  #     if_else(str_detect(广告账户名称, "QUEEN"), "Queen",
  #       "Parti"
  #     )
  #   )
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ no_group(., .$产品)) |>
  # select(group, 日期, 花费, 安装) |>
  # save_csv(name = "福韵")
}

# 光年游戏 --------------------------------------------------------------------

{
  dataGuangNian |>
  mutate(产品 = if_else(str_detect(广告账户名称, "1016"), "1016",
    if_else(str_detect(广告账户名称, "9028"), "9028",
      if_else(str_detect(广告账户名称, "5122"), "5122",
        "None"
      )
    )
  )) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  save_csv(name = "光年游戏")
}

# 海科 ----------------------------------------------------------------------

{
  # dataHaiKe |>
  # mutate(
  #   广告帐户名称 = toupper(帐户名称),
  #   产品 = if_else(str_detect(广告帐户名称, "MEET"), "BP Meet",
  #     if_else(str_detect(广告帐户名称, "DELICACY"), "Teen Patti Delicacy",
  #       "NONE"
  #     )
  #   )
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ hai_ke(., .$产品)) |>
  # save_csv(name = "海科")
}

# 海南玩呗 --------------------------------------------------------------------

{
  dataWanBei |>
  no_group(gro = "海南玩呗") |>
  save_csv(name = "海南玩呗")
}


# 优量 ----------------------------------------------------------------------

{
  dataYouLiang |>
  no_group(gro = "优量") |>
  save_csv(name = "优量")
}

# 杭州优擎 --------------------------------------------------------------------

{
  dataYouQing |>
  you() |>
  save_csv(name = "杭州优擎")
}

# 华述 ----------------------------------------------------------------------

{
  # dataHuaShu |>
  # mutate(
  #   帐户名称 = toupper(帐户名称),
  #   产品 = if_else(str_detect(帐户名称, "RUMMY"), "Rummy",
  #     if_else(str_detect(帐户名称, "TEENPATTIIKKA"), "TeenPattiIkka",
  #       if_else(str_detect(帐户名称, "TP"), "TeenPatti",
  #         if_else(str_detect(帐户名称, "TEEN"), "TeenPatti",
  #           "NONE"
  #         )
  #       )
  #     )
  #   )
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ hua_shu(., gro = .$产品)) |>
  # save_csv(name = "华述")
}

# 华恩 ----------------------------------------------------------------------

{
  dataHuaEn |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "KEY"), "Naira Key",
      if_else(str_detect(广告账户名称, "NOW"), "Naira Now",
        "None"
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  save_csv(name = "华恩")
}

# 捷奕 ----------------------------------------------------------------------

{
  dataJieYi |>
  mutate(
    帐户名称 = toupper(帐户名称),
    产品 = if_else(str_detect(帐户名称, "EASYBORROW"), "Easyborrow", "0609")
  ) |>
  group_split(产品) |>
  map_dfr(~ jie_yi(., .$产品)) |>
  save_csv(name = "捷奕")

  dataJieYiGG1 |>
  bind_rows(dataJieYiGG2) |>
  mutate_all(replace_na, replace = 0) |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "捷奕GG",
    点击次数 = sum(点击次数),
    安装 = sum(安装次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用)
  ) |>
  save_csv(name = "捷奕GG")
}

# 快乐格子 --------------------------------------------------------------------

{
  dataGeZi %>%
    mutate(
      广告帐户名称 = toupper(帐户名称),
      产品 = if_else(str_detect(广告帐户名称, "RUPEE"), "Rupee",
        if_else(str_detect(广告帐户名称, "LOAN"), "Loan Wallet",
          "NONE"
        )
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ ge_zi(., .$产品)) %>%
    mutate(CPI = 花费 / 安装, 购买单价 = 花费 / 购买) %>%
    select(group, 日期, 安装, CPI, 购买, 购买单价, 花费) %>%
    save_csv(name = "格子")
}

# 量子Dop -------------------------------------------------------------------

{
  dataLiangZiDop |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "DOP"), "DOP",
      if_else(str_detect(广告账户名称, "CROWN"), "DCrown", "None")
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-c(回收)) |>
  save_csv(name = "量子Dop")
}

# 灵分 ----------------------------------------------------------------------

{
  dataLingKPC |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "KEY"), "Key",
      if_else(str_detect(广告账户名称, "PAY"), "Pay",
        if_else(str_detect(广告账户名称, "CUBE"), "Cube",
          if_else(str_detect(广告账户名称, "GOOD"), "Good Loaning",
            if_else(str_detect(广告账户名称, "BOSS"), "Credit Boss",
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
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ ling(., name = .$产品)) |>
  save_csv(name = "灵分Key_Pay_Cube")

  dataLingSo |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "AB"), "AB",
      (if_else(str_detect(广告账户名称, "ZX"), "ZX", "SoCredit"))
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ ling(., name = .$产品)) |>
  save_csv(name = "灵分So_AB_ZX")
}

# 墨家 ----------------------------------------------------------------------

{
  dataMoJia |>
  no_group(gro = "墨家") |>
  save_csv(name = "墨家")
}

# 木星 ----------------------------------------------------------------------

{
  dataMuXing |>
  no_group(gro = "木星") |>
  save_csv(name = "木星")
}

# 木子少 ---------------------------------------------------------------------

{
  # dataMuZi |>
  # no_group(gro = "木子少") |>
  # save_csv(name = "木子少")
}

# 趣众 ----------------------------------------------------------------------

{
  dataQuZhong |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "JOSH"), "Josh",
      if_else(str_detect(广告账户名称, "BUFFETT"), "Buffett", "None")
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  save_csv(name = "趣众")
}

# 世纪欢腾 --------------------------------------------------------------------

{
  dataShiJi0 <- dataShiJi |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "GLORY"), "GloryFish",
      if_else(str_detect(广告账户名称, "CRAZY"), "CrazyFun", "None")
    )
  )

  dataShiJi0 |>
  filter(产品 == "GloryFish") |>
  with_os() |>
  mutate(产品 = "GloryFish") |>
  select(产品, 日期, 版本, 安装, 花费, 回收) |>
  save_csv(name = "GloryFish")

  dataShiJi0 |>
  filter(产品 != "GloryFish") |>
  with_os() |>
  mutate(产品 = "CrazyFun") |>
  select(产品, 日期, 版本, 安装, 花费, 回收) |>
  save_csv(name = "CrazyFun")
}

# 深圳小逗爱 -------------------------------------------------------------------

{
  dataDouAi |>
  no_group(gro = "小逗爱") |>
  save_csv(name = "小逗爱")
}

# 洛阳采润 --------------------------------------------------------------------

{
  # dataCaiRun |>
  # no_group(gro = "洛阳采润") |>
  # save_csv(name = "洛阳采润")
}

# 锐讯 ----------------------------------------------------------------------

{
  # dataRuiXun |>
  # no_group(gro = "锐讯") |>
  # save_csv(name = "锐讯")
}

# 温州李冉 --------------------------------------------------------------------

{
  # dataLiRan |>
  # no_group(gro = "温州李冉") |>
  # select(日期, 安装, 花费) |>
  # save_csv(name = "温州李冉")
}

# 小糖 ----------------------------------------------------------------------

{
  dataXiaoTang |>
  no_group(gro = "小糖") |>
  save_csv(name = "小糖")

  # dataXiaoTangGG |>
  # summarise(
  #   日期 = Sys.Date() - 1,
  #   group = "小糖GG",
  #   安装次数 = sum(安装次数),
  #   展示次数 = sum(展示次数),
  #   点击次数 = sum(点击次数),
  #   费用 = sum(费用),
  #   转化价值 = sum(转化价值)
  # ) |>
  # save_csv(name = "小糖GG")
}

# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "95"), "95",
      if_else(str_detect(广告账户名称, "122"), "122",
        if_else(str_detect(广告账户名称, "123"), "123",
          if_else(str_detect(广告账户名称, "124"), "124", "None")
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(group, 日期, 花费, 点击, 安装) |>
  save_csv(name = "深圳理奥")
}

# 掌门 ----------------------------------------------------------------------

{
  dataZhangMen |>
  no_group(gro = "掌门") |>
  save_csv(name = "掌门")
}

# 重庆君仪 --------------------------------------------------------------------

{
  dataJunYi |>
  no_group(gro = "重庆君仪") |>
  save_csv(name = "重庆君仪")
}

# 卓易 ----------------------------------------------------------------------

{
  dataZhuoYi |>
  no_group(gro = "卓易") |>
  select(-回收) |>
  save_csv(name = "卓易")
}

# 海南领麦 ----------------------------------------------------------------

{
  dataSan1 <- dataSan |>
  no_group(gro = "Sancamap")

  dataBaCay1 <- dataBaCay |>
  no_group(gro = "BaCay")

  dataFortune1 <- dataFortune |>
  no_group(gro = "Fortune")

  dataBauCuaKing1 <- dataBauCuaKing |>
  no_group(gro = "BauCuaKing")

  dataSlotsMaster1 <- dataSlotsMaster |>
  no_group(gro = "SlotsMaster")

  dataMegaWin1 <- dataMegaWin |>
  mutate(产品 = if_else(str_detect(广告账户名称, "Mega"), "Mega", "POP")) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品))


  dataHuanLe1 <- dataHuanLe |>
  with_os() |>
  mutate(group = "欢乐语音") |>
  select(日期, group, 版本, 安装, 点击, 展示次数, 花费)

  bind_rows(dataSan1, dataBaCay1, dataFortune1, dataBauCuaKing1, dataMegaWin1, dataSlotsMaster1, dataHuanLe1) |>
  select(group, 日期, 版本, everything()) |>
  select(-回收) |>
  save_csv(name = "领麦Sancamap")
}

# 龙女 ----------------------------------------------------------------------

{
  # dataLongNv |>
  # mutate(应用 = if_else(str_detect(广告系列, "IOS"), "IOS", "AND")) |>
  # group_by(应用) |>
  # summarise(
  #   日期 = Sys.Date() - 1,
  #   安装 = sum(安装次数),
  #   花费 = sum(费用),
  #   回收 = sum(所有转化价值)
  # ) |>
  # select(日期, everything()) |>
  # save_csv(name = "龙女")
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
    dataCashBox <- readxl::read_xlsx("cashbox.xlsx", col_names = T)
    # dataZhuLi <- readxl::read_xls("新朱礼.xls")
    # dataDaYu <- readxl::read_xls("新大鱼_BingoWild.xls")
    # dataJinGuo <- readxl::read_xls("新金果.xls")

    dataCashBox1 <- dataCashBox |>
    filter(!is.na(日期)) |>
    fix_fb_name() |>
    mutate_all(replace_na, replace = 0) |>
    mutate(
      方式 = if_else(str_detect(广告系列名称, "注册"), "注册", "AEO"),
      花费 = `花费金额`,
      安装 = 应用安装,
      注册 = 完成注册,
      申请 = 完成关卡
    ) |>
    group_by(方式) |>
    summarize(
      日期 = as.character(Sys.Date() - 1),
      花费 = sum(as.numeric(花费)),
      安装 = sum(as.numeric(安装)),
      注册 = sum(as.numeric(注册)),
      申请 = sum(as.numeric(申请))
    ) |>
    arrange(desc(方式))

    dataCashBox2 <- tibble(
      方式 = "",
      日期 = as.character(Sys.Date() - 1),
      花费 = sum(dataCashBox1$花费),
      安装 = sum(dataCashBox1$安装),
      注册 = sum(dataCashBox1$注册),
      申请 = sum(dataCashBox1$申请)
    )
    bind_rows(dataCashBox2, dataCashBox1) |>
    save_csv(name = "爆发户", filename = "00下午")

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
