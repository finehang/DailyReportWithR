# 数据导入 --------------------------------------------------------------------
{
  setwd("C:/Users/fanhang/Desktop/Datadownload")
  source("C:/Users/fanhang/OneDrive/Code/DailyReport/FUN.R", encoding = "utf-8")
  rename_me()

  dataHaiKe <- readxl::read_xlsx("海科.xlsx") |> filter(!is.na(帐户名称))
  dataZhangYue <- readxl::read_xlsx("掌阅.xlsx") |> filter(!is.na(帐户名称))
  dataHuaShu <- readxl::read_xlsx("./华述.xlsx") |> filter(!is.na(帐户名称))
  xin_mo <- readxl::read_xlsx("./新陌.xlsx") |> filter(!is.na(帐户名称))
  # dataGeZi <- readxl::read_xlsx("./格子.xlsx") |> filter(!is.na(帐户名称))
  # dataFench <- readxl::read_xlsx("./Fench.xlsx") |> filter(!is.na(帐户名称))
  # dataHuiXian <- readxl::read_xlsx("辉仙.xlsx") |> filter(!is.na(帐户名称))
  dataJiDao <- readxl::read_xlsx("吉道.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataLongNv <- readxl::read_xlsx("龙女.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataRuiDao <- readxl::read_xlsx("瑞道.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataMocaGG <- readxl::read_xlsx("moca.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataJieYiGG <- readxl::read_xlsx("捷奕.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataMoJia <- readxl::read_xlsx("墨家.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataXiaoTangGG <- readxl::read_xlsx("小糖.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataBuYu <- readxl::read_xlsx("捕鱼.xlsx", skip = 2, col_names = T) |> filter(!is.na(广告系列))
  dataJieYi <- readxl::read_xls("./新捷奕.xls")
  dataMoca <- readxl::read_xls("./新Moca.xls")
  dataXiaoTang <- readxl::read_xls("./新小糖.xls")
  dataRuiXun <- readxl::read_xls("./新锐讯.xls")
  dataZhuoYi <- readxl::read_xls("./新卓易.xls")
  dataZhangMen <- readxl::read_xls("./新掌门.xls")
  dataChengDu <- readxl::read_xls("./新成都极宝.xls")
  dataTPReal_IOS <- readxl::read_xls("新博客来_TPReal_IOS.xls")
  dataWin_IOS <- readxl::read_xls("新博客来_Win_IOS.xls")
  dataCaiRun <- readxl::read_xls("新洛阳采润.xls")
  dataShiJi <- readxl::read_xls("新世纪欢腾.xls")
  dataHaiWan <- readxl::read_xls("新HaiWan.xls")
  dataMiCoLive <- readxl::read_xls("新MiCoLive.xls")
  dataMiYi <- readxl::read_xls("新米易.xls")
  dataWanBei <- readxl::read_xls("新海南玩呗.xls")
  dataXingQi <- readxl::read_xls("新星奇畅想.xls")
  dataXinYa <- readxl::read_xls("新XinYa.xls")
  dataKuWanJane <- readxl::read_xls("新酷玩_Jane.xls")
  dataKuWanMonika <- readxl::read_xls("新酷玩_Monika.xls")
  dataLiangZiDop <- readxl::read_xls("新量子_Dop.xls")
  dataHuaCe <- readxl::read_xls("新华策天城.xls")
  dataYouQing <- readxl::read_xls("新杭州优擎.xls")
  dataHaiNan <- readxl::read_xls("新海南翎唛.xls")
  dataSan <- readxl::read_xls("新海南翎麦Sancamap.xls")
  dataBauCuaKing <- readxl::read_xls("新海南翎麦_BauCuaKing.xls")
  dataHuanLe <- readxl::read_xls("新海南翎麦_欢乐语音.xls")
  dataFortune <- readxl::read_xls("新海南翎麦_FortuneClub.xls")
  dataBaCay <- readxl::read_xls("新海南翎麦_BaCayPoker.xls")
  dataSlotsMaster <- readxl::read_xls("新海南翎麦_SlotsMaster.xls")
  dataMegaWin <- readxl::read_xls("新海南翎麦_MegaWin.xls")
  dataLingKPC <- readxl::read_xls("新灵分_Key_Pay_Cube.xls")
  dataLingSo <- readxl::read_xls("新灵分_So_AB_ZX.xls")
  dataMerlingen <- readxl::read_xls("新Merlingen.xls")
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
  dataDreame <- readxl::read_xls("新Dreame1.xls")
  dataJiang <- readxl::read_xls("江苏明通新墨香.xls")
  dataFuYun <- readxl::read_xls("新福韵.xls")
  dataLiRan <- readxl::read_xls("新李冉.xls")
  dataJunYi <- readxl::read_xls("新重庆君仪.xls")
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
}

# 白鲸 ----------------------------------------------------------------------

{
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

  bind_rows(dataBaiPlayerIOS14, dataBaiVidman14, dataBaiJogsy1, dataBaiPlayer1, dataBaiVidman1) |>
  save_csv(name = "白鲸")
}

# 酷玩 ----------------------------------------------------------------------

{
  dataKuWanJane |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "3150032"), "Jane_Amazing",
      if_else(str_detect(广告账户名称, "3140032"), "Jane_IndiaCard",
        if_else(str_detect(广告账户名称, "3140072"), "Jane_3140072",
          "None"
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
    产品 = if_else(str_detect(广告账户名称, "3150032"), "Monika_Amazing",
      if_else(str_detect(广告账户名称, "3140032"), "Monika_IndiaCard",
        if_else(str_detect(广告账户名称, "3140072"), "Monika_3140072",
          "None"
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
  dataXingQi |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "POOL"), "Pool Master", "ZumbaClassic")
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(日期, group, 花费, 安装) |>
  save_csv(name = "星奇畅想")
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

# 世纪欢腾 --------------------------------------------------------------------

{
  dataShiJi |>
    no_group(gro = "世纪欢腾") |>
    select(安装, 花费) |>
    save_csv(name = "世纪欢腾")
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
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-c(回收)) |>
  save_csv(name = "领麦")
}

# Merlingen ------------------------------------------------------------------

{
  dataMerlingen1 <- dataMerlingen |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "LUXURY"), "Luxury",
      if_else(str_detect(广告账户名称, "JEETOBADA"), "Jeetobada",
        if_else(str_detect(广告账户名称, "SPIN"), "SpinToWorld",
          if_else(str_detect(广告账户名称, "COOL"), "Rummy Cool Card",
            "None"
          )
        )
      )
    )
  )

  dataMerlingen1 |>
  filter(产品 == "Luxury") |>
  luxury() |>
  select(日期, 产品, 花费) |>
  save_csv(name = "Luxury")

  dataMerlingen1 |>
  filter(产品 == "Jeetobada") |>
  no_group(gro = "Jeetobada") |>
  select(group, 日期, 花费) |>
  save_csv(name = "Jeetobada")

  dataMerlingen1 |>
  filter(产品 == "SpinToWorld") |>
  no_group(gro = "SpinToWorld") |>
  select(group, 日期, 花费) |>
  save_csv(name = "SpinToWorld")

  dataMerlingen1 |>
  filter(产品 == "Rummy Cool Card") |>
  no_group(gro = "Rummy Cool Card") |>
  select(group, 日期, 花费) |>
  save_csv(name = "Rummy Cool Card")
}

# 米易 ----------------------------------------------------------------------

{
  dataMiYi |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "ONLINE"), "Fast",
      if_else(str_detect(广告账户名称, "PONDO"), "Pondo Cash",
        if_else(str_detect(广告账户名称, "FAST"), "Fast",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-回收) |>
  save_csv(name = "米易")
}

# XinYa -------------------------------------------------------------------

{
  dataXinYa |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "CITY"), "City",
      if_else(str_detect(广告账户名称, "CRAZY"), "crazy",
        if_else(str_detect(广告账户名称, "FAST"), "Fast",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., gro = .$产品)) |>
  select(-回收) |>
  save_csv(name = "XinYa")
}

# 捕鱼 ----------------------------------------------------------------------

{
  dataBuYu |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "捕鱼",
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    费用 = sum(费用),
    转化价值 = sum(转化价值)
  ) |>
  save_csv(name = "捕鱼")
}

# 墨家 ----------------------------------------------------------------------

{
  dataMoJia |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "墨家",
    安装次数 = sum(安装次数),
    点击次数 = sum(点击次数),
    展示次数 = sum(展示次数),
    费用 = sum(费用),
    转化价值 = sum(转化价值)
  ) |>
  save_csv(name = "墨家")
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
  dataRuiDao |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "瑞道",
    花费 = sum(费用),
    安装 = sum(安装次数),
    操作 = sum(应用内操作),
    回收 = sum(所有转化价值)
  ) |>
  save_csv(name = "瑞道")
}

# 华策天城 --------------------------------------------------------------------

{
  dataHuaCe |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "OE"), "OE Tread",
      if_else(str_detect(广告账户名称, "UNI"), "Uni Trend", "None")
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
  dataHaiWan |>
  no_group(gro = "HaiWan") |>
  save_csv(name = "HaiWan")
}

# MiCoLive ----------------------------------------------------------------

{
  dataMiCoLive |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "REALIVE"), "Realive", "Mico")
  ) |>
  group_split(优化) |>
  map_dfr(~ no_group(., gro = .$优化)) |>
  select(group, 日期, 安装, 花费, 回收) |>
  save_csv(name = "MiCoLive")
}

# 博客来 J+M -----------------------------------------------------------

{
  dataTPReal_IOS |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子", "Monika")
  ) |>
  group_split(优化) |>
  map_dfr(~ no_group(., gro = .$优化)) |>
  select(日期, group, 展示次数, 点击, 花费) |>
  save_csv(name = "TPReal_IOS")

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
  dataMoca |>
  no_group(gro = "Moca") |>
  select(group, 日期, 花费, 展示次数, 点击, 安装) |>
  save_csv(name = "Moca")

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

# 成都极宝 --------------------------------------------------------------------

{
  dataChengDu |>
  no_group(gro = "成都极宝") |>
  save_csv(name = "成都极宝")
}

# 福韵 ----------------------------------------------------------------------

{
  dataFuYun |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "BETFAIR"), "Betfair",
      if_else(str_detect(广告账户名称, "QUEEN"), "Queen",
        "Parti"
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., .$产品)) |>
  select(group, 日期, 花费, 安装) |>
  save_csv(name = "福韵")
}

# 海科 ----------------------------------------------------------------------

{
  dataHaiKe |>
  mutate(
    广告帐户名称 = toupper(帐户名称),
    产品 = if_else(str_detect(广告帐户名称, "MEET"), "BP Meet",
      if_else(str_detect(广告帐户名称, "DELICACY"), "Teen Patti Delicacy",
        "NONE"
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ hai_ke(., .$产品)) |>
  save_csv(name = "海科")
}

# 海南玩呗 --------------------------------------------------------------------

{
  dataWanBei |>
  no_group(gro = "海南玩呗") |>
  save_csv(name = "海南玩呗")
}

# 杭州优擎 --------------------------------------------------------------------

{
  dataYouQing |>
  you() |>
  save_csv(name = "杭州优擎")
}

# 华述 ----------------------------------------------------------------------

{
  dataHuaShu |>
  mutate(
    帐户名称 = toupper(帐户名称),
    产品 = if_else(str_detect(帐户名称, "RUMMY"), "Rummy",
      if_else(str_detect(帐户名称, "TEENPATTIIKKA"), "TeenPattiIkka",
        if_else(str_detect(帐户名称, "TP"), "TeenPatti",
          if_else(str_detect(帐户名称, "TEEN"), "TeenPatti",
            "NONE"
          )
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ hua_shu(., gro = .$产品)) |>
  save_csv(name = "华述")
}

# 华恩 ----------------------------------------------------------------------

{
  # dataHuaEn |>
  #   mutate(
  #     广告账户名称 = toupper(广告账户名称),
  #     产品 = if_else(str_detect(广告账户名称, "PAYCREDIT"), "PayCredit",
  #       if_else(str_detect(广告账户名称, "FLY"), "FlyCash",
  #         if_else(str_detect(广告账户名称, "NAIRA CREDIT"), "Naira Credit",
  #           if_else(str_detect(广告账户名称, "EASYCREDIT"), "EasyCredit",
  #             if_else(str_detect(广告账户名称, "GOCASH"), "Gocash",
  #               if_else(str_detect(广告账户名称, "LUCKYCASH"), "luckycash",
  #                 if_else(str_detect(广告账户名称, "LUCKYBANK"), "Luckybank",
  #                   if_else(str_detect(广告账户名称, "NCN"), "NCN",
  #                     if_else(str_detect(广告账户名称, "51CREDIT"), "51 Credit",
  #                       if_else(str_detect(广告账户名称, "QUICK"), "quick cash",
  #                         if_else(str_detect(广告账户名称, "CREDIT"), "CreditCash",
  #                           if_else(str_detect(广告账户名称, "OGON"), "ZW",
  #                             if_else(str_detect(广告账户名称, "NAIRA PLUS"), "Naira Plus",
  #                               "None"
  #                             )
  #                           )
  #                         )
  #                       )
  #                     )
  #                   )
  #                 )
  #               )
  #             )
  #           )
  #         )
  #       )
  #     )
  #   ) |>
  #   group_split(产品) |>
  #   map_dfr(~ no_group(., gro = .$产品)) |>
  #   save_csv(name = "华恩")
}

# 捷奕 ----------------------------------------------------------------------

{
  dataJieYi |>
  no_group(gro = "捷奕") |>
  save_csv(name = "捷奕")

  dataJieYiGG |>
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

# 量子Dop -------------------------------------------------------------------

{
  dataLiangZiDop |>
  no_group(gro = "量子Dop") |>
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

# 洛阳采润 --------------------------------------------------------------------

{
  dataCaiRun |>
  no_group(gro = "洛阳采润") |>
  save_csv(name = "洛阳采润")
}

# 锐讯 ----------------------------------------------------------------------

{
  dataRuiXun |>
  no_group(gro = "锐讯") |>
  save_csv(name = "锐讯")
}

# 温州李冉 --------------------------------------------------------------------

{
  dataLiRan |>
  no_group(gro = "温州李冉") |>
  select(日期, 安装, 花费) |>
  save_csv(name = "温州李冉")
}

# 小糖 ----------------------------------------------------------------------

{
  dataXiaoTang |>
  no_group(gro = "小糖") |>
  save_csv(name = "小糖")

  dataXiaoTangGG |>
  summarise(
    日期 = Sys.Date() - 1,
    group = "小糖GG",
    安装次数 = sum(安装次数),
    展示次数 = sum(展示次数),
    点击次数 = sum(点击次数),
    费用 = sum(费用),
    转化价值 = sum(转化价值)
  ) |>
  save_csv(name = "小糖GG")
}

# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo |>
  li_ao() |>
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
  dataLongNv |>
  mutate(应用 = if_else(str_detect(广告系列, "IOS"), "IOS", "AND")) |>
  group_by(应用) |>
  summarise(
    日期 = Sys.Date() - 1,
    安装 = sum(安装次数),
    花费 = sum(费用),
    回收 = sum(所有转化价值)
  ) |>
  select(日期, everything()) |>
  save_csv(name = "龙女")
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
    dataZhuLi <- readxl::read_xls("新朱礼.xls")
    # dataDaYu <- readxl::read_xls("新大鱼_BingoWild.xls")
    dataJinGuo <- readxl::read_xls("新金果.xls")

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

    dataZhuLi |>
    no_group(gro = "朱礼") |>
    save_csv(name = "朱礼", filename = "00下午", append = T)

    dataJinGuo |>
    no_group(gro = "金果") |>
    select(日期, 安装, 花费) |>
    save_csv(name = "金果", filename = "00下午", append = T)
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
