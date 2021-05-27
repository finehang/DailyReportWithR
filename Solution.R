# 数据导入 --------------------------------------------------------------------
{
  setwd("C:/Users/fanhang/Desktop/Datadownload")
  source("C:/Users/fanhang/OneDrive/Code/DailyReport/FUN.R", encoding = "utf-8")
  rename_me()

  dataGuangNian <- readxl::read_xlsx("./光年.xlsx") |> filter(!is.na(帐户名称))
  dataHaiKe <- readxl::read_xlsx("海科.xlsx") |> filter(!is.na(帐户名称))
  dataZhangYue <- readxl::read_xlsx("掌阅.xlsx") |> filter(!is.na(帐户名称))
  dataHuaShu <- readxl::read_xlsx("./华述.xlsx") |> filter(!is.na(帐户名称))
  xin_mo <- readxl::read_xlsx("./新陌.xlsx") |> filter(!is.na(帐户名称))
  # dataGeZi <- readxl::read_xlsx("./格子.xlsx") |> filter(!is.na(帐户名称))
  # dataFench <- readxl::read_xlsx("./Fench.xlsx") |> filter(!is.na(帐户名称))
  # dataHuiXian <- readxl::read_xlsx("辉仙.xlsx") |> filter(!is.na(帐户名称))
  # dataZheng <- readxl::read_xls("./华生.xlsx")
  dataJieYi <- readxl::read_xls("./新捷奕.xls")
  dataZheng <- readxl::read_xls("./新郑郑.xls")
  dataMoca <- readxl::read_xls("./新Moca.xls")
  dataTPReal_IOS <- readxl::read_xls("新博客来_TPReal_IOS.xls")
  dataCaiRun <- readxl::read_xls("新洛阳采润.xls")
  dataShiJi <- readxl::read_xls("新世纪欢腾.xls")
  dataRummyReal <- readxl::read_xls("新博客来RummyReal.xls")
  dataRummyAND <- readxl::read_xls("新博客来_Rummy_AND.xls")
  dataHaiWan <- readxl::read_xls("新HaiWan.xls")
  dataMiCoLive <- readxl::read_xls("新MiCoLive.xls")
  dataBit <- readxl::read_xls("新比特币.xls")
  dataMiYi <- readxl::read_xls("新米易.xls")
  dataWanBei <- readxl::read_xls("新海南玩呗.xls")
  dataXingQi <- readxl::read_xls("新星奇畅想.xls")
  dataTengSheng <- readxl::read_xls("新北京腾升.xls")
  dataXinYa <- readxl::read_xls("新XinYa.xls")
  dataKuWanJane <- readxl::read_xls("新酷玩_Jane.xls")
  dataKuWanMonika <- readxl::read_xls("新酷玩_Monika.xls")
  dataLiangZiDop <- readxl::read_xls("新量子_Dop.xls")
  dataFeiFB <- readxl::read_xls("新飞乐乐_FB.xls")
  dataHuaCe <- readxl::read_xls("新华策天城.xls")
  dataYouLiang <- readxl::read_xls("新杭州优量.xls")
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
  dataJiDao <- readxl::read_xlsx("吉道.xlsx", skip = 2, col_names = T)
  dataMiao <- readxl::read_xls("新喵石.xls")
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
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
  # dataPrometheus <- readxl::read_xls("新Prometheus.xls")
  # dataLiRan <- readxl::read_xls("新李冉.xls")
  # dataNanTong <- readxl::read_xls("新南通小塘.xls")
  # dataRuiDao <- readxl::read_xls("新瑞道.xls")
  # dataChuanYe <- readxl::read_xls("新川野.xls")
  dataJunYi <- readxl::read_xls("新重庆君仪.xls")
  # dataZhiNuo2 <- readxl::read_xlsx("致诺2.xlsx")
  # dataJuChao <- readxl::read_xls("新巨潮.xls")
  # dataHuaEn <- readxl::read_xls("新华恩.xls")
  # dataWeiNa <- readxl::read_xls("新微纳.xls")
  # dataChuYin <- readxl::read_xls("新刍音.xls")
  # dataAnChengOne <- readxl::read_xls("新安橙_OneLive.xls")
  # dataAJiBi <- readxl::read_xls("新阿吉比.xls")
  # dataCaiShen <- readxl::read_xls("新财神卡.xls")
  # dataZhangYun <- readxl::read_xls("新掌中云.xls")
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

# 领麦TopRummy -----------------------------------------------------------------

{
  a <- dataHaiNan |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "INDIAN"), "IndianTP",
      if_else(str_detect(广告账户名称, "CALLBREAK"), "Cellbreak",
        if_else(str_detect(广告账户名称, "RUMMY WIN"), "Rummy Win Facebook",
          if_else(str_detect(广告账户名称, "REAL TEEN"), "Real Teen Patti",
            if_else(str_detect(广告账户名称, "0429-RUMMY"), "kingrummy",
              if_else(str_detect(广告账户名称, "KING"), "kingrummy",
                if_else(str_detect(广告账户名称, "TEENPATTI"), "TeenPattiStar",
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

# 吉道 ----------------------------------------------------------------------

{
  dataJiDao |>
  ji_dao() |>
  select(日期, everything()) |>
  save_csv(name = "吉道")
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

# 温州李冉 --------------------------------------------------------------------

{
  # dataLiRan |>
  #   no_group(gro = "李冉") |>
  #   select(日期, 安装, 花费) |>
  #   save_csv(name = "温州李冉")
}

# 世纪欢腾 --------------------------------------------------------------------

{
  dataShiJi |>
  no_group(gro = "世纪欢腾") |>
  select(安装, 花费) |>
  save_csv(name = "世纪欢腾")
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

# 掌云 ----------------------------------------------------------------------

{
  # dataZhangYun |>
  #   mutate(
  #     广告账户名称 = toupper(广告账户名称),
  #     产品 = if_else(str_detect(广告账户名称, "LILACNOVEL"), "Lilacnovel", "掌云")
  #   ) |>
  #   group_split(产品) |>
  #   map_dfr(~ no_group(., gro = .$产品)) |>
  #   select(group, 日期, everything()) |>
  #   save_csv(name = "掌云")
}


# HaiWan ------------------------------------------------------------------

{
  dataHaiWan |>
  no_group(gro = "HaiWan") |>
  save_csv(name = "HaiWan")
}


# Fench -------------------------------------------------------------------

{
  # dataFench |>
  #   mutate(group = "Fench", 日期 = Sys.Date() - 1) |>
  #   select(group, 日期, 应用安装, `点击量（全部）`, 展示次数, `花费金额 (USD)`, 购买, 完成注册) |>
  #   save_csv(name = "Fench")
}

# MiCoLive ----------------------------------------------------------------

{
  dataMiCoLive |>
    mutate(
      广告账户名称 = toupper(广告账户名称),
      优化 = if_else(str_detect(广告账户名称, "REALIVE"), "Realive", "None")
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

  dataRummyAND |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子",
      (if_else(str_detect(广告账户名称, "J代投"), "叶子",
        (if_else(str_detect(广告账户名称, "JANE代投"), "叶子", "Monika"))
      ))
    )
  ) |>
  group_split(优化) |>
  map_dfr(~ no_group(., gro = .$优化)) |>
  save_csv(name = "RummyAND")

  dataRummyReal |>
  no_group(gro = "RummyReal") |>
  select(日期, group, 展示次数, 点击, 花费) |>
  save_csv(name = "RummyReal")
}

# 使用walk保存数据 --------------------------------------------------------------

{
  # Rummy <- list(dataRummyIOSJ1, dataRummyIOSM1, dataRummyANDJ1, dataRummyANDM1)

  # walk(Rummy, ~save_csv(.,name = .$group))
}

# Prometheus --------------------------------------------------------------

{
  # dataPrometheus |>
  #   mutate(
  #     广告账户名称 = toupper(广告账户名称),
  #     产品 = if_else(str_detect(广告账户名称, "7UP"), "7UP",
  #       if_else(str_detect(广告账户名称, "MK"), "MoreKash",
  #         if_else(str_detect(广告账户名称, "HIPAL"), "HiPal", "None")
  #       )
  #     )
  #   ) |>
  #   group_split(产品) |>
  #   map_dfr(~ no_group(., gro = .$产品)) |>
  #   save_csv(name = "Prometheus")
}

# Moca --------------------------------------------------------------------

{
  dataMoca |> 
    no_group(gro = "Moca") |> 
    select(group, 日期, 花费, 展示次数, 点击, 安装) |> 
    save_csv(name = "Moca")
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

# 阿吉比 ---------------------------------------------------------------------

{
  # dataAJiBi |>
  #   mutate(
  #     系列名称 = toupper(系列名称),
  #     产品 = if_else(str_detect(系列名称, "BEST"), "Bestgp",
  #       if_else(str_detect(系列名称, "DHANI"), "Dhanigp", "None")
  #     )
  #   ) |>
  #   group_split(产品) |>
  #   map_dfr(~ no_group(., .$产品)) |>
  #   save_csv(name = "阿吉比")
}

# 安橙 ----------------------------------------------------------------------

{
  # dataAnChengOne |>
  #   with_geo(gro = "安橙OneLive") |>
  #   mutate(安装成本 = 花费 / 安装, ROI = 回收 / 花费) |>
  #   select(Group, 日期, 地区, 安装, 花费, 回收, 安装成本, ROI) |>
  #   save_csv(name = "安橙OneLive")
}

# 北京腾升 --------------------------------------------------------------------

{
  dataTengSheng |>
  with_geo(gro = "北京腾升") |>
  save_csv(name = "北京腾升")
}

# 财神卡 ---------------------------------------------------------------------

{
  # dataCaiShen |>
  #   no_group(gro = "财神卡") |>
  #   save_csv(name = "财神卡")
}

# 刍音 ----------------------------------------------------------------------

{
  # dataChuYin |>
  #   no_group(gro = "刍音") |>
  #   save_csv(name = "刍音")
}


# 川野 ----------------------------------------------------------------------

{
  # dataChuanYe |>
  #   no_group(gro = "川野") |>
  #   save_csv(name = "川野")
}

# 飞乐乐 ----------------------------------------------------------------------

{
  dataFeiFB |>
  fei() |>
  select(日期, everything()) |>
  save_csv(name = "飞乐乐")
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

# 格子 ----------------------------------------------------------------------

{
  # dataGeZi |>
  # mutate(
  #   广告帐户名称 = toupper(帐户名称),
  #   产品 = if_else(str_detect(广告帐户名称, "RUPEE"), "Rupee",
  #     if_else(str_detect(广告帐户名称, "LOAN"), "Loan Wallet",
  #       "NONE"
  #     )
  #   )
  # ) |>
  # group_split(产品) |>
  # map_dfr(~ ge_zi(., .$产品)) |>
  # mutate(CPI = 花费 / 安装, 购买单价 = 花费 / 购买) |>
  # select(group, 日期, 安装, CPI, 购买, 购买单价, 花费) |>
  # save_csv(name = "格子")
}

# 光年 ----------------------------------------------------------------------

{
  dataGuangNian |>
  transmute(
    产品 = "光年",
    日期 = 报告开始日期,
    安装 = sum(应用安装),
    点击 = sum(`点击量（全部）`),
    展示 = sum(展示次数),
    花费 = sum(`花费金额 (USD)`)
  ) |>
  save_csv(name = "光年")
}

# 海南玩呗 --------------------------------------------------------------------

{
  dataWanBei |>
  no_group(gro = "海南玩呗") |>
  save_csv(name = "海南玩呗")
}

# 杭州优量 --------------------------------------------------------------------

{
  dataYouLiang |>
  mutate(
    广告账户名称 = toupper(广告账户名称),
    产品 = if_else(str_detect(广告账户名称, "CASTLE"), "Castle",
      if_else(str_detect(广告账户名称, "GROUP"), "Rummy",
        if_else(str_detect(广告账户名称, "DOMAIN"), "Rummy Domain",
          "None"
        )
      )
    )
  ) |>
  group_split(产品) |>
  map_dfr(~ no_group(., .$产品)) |>
  save_csv(name = "杭州优量")
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
      if_else(str_detect(帐户名称, "TP"), "TeenPatti",
        if_else(str_detect(帐户名称, "TEEN"), "TeenPatti",
          "NONE"
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

# 辉仙 ----------------------------------------------------------------------

{
  # dataHuiXian |>
  #   mutate(
  #     地区 = `国家/地区`,
  #     帐户名称 = toupper(帐户名称),
  #     产品 = if_else(str_detect(帐户名称, "PATTI KING"), "Patti KING",
  #       if_else(str_detect(帐户名称, "FUTURE"), "Future",
  #         if_else(str_detect(帐户名称, "WORLD"), "Patti World",
  #           if_else(str_detect(帐户名称, "LUCKY"), "Lucky 3 Patti ",
  #             "NONE"
  #           )
  #         )
  #       )
  #     )
  #   ) |>
  #   group_split(产品) |>
  #   map_dfr(~ hui_xian(., gro = .$产品)) |>
  #   save_csv(name = "辉仙")
}

# 巨潮 ----------------------------------------------------------------------

{
  # dataJuChao |>
  #   no_group(gro = "巨潮") |>
  #   save_csv(name = "巨潮")
}

# 捷奕 ----------------------------------------------------------------------

{
  dataJieYi |> 
    no_group(gro = "捷奕") |>
    save_csv(name = "捷奕")
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

# 喵石 ----------------------------------------------------------------------

{
  dataMiao |>
  with_os() |>
  select(日期, 版本, 安装, 花费) |>
  save_csv(name = "喵石")
}

# 瑞道 ----------------------------------------------------------------------

{
  # dataRuiDao |>
  #   no_group(gro = "瑞道") |>
  #   save_csv(name = "瑞道")
}

# 南通小塘 --------------------------------------------------------------------

{
  # dataNanTong |>
  #   no_group(gro = "南通小塘") |>
  #   save_csv(name = "南通小塘")
}

# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo |>
  li_ao() |>
  save_csv(name = "深圳理奥")
}

# 微纳 ----------------------------------------------------------------------

{
  # dataWeiNa |>
  #   mutate(日期 = Sys.Date() - 1, 账户id = as.character(账户id)) |>
  #   select(日期, 广告账户名称, 系列名称, 账户id, 金额) |>
  #   save_csv(name = "微纳")
}

# 重庆君仪 --------------------------------------------------------------------

{
  dataJunYi |>
    no_group(gro = "重庆君仪") |>
    save_csv(name = "重庆君仪")
}


# 致诺 ----------------------------------------------------------------------

{
  # ZhiNuo2 <- dataZhiNuo2 |>
  #   fix_fb_name()
  #
  # ZhiNuo2 |>
  #   filter(!is.na(帐户名称)) |>
  #   mutate_all(replace_na, replace = 0) |>
  #   mutate(
  #     日期 = Sys.Date() - 1,
  #     购买 = 购买,
  #     购物转化值 = 购物转化价值
  #   ) |>
  #   select(日期, `点击量（全部）`, 展示次数, 花费金额, 购买, 购物转化值) |>
  #   adorn_totals(., name = "总计") |>
  #   save_csv(name = "致诺")
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

# 郑郑 ----------------------------------------------------------------------

{
  dataZheng |>
  no_group(gro = "郑郑") |>
  select(group, 日期, 安装, 花费) |>
  save_csv(name = "郑郑")
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
    dataDaYu <- readxl::read_xls("新大鱼_BingoWild.xls")
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
  } else {
    message("NotNow!")
  }

  dataDaYu |>
  mutate(优化 = if_else(str_detect(系列名称, "AEO"), "AEO", "VO")) |>
  group_split(优化) |>
  map_dfr(~ with_os(.)) |>
  select(日期, 优化, 版本, 花费) |>
  save_csv(name = "大鱼", filename = "00下午", append = T)
  
  dataJinGuo |> 
    no_group(gro = "金果") |> 
    select(日期, 安装, 花费) |> 
    save_csv(name = "金果", filename = "00下午", append = T)
}

gc()
message("任務終了")
