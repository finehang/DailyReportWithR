setwd("C:/Users/fanhang/Desktop/Datadownload")
source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

# 数据导入 --------------------------------------------------------------------

{
  dataAce <- readxl::read_xls("新Ace.xls")
  dataKaiXin <- readxl::read_xls("新开心BakBak.xls")
  dataHotSpot <- readxl::read_xls("新HOtSpot.xls")
  dataRummyIOS <- readxl::read_xls("新博客来_IOS14.xls")
  dataDreamTP <- readxl::read_xls("新DreamTP.xls")
  dataDouShiAND <- readr::read_csv("ANDAF.csv")
  dataDouShiIOS <- readr::read_csv("IOSAF.csv")
  dataTakeCash <- readxl::read_xls("新TakeCash.xls")
  dataCashMap <- readxl::read_xls("新CashMap.xls")
  dataDouShiM <- readxl::read_xls("新圣斗士_M.xls")
  dataDouShiJ <- readxl::read_xls("新圣斗士_J.xls")
  dataFei <- readxl::read_xls("新飞乐乐.xls")
  dataRong <- readxl::read_xls("新融创汇通.xls")
  dataFortune <- readxl::read_xls("新FortuneClub.xls")
  dataBaCay <- readxl::read_xls("新BaCayPoker.xls")
  dataRummyIOS14 <- readxl::read_xls("新博客来_IOS14.xls")
  dataRummyJ <- readxl::read_xls("新博客来Rummy_IOS_J.xls")
  dataRummyM <- readxl::read_xls("新博客来Rummy_IOS_M.xls")
  dataShouTuiF <- readxl::read_xls("新Fingertip.xls")
  dataShouTui <- readxl::read_xls("新首推.xls")
  dataZuoTou <- readxl::read_xls("新座头鲸.xls")
  dataBlink <- readxl::read_xls("新看看-Blink.xls")
  dataLuxury <- readxl::read_xls("新LuxuryRummy.xls")
  dataZhiQi <- readxl::read_xls("新智启辰远.xls")
  dataTPJ <- readxl::read_xls("新博客来TPReal-J.xls")
  dataTPM <- readxl::read_xls("新博客来TPReal-M.xls")
  dataZhangYun <- readxl::read_xls("新掌中云.xls")
  dataBliss <- readxl::read_xls("新看看_bliss_lite.xls")
  dataTrinku <- readxl::read_xls("新看看-trinku.xls")
  dataLiAo <- readxl::read_xls("新深圳理奥.xls")
  dataSpend <- readxl::read_xls("新SpendCash.xls")
  dataWanDe <- readxl::read_xls("新玩德游戏.xls")
  dataMicroJ <- readxl::read_xls("新microcard-J.xls")
  dataMicroM <- readxl::read_xls("新microcard-M.xls")
  dataJeruk <- readxl::read_xls("新JerukLive.xls")
  dataNovelSky <- readxl::read_xls("新NovelSky.xls")
  dataMiao <- readxl::read_xls("新喵石.xls")
  dataSan <- readxl::read_xls("新sancamap.xls")
  dataGuai <- readxl::read_xls("新怪猫.xls")
  dataShen <- readxl::read_xls("新神兽传奇.xls")
  dataVideo <- readxl::read_xls("新凯丽金-videochat.xls")
  dataFaU <- readxl::read_xls("新凯丽金-FaU.xls")
  dataHaya <- readxl::read_xls("新凯丽金-Haya.xls")
  dataHallo <- readxl::read_xls("新凯丽金-Hallo.xls")
  dataWinnie <- readxl::read_xls("新凯丽金-Winnie.xls")
  dataBaiYoung <- readxl::read_xls("新白鲸-YoungRadio.xls")
  dataBaiYolk <- readxl::read_xls("新白鲸_yolk.xls")
  dataBaiPlayer <- readxl::read_xls("新白鲸-VideoPlayer.xls")
  dataDreame <- readxl::read_xls("新Dreame1.xls")
  dataDreamenew <- readxl::read_xls("新Dreame624483291607329.xls")
  dataReadictM <- readxl::read_xls("新vital-readict-monika.xls")
  dataReadictJ <- readxl::read_xls("新vital-readict-jane.xls")
  dataNovelCat <- readxl::read_xls("新陌-novelcat.xls")
  dataJiang <- readxl::read_xls("江苏明通新墨香.xls")
  dataBaiMovzy <- readxl::read_xls("新白鲸-movzy.xls")
  dataZhang <- readxl::read_xls("新掌阅-ireader.xls")
  dataStr <- tibble(blankLine = c(" ", " "))
  readr::write_excel_csv(tibble(数据汇总 = "数据汇总"), file = "./result.csv", col_names = F)
  # dataKeyCredit <- readxl::read_xls("新KeyCredit.xls")
  # dataHuaShu <- readxl::read_xls("新华述.xls")
  # dataRupeecash <- readxl::read_xls("新rupeecash.xls")
  # dataMai <- readxl::read_xls("新麦尔.xls")
  # dataPayCash <- readxl::read_xls("新PayCash.xls")
  # dataLing <- readxl::read_xls("新上海灵分.xls")
  # dataZx <- readxl::read_xls("新ZxCash.xls")
  # dataCashIndi <- readxl::read_xls("新CashIndiHub.xls")
  # dataPayCash <- readxl::read_xls("新PayCash.xls")
  # dataWanYou <- readxl::read_xls("新万友互娱.xls")
  # dataRe <- readxl::read_xls("新remini.xls")
  # dataReJ <- readxl::read_xls("新reminiJane.xls")
}

# 暂停 ----------------------------------------------------------------------

{
  # dataCashIndi %>%
  #   MobanWithoutGroup() %>%
  #   mutate(CPI = 花费 / 注册) %>%
  #   select(日期, 安装, 花费, CPI) %>%
  #   SaveCsv(name = "CashIndiHub")
}
{
  # dataMai %>%
  #   MobanWithoutGroup(gro = "IN") %>%
  #   SaveCsv(name = "麦尔")
}
{
  # dataRe1 <- dataRe %>%
  #   MobanWithoutGroup(gro = "remini") %>%
  #   MobanSelectDefault(selection = "group") %>%
  #   select(-回收)
  #
  # dataReJ1 <- dataReJ %>%
  #   MobanWithoutGroup(gro = "reminiJane") %>%
  #   MobanSelectDefault(selection = "group") %>%
  #   select(-回收)
  #
  # bind_rows(dataRe1, dataReJ1) %>% SaveCsv(name = "remini")
}
{
  # dataZx %>%
  #   Zx() %>%
  #   ZxAeo() %>%
  #   SaveCsv(name = "ZxWithAeo")
  #
  # dataZx %>%
  #   Zx() %>%
  #   ZxNoAeo() %>%
  #   SaveCsv(name = "ZxWithOutAeo")
}
{
  # dataKeyCredit %>%
  #   MobanWithGroupGeo() %>%
  #   select(-回收, -注册) %>%
  #   SaveCsv(name = "上海灵分_KeyCredit")
  #
  # dataPayCash %>%
  #   MobanWithGroupGeo() %>%
  #   select(-回收, -注册, -购买) %>%
  #   SaveCsv(name = "上海灵分_PayCash")
  #
  # dataRupeecash %>%
  #   MobanWithoutGroup(gro = "Rupeecash") %>%
  #   select(-回收, -注册) %>%
  #   SaveCsv(name = "上海灵分_Rupeecash")
  #
  # dataLing %>%
  #   MobanWithoutGroup(gro = "SoCredit") %>%
  #   select(-回收, -注册) %>%
  #   SaveCsv(name = "上海灵分_SoCredit")
}
{
  # dataWanYou %>%
  #   MobanWithoutGroup(gro = "万友互娱") %>%
  #   MobanSelectDefault() %>%
  #   SaveCsv(name = "万友互娱")
}

# 白鲸 ----------------------------------------------------------------------

{
  dataBaiMovzy1 <- dataBaiMovzy %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸Movzy") %>%
    BaiJing()

  dataBaiYoung1 <- dataBaiYoung %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸YoungRadio+") %>%
    BaiJing()

  dataBaiYolk1 <- dataBaiYolk %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸Yolk") %>%
    BaiJing()
  dataBaiPlayer1 <- dataBaiPlayer %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸video player") %>%
    BaiJing()

  bind_rows(dataBaiMovzy1, dataBaiYoung1, dataBaiPlayer1) %>%
    SaveCsv(name = "白鲸")
  dataBaiYolk1 %>% SaveCsv(name = "白鲸Yolk")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhang %>%
    MobanWithGroupPlatform() %>%
    ZhangYue() %>%
    SaveCsv(name = "掌阅")
}

# 领麦DreamTP -----------------------------------------------------------------

{
  dataDreamTP %>%
    MobanWithGroupGeo() %>%
    select(-c(回收, 购买, 注册)) %>%
    SaveCsv(name = "领麦DreamTP")
}

# HotSpot -----------------------------------------------------------------

{
  dataHotSpot %>% 
    MobanWithGroupGeo() %>% 
    mutate(单价 = 花费 / 安装) %>% 
    select(日期, 地区, 花费, 安装, 单价) %>% 
    SaveCsv(name = "HotSpot")
}

# 开心BakBak ----------------------------------------------------------------

{
  dataKaiXin %>% MobanWithGroupGeo() %>% 
    select(-c(购买, 注册)) %>% 
    SaveCsv(name = "开心BakBak")
}
# Luxury ------------------------------------------------------------------

{
  dataLuxury %>%
    Luxury() %>%
    select(日期, 产品, 花费) %>%
    SaveCsv(name = "Luxury")
}

# Jeruk --------------------------------------------------------------------

{
  dataJeruk %>%
    MobanWithoutGroup(gro = "Jeruk") %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "Jeruk")
}

# NovelSky ----------------------------------------------------------------

{
  dataNovelSky %>%
    MobanWithoutGroup(gro = "NovelSky") %>%
    select(-c(回收, 购买, 注册)) %>%
    SaveCsv(name = "NovelSky")
}

# 玩德游戏 --------------------------------------------------------------------

{
  dataWanDe1 <- dataWanDe %>%
    MobanWithGroupGP() %>%
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

  bind_rows(dataWanDe1, dataWanDe2) %>% SaveCsv(name = "玩德游戏")
}

# NovelCat ----------------------------------------------------------------

{
  dataNovelCat %>%
    NovelCat() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册) %>%
    mutate(CPI = 花费 / 安装, ROI = 回收 / 花费) %>%
    SaveCsv(name = "NovelCat")
}

# readict M+J -------------------------------------------------------------

{
  dataReadictJ1 <- dataReadictJ %>%
    MobanWithGroupGP() %>%
    select(日期, 版本, 地区, 安装, 点击, 展示次数)

  dataReadictM1 <- dataReadictM %>%
    MobanWithGroupGP() %>%
    select(日期, 版本, 地区, 安装, 点击, 展示次数)

  bind_rows(dataReadictJ1, dataReadictM1) %>% SaveCsv(name = "readict ")
}

# 江苏明通新墨香 -----------------------------------------------------------------

{
  dataJiang1 <- dataJiang %>%
    MobanWithGroupGP() %>%
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

  bind_rows(dataJiang1, dataJiang2) %>% SaveCsv(name = "江苏明通新墨香")
}

# 神兽传奇 --------------------------------------------------------------------

{
  dataShen1 <- dataShen %>%
    MobanWithGroupGP() %>%
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
  
  bind_rows(dataShen1, dataShen2) %>% SaveCsv(name = "神兽传奇")
}

# dreame -----------------------------------------------------------------

{
  dataDreame %>%
    Dream() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册) %>%
    SaveCsv(name = "Dreame")

  dataDreamenew %>%
    Dream() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册) %>%
    SaveCsv(name = "DreameNew")
}

# 智启辰远 --------------------------------------------------------------------

{
  dataZhiQi %>%
    MobanWithGroupGeo() %>%
    select(-c(购买, 注册, 花费, 回收)) %>%
    SaveCsv(name = "智启辰远")
}

# 掌云 ----------------------------------------------------------------------

{
  dataZhangYun1 <- dataZhangYun %>%
    MobanWithGroupGeo() %>%
    select(-c(购买, 注册))

  dataZhangYun2 <- tibble(
    日期 = "　", 地区 = "总计",
    安装 = sum(dataZhangYun1$安装),
    点击 = sum(dataZhangYun1$点击),
    展示次数 = sum(dataZhangYun1$展示次数),
    花费 = sum(dataZhangYun1$花费),
    回收 = sum(dataZhangYun1$回收)
  )

  bind_rows(dataZhangYun1, dataZhangYun2) %>% SaveCsv(name = "掌云")
}

# 座头鲸 ---------------------------------------------------------------------

{
  dataZuoTou %>%
    MobanWithoutGroup(gro = "座头鲸") %>%
    select(日期, group, 安装, 点击, 展示次数) %>%
    SaveCsv(name = "座头鲸")
}

# CashMap -----------------------------------------------------------------
{
  dataCashMap %>%
    MobanWithGroupGeo() %>%
    select(-c(安装, 回收, 购买)) %>%
    SaveCsv(name = "CashMap")
}

# TakeCash ----------------------------------------------------------------
{
  dataTakeCash %>%
    MobanWithGroupGeo() %>%
    select(-c(安装, 回收, 购买)) %>%
    SaveCsv(name = "TakeCash")
}

# microcard J+M -----------------------------------------------------------

{
  dataTPJ1 <- dataTPJ %>%
    MobanWithoutGroup(gro = "TP_AND_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataTPM1 <- dataTPM %>%
    MobanWithoutGroup(gro = "TP_AND_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyJ1 <- dataRummyJ %>%
    MobanWithoutGroup(gro = "Rummy_IOS_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyM1 <- dataRummyM %>%
    MobanWithoutGroup(gro = "Rummy_IOS_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataRummyIOS141 <- dataRummyIOS14 %>%
    MobanWithoutGroup(gro = "RummyIOS14") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataMicroJ1 <- dataMicroJ %>%
    MobanWithoutGroup(gro = "rummy_AND_J") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataMicroM1 <- dataMicroM %>%
    MobanWithoutGroup(gro = "rummy_AND_M") %>%
    select(日期, group, 展示次数, 点击, 花费)

  bind_rows(dataTPJ1, dataTPM1) %>% SaveCsv(name = "博客来TP")
  bind_rows(dataRummyJ1, dataRummyM1) %>% SaveCsv(name = "博客来Rummy_IOS")
  bind_rows(dataMicroJ1, dataMicroM1) %>% SaveCsv(name = "博客来Rummy_AND")
  dataRummyIOS141 %>% SaveCsv(name = "博客来RummyIOS141")
}

# 凯丽金videochat -------------------------------------------------------------

{
  dataVideo1 <- dataVideo %>%
    MobanWithoutGroup(gro = "Video") %>%
    MobanSelectDefault(selection = "注册")

  dataWinnie1 <- dataWinnie %>%
    MobanWithoutGroup(gro = "Winnie") %>%
    MobanSelectDefault(selection = "注册")

  dataHaya1 <- dataHaya %>%
    MobanWithoutGroup(gro = "Haya") %>%
    MobanSelectDefault(selection = "注册")

  dataFaU1 <- dataFaU %>%
    MobanWithoutGroup(gro = "FaU") %>%
    MobanSelectDefault(selection = "注册")

  bind_rows(dataVideo1, dataWinnie1, dataHaya1, dataFaU1) %>%
    SaveCsv(name = "Videochat")

  dataHallo %>%
    MobanWithGroupGeo() %>%
    select(-购买) %>%
    SaveCsv(name = "Videochat_Hallo")
}

#  叨叨叨SpendCash------------------------------------------------------------

{
  dataSpend %>%
    MobanWithoutGroup(gro = "叨叨叨") %>%
    select(日期, group, 安装, 花费) %>%
    SaveCsv(name = "叨叨叨")
}

# 飞乐乐 ----------------------------------------------------------------------

{
  dataFei %>%
    Fei() %>%
    select(日期, everything()) %>%
    SaveCsv(name = "飞乐乐")
}

# 看看在线 --------------------------------------------------------------------

{
  dataTrinku1 <- dataTrinku %>%
    MobanWithGroupGeo() %>%
    mutate(产品 = "Trinku") %>%
    select(-c(购买, 注册))

  dataBlink1 <- dataBlink %>%
    MobanWithGroupGeo() %>%
    mutate(产品 = "Blink") %>%
    select(-c(购买, 注册))

  dataBliss1 <- dataBliss %>%
    MobanWithGroupGeo() %>%
    mutate(产品 = "Bliss") %>%
    select(-c(购买, 注册))

  dataBliss2 <- tibble(
    日期 = "",
    地区 = "总计",
    安装 = sum(dataBliss1$安装),
    点击 = sum(dataBliss1$点击),
    展示次数 = sum(dataBliss1$展示次数),
    花费 = sum(dataBliss1$花费),
    回收 = sum(dataBliss1$回收),
    产品 = "Bliss"
  )


  bind_rows(dataTrinku1, dataBlink1, dataBliss1, dataBliss2) %>%
    select(产品, everything()) %>%
    SaveCsv(name = "看看在线")
}

# 喵石 ----------------------------------------------------------------------

{
  dataMiao %>%
    MobanWithoutGroup(gro = "喵石") %>%
    select(日期, group, 安装, 花费) %>%
    SaveCsv(name = "喵石")
}

# 融创 ----------------------------------------------------------------------

{
  dataRong %>%
    MobanWithGroupGeo() %>%
    select(-c(安装, 回收, 购买)) %>%
    SaveCsv(name = "融创")
}
# 深圳理奥 --------------------------------------------------------------------

{
  dataLiAo %>%
    LiAo() %>%
    SaveCsv(name = "深圳理奥")
}

# 圣斗士 ---------------------------------------------------------------------

{
  dataDouShiJ1 <- dataDouShiJ %>%
    MobanWithGroupGP() %>%
    mutate(代理 = "GatherOne", 国家 = 地区)
  dataDouShiJ2 <- dataDouShiJ %>%
    MobanWithoutGroup(gro = "圣斗士Jane") %>%
    mutate(代理 = "GatherOne", 国家 = "总计")

  bind_rows(dataDouShiJ1, dataDouShiJ2) %>%
    select(日期, 代理, 地区, 国家, 安装, 展示次数, 点击, 花费) %>%
    SaveCsv(name = "圣斗士Jane")

  dataDouShiM1 <- dataDouShiM %>%
    MobanWithGroupGP() %>%
    mutate(代理 = "GatherOne", 国家 = 地区)
  dataDouShiM2 <- dataDouShiM %>%
    MobanWithoutGroup(gro = "圣斗士Monika") %>%
    mutate(代理 = "GatherOne", 国家 = "总计")

  bind_rows(dataDouShiM1, dataDouShiM2) %>%
    select(日期, 代理, 地区, 国家, 安装, 展示次数, 点击, 花费) %>%
    SaveCsv(name = "圣斗士Monika")

  dataDouShiAll <- bind_rows(dataDouShiJ, dataDouShiM)

  dataDouShiAll1 <- dataDouShiAll %>%
    MobanWithGroupGP() %>%
    mutate(代理 = "GatherOne", 国家 = 地区) %>%
    select(日期, 代理, 地区, 国家, 安装, 展示次数, 点击, 花费)

  dataDouShiAll2 <- dataDouShiAll %>%
    MobanWithoutGroup(gro = "圣斗士汇总") %>%
    mutate(代理 = "GatherOne", 国家 = "总计") %>%
    select(日期, 代理, 国家, 安装, 展示次数, 点击, 花费)

  bind_rows(dataDouShiAll1, dataDouShiAll2) %>%
    SaveCsv(name = "圣斗士汇总")

  dataDouShiAND1 <- dataDouShiAND[-1, c("广告系列", "激活")]
  dataDouShiIOS1 <- dataDouShiIOS[-1, c("广告系列", "激活")]

  dataDouShiAND1 %>%
    mutate(优化 = if_else(str_detect(广告系列, "jane"), "Jane", "Monika")) %>%
    group_by(优化)
}

# 首推 ----------------------------------------------------------------------

{
  dataShouTui %>%
    MobanWithoutGroup(gro = "首推") %>%
    select(日期, group, 安装, 花费, 购买) %>%
    SaveCsv(name = "首推")

  dataShouTuiF %>%
    MobanWithoutGroup(gro = "首推Fingertip") %>%
    select(日期, group, 安装, 花费, 购买) %>%
    SaveCsv(name = "首推Fingertip")
}
# Sancamap ----------------------------------------------------------------

{
  dataSan %>%
    MobanWithoutGroup(gro = "Sancamap") %>%
    MobanSelectDefault() %>%
    select(-回收) %>%
    SaveCsv(name = "Sancamap")
  
  dataAce %>%
    MobanWithoutGroup(gro = "Ace") %>%
    MobanSelectDefault() %>%
    select(-回收) %>%
    SaveCsv(name = "Ace")

  dataBaCay %>%
    MobanWithoutGroup(gro = "BaCay") %>%
    MobanSelectDefault() %>%
    select(-回收) %>%
    SaveCsv(name = "BaCay")

  dataFortune %>%
    MobanWithoutGroup(gro = "Fortune") %>%
    MobanSelectDefault() %>%
    select(-回收) %>%
    SaveCsv(name = "Fortune")
}

# 怪猫 ----------------------------------------------------------------------

{
  dataGuai %>%
    Mao() %>%
    SaveCsv(name = "怪猫")
}

# CashBox -----------------------------------------------------------------
{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 18)) {
    dataCashBox <- readxl::read_xls("新Cashbox.xls")
    dataCashBox %>%
      MobanWithGroupGeo() %>%
      select(日期, 花费, 安装, 注册) %>%
      SaveCsv(filename = "0Cash", name = "CashBox", append = F)
  } else {
    message("NotNow")
  }
}

# 二手车 ---------------------------------------------------------------------
{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 13) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 18)) {
    dataCarFB <- readxl::read_xlsx("二手车FB.xlsx", col_names = T)
    dataCarGG <- readxl::read_xlsx("二手车GG.xlsx", skip = 2, col_names = T)
    dataFixFB <- readxl::read_xlsx("修车FB.xlsx", col_names = T)
    dataFixGG <- readxl::read_xlsx("修车GG.xlsx", skip = 2, col_names = T)

    dataCarFB1 <- dataCarFB %>%
      CarFixFB() %>%
      CarFB()
    dataCarGG1 <- dataCarGG %>% CarGG()
    dataFixFB1 <- dataFixFB %>%
      CarFixFB() %>%
      CarFB()
    dataFixGG1 <- dataFixGG %>% CarGG()

    bind_rows(dataCarFB1, dataCarGG1) %>%
      arrange(日期) %>%
      SaveCsv(name = "Car", filename = "0二手车", append = F)
    bind_rows(dataFixFB1, dataFixGG1) %>%
      arrange(日期) %>%
      SaveCsv(name = "Fix", filename = "0二手车")
  } else {
    message("NotNow!")
  }
}

# 赤子城 ---------------------------------------------------------------------

{
  if ((wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 15) | ((wday(now()) <= 1 | wday(now()) >= 7) & hour(now()) > 18)) {
    dataBela <- readxl::read_xls("赤子城-bela.xls")
    dataMimi <- readxl::read_xls("赤子城-mimi.xls")
    dataPeach <- readxl::read_xls("赤子城-peach.xls")
    # dataYumy <- readxl::read_xls("赤子城-yumy.xls")

    dataPeach1 <- dataPeach %>%
      MobanWithGroupGeo() %>%
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataPeach2 <- tibble(
      日期 = "　", 地区 = "总计",
      花费 = sum(dataPeach1$花费),
      安装 = sum(dataPeach1$安装),
      点击 = sum(dataPeach1$点击),
      展示次数 = sum(dataPeach1$展示次数)
    )

    dataBela1 <- dataBela %>%
      MobanWithGroupGeo() %>%
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataBela2 <- tibble(
      日期 = "　", 地区 = "总计",
      花费 = sum(dataBela1$花费),
      安装 = sum(dataBela1$安装),
      点击 = sum(dataBela1$点击),
      展示次数 = sum(dataBela1$展示次数)
    )

    bind_rows(dataBela1, dataBela2) %>%
      SaveCsv(name = "赤子城Bela", filename = "0赤子城", append = F)

    bind_rows(dataPeach1, dataPeach2) %>%
      SaveCsv(name = "赤子城Peach", filename = "0赤子城")

    dataMimi1 <- dataMimi %>%
      MobanWithoutGroup("Mimi") %>%
      select(日期, group, 花费, 安装, 点击, 展示次数) %>%
      SaveCsv(name = "赤子城Mimi", filename = "0赤子城")

    # dataYumy %>%
    #   MobanWithoutGroup("Yumy") %>%
    #   select(日期, group, 花费, 安装, 点击, 展示次数) %>%
    #   SaveCsv(name = "赤子城Yumy", filename = "0赤子城")
  } else {
    message("NotNow!")
  }
}
message("任務終了")
