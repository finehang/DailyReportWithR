setwd("C:/Users/fanhang/Desktop/Datadownload")
source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

# 数据导入 --------------------------------------------------------------------

{
  dataFei6 <- readr::read_csv("飞6.csv")
  dataFei5 <- readr::read_csv("飞5.csv")
  dataFei4 <- readr::read_csv("飞4.csv")
  dataFei3 <- readr::read_csv("飞3.csv")
  dataFei2 <- readr::read_csv("飞2.csv")
  dataFei1 <- readr::read_csv("飞1.csv")
  dataFeiFB <- readxl::read_xls("新飞乐乐_FB.xls")
  dataAJiBi <- readxl::read_xls("新阿吉比.xls")
  dataHuanLe <- readxl::read_xls("新海南翎麦_欢乐语音.xls")
  dataGouQiGaga <- readxl::read_xls("新枸杞_Gaga.xls")
  dataGouQiLili <- readxl::read_xls("新枸杞_Lili.xls")
  dataHuaCe <- readxl::read_xls("新华策天城.xls")
  dataYouLiang <- readxl::read_xls("新杭州优量.xls")
  dataYouQing <- readxl::read_xls("新杭州优擎.xls")
  dataKuChall <- readxl::read_xls("新酷玩_Chall77.xls")
  dataKuHappy <- readxl::read_xls("新酷玩_Happy.xls")
  dataPromeHiPal <- readxl::read_xls("新Prometheus_HiPal.xls")
  dataPromeMoreKash <- readxl::read_xls("新Prometheus_MoreKash.xls")
  dataBauCuaKing <- readxl::read_xls("新海南翎麦_BauCuaKing.xls")
  dataXiangGang <- readxl::read_xls("新香港瑞兆.xls")
  dataFuYunPattPlus <- readxl::read_xls("新福韵_PattPlus.xls")
  dataFuYunRummy <- readxl::read_xls("新福韵_Rummy.xls")
  dataAce <- readxl::read_xls("新Ace.xls")
  dataKaiXin <- readxl::read_xls("新开心_BakBak.xls")
  dataHotSpot <- readxl::read_xls("新HotSpot.xls")
  dataDreamTP <- readxl::read_xls("新DreamTP.xls")
  dataTakeCash <- readxl::read_xls("新TakeCash.xls")
  dataPPcash <- readxl::read_xls("新PPcash.xls")
  dataCashMap <- readxl::read_xls("新洪禄_CashMap.xls")
  dataRongDoan <- readxl::read_xls("新融创汇通_Doan.xls")
  dataRongFacevay <- readxl::read_xls("新融创汇通_Facevay.xls")
  dataRongVinvay <- readxl::read_xls("新融创汇通_Vinvay.xls")
  dataFortune <- readxl::read_xls("新海南翎麦_FortuneClub.xls")
  dataBaCay <- readxl::read_xls("新海南翎麦_BaCayPoker.xls")
  dataRummyIOS14 <- readxl::read_xls("新博客来_IOS14.xls")
  dataTPGOJ <- readxl::read_xls("新博客来_TPGO_J.xls")
  dataTPGOM <- readxl::read_xls("新博客来_TPGO_M.xls")
  dataRummyIOSJ <- readxl::read_xls("新博客来_Rummy_IOS_J.xls")
  dataRummyIOSM <- readxl::read_xls("新博客来_Rummy_IOS_M.xls")
  dataRummyANDJ <- readxl::read_xls("新博客来_Rummy_AND_J.xls")
  dataRummyANDM <- readxl::read_xls("新博客来_Rummy_AND_M.xls")
  dataShouTuiF <- readxl::read_xls("新Fingertip.xls")
  dataBlink <- readxl::read_xls("新看看_Blink.xls")
  dataLuxury <- readxl::read_xls("新LuxuryRummy.xls")
  dataZhiQiLuckyDay <- readxl::read_xls("新智启辰远_LuckyDay.xls")
  dataZhiQiLuckyDice <- readxl::read_xls("新智启辰远_LuckyDice.xls")
  dataZhangYun <- readxl::read_xls("新掌中云.xls")
  dataKanTW <- readxl::read_xls("新看看_TW.xls")
  dataKanBlink <- readxl::read_xls("新看看_Blink.xls")
  dataKanBliss <- readxl::read_xls("新看看_BlissLite.xls")
  dataKanTrinku <- readxl::read_xls("新看看_Trinku.xls")
  dataKanLocku <- readxl::read_xls("新看看_Locku.xls")
  dataLiAo <- readxl::read_xls("新深圳理奥.xls")
  dataLiAo39 <- readxl::read_xls("新理奥_Vungo39.xls")
  dataLiAo33 <- readxl::read_xls("新理奥_Vungo33.xls")
  dataWanDeGG <- readxl::read_xlsx("玩德.xlsx", skip = 2, col_names = T)
  dataWanDe <- readxl::read_xls("新玩德游戏.xls")
  dataJeruk <- readxl::read_xls("新JerukLive.xls")
  dataNovelSky <- readxl::read_xls("新NovelSky.xls")
  dataMiao <- readxl::read_xls("新喵石.xls")
  dataSan <- readxl::read_xls("新Sancamap.xls")
  dataGuai <- readxl::read_xls("新怪猫.xls")
  dataShen <- readxl::read_xls("新神兽传奇.xls")
  dataKaiStich <- readxl::read_xls("新凯丽金_Stich.xls")
  dataKaiJoyo <- readxl::read_xls("新凯丽金_Joyo.xls")
  dataKaiVideo <- readxl::read_xls("新凯丽金_VideoChat.xls")
  dataKaiFaU <- readxl::read_xls("新凯丽金_FaU.xls")
  dataKaiHaya <- readxl::read_xls("新凯丽金_Haya.xls")
  dataKaiHallo <- readxl::read_xls("新凯丽金_Hallo.xls")
  dataKaiWinnie <- readxl::read_xls("新凯丽金_Winnie.xls")
  dataBaiYoung <- readxl::read_xls("新白鲸_YoungRadio.xls")
  dataBaiYolk <- readxl::read_xls("新白鲸_Yolk.xls")
  dataBaiPlayer <- readxl::read_xls("新白鲸_VideoPlayer.xls")
  dataBaiMovzy <- readxl::read_xls("新白鲸_Movzy.xls")
  dataDreame <- readxl::read_xls("新Dreame1.xls")
  dataDreamenew <- readxl::read_xls("新Dreame624483291607329.xls")
  dataReadictM <- readxl::read_xls("新Vital_Readict_Monika.xls")
  dataReadictJ <- readxl::read_xls("新Vital_Readict_Jane.xls")
  dataNovelCat <- readxl::read_xls("新陌_Novelcat.xls")
  dataJiang <- readxl::read_xls("江苏明通新墨香.xls")
  dataZhang <- readxl::read_xls("新掌阅_Ireader.xls")
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
  # dataHuaShu <- readxl::read_xls("新华述.xls")
  # dataRupeecash <- readxl::read_xls("新rupeecash.xls")
  # dataMai <- readxl::read_xls("新麦尔.xls")
  # dataCashIndi <- readxl::read_xls("新CashIndiHub.xls")
  # dataWanYou <- readxl::read_xls("新万友互娱.xls")
  # dataRe <- readxl::read_xls("新remini.xls")
  # dataReJ <- readxl::read_xls("新reminiJane.xls")
  # dataShouTui <- readxl::read_xls("新首推.xls")
  # dataDouShi <- readxl::read_xls("新圣斗士.xls")
  # dataZuoTou <- readxl::read_xls("新座头鲸.xls")
  # dataLingPay <- readxl::read_xls("新灵分_Pay.xls")
  # dataLingKey <- readxl::read_xls("新灵分_Key.xls")
  # dataLingSo <- readxl::read_xls("新灵分_SoCredit.xls")
  # dataTai <- readxl::read_xls("新泰坤.xls")
  # dataZxCash <- readxl::read_xls("新邦振_ZxCash.xls")
  # dataMiYi <- readxl::read_xls("新米易.xls")
}

# 暂停 ----------------------------------------------------------------------

{
  # dataCashIndi %>%
  #   no_group() %>%
  #   mutate(CPI = 花费 / 注册) %>%
  #   select(日期, 安装, 花费, CPI) %>%
  #   save_csv(name = "CashIndiHub")
}
{
  # dataMai %>%
  #   no_group(gro = "IN") %>%
  #   save_csv(name = "麦尔")
}
{
  # dataRe1 <- dataRe %>%
  #   no_group(gro = "remini") %>%
  #   select_default(selection = "group") %>%
  #   select(-回收)
  #
  # dataReJ1 <- dataReJ %>%
  #   no_group(gro = "reminiJane") %>%
  #   select_default(selection = "group") %>%
  #   select(-回收)
  #
  # bind_rows(dataRe1, dataReJ1) %>% save_csv(name = "remini")
}
{
  # dataKeyCredit %>%
  #   with_geo() %>%
  #   select(-回收, -注册) %>%
  #   save_csv(name = "上海灵分_KeyCredit")
  #
  # dataPayCash %>%
  #   with_geo() %>%
  #   select(-回收, -注册, -购买) %>%
  #   save_csv(name = "上海灵分_PayCash")
  #
  # dataRupeecash %>%
  #   no_group(gro = "Rupeecash") %>%
  #   select(-回收, -注册) %>%
  #   save_csv(name = "上海灵分_Rupeecash")
  #
  # dataLing %>%
  #   no_group(gro = "SoCredit") %>%
  #   select(-回收, -注册) %>%
  #   save_csv(name = "上海灵分_SoCredit")
}
{
  # dataWanYou %>%
  #   no_group(gro = "万友互娱") %>%
  #   select_default() %>%
  #   save_csv(name = "万友互娱")
}

# Tap ---------------------------------------------------------------------

{
  if (hour(now()) > 15) {
    date_tap <- as.character(Sys.Date())
  } else {
    date_tap <- as.character(Sys.Date() - 1)
  }
  dataTap <- readxl::read_xls("新Taptap.xls")
  dataTap %>%
    tap() %>%
    sum_split(版本) %>%
    mutate(日期 = date_tap) %>%
    save_csv(name = "Taptap", filename = "0Tap", append = F)
}

# 白鲸 ----------------------------------------------------------------------

{
  dataBaiMovzy1 <- dataBaiMovzy %>%
    with_go() %>%
    mutate(产品 = "白鲸Movzy") %>%
    bai_jing()

  dataBaiYoung1 <- dataBaiYoung %>%
    with_go() %>%
    mutate(产品 = "白鲸YoungRadio+") %>%
    bai_jing()

  dataBaiYolk1 <- dataBaiYolk %>%
    with_go() %>%
    mutate(产品 = "白鲸Yolk") %>%
    bai_jing()

  dataBaiPlayer1 <- dataBaiPlayer %>%
    with_go() %>%
    mutate(产品 = "白鲸video player") %>%
    bai_jing()

  dataBaiMovzyIOS14 <- tibble(
    日期 = as.character(Sys.Date() - 1),
    产品 = "白鲸Movzy",
    地区 = c("AU", "CA", "GB", "PH", "US"),
    版本 = "IOS14",
    安装 = 0
  )
  dataBaiPlayerIOS14 <- tibble(
    日期 = as.character(Sys.Date() - 1),
    产品 = "白鲸video player",
    地区 = c("CA", "GB", "PH", "US"),
    版本 = "IOS14",
    安装 = 0
  )

  bind_rows(dataBaiMovzyIOS14, dataBaiPlayerIOS14, dataBaiMovzy1, dataBaiYoung1, dataBaiPlayer1) %>%
    save_csv(name = "白鲸")
  dataBaiYolk1 %>% save_csv(name = "白鲸Yolk")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhang %>%
    with_os() %>%
    zhang_yue() %>%
    save_csv(name = "掌阅")
}

# 领麦DreamTP -----------------------------------------------------------------

{
  dataDreamTP %>%
    with_geo() %>%
    select(-c(回收, 购买, 注册)) %>%
    save_csv(name = "领麦DreamTP")
}

# HotSpot -----------------------------------------------------------------

{
  dataHotSpot %>%
    with_go() %>%
    mutate(单价 = 花费 / 安装) %>%
    select(日期, 版本, 地区, 花费, 安装, 单价) %>%
    save_csv(name = "HotSpot")
}

# 开心BakBak ----------------------------------------------------------------

{
  dataKaiXin %>%
    with_geo() %>%
    select(-c(购买, 注册)) %>%
    save_csv(name = "开心BakBak")
}
# Luxury ------------------------------------------------------------------

{
  dataLuxury %>%
    luxury() %>%
    select(日期, 产品, 花费) %>%
    save_csv(name = "Luxury")
}

# Jeruk --------------------------------------------------------------------

{
  dataJeruk %>%
    no_group(gro = "Jeruk") %>%
    select_default() %>%
    save_csv(name = "Jeruk")
}

# NovelSky ----------------------------------------------------------------

{
  dataNovelSky %>%
    no_group(gro = "NovelSky") %>%
    select(-c(回收, 购买, 注册)) %>%
    save_csv(name = "NovelSky")
}

# 玩德游戏 --------------------------------------------------------------------

{
  dataWanDeGG1 <- dataWanDeGG %>% 
    na.omit() %>% 
    mutate(版本 = if_else(str_detect(广告系列, "AND"), "AND", "IOS"),
           地区 = if_else(str_detect(广告系列, "ID"), "ID",
                        str_sub(广告系列, 23,24)),
           安装量 = 安装次数,
           点击量 = 点击次数, 
           金额 = 费用) %>% 
    group_by(版本, 地区) %>% 
    summarise(
      日期 = as.character(Sys.Date() - 1),
      安装 = sum(as.numeric(安装量)),
      点击 = sum(as.numeric(点击量)),
      展示次数 = sum(as.numeric(展示次数)),
      花费 = sum(as.numeric(金额)),
      CPI = 花费 / 安装,
      CTR = 点击 / 展示次数,
      CVR = 安装 / 点击
    ) %>%
    select(日期, 版本, 地区, 安装, 花费, CPI, 点击, 展示次数, CTR, CVR)
  
  dataWanDeGG2 <- tibble(
    日期 = "　", 版本 = "　", 地区 = "总计",
    安装 = sum(dataWanDeGG1$安装),
    点击 = sum(dataWanDeGG1$点击),
    展示次数 = sum(dataWanDeGG1$展示次数),
    花费 = sum(dataWanDeGG1$花费)
  ) %>%
    mutate(
      CPI = 花费 / 安装,
      CTR = 点击 / 展示次数,
      CVR = 安装 / 点击
    )
  
  
  dataWanDe1 <- dataWanDe %>%
    with_go() %>%
    mutate(
      CPI = 花费 / 安装,
      CTR = 点击 / 展示次数,
      CVR = 安装 / 点击
    ) %>%
    select(日期, 版本, 地区, 安装, 花费, CPI, 点击, 展示次数, CTR, CVR)

  dataWanDe2 <- tibble(
    日期 = "　", 版本 = "　", 地区 = "总计",
    安装 = sum(dataWanDe1$安装),
    点击 = sum(dataWanDe1$点击),
    展示次数 = sum(dataWanDe1$展示次数),
    花费 = sum(dataWanDe1$花费)
  ) %>%
    mutate(
      CPI = 花费 / 安装,
      CTR = 点击 / 展示次数,
      CVR = 安装 / 点击
    )

  bind_rows(dataWanDeGG1, dataWanDeGG2) %>% save_csv(name = "玩德游戏GG")
  bind_rows(dataWanDe1, dataWanDe2) %>% save_csv(name = "玩德游戏")
}

# NovelCat ----------------------------------------------------------------

{
  dataNovelCat %>%
    novel_cat() %>%
    with_go() %>%
    select(-购买, -注册) %>%
    mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) %>%
    save_csv(name = "NovelCat")
}

# readict M+J -------------------------------------------------------------

{
  dataReadictJ1 <- dataReadictJ %>%
    with_go() %>%
    mutate(gg = "Jane") 

  dataReadictM1 <- dataReadictM %>%
    with_go() %>%
    mutate(gg = "Monika")

  bind_rows(dataReadictJ1, dataReadictM1) %>%
    select(日期, gg, 版本, 地区, 安装, 点击, 展示次数) %>% 
    save_csv(name = "readict ")
}

# 江苏明通新墨香 -----------------------------------------------------------------

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

# 神兽传奇 --------------------------------------------------------------------

{
  dataShen1 <- dataShen %>%
    with_go() %>%
    select(-安装, -购买) %>%
    mutate(CPI = 花费 / 注册, ROI = 回收 / 花费)

  dataShen2 <- tibble(
    日期 = "　", 版本 = " ", 地区 = "总计",
    点击 = sum(dataShen1$点击),
    展示次数 = sum(dataShen1$展示次数),
    花费 = sum(dataShen1$花费),
    回收 = sum(dataShen1$回收),
    注册 = sum(dataShen1$注册),
    CPI = 花费 / 注册,
    ROI = 回收 / 花费
  )

  bind_rows(dataShen1, dataShen2) %>% save_csv(name = "神兽传奇")
}

# dreame -----------------------------------------------------------------

{
  dataDreame %>%
    dream() %>%
    with_go() %>%
    select(-c(购买, 注册)) %>%
    save_csv(name = "Dreame")

  dataDreamenew %>%
    dream() %>%
    with_go() %>%
    select(-c(购买, 注册)) %>%
    save_csv(name = "DreameNew")
}

# 智启辰远 --------------------------------------------------------------------

{
  dataZhiQiLuckyDay %>%
    with_geo(gro = "LuckyDay") %>%
    select(-c(购买, 注册, 花费, 回收)) %>%
    save_csv(name = "智启辰远LuckyDay")

  dataZhiQiLuckyDice %>%
    with_geo(gro = "LuckyDice") %>%
    select(-c(购买, 注册, 花费, 回收)) %>%
    save_csv(name = "智启辰远LuckyDice")
}

# 掌云 ----------------------------------------------------------------------

{
  dataZhangYun %>%
    with_geo() %>%
    select(-c(购买, 注册)) %>% 
    sum_split(Group) %>% 
    select(-Group) %>% 
    save_csv(name = "掌云")
}

# 座头鲸 ---------------------------------------------------------------------

{
  # dataZuoTou %>%
  #   no_group(gro = "座头鲸") %>%
  #   select(日期, group, 安装, 点击, 展示次数) %>%
  #   save_csv(name = "座头鲸")
}

# microcard J+M -----------------------------------------------------------

{
  dataRummyIOS141 <- dataRummyIOS14 %>%
    no_group(gro = "RummyIOS14") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataTPGOJ1 <- dataTPGOJ %>%
    no_group(gro = "TP_GO_FB_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataTPGOM1 <- dataTPGOM %>%
    no_group(gro = "TP_GO_FB_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyIOSJ1 <- dataRummyIOSJ %>%
    no_group(gro = "Rummy_IOS_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyIOSM1 <- dataRummyIOSM %>%
    no_group(gro = "Rummy_IOS_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyANDJ1 <- dataRummyANDJ %>%
    no_group(gro = "Rummy_AND_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyANDM1 <- dataRummyANDM %>%
    no_group(gro = "Rummy_AND_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  bind_rows(dataTPGOJ1, dataTPGOM1) %>% save_csv(name = "博客来TPGO")
  bind_rows(dataRummyIOSJ1, dataRummyIOSM1) %>% save_csv(name = "博客来Rummy_IOS")
  bind_rows(dataRummyANDJ1, dataRummyANDM1) %>% save_csv(name = "博客来Rummy_AND")
  dataRummyIOS141 %>% save_csv(name = "博客来RummyIOS141")
}
{
  Rummy <- list(dataRummyIOSJ1, dataRummyIOSM1, dataRummyANDJ1, dataRummyANDM1)

  # walk(Rummy, ~save_csv(.,name = .$group))
}
# Prometheus --------------------------------------------------------------

{
  dataPromeHiPal1 <- dataPromeHiPal %>%
    no_group(gro = "HiPal") %>%
    select(-c(购买, 注册))

  dataPromeMoreKash1 <- dataPromeMoreKash %>%
    no_group(gro = "MoreKash") %>%
    select(-c(购买, 注册))

  bind_rows(dataPromeHiPal1, dataPromeMoreKash1) %>% save_csv(name = "Prometheus")
}
# 凯丽金videochat -------------------------------------------------------------

{
  dataKaiFaU1 <- dataKaiFaU %>%
    no_group(gro = "FaU") %>%
    select_default(selection = "注册")

  dataKaiJoyo1 <- dataKaiJoyo %>%
    no_group(gro = "Joyo") %>%
    select_default(selection = "注册")

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

  bind_rows(dataKaiFaU1, dataKaiJoyo1, dataKaiHaya1, dataKaiStich1, dataKaiVideo1, dataKaiWinnie1) %>%
    save_csv(name = "Videochat")

  dataKaiHallo %>%
    with_geo() %>%
    select(-购买) %>%
    save_csv(name = "Videochat_Hallo")
}

# 邦振 ----------------------------------------------------------------------

{
  # dataZxCash %>% 
  #   no_group(gro = "邦振ZxCash") %>% 
  #   select(-c(回收, 购买, 注册)) %>% 
  #   save_csv(name = "邦振ZxCash")
}
# 福韵 ----------------------------------------------------------------------

{
  dataFuYunRummy %>%
    no_group(gro = "福韵Rummy") %>%
    select(花费, 安装) %>%
    save_csv(name = "福韵Rummy")
  
  dataFuYunPattPlus %>%
    no_group(gro = "福韵PattPlus") %>%
    select(花费, 安装) %>%
    save_csv(name = "福韵PattPlus")
}

# 枸杞 ----------------------------------------------------------------------

{
  dataGouQiGaga %>% 
    with_geo(gro = "枸杞Gaga") %>% 
    mutate(CPI = 花费 / 注册) %>% 
    select(Group, 日期, 地区, 花费, 注册, CPI) %>% 
    save_csv(name = "枸杞Gaga")
  
  dataGouQiLili %>% 
    with_geo(gro = "枸杞Lili") %>% 
    mutate(CPI = 花费 / 注册) %>% 
    select(Group, 日期, 地区, 花费, 注册, CPI) %>% 
    save_csv(name = "枸杞Lili")
}

# 阿吉比 ---------------------------------------------------------------------

{
  dataAJiBi %>% 
    no_group(gro = "阿吉比") %>% 
    select(-c(购买, 注册)) %>% 
    save_csv(name = "阿吉比")
}
# 飞乐乐 ----------------------------------------------------------------------

{
  dataFeiFBALL <- bind_rows(dataFei1, dataFei2, dataFei3, dataFei4, dataFei5, dataFei6) %>% 
    select(-c(报告开始日期, 报告结束日期))

  bb <- dataFeiFBALL %>%
    mutate(产品 = if_else(str_detect(帐户名称, "Pro"), "Pro Betting tips",
      if_else(str_detect(帐户名称, "BetPawa"), "BetPawa",
        if_else(str_detect(帐户名称, "Beton"), "Beton",
          if_else(str_detect(帐户名称, "OneBet"), "OneBet",
            if_else(str_detect(帐户名称, "onebet tips"), "onebet tips",
              if_else(str_detect(帐户名称, "Bet365"), "Bet365",
                "暂无"
              )
            )
          )
        )
      )
    )) %>% 
    sum_split(产品) %>% 
    select(产品, everything()) %>% 
    save_csv(name = "飞乐乐FB")

  dataFeiFB %>%
    fei() %>%
    select(日期, everything()) %>%
    save_csv(name = "飞乐乐")
}

# 杭州优量 --------------------------------------------------------------------

{
  dataYouLiang %>%
    no_group(gro = "优量") %>%
    select(-c(注册)) %>%
    save_csv(name = "杭州优量")
}

# 杭州优擎 --------------------------------------------------------------------

{
  dataYouQing %>%
    you() %>%
    save_csv(name = "杭州优擎")
}

# TakeCash ----------------------------------------------------------------
{
  dataTakeCash %>%
    with_geo() %>%
    select(-c(安装, 回收, 购买)) %>%
    save_csv(name = "TakeCash")
}

# 洪禄CashMap -----------------------------------------------------------------
{
  dataCashMap %>%
    with_geo() %>%
    select(花费, 注册) %>%
    save_csv(name = "洪禄CashMap")
  
  dataPPcash %>%
    with_geo() %>%
    select(花费, 注册) %>%
    save_csv(name = "洪禄PPcash")
}

# 华策天城 --------------------------------------------------------------------

{
  dataHuaCe %>% 
    no_group(gro = "华策天城") %>% 
    select(-c(回收, 注册)) %>% 
    save_csv(name = "华策天城")
}
# 看看在线 --------------------------------------------------------------------

{
  dataKanTW %>%
    with_geo(gro = "TW") %>%
    mutate(安装成本 = 花费 / 安装, ROI = 回收 / 花费) %>%
    select(Group, 日期, 地区, 安装, 花费, 回收, 安装成本, ROI) %>%
    save_csv(name = "看看台湾")

  dataKanTrinku %>%
    with_geo(gro = "Trinku") %>%
    select(-c(购买, 注册)) %>%
    save_csv(name = "Trinku")

  dataKanLocku1 <- dataKanLocku %>%
    with_geo(gro = "Locku") %>%
    select(-c(购买, 注册))

  dataKanBlink1 <- dataKanBlink %>%
    with_geo(gro = "Blink") %>%
    select(-c(购买, 注册))

  dataKanBliss1 <- dataKanBliss %>%
    with_geo(gro = "Bliss") %>%
    select(-c(购买, 注册))

  dataKanBliss2 <- tibble(
    日期 = "",
    地区 = "总计",
    安装 = sum(dataKanBliss1$安装),
    点击 = sum(dataKanBliss1$点击),
    展示次数 = sum(dataKanBliss1$展示次数),
    花费 = sum(dataKanBliss1$花费),
    回收 = sum(dataKanBliss1$回收),
    Group = "Bliss"
  )
}

# 酷玩 ----------------------------------------------------------------------

{
  dataKuChall1 <- dataKuChall %>%
    no_group(gro = "酷玩Chall")

  dataKuHappy1 <- dataKuHappy %>%
    no_group(gro = "酷玩Happy")

  bind_rows(dataKuChall1, dataKuHappy1) %>%
    save_csv(name = "酷玩")
}

# 灵分 ----------------------------------------------------------------------

{
  # dataLingKey %>% 
  #   ling(name = "灵分Key") %>% 
  #   save_csv(name = "灵分Key")
  # 
  # dataLingPay %>% 
  #   ling(name = "灵分Pay") %>% 
  #   save_csv(name = "灵分Pay")
  # 
  # dataLingSo %>% 
  #   ling(name = "灵分So") %>% 
  #   save_csv(name = "灵分So")
}
# 米易 ----------------------------------------------------------------------

{
  # dataMiYi %>%
  #   no_group() %>%
  #   select(日期, 花费, 展示次数, 点击, 安装, 注册) %>%
  #   save_csv(name = "米易")
}
# 喵石 ----------------------------------------------------------------------

{
  dataMiao %>%
    no_group(gro = "喵石") %>%
    select(日期, group, 安装, 花费) %>%
    save_csv(name = "喵石")
}

# 融创 ----------------------------------------------------------------------

{
  dataRongDoan1 <- dataRongDoan %>%
    with_geo(gro = "RongDoan") %>%
    select(-c(地区, 安装, 回收, 购买))

  dataRongFacevay1 <- dataRongFacevay %>%
    with_geo(gro = "RongFacevay") %>%
    select(-c(地区, 安装, 回收, 购买))

  dataRongVinvay1 <- dataRongVinvay %>%
    with_geo(gro = "RongVinvay") %>%
    select(-c(地区, 安装, 回收, 购买))

  bind_rows(dataRongDoan1, dataRongFacevay1, dataRongVinvay1) %>%
    save_csv(name = "融创")
}
# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo %>%
    li_ao() %>%
    save_csv(name = "深圳理奥")

  dataLiAo33 %>%
    no_group(gro = "LiAo33") %>%
    select(-c(购买, 注册)) %>%
    mutate(CPI = 花费 / 安装) %>%
    save_csv(name = "深圳理奥LiAo33")

  dataLiAo39 %>%
    no_group(gro = "LiAo39") %>%
    select(-c(购买, 注册)) %>%
    mutate(CPI = 花费 / 安装) %>%
    save_csv(name = "深圳理奥LiAo39")
}

# 圣斗士 ---------------------------------------------------------------------

{
  # dataDouShi1 <- dataDouShi %>%
  #   with_go() %>%
  #   mutate(代理 = "GatherOne", 国家 = 地区) %>%
  #   select(版本, 日期, 代理, 地区, 国家, 安装, 展示次数, 点击, 花费)
  # 
  # dataDouShi2 <- tibble(
  #   版本 = " ",
  #   日期 = " ",
  #   代理 = " ",
  #   地区 = " ",
  #   国家 = "合计",
  #   安装 = sum(dataDouShi1$安装),
  #   展示次数 = sum(dataDouShi1$展示次数),
  #   点击 = sum(dataDouShi1$点击),
  #   花费 = sum(dataDouShi1$花费)
  # )
  # 
  # bind_rows(dataDouShi1, dataDouShi2) %>%
  #   save_csv(name = "圣斗士汇总")
}

# 泰坤 ----------------------------------------------------------------------

{
  # dataTai %>% 
  #   no_group(gro = "泰坤") %>% 
  #   select(-c(回收, 购买, 注册)) %>% 
  #   save_csv(name = "泰坤")
}
# 首推 ----------------------------------------------------------------------

{
  # dataShouTui %>%
  #   no_group(gro = "首推_Online") %>%
  #   select(日期, group, 花费, 安装, 购买) %>%
  #   save_csv(name = "首推_Online")
  # 
  # dataShouTuiF %>%
  #   no_group(gro = "首推_Fingertip") %>%
  #   select(日期, group, 花费, 安装, 购买) %>%
  #   save_csv(name = "首推_Fingertip")
}

# 香港瑞兆 --------------------------------------------------------------------

{
  dataXiangGang %>%
    no_group(gro = "香港瑞兆") %>%
    save_csv(name = "香港瑞兆")
}
# Sancamap ----------------------------------------------------------------

{
  dataAce1 <- dataAce %>%
    no_group(gro = "Ace") %>%
    select_default() %>%
    select(-回收)

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
  
  dataHuanLe1 <- dataHuanLe %>%
    no_group(gro = "欢乐语音") %>%
    select_default() %>%
    select(-回收)

  bind_rows(dataAce1, dataSan1, dataBaCay1, dataFortune1, dataBauCuaKing1, dataHuanLe1) %>%
    save_csv(name = "领麦Sancamap")
}

# 怪猫 ----------------------------------------------------------------------

{
  dataGuai %>%
    mao() %>%
    save_csv(name = "怪猫")
}

# 二手车 ---------------------------------------------------------------------
{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 17)) {
    # dataCarFB <- readxl::read_xlsx("二手车FB.xlsx", col_names = T)
    # dataCarGG <- readxl::read_xlsx("二手车GG.xlsx", skip = 2, col_names = T)
    dataFixFB <- readxl::read_xlsx("修车FB.xlsx", col_names = T)
    dataFixGG <- readxl::read_xlsx("修车GG.xlsx", skip = 2, col_names = T)

    # dataCarFB1 <- dataCarFB %>%
    #   car_fix_fb() %>%
    #   CarFB()

    # dataCarGG1 <- dataCarGG %>% car_gg()

    dataFixFB1 <- dataFixFB %>%
      car_fix_fb() %>%
      car_fb()

    dataFixGG1 <- dataFixGG %>% car_gg()

    # bind_rows(dataCarFB1, dataCarGG1) %>%
    #   arrange(日期) %>%
    #   save_csv(name = "Car", filename = "0二手车", append = F)
    bind_rows(dataFixFB1, dataFixGG1) %>%
      arrange(日期) %>%
      save_csv(name = "Fix", filename = "0二手车", append = F)
  } else {
    message("NotNow!")
  }
}

# 赤子城 ---------------------------------------------------------------------

{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 15) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 17)) {
    dataBela <- readxl::read_xls("赤子城-bela.xls")
    dataMimi <- readxl::read_xls("赤子城-mimi.xls")
    dataPeach <- readxl::read_xls("赤子城-peach.xls")
    # dataYumy <- readxl::read_xls("赤子城-yumy.xls")

    dataPeach1 <- dataPeach %>%
      with_geo() %>%
      mutate(地区 = "IN") %>% 
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataPeach2 <- tibble(
      日期 = "　", 地区 = "总计",
      花费 = sum(dataPeach1$花费),
      安装 = sum(dataPeach1$安装),
      点击 = sum(dataPeach1$点击),
      展示次数 = sum(dataPeach1$展示次数)
    )

    dataBela1 <- dataBela %>%
      with_geo() %>%
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataBela2 <- tibble(
      日期 = "总计",
      花费 = sum(dataBela1$花费),
      安装 = sum(dataBela1$安装),
      点击 = sum(dataBela1$点击),
      展示次数 = sum(dataBela1$展示次数)
    )

    bind_rows(dataBela1, dataBela2) %>%
      save_csv(name = "赤子城Bela", filename = "0赤子城", append = F)

    bind_rows(dataPeach1, dataPeach2) %>%
      save_csv(name = "赤子城Peach", filename = "0赤子城")

    dataMimi1 <- dataMimi %>%
      no_group("Mimi") %>%
      select(日期, group, 花费, 安装, 点击, 展示次数) %>%
      save_csv(name = "赤子城Mimi", filename = "0赤子城")

    # dataYumy %>%
    #   no_group("Yumy") %>%
    #   select(日期, group, 花费, 安装, 点击, 展示次数) %>%
    #   save_csv(name = "赤子城Yumy", filename = "0赤子城")
  } else {
    message("NotNow!")
  }
}
gc()
message("任務終了")
