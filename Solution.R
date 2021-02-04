setwd("C:/Users/fanhang/Desktop/数据下载/other")
source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

# 数据导入 --------------------------------------------------------------------

{
  dataZhiQi <- readxl::read_xls("新智启辰远.xls")
  dataTPJ <- readxl::read_xls("新博客来TPReal-J.xls")
  dataTPM <- readxl::read_xls("新博客来TPReal-M.xls")
  dataZhangYun <- readxl::read_xls("新掌中云.xls")
  dataBliss <- readxl::read_xls("新看看_bliss_lite.xls")
  dataTrinku <- readxl::read_xls("新看看-trinku.xls")
  dataLiAo <- readxl::read_xls("新深圳理奥.xls")
  dataSuoerTP <- readxl::read_xls("新SuperTP.xls")
  dataGuangHeng <- readxl::read_xls("新广恒通盛.xls")
  dataKeyCredit <- readxl::read_xls("新KeyCredit.xls")
  dataPayCash <- readxl::read_xls("新PayCash.xls")
  dataZx <- readxl::read_xls("新ZxCash.xls")
  dataCashIndi <- readxl::read_xls("新CashIndiHub.xls")
  dataPayCash <- readxl::read_xls("新PayCash.xls")
  dataWanYou <- readxl::read_xls("新万友互娱.xls")
  dataSpend <- readxl::read_xls("新SpendCash.xls")
  dataWanDe <- readxl::read_xls("新玩德游戏.xls")
  dataMaiEr <- readxl::read_xls("新麦尔.xls")
  dataHuaShu <- readxl::read_xls("新华述.xls")
  dataPalace <- readxl::read_xls("新RummyPalace.xls")
  dataApex <- readxl::read_xls("新ApexGame.xls")
  dataTp <- readxl::read_xls("新TeenpattiFun.xls")
  dataMicroJ <- readxl::read_xls("新microcard-J.xls")
  dataMicroM <- readxl::read_xls("新microcard-M.xls")
  dataJeruk <- readxl::read_xls("新JerukLive.xls")
  dataNovelSky <- readxl::read_xls("新NovelSky.xls")
  dataRe <- readxl::read_xls("新remini.xls")
  dataReJ <- readxl::read_xls("新reminiJane.xls")
  dataMiao <- readxl::read_xls("新喵石.xls")
  dataSan <- readxl::read_xls("新sancamap.xls")
  dataGuai <- readxl::read_xls("新怪猫.xls")
  dataLing <- readxl::read_xls("新上海灵分.xls")
  dataShen <- readxl::read_xls("新神兽传奇.xls")
  dataVideo <- readxl::read_xls("新凯丽金-videochat.xls")
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
}

# 白鲸 ----------------------------------------------------------------------

{
  dataBaiMovzy %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸Movzy") %>%
    BaiJing() %>%
    SaveCsv(name = "白鲸Movzy")

  dataBaiYoung %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸YoungRadio+") %>%
    BaiJing() %>%
    SaveCsv(name = "白鲸YoungRadio+")

  dataBaiYolk %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸Yolk") %>%
    BaiJing() %>%
    SaveCsv(name = "白鲸Yolk")

  dataBaiPlayer %>%
    MobanWithGroupGP() %>%
    mutate(产品 = "白鲸video player") %>%
    BaiJing() %>%
    SaveCsv(name = "白鲸video player")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhang %>%
    MobanWithGroupPlatform() %>%
    ZhangYue() %>%
    SaveCsv(name = "掌阅")
}

# RummyPalace -------------------------------------------------------------

{
  dataPalace %>%
    MobanWithoutGroup(gro = "RummyPalace") %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "RummyPalace")
}


# SuperTP -----------------------------------------------------------------

{
  dataSuoerTP %>%
    MobanWithGroupGeo() %>%
    select(-c(回收, 购买, 注册)) %>%
    SaveCsv(name = "SuperTP")
}

# TeenpattiFun ------------------------------------------------------------

{
  dataTp %>%
    MobanWithoutGroup(gro = "TeenpattiFun") %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "TeenpattiFun")
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

# 江苏明通新墨香 -----------------------------------------------------------------

{
  dataJiang1 <- dataJiang %>%
    MobanWithGroupGP() %>%
    select(-回收, -注册) %>%
    mutate(CPI = 花费 / 安装) %>%
    select(-购买) %>%
    filter(地区 != "unknown")

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

# 智启辰远 --------------------------------------------------------------------

{
  dataZhiQi %>% MobanWithGroupGeo() %>% 
    select(-c(购买, 注册)) %>% 
    SaveCsv(name = "智启辰远")
}

# 掌云 ----------------------------------------------------------------------

{
  dataZhangYun %>% MobanWithGroupGeo() %>% 
    select(-c(购买, 注册)) %>% SaveCsv(name = "掌云")
}

# ApexGame ----------------------------------------------------------------

{
  dataApex %>%
    MobanWithoutGroup() %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "ApexGame")
}

# CashIndiHub -------------------------------------------------------------

{
  dataCashIndi %>%
    MobanWithoutGroup() %>%
    mutate(CPI = 花费 / 注册) %>%
    select(日期, 安装, 花费, CPI) %>%
    SaveCsv(name = "CashIndiHub")
}

# microcard J+M -----------------------------------------------------------

{
  dataTPJ1 <- dataTPJ %>%
    MobanWithoutGroup(gro = "TPJane") %>%
    select(日期, group, 展示次数, 点击, 花费)
  
  dataTPM1 <- dataTPM %>%
    MobanWithoutGroup(gro = "TPMonika") %>%
    select(日期, group, 展示次数, 点击, 花费)
  
  dataMicroJ1 <- dataMicroJ %>%
    MobanWithoutGroup(gro = "rummyJane") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataMicroM1 <- dataMicroM %>%
    MobanWithoutGroup(gro = "rummyMonika") %>%
    select(日期, group, 展示次数, 点击, 花费)

  bind_rows(dataTPJ1, dataTPM1) %>% SaveCsv(name = "博客来TP")
  bind_rows(dataMicroJ1, dataMicroM1) %>% SaveCsv(name = "博客来Rummy")
}

# remini ------------------------------------------------------------------

{
  dataRe1 <- dataRe %>%
    MobanWithoutGroup(gro = "remini") %>%
    MobanSelectDefault(selection = "group") %>%
    select(-回收)

  dataReJ1 <- dataReJ %>%
    MobanWithoutGroup(gro = "reminiJane") %>%
    MobanSelectDefault(selection = "group") %>%
    select(-回收)

  bind_rows(dataRe1, dataReJ1) %>% SaveCsv(name = "remini")
}

# videochat ---------------------------------------------------------------

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

  dataHallo1 <- dataHallo %>%
    MobanWithGroupGeo() %>%
    select(-购买)

  bind_rows(dataVideo1, dataWinnie1, dataHaya1) %>% SaveCsv(name = "Videochat")
  dataHallo1 %>% SaveCsv(name = "Videochat_Hallo")
}

# ZxCash ------------------------------------------------------------------

{
  dataZx %>%
    Zx() %>%
    ZxAeo() %>%
    SaveCsv(name = "ZxWithAeo")

  dataZx %>%
    Zx() %>%
    ZxNoAeo() %>%
    SaveCsv(name = "ZxWithOutAeo")
}

# 叨叨叨SpendCash ------------------------------------------------------------

{
  dataSpend %>%
    MobanWithoutGroup(gro = "叨叨叨") %>%
    select(日期, group, 安装, 花费) %>%
    SaveCsv(name = "叨叨叨")
}

# 广恒通盛 ----------------------------------------------------------------------

{
  dataGuangHeng %>%
    MobanWithoutGroup(gro = "广恒通盛") %>%
    mutate(CPI = 花费 / 安装) %>%
    select(-c(回收, 购买, 注册)) %>%
    SaveCsv(name = "广恒通盛")
}


# 华述 ----------------------------------------------------------------------

{
  dataHuaShu %>%
    MobanWithoutGroup(gro = "华述") %>%
    select(-c(回收, 购买, 注册)) %>%
    SaveCsv(name = "华述")
}

# 看看在线 --------------------------------------------------------------------

{
  dataTrinku1 <- dataTrinku %>% MobanWithoutGroup(gro = "Trinku") %>% 
    select(-c(购买, 注册))
  
  dataBliss1 <- dataBliss %>% MobanWithoutGroup(gro = "Bliss") %>% 
    select(-c(购买, 注册))
  
  bind_rows(dataTrinku1, dataBliss1) %>% SaveCsv(name = "看看在线")
}

# 麦尔 ----------------------------------------------------------------------

{
  dataMaiEr %>%
    MobanWithoutGroup(gro = "麦尔") %>%
    SaveCsv(name = "麦尔")
}
# 喵石 ----------------------------------------------------------------------

{
  dataMiao %>%
    MobanWithoutGroup(gro = "喵石") %>%
    select(日期, group, 安装, 花费) %>%
    SaveCsv(name = "喵石")
}

# 上海灵分 --------------------------------------------------------------------
{
  dataLing %>%
    MobanWithoutGroup(gro = "SoCredit") %>%
    select(-回收, -注册) %>%
    SaveCsv(name = "上海灵分_SoCredit")

  dataKeyCredit %>%
    MobanWithGroupGeo() %>%
    select(-回收, -注册) %>%
    SaveCsv(name = "上海灵分_KeyCredit")

  dataPayCash %>%
    MobanWithGroupGeo() %>%
    select(-回收, -注册, -购买) %>%
    SaveCsv(name = "上海灵分_PayCash")
}

# 深圳理奥 --------------------------------------------------------------------
{
  dataLiAo %>% MobanWithGroupGeo() %>% 
    select(-c(购买, 注册)) %>% 
    SaveCsv(name = "深圳理奥")
}

# 玩德游戏 --------------------------------------------------------------------

{
  dataWanDe1 <- dataWanDe %>%
    MobanWithGroupGeo() %>%
    select(-注册, -购买)
  
  dataWanDe2 <- tibble(
    日期 = "　", 地区 = "总计",
    安装 = sum(dataWanDe1$安装),
    点击 = sum(dataWanDe1$点击),
    展示次数 = sum(dataWanDe1$展示次数),
    花费 = sum(dataWanDe1$花费),
    回收 = sum(dataWanDe1$回收)
  )
  
  bind_rows(dataWanDe1, dataWanDe2) %>% SaveCsv(name = "玩德游戏")
}

# 万友互娱 --------------------------------------------------------------------

{
  dataWanYou %>%
    MobanWithoutGroup(gro = "万友互娱") %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "万友互娱")
}

# Sancamap ----------------------------------------------------------------
{
  dataSan %>%
    MobanWithoutGroup(gro = "Sancamap") %>%
    MobanSelectDefault() %>%
    SaveCsv(name = "Sancamap")
}

# 怪猫 ----------------------------------------------------------------------

{
  dataGuai %>%
    Mao() %>%
    SaveCsv(name = "怪猫")
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
    select(日期, 版本, 地区, 安装, 点击, 展示次数) %>%
    filter(地区 != "unknown")

  dataReadictM1 <- dataReadictM %>%
    MobanWithGroupGP() %>%
    select(日期, 版本, 地区, 安装, 点击, 展示次数)

  bind_rows(dataReadictJ1, dataReadictM1) %>% SaveCsv(name = "readict ")
}

# 赤子城 ---------------------------------------------------------------------
{
  if (wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 15) {
    dataBela <- readxl::read_xls("赤子城-Bela.xls")
    dataMimi <- readxl::read_xls("赤子城-mimi.xls")
    dataPeach <- readxl::read_xls("赤子城-peach.xls")

    dataPeach1 <- dataPeach %>%
      MobanWithGroupGeo() %>%
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataPeach2 <- tibble(
      日期 = "　", 地区 = "总计",
      花费 = sum(dataPeach1$花费),
      安装 = sum(dataPeach1$安装),
      点击 = sum(dataPeach1$点击),
      展示次数 = sum(dataPeach1$展示次数))

    bind_rows(dataPeach1, dataPeach2) %>%
      SaveCsv(name = "赤子城Peach", filename = "0赤子城", append = F)

    dataBela1 <- dataBela %>%
      MobanWithGroupGeo() %>%
      select(日期, 地区, 花费, 安装, 点击, 展示次数)

    dataBela2 <- tibble(
      日期 = "　", 地区 = "总计",
      花费 = sum(dataBela1$花费),
      安装 = sum(dataBela1$安装),
      点击 = sum(dataBela1$点击),
      展示次数 = sum(dataBela1$展示次数))

    bind_rows(dataBela1, dataBela2) %>%
      SaveCsv(name = "赤子城Bela", filename = "0赤子城")

    dataMimi1 <- dataMimi %>%
      MobanWithoutGroup("Bela") %>%
      select(日期, group, 花费, 安装, 点击, 展示次数) %>%
      SaveCsv(name = "赤子城Mimi", filename = "0赤子城")
  } else {
    cat("NotNow!")
  }
}

# 二手车 ---------------------------------------------------------------------

if (wday(now()) >= 2 & wday(now()) <= 6 & hour(now()) > 14) {
  {
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
  }
} else {
  cat("NotNow!")
}

cat("任務終了")