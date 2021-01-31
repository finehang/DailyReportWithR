setwd("C:/Users/fanhang/Desktop/数据下载/other")
source("C:/Users/fanhang/OneDrive/DailyReport/DailyReport/FUN.R", encoding = "utf-8")

# 数据导入 --------------------------------------------------------------------

{
  dataFei <- readxl::read_xls("新飞乐乐.xls")
  dataZhiQi <- readxl::read_xls("新志启.xls")
  dataBela <- readxl::read_xls("新赤子城-Bela.xls")
  dataMimi <- readxl::read_xls("新赤子城-mimi.xls")
  dataPeach <- readxl::read_xls("新赤子城-peach.xls")
  dataKeyCredit <- readxl::read_xls("新KeyCredit.xls")
  dataPayCash <- readxl::read_xls("新PayCash.xls")
  dataZx <- readxl::read_xls("新ZxCash.xls")
  dataCashIndi <- readxl::read_xls("新CashIndiHub.xls")
  dataRong <- readxl::read_xls("新融创-VAY.xls")
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
  dataZhiBo <- readxl::read_xls("新1024.xls")
  dataRe <- readxl::read_xls("新remini.xls")
  dataReJ <- readxl::read_xls("新reminiJane.xls")
  dataMiao <- readxl::read_xls("新喵石.xls")
  dataSan <- readxl::read_xls("新sancamap.xls")
  dataGuai <- readxl::read_xls("新怪猫.xls")
  dataLing <- readxl::read_xls("新上海灵分.xls")
  dataBegin <- readxl::read_xls("新Beginlive.xls")
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

  dataBaiMovzy1 %>% SaveCsv(name = "白鲸Movzy")
  dataBaiYoung1 %>% SaveCsv(name = "白鲸YoungRadio+")
  dataBaiYolk1 %>% SaveCsv(name = "白鲸Yolk")
  dataBaiPlayer1 %>% SaveCsv(name = "白鲸video player")
}

# 掌阅 ----------------------------------------------------------------------

{
  dataZhang1 <- dataZhang %>%
    MobanWithGroupPlatform() %>%
    ZhangYue()

  dataZhang1 %>% SaveCsv(name = "掌阅")
}

# RummyPalace -------------------------------------------------------------

{
  dataPalace1 <- dataPalace %>%
    MobanWithoutGroup(gro = "RummyPalace") %>%
    MobanSelectDefault()

  dataPalace1 %>% SaveCsv(name = "RummyPalace")
}

# TeenpattiFun ------------------------------------------------------------

{
  dataTp1 <- dataTp %>%
    MobanWithoutGroup(gro = "TeenpattiFun") %>%
    MobanSelectDefault()

  dataTp1 %>% SaveCsv(name = "TeenpattiFun")
}

# Jeruk --------------------------------------------------------------------

{
  dataJeruk1 <- dataJeruk %>%
    MobanWithoutGroup(gro = "Jeruk") %>%
    MobanSelectDefault()

  dataJeruk1 %>% SaveCsv(name = "Jeruk")
}

# NovelSky ----------------------------------------------------------------

{
  dataNovelSky1 <- dataNovelSky %>%
    MobanWithoutGroup(gro = "NovelSky") %>%
    select(-c(回收, 购买, 注册))

  dataNovelSky1 %>% SaveCsv(name = "NovelSky")
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
  dataDreame1 <- dataDreame %>%
    Dream() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册)

  dataDreamenew1 <- dataDreamenew %>%
    Dream() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册)

  dataDreame1 %>% SaveCsv(name = "Dreame")
  dataDreamenew1 %>% SaveCsv(name = "DreameNew")
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


# ApexGame ----------------------------------------------------------------

{
  dataApex1 <- dataApex %>%
    MobanWithoutGroup() %>%
    MobanSelectDefault()

  dataApex1 %>% SaveCsv(name = "ApexGame")
}


# CashIndiHub -------------------------------------------------------------

{
  dataCashIndi1 <- dataCashIndi %>%
    MobanWithoutGroup() %>%
    mutate(CPI = 花费 / 注册) %>%
    select(日期, 安装, 花费, CPI)

  dataCashIndi1 %>% SaveCsv(name = "CashIndiHub")
}


# 志启 ----------------------------------------------------------------------

{
  dataZhiQi1 <- dataZhiQi %>% 
    MobanWithoutGroup(gro = "志启") %>% 
    mutate(CPI = 花费 / 安装) %>% 
    select(-c(回收, 购买, 注册))
  
  dataZhiQi1 %>% SaveCsv(name = "志启")
}

# microcard J+M -----------------------------------------------------------

{
  dataMicroJ1 <- dataMicroJ %>%
    MobanWithoutGroup(gro = "Jane") %>%
    select(日期, group, 展示次数, 点击, 花费)

  dataMicroM1 <- dataMicroM %>%
    MobanWithoutGroup(gro = "Monika") %>%
    select(日期, group, 展示次数, 点击, 花费)

  bind_rows(dataMicroJ1, dataMicroM1) %>% SaveCsv(name = "microcard")
}


# remini ------------------------------------------------------------------

{
  dataRe1 <- dataRe %>%
    MobanWithoutGroup(gro = "remini") %>%
    MobanSelectDefault(selection = "group") %>% 
    select(-回收)

  dataReJ1 <- dataReJ %>%
    MobanWithoutGroup(gro = "reminiJane") %>%
    MobanSelectDefault(selection = "group")
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
  dataZxAeo <- dataZx %>%
    Zx() %>%
    ZxAeo()
  dataZxNoAeo <- dataZx %>%
    Zx() %>%
    ZxNoAeo()

  dataZxAeo %>% SaveCsv(name = "ZxWithAeo")
  dataNoZxAeo %>% SaveCsv(name = "ZxWithOutAeo")
}

# 叨叨叨SpendCash ------------------------------------------------------------

{
  dataSpend1 <- dataSpend %>%
    MobanWithoutGroup(gro = "叨叨叨") %>%
    select(日期, group, 安装, 花费)

  dataSpend1 %>% SaveCsv(name = "叨叨叨")
}



# 飞乐乐 ---------------------------------------------------------------------

{
  dataFei %>% MobanWithoutGroup(gro = "飞乐乐") %>% 
    SaveCsv(name = "飞乐乐")
}

# 华述 ----------------------------------------------------------------------

{
  dataHuaShu1 <- dataHuaShu %>%
    MobanWithoutGroup(gro = "华述") %>%
    select(-c(回收, 购买, 注册))

  dataHuaShu1 %>% SaveCsv(name = "华述")
}


# 麦尔 ----------------------------------------------------------------------

{
  dataMaiEr1 <- dataMaiEr %>%
    MobanWithoutGroup(gro = "麦尔")

  dataMaiEr1 %>% SaveCsv(name = "麦尔")
}
# 喵石 ----------------------------------------------------------------------

{
  dataMiao1 <- dataMiao %>%
    MobanWithoutGroup(gro = "喵石") %>%
    select(日期, group, 安装, 花费)

  dataMiao1 %>% SaveCsv(name = "喵石")
}


# 融创 ----------------------------------------------------------------------

{
  dataRong1 <- dataRong %>%
    MobanWithGroupGeo() %>%
    select(-安装, -购买)

  dataRong1 %>% SaveCsv(name = "融创Vay")
}


# 上海灵分 --------------------------------------------------------------------
{
  dataSo1 <- dataLing %>%
    MobanWithoutGroup(gro = "SoCredit") %>%
    select(-回收, -注册)

  dataKeyCredit1 <- dataKeyCredit %>%
    MobanWithGroupGeo() %>% 
    select(-回收, -注册)

  dataPayCash1 <- dataPayCash %>%
    MobanWithGroupGeo() %>%
    select(-回收, -注册, -购买)

  dataSo1 %>% SaveCsv(name = "上海灵分_SoCredit")
  dataKeyCredit1 %>% SaveCsv(name = "上海灵分_KeyCredit")
  dataPayCash1 %>% SaveCsv(name = "上海灵分_PayCash")
}

# 玩德游戏 --------------------------------------------------------------------

{
  dataWanDe1 <- dataWanDe %>%
    MobanWithGroupGeo() %>%
    select(-注册, -购买)

  dataWanDe1 %>% SaveCsv(name = "玩德游戏")
}


# 万友互娱 --------------------------------------------------------------------

{
  dataWanYou1 <- dataWanYou %>%
    MobanWithoutGroup(gro = "万友互娱") %>%
    MobanSelectDefault()

  dataWanYou1 %>% SaveCsv(name = "万友互娱")
}
# Sancamap ----------------------------------------------------------------
{
  dataSan1 <- dataSan %>%
    MobanWithoutGroup(gro = "Sancamap") %>%
    MobanSelectDefault()

  dataSan1 %>% SaveCsv(name = "Sancamap")
}


# 怪猫 ----------------------------------------------------------------------

{
  dataGuai1 <- dataGuai %>% Mao()

  dataGuai1 %>% SaveCsv(name = "怪猫")
}


# 赤子城 ---------------------------------------------------------------------

{
  dataPeach1 <- dataPeach %>%
    MobanWithoutGroup("Peach") %>%
    select(日期, group, 花费, 安装, 点击, 展示次数)

  dataBela1 <- dataBela %>%
    MobanWithoutGroup("Bela") %>%
    select(日期, group, 花费, 安装, 点击, 展示次数)

  dataMimi1 <- dataMimi %>%
    MobanWithoutGroup("Bela") %>%
    select(日期, group, 花费, 安装, 点击, 展示次数)

  bind_rows(dataPeach1, dataBela1, dataMimi1) %>% SaveCsv(name = "赤子城")
}


# NovelCat ----------------------------------------------------------------

{
  dataNovelCat1 <- dataNovelCat %>%
    NovelCat() %>%
    MobanWithGroupGP() %>%
    select(-购买, -注册) %>%
    mutate(CPI = 花费 / 安装, ROI = 回收 / 花费)

  dataNovelCat1 %>% SaveCsv(name = "NovelCat")
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