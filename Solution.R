# 数据导入 --------------------------------------------------------------------
{
  setwd("C:/Users/fanhang/Desktop/Datadownload")
  source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

  dataNanTong <- readxl::read_xls("新南通小塘.xls")
  dataWanBei <- readxl::read_xls("新海南玩呗.xls")
  dataZhiNuo2 <- readxl::read_xlsx("致诺2.xlsx")
  dataXingQi <- readxl::read_xls("新星奇畅想.xls")
  dataJunYi <- readxl::read_xls("新重庆君仪.xls")
  dataTengSheng <- readxl::read_xls("新北京腾升.xls")
  dataXinYa <- readxl::read_xls("新XinYa.xls")
  dataKuWan <- readxl::read_xls("新酷玩.xls")
  dataJuChao <- readxl::read_xls("新巨潮.xls")
  dataHuaEn <- readxl::read_xls("新华恩.xls")
  dataWeiNa <- readxl::read_xls("新微纳.xls")
  dataChuYin <- readxl::read_xls("新刍音.xls")
  dataHuaShu <- readxl::read_xls("新华述_TPRaajy.xls")
  dataDaYu <- readxl::read_xls("新大鱼_BingoWild.xls")
  dataAnChengOne <- readxl::read_xls("新安橙_OneLive.xls")
  dataLiangZiDop <- readxl::read_xls("新量子_Dop.xls")
  dataCaiShen <- readxl::read_xls("新财神卡.xls")
  dataFeiFB <- readxl::read_xls("新飞乐乐_FB.xls")
  dataAJiBi <- readxl::read_xls("新阿吉比.xls")
  dataHuaCe <- readxl::read_xls("新华策天城.xls")
  dataYouLiang <- readxl::read_xls("新杭州优量.xls")
  dataYouQing <- readxl::read_xls("新杭州优擎.xls")
  dataPrometheus <- readxl::read_xls("新Prometheus.xls")
  dataHaiNan <- readxl::read_xls("新海南翎唛.xls")
  dataBauCuaKing <- readxl::read_xls("新海南翎麦_BauCuaKing.xls")
  dataHuanLe <- readxl::read_xls("新海南翎麦_欢乐语音.xls")
  dataFortune <- readxl::read_xls("新海南翎麦_FortuneClub.xls")
  dataBaCay <- readxl::read_xls("新海南翎麦_BaCayPoker.xls")
  dataSlotsMaster <- readxl::read_xls("新海南翎麦_SlotsMaster.xls")
  dataTPReal_IOS <- readxl::read_xls("新博客来_TPReal_IOS.xls")
  dataRummyReal <- readxl::read_xls("新博客来RummyReal.xls")
  dataRummyAND <- readxl::read_xls("新博客来_Rummy_AND.xls")
  dataLingKPC <- readxl::read_xls("新灵分_Key_Pay_Cube.xls")
  dataLingSo <- readxl::read_xls("新灵分_So_AB_ZX.xls")
  dataMerlingen <- readxl::read_xls("新Merlingen.xls")
  dataZhangYun <- readxl::read_xls("新掌中云.xls")
  dataLiAo <- readxl::read_xls("新深圳理奥.xls")
  dataJiDao <- readxl::read_xlsx("吉道.xlsx", skip = 2, col_names = T)
  dataMiao <- readxl::read_xls("新喵石.xls")
  dataSan <- readxl::read_xls("新海南翎麦Sancamap.xls")
  dataKaiTakTak <- readxl::read_xls("新凯丽金_TakTak.xls")
  dataKaiStich <- readxl::read_xls("新凯丽金_Stich.xls")
  dataKaiVideo <- readxl::read_xls("新凯丽金_VideoChat.xls")
  dataKaiHaya <- readxl::read_xls("新凯丽金_Haya.xls")
  dataKaiHallo <- readxl::read_xls("新凯丽金_Hallo.xls")
  dataKaiWinnie <- readxl::read_xls("新凯丽金_Winnie.xls")
  dataBaiPlayer <- readxl::read_xls("新白鲸_VideoPlayer.xls")
  dataBaiMovzy <- readxl::read_xls("新白鲸_Movzy.xls")
  dataBaiVidman <- readxl::read_xls("新白鲸_Vidman.xls")
  dataDreame <- readxl::read_xls("新Dreame1.xls")
  dataJiang <- readxl::read_xls("江苏明通新墨香.xls")
  dataFuYunParti <- readxl::read_xls("新福韵_Parti.xls")
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
}

# 白鲸 ----------------------------------------------------------------------

{
  dataBaiMovzy1 <- dataBaiMovzy %>%
    with_go() %>%
    mutate(产品 = "白鲸Movzy") %>%
    bai_jing()

  dataBaiPlayer1 <- dataBaiPlayer %>%
    with_go() %>%
    mutate(产品 = "白鲸video player") %>%
    bai_jing()

  dataBaiVidman1 <- dataBaiVidman %>%
    with_go() %>%
    mutate(产品 = "白鲸Vidman") %>%
    bai_jing()

  dataBaiMovzyIOS14 <- tibble(
    日期 = as.character(Sys.Date() - 1),
    产品 = "白鲸Movzy",
    地区 = c("AU", "CA", "NL", "GB", "PH", "US"),
    版本 = "IOS14",
    安装 = 0
  )

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

  bind_rows(dataBaiMovzyIOS14, dataBaiPlayerIOS14, dataBaiVidman14, dataBaiPlayer1, dataBaiVidman1) %>%
    save_csv(name = "白鲸")
}

# 酷玩 ----------------------------------------------------------------------

{
  dataKuWan %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "3101006"), "happy",
        if_else(str_detect(广告账户名称, "3100050"), "2号",
          if_else(str_detect(广告账户名称, "3140026"), "pro",
            if_else(str_detect(广告账户名称, "3150032"), "amazing",
              if_else(str_detect(广告账户名称, "1888972"), "luckytrip",
                if_else(str_detect(广告账户名称, "1888973"), "fantasykargame",
                  if_else(str_detect(广告账户名称, "成都五彩石"), "Rummy Vungo",
                    "None"
                  )
                )
              )
            )
          )
        )
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    save_csv(name = "酷玩")
}


# 星奇畅想 --------------------------------------------------------------------

{
  dataXingQi %>%
    no_group(gro = "星奇畅想") %>%
    select(日期, 花费, 安装) %>%
    save_csv(name = "星奇畅想")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhang %>%
    with_os() %>%
    zhang_yue() %>%
    save_csv(name = "掌阅")
}

# 领麦TopRummy -----------------------------------------------------------------

{
  dataHaiNan %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "INDIAN"), "IndianTP",
        if_else(str_detect(广告账户名称, "CALLBREAK"), "Cellbreak",
          if_else(str_detect(广告账户名称, "RUMMY WIN"), "Rummy Win Facebook",
            if_else(str_detect(广告账户名称, "REAL TEEN"), "Real Teen Patti",
              "None"
            )
          )
        )
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    select(-c(回收, 购买, 注册)) %>%
    save_csv(name = "领麦")
}

# Merlingen ------------------------------------------------------------------

{
  dataMerlingen1 <- dataMerlingen %>%
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

  dataMerlingen1 %>%
    filter(产品 == "Luxury") %>%
    luxury() %>%
    select(日期, 产品, 花费) %>%
    save_csv(name = "Luxury")

  dataMerlingen1 %>%
    filter(产品 == "Jeetobada") %>%
    no_group(gro = "Jeetobada") %>%
    select(group, 日期, 花费) %>%
    save_csv(name = "Jeetobada")

  dataMerlingen1 %>%
    filter(产品 == "SpinToWorld") %>%
    no_group(gro = "SpinToWorld") %>%
    select(group, 日期, 花费) %>%
    save_csv(name = "SpinToWorld")

  dataMerlingen1 %>%
    filter(产品 == "Rummy Cool Card") %>%
    no_group(gro = "Rummy Cool Card") %>%
    select(group, 日期, 花费) %>%
    save_csv(name = "Rummy Cool Card")
}

# 玩德游戏 --------------------------------------------------------------------

{
  # dataWanDeGG1 <- dataWanDeGG %>%
  #   filter(!is.na(广告系列)) %>%
  #   mutate_all(replace_na, replace = 0) %>%
  #   mutate(
  #     版本 = if_else(str_detect(广告系列, "AND"), "AND", "IOS"),
  #     地区 = if_else(str_detect(广告系列, "ID"), "ID",
  #       str_sub(广告系列, 23, 24)
  #     ),
  #     安装量 = 安装次数,
  #     点击量 = 点击次数,
  #     金额 = 费用
  #   ) %>%
  #   group_by(版本, 地区) %>%
  #   summarise(
  #     日期 = as.character(Sys.Date() - 1),
  #     安装 = sum(as.numeric(安装量)),
  #     点击 = sum(as.numeric(点击量)),
  #     展示次数 = sum(as.numeric(展示次数)),
  #     花费 = sum(as.numeric(金额)),
  #     CPI = 花费 / 安装,
  #     CTR = 点击 / 展示次数,
  #     CVR = 安装 / 点击
  #   ) %>%
  #   select(日期, 版本, 地区, 安装, 花费, CPI, 点击, 展示次数, CTR, CVR)

  # dataWanDeGG2 <- tibble(
  #   日期 = "　", 版本 = "　", 地区 = "总计",
  #   安装 = sum(dataWanDeGG1$安装),
  #   点击 = sum(dataWanDeGG1$点击),
  #   展示次数 = sum(dataWanDeGG1$展示次数),
  #   花费 = sum(dataWanDeGG1$花费)
  # ) %>%
  #   mutate(
  #     CPI = 花费 / 安装,
  #     CTR = 点击 / 展示次数,
  #     CVR = 安装 / 点击
  #   )
  #
  #   dataWanDe1 <- dataWanDe %>%
  #     with_go() %>%
  #     mutate(
  #       CPI = 花费 / 安装,
  #       CTR = 点击 / 展示次数,
  #       CVR = 安装 / 点击
  #     ) %>%
  #     select(日期, 版本, 地区, 安装, 花费, CPI, 点击, 展示次数, CTR, CVR)
  #
  #   dataWanDe2 <- tibble(
  #     日期 = "　", 版本 = "　", 地区 = "总计",
  #     安装 = sum(dataWanDe1$安装),
  #     点击 = sum(dataWanDe1$点击),
  #     展示次数 = sum(dataWanDe1$展示次数),
  #     花费 = sum(dataWanDe1$花费)
  #   ) %>%
  #     mutate(
  #       CPI = 花费 / 安装,
  #       CTR = 点击 / 展示次数,
  #       CVR = 安装 / 点击
  #     ) %>%
  #     select(日期, 版本, 地区, 安装, 花费, CPI, 点击, 展示次数, CTR, CVR)
  #
  #   # bind_rows(dataWanDeGG1, dataWanDeGG2) %>% save_csv(name = "玩德游戏GG")
  #   bind_rows(dataWanDe1, dataWanDe2) %>% save_csv(name = "玩德游戏")
}


# XinYa -------------------------------------------------------------------

{
  dataXinYa %>%
    no_group(gro = "XinYa") %>%
    save_csv(name = "XinYa")
}

# 吉道 ----------------------------------------------------------------------

{
  dataJiDao %>%
    ji_dao() %>%
    select(日期, everything()) %>%
    save_csv(name = "吉道")
}
# 华策天城 --------------------------------------------------------------------

{
  dataHuaCe %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "OE"), "OE Tread",
        if_else(str_detect(广告账户名称, "UNI"), "Uni Trend", "None")
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    select(-c(购买, 回收, 注册)) %>%
    save_csv(name = "华策天城")
}

# 江苏明通新墨香 -------------------------------------------------------------

{
  dataJiang1 <- dataJiang %>%
    with_go() %>%
    select(-回收, -注册) %>%
    mutate(CPI = 花费 / 安装) %>%
    select(-购买)

  dataJiang2 <- tibble(
    日期 = "　", 版本 = " ", 地区 = "总计",
    安装 = sum(dataJiang1$安装),
    点击 = sum(dataJiang1$点击),
    展示次数 = sum(dataJiang1$展示次数),
    花费 = sum(dataJiang1$花费),
    CPI = 花费 / 安装
  )

  bind_rows(dataJiang1, dataJiang2) %>% save_csv(name = "江苏明通新墨香")
}

# dreame -----------------------------------------------------------------

{
  dataDreame %>%
    dream() %>%
    with_go() %>%
    select(-c(购买, 注册)) %>%
    save_csv(name = "Dreame")
}

# 掌云 ----------------------------------------------------------------------

{
  dataZhangYun %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "LILACNOVEL"), "Lilacnovel", "掌云")
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    select(-c(购买, 注册)) %>%
    select(group, 日期, everything()) %>%
    save_csv(name = "掌云")
}

# 博客来 J+M -----------------------------------------------------------

{
  dataTPReal_IOS %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子", "Monika")
    ) %>%
    group_split(优化) %>%
    map_dfr(., ~ no_group(., gro = .$优化)) %>%
    select(日期, group, 展示次数, 点击, 花费) %>%
    save_csv(name = "TPReal_IOS")

  dataRummyAND %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      优化 = if_else(str_detect(广告账户名称, "贰壹A"), "叶子",
        (if_else(str_detect(广告账户名称, "J代投"), "叶子",
          (if_else(str_detect(广告账户名称, "JANE代投"), "叶子", "Monika"))
        ))
      )
    ) %>%
    group_split(优化) %>%
    map_dfr(., ~ no_group(., gro = .$优化)) %>%
    select(日期, group, 展示次数, 点击, 花费) %>%
    save_csv(name = "RummyAND")

  dataRummyReal %>%
    no_group(gro = "RummyReal") %>%
    select(日期, group, 展示次数, 点击, 花费) %>%
    save_csv(name = "RummyReal")
}

# 使用walk保存数据 --------------------------------------------------------------

{
  # Rummy <- list(dataRummyIOSJ1, dataRummyIOSM1, dataRummyANDJ1, dataRummyANDM1)

  # walk(Rummy, ~save_csv(.,name = .$group))
}

# Prometheus --------------------------------------------------------------

{
  dataPrometheus %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "7UP"), "7UP",
        if_else(str_detect(广告账户名称, "MK"), "MoreKash",
          if_else(str_detect(广告账户名称, "HIPAL"), "HiPal", "None")
        )
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    select(-c(注册)) %>%
    save_csv(name = "Prometheus")
}

# 凯丽金videochat -------------------------------------------------------------

{
  dataKaiHaya1 <- dataKaiHaya %>%
    no_group(gro = "Haya") %>%
    select_default(selection = "注册")

  dataKaiStich1 <- dataKaiStich %>%
    no_group(gro = "Stich") %>%
    select_default(selection = "注册")

  dataKaiVideo1 <- dataKaiVideo %>%
    no_group(gro = "Video") %>%
    select_default(selection = "注册")

  dataKaiWinnie1 <- dataKaiWinnie %>%
    no_group(gro = "Winnie") %>%
    select_default(selection = "注册")

  dataKaiTakTak1 <- dataKaiTakTak %>%
    no_group(gro = "TakTak") %>%
    select_default(selection = "注册")

  bind_rows(dataKaiHaya1, dataKaiStich1, dataKaiVideo1, dataKaiWinnie1, dataKaiTakTak1) %>%
    save_csv(name = "Videochat")

  dataKaiHallo %>%
    with_geo(gro = "Hallo") %>%
    select(-购买) %>%
    save_csv(name = "Videochat_Hallo")
}

# 阿吉比 ---------------------------------------------------------------------

{
  dataAJiBi %>%
    mutate(
      系列名称 = toupper(系列名称),
      产品 = if_else(str_detect(系列名称, "BEST"), "Bestgp",
        if_else(str_detect(系列名称, "DHANI"), "Dhanigp", "None")
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., .$产品)) %>%
    select(-c(注册)) %>%
    save_csv(name = "阿吉比")
}

# 安橙 ----------------------------------------------------------------------

{
  dataAnChengOne %>%
    with_geo(gro = "安橙OneLive") %>%
    mutate(安装成本 = 花费 / 安装, ROI = 回收 / 花费) %>%
    select(Group, 日期, 地区, 安装, 花费, 回收, 安装成本, ROI) %>%
    save_csv(name = "安橙OneLive")
}

# 北京腾升 --------------------------------------------------------------------

{
  dataTengSheng %>%
    with_geo(gro = "北京腾升") %>%
    save_csv(name = "北京腾升")
}

# 财神卡 ---------------------------------------------------------------------

{
  dataCaiShen %>%
    no_group(gro = "财神卡") %>%
    select(-c(注册)) %>%
    save_csv(name = "财神卡")
}

# 刍音 ----------------------------------------------------------------------

{
  dataChuYin %>%
    no_group(gro = "刍音") %>%
    save_csv(name = "刍音")
}

# 大鱼 ----------------------------------------------------------------------

{
  dataDaYu %>%
    mutate(优化 = if_else(str_detect(系列名称, "AEO"), "AEO", "VO")) %>%
    group_split(优化) %>%
    map_dfr(~ with_os(.)) %>%
    select(日期, 优化, 版本, 花费) %>%
    save_csv(name = "大鱼")
}

# 飞乐乐 ----------------------------------------------------------------------

{
  dataFeiFB %>%
    fei() %>%
    select(日期, everything()) %>%
    save_csv(name = "飞乐乐")
}

# 福韵 ----------------------------------------------------------------------

{
  dataFuYunParti %>%
    no_group(gro = "福韵Parti") %>%
    select(花费, 安装) %>%
    save_csv(name = "福韵Parti")
}

# 海南玩呗 --------------------------------------------------------------------

{
  dataWanBei %>%
    no_group(gro = "海南玩呗") %>%
    save_csv(name = "海南玩呗")
}

# 杭州优量 --------------------------------------------------------------------

{
  dataYouLiang %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "CASTLE"), "Castle",
        if_else(str_detect(广告账户名称, "GROUP"), "Rummy",
          if_else(str_detect(广告账户名称, "DOMAIN"), "Rummy Domain",
            "None"
          )
        )
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., .$产品)) %>%
    select(-c(注册)) %>%
    save_csv(name = "杭州优量")
}

# 杭州优擎 --------------------------------------------------------------------

{
  dataYouQing %>%
    you() %>%
    save_csv(name = "杭州优擎")
}

# 华述 ----------------------------------------------------------------------

{
  dataHuaShu %>%
    no_group(gro = "华述") %>%
    save_csv(name = "华述")
}

# 华恩 ----------------------------------------------------------------------

{
  dataHuaEn %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "PAYCREDIT"), "PayCredit",
        if_else(str_detect(广告账户名称, "FLY"), "FlyCash",
          if_else(str_detect(广告账户名称, "NAIRA"), "Naira",
            if_else(str_detect(广告账户名称, "EASYCREDIT"), "EasyCredit",
              if_else(str_detect(广告账户名称, "GOCASH"), "Gocash",
                if_else(str_detect(广告账户名称, "LUCKYCASH"), "luckycash",
                  if_else(str_detect(广告账户名称, "LUCKYBANK"), "Luckybank",
                    if_else(str_detect(广告账户名称, "NCN"), "NCN",
                      if_else(str_detect(广告账户名称, "51CREDIT"), "51 Credit",
                        if_else(str_detect(广告账户名称, "QUICK"), "quick cash",
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
    ) %>%
    group_split(产品) %>%
    map_dfr(~ no_group(., gro = .$产品)) %>%
    save_csv(name = "华恩")
}



# 巨潮 ----------------------------------------------------------------------

{
  dataJuChao %>%
    no_group(gro = "巨潮") %>%
    save_csv(name = "巨潮")
}

# 量子Dop -------------------------------------------------------------------

{
  dataLiangZiDop %>%
    no_group(gro = "量子Dop") %>%
    select(-c("回收", "购买", "注册")) %>%
    save_csv(name = "量子Dop")
}

# 灵分 ----------------------------------------------------------------------

{
  dataLingKPC %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "KEY"), "Key",
        (if_else(str_detect(广告账户名称, "PAY"), "Pay",
          (if_else(str_detect(广告账户名称, "CUBE"), "Cube",
            (if_else(str_detect(广告账户名称, "GOOD"), "Good Loaning",
              (if_else(str_detect(广告账户名称, "BOSS"), "Credit Boss",
                (if_else(str_detect(广告账户名称, "MOMO"), "MoMoCash", "None")
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
    ) %>%
    group_split(产品) %>%
    map_dfr(~ ling(., name = .$产品)) %>%
    save_csv(name = "灵分Key_Pay_Cube")

  dataLingSo %>%
    mutate(
      广告账户名称 = toupper(广告账户名称),
      产品 = if_else(str_detect(广告账户名称, "AB"), "AB",
        (if_else(str_detect(广告账户名称, "ZX"), "ZX", "SoCredit"))
      )
    ) %>%
    group_split(产品) %>%
    map_dfr(~ ling(., name = .$产品)) %>%
    save_csv(name = "灵分So_AB_ZX")
}

# 喵石 ----------------------------------------------------------------------

{
  dataMiao %>%
    with_os() %>%
    select(日期, 版本, 安装, 花费) %>%
    save_csv(name = "喵石")
}

# 南通小塘 --------------------------------------------------------------------

{
  dataNanTong %>% 
    no_group(gro = "南通小塘") %>% 
    save_csv(name = "南通小塘")
}

# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo %>%
    li_ao() %>%
    save_csv(name = "深圳理奥")
}

# 微纳 ----------------------------------------------------------------------

{
  dataWeiNa %>%
    mutate(日期 = Sys.Date() - 1, 账户id = as.character(账户id)) %>%
    select(日期, 广告账户名称, 系列名称, 账户id, 金额) %>%
    save_csv(name = "微纳")
}

# 重庆君仪 --------------------------------------------------------------------

{
  dataJunYi %>%
    no_group(gro = "重庆君仪") %>%
    save_csv(name = "重庆君仪")
}


# 致诺 ----------------------------------------------------------------------

{
  ZhiNuo2 <- dataZhiNuo2 %>%
    fix_fb_name()

  ZhiNuo2 %>%
    filter(!is.na(帐户名称)) %>%
    mutate_all(replace_na, replace = 0) %>%
    mutate(
      日期 = Sys.Date() - 1,
      购买 = 购买,
      购物转化值 = 购物转化价值
    ) %>%
    select(日期, `点击量（全部）`, 展示次数, 花费金额, 购买, 购物转化值) %>%
    adorn_totals(., name = "总计") %>%
    save_csv(name = "致诺")
}

# 海南领麦 ----------------------------------------------------------------

{
  dataSan1 <- dataSan %>%
    no_group(gro = "Sancamap") %>%
    select_default() %>%
    select(-回收)

  dataBaCay1 <- dataBaCay %>%
    no_group(gro = "BaCay") %>%
    select_default() %>%
    select(-回收)

  dataFortune1 <- dataFortune %>%
    no_group(gro = "Fortune") %>%
    select_default() %>%
    select(-回收)

  dataBauCuaKing1 <- dataBauCuaKing %>%
    no_group(gro = "BauCuaKing") %>%
    select_default() %>%
    select(-回收)

  dataSlotsMaster1 <- dataSlotsMaster %>%
    no_group(gro = "SlotsMaster") %>%
    select_default() %>%
    select(-回收)

  dataHuanLe1 <- dataHuanLe %>%
    with_os() %>%
    mutate(group = "欢乐语音") %>%
    select(日期, group, 版本, 安装, 点击, 展示次数, 花费)

  bind_rows(dataSan1, dataBaCay1, dataFortune1, dataBauCuaKing1, dataSlotsMaster1, dataHuanLe1) %>%
    select(group, 日期, 版本, everything()) %>%
    save_csv(name = "领麦Sancamap")
}

# 二手车 ---------------------------------------------------------------------

{
  # if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 17)) {
  #   # dataCarFB <- readxl::read_xlsx("二手车FB.xlsx", col_names = T)
  #   # dataCarGG <- readxl::read_xlsx("二手车GG.xlsx", skip = 2, col_names = T)
  #   dataFixFB <- readxl::read_xlsx("修车FB.xlsx", col_names = T)
  #   dataFixGG <- readxl::read_xlsx("修车GG.xlsx", skip = 2, col_names = T)
  #
  #   # dataCarFB1 <- dataCarFB %>%
  #   #   car_fix_fb() %>%
  #   #   CarFB()
  #
  #   # dataCarGG1 <- dataCarGG %>% car_gg()
  #
  #   dataFixFB1 <- dataFixFB %>%
  #     filter(!is.na(日期)) %>%
  #     fix_fb_name() %>%
  #     car_fb()
  #
  #   dataFixGG1 <- dataFixGG %>% car_gg()
  #
  #   # bind_rows(dataCarFB1, dataCarGG1) %>%
  #   #   arrange(日期) %>%
  #   #   save_csv(name = "Car", filename = "0二手车", append = F)
  #   bind_rows( dataFixGG1) %>%
  #     arrange(日期) %>%
  #     save_csv(name = "Fix", filename = "00二手车")
  # } else {
  #   message("NotNow!")
  # }
}

# 暴发户 ---------------------------------------------------------------------

{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 12)) {
    dataCashBox <- readxl::read_xlsx("cashbox.xlsx", col_names = T)
    dataCashBox1 <- dataCashBox %>%
      filter(!is.na(日期)) %>%
      fix_fb_name() %>%
      mutate_all(replace_na, replace = 0) %>%
      mutate(
        方式 = if_else(str_detect(广告系列名称, "注册"), "注册", "AEO"),
        花费 = `花费金额`,
        安装 = 应用安装,
        注册 = 完成注册,
        申请 = 完成关卡
      ) %>%
      group_by(方式) %>%
      summarize(
        日期 = as.character(Sys.Date() - 1),
        花费 = sum(as.numeric(花费)),
        安装 = sum(as.numeric(安装)),
        注册 = sum(as.numeric(注册)),
        申请 = sum(as.numeric(申请))
      ) %>%
      arrange(desc(方式))

    dataCashBox2 <- tibble(
      方式 = "",
      日期 = as.character(Sys.Date() - 1),
      花费 = sum(dataCashBox1$花费),
      安装 = sum(dataCashBox1$安装),
      注册 = sum(dataCashBox1$注册),
      申请 = sum(dataCashBox1$申请)
    )
    bind_rows(dataCashBox2, dataCashBox1) %>%
      save_csv(name = "爆发户", filename = "00暴发户")
  } else {
    message("NotNow!")
  }
}

gc()
message("任務終了")
