
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `AT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AT010` (
  `CDBUMON` varchar(5) NOT NULL,
  `TXBUMON` varchar(30) NOT NULL COMMENT '部門名',
  `NRKANRISYA` varchar(5) NOT NULL COMMENT '管理者№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`CDBUMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部門C';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AT011` (
  `CDBUMON` varchar(5) NOT NULL COMMENT '部門C',
  `DTHAKKOUNENGETSU` varchar(6) NOT NULL COMMENT '発効年月',
  `CDJYOUIBUMON` varchar(5) NOT NULL COMMENT '上位部門C',
  `DTSIKKOUNENGETSU` varchar(6) DEFAULT NULL COMMENT '失効年月',
  PRIMARY KEY (`CDBUMON`,`DTHAKKOUNENGETSU`),
  KEY `AT011_FK1` (`CDJYOUIBUMON`),
  CONSTRAINT `AT011_FK1` FOREIGN KEY (`CDJYOUIBUMON`) REFERENCES `AT010` (`CDBUMON`),
  CONSTRAINT `AT011_FK2` FOREIGN KEY (`CDBUMON`) REFERENCES `AT010` (`CDBUMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AT020` (
  `NRJYUGYOIN` varchar(5) NOT NULL,
  `TXKANA` varchar(30) NOT NULL COMMENT 'カナ名',
  `TXKANJI` varchar(30) NOT NULL COMMENT '漢字名',
  `KBKOYOU` varchar(2) NOT NULL COMMENT '雇用区分',
  `DTNYUSYA` date NOT NULL COMMENT '入社日',
  `DTTAISYA` date DEFAULT NULL COMMENT '退社日',
  PRIMARY KEY (`NRJYUGYOIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='従業員№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AT021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AT021` (
  `NRJYUGYOIN` varchar(5) NOT NULL COMMENT '従業員№',
  `DTSYOZOKUNENGETSU` varchar(6) NOT NULL COMMENT '所属発効年月',
  `CDBUMON` varchar(5) NOT NULL COMMENT '部門C',
  `DTLASTNENGETSU` varchar(6) NOT NULL COMMENT '所属最終年月',
  `KBPRESENT` varchar(1) NOT NULL COMMENT '現行メンバー区分',
  PRIMARY KEY (`NRJYUGYOIN`,`DTSYOZOKUNENGETSU`),
  KEY `AT021_FK2` (`CDBUMON`),
  CONSTRAINT `AT021_FK1` FOREIGN KEY (`NRJYUGYOIN`) REFERENCES `AT020` (`NRJYUGYOIN`),
  CONSTRAINT `AT021_FK2` FOREIGN KEY (`CDBUMON`) REFERENCES `AT010` (`CDBUMON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AT030` (
  `NRTORIHIKISAKI` varchar(8) NOT NULL,
  `TXKANA` varchar(40) NOT NULL COMMENT 'カナ名',
  `TXKANJI` varchar(40) NOT NULL COMMENT '漢字名',
  `KBCOUNTRY` varchar(3) NOT NULL COMMENT '国コード',
  `KBCURRENCY` varchar(3) NOT NULL COMMENT '取引通貨',
  `NRYUBIN` varchar(8) NOT NULL COMMENT '郵便番号',
  `TXJYUSYO1` varchar(30) NOT NULL COMMENT '住所１',
  `TXJYUSYO2` varchar(30) DEFAULT NULL COMMENT '住所２',
  `NRDENWA` varchar(14) NOT NULL COMMENT '代表電話番号',
  `NRFAX` varchar(14) NOT NULL COMMENT 'FAX番号',
  `TXURL` varchar(40) DEFAULT NULL COMMENT 'ＵＲＬ',
  `FGKOKYAKU` varchar(1) NOT NULL COMMENT '顧客対象FLAG',
  `FGSIIRESAKI` varchar(1) NOT NULL COMMENT '仕入先対象FLAG',
  PRIMARY KEY (`NRTORIHIKISAKI`),
  UNIQUE KEY `AT030_SK1` (`TXKANJI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BT010` (
  `CDMAKER` varchar(5) NOT NULL,
  `TXMAKER` varchar(40) NOT NULL COMMENT 'メーカー名',
  `TXMAKERABR` varchar(10) NOT NULL COMMENT 'メーカー略称',
  `KBCOUNTRY` varchar(3) NOT NULL COMMENT '国コード',
  `NRYUBIN` varchar(8) NOT NULL COMMENT '郵便番号',
  `TXJYUSYO` varchar(40) NOT NULL COMMENT '住所',
  `NRDENWA` varchar(14) NOT NULL COMMENT '代表電話番号',
  `NRFAX` varchar(14) NOT NULL COMMENT 'FAX番号',
  `TXURL` varchar(40) DEFAULT NULL COMMENT 'ＵＲＬ',
  `TXEMAIL` varchar(40) DEFAULT NULL COMMENT '担当者メアド',
  PRIMARY KEY (`CDMAKER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='メーカー№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BT020` (
  `NRSYOHIN` varchar(7) NOT NULL,
  `TXSYOHIN` varchar(30) NOT NULL COMMENT '商品名',
  `TXHINBAN` varchar(20) NOT NULL COMMENT '品番',
  `TXSIYOU` varchar(50) DEFAULT NULL COMMENT '仕様',
  `TXIMAGEFILENAME` varchar(30) NOT NULL COMMENT '外観',
  `KBSYOHIN` varchar(5) NOT NULL COMMENT '商品群区分',
  `CDMAKER` varchar(5) NOT NULL COMMENT 'メーカーＣ',
  `PRHANBAI` int(11) DEFAULT NULL COMMENT '標準売価',
  `PRSIIRE` int(11) DEFAULT NULL COMMENT '標準仕入価格',
  `KBZAIKOUM` varchar(2) NOT NULL COMMENT '在庫単位区分',
  `QTHANBAIUNIT` int(11) NOT NULL COMMENT '販売単位数',
  `QTANZENZAIKO` int(11) DEFAULT NULL COMMENT '安全在庫省略値',
  `QTJYOUGENZAIKO` int(11) NOT NULL COMMENT '上限在庫省略値',
  `FGLOTKANRI` varchar(1) NOT NULL COMMENT 'ロット管理対象',
  `FGLISTSYOHIN` varchar(1) NOT NULL COMMENT '一覧表示対象',
  `PRARARI` int(11) DEFAULT NULL COMMENT '標準粗利',
  PRIMARY KEY (`NRSYOHIN`),
  UNIQUE KEY `BT020_SK1` (`TXHINBAN`),
  KEY `BT020_FK1` (`CDMAKER`),
  CONSTRAINT `BT020_FK1` FOREIGN KEY (`CDMAKER`) REFERENCES `BT010` (`CDMAKER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部商品№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BT021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BT021` (
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `NRCHILD` varchar(7) NOT NULL COMMENT '構成品内部商品№',
  `RTKOUSEI` int(11) NOT NULL COMMENT '構成数',
  `SQLIST` smallint(6) DEFAULT NULL COMMENT '構成一覧順',
  PRIMARY KEY (`NRSYOHIN`,`NRCHILD`),
  CONSTRAINT `BT021_FK1` FOREIGN KEY (`NRSYOHIN`) REFERENCES `BT020` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BT030` (
  `NRSOUKO` varchar(5) NOT NULL,
  `TXSOUKO` varchar(20) NOT NULL COMMENT '倉庫名',
  `TXSOUKOENG` varchar(30) DEFAULT NULL COMMENT '倉庫名(英文)',
  `NRYUBIN` varchar(8) NOT NULL COMMENT '郵便番号',
  `TXJYUSYO` varchar(40) NOT NULL COMMENT '住所',
  `TXJYUSYOENG` varchar(40) DEFAULT NULL COMMENT '住所(英文)',
  `NRDENWA` varchar(14) NOT NULL COMMENT '電話番号',
  `NRFAX` varchar(14) NOT NULL COMMENT 'FAX番号',
  PRIMARY KEY (`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='倉庫№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BT031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BT031` (
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRLOCATION` varchar(5) NOT NULL COMMENT 'ロケ№',
  `TXTEKIYO` varchar(20) NOT NULL COMMENT '摘要',
  PRIMARY KEY (`NRSOUKO`,`NRLOCATION`),
  CONSTRAINT `BT031_FK1` FOREIGN KEY (`NRSOUKO`) REFERENCES `BT030` (`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CT010` (
  `NRTORIHIKISAKI` varchar(8) NOT NULL,
  `TXTANTOUBUSYO` varchar(30) NOT NULL COMMENT '仕入先担当部署',
  `TXTANTOUSYA` varchar(40) DEFAULT NULL COMMENT '仕入先担当者名',
  `TXTANTOUSYASYOKUI` varchar(10) DEFAULT NULL COMMENT '仕入先担当者職位',
  `TXTANTOUSYAEMAIL` varchar(40) DEFAULT NULL COMMENT '仕入先担当者メアド',
  `TXTANTOUSYADENWA` varchar(20) DEFAULT NULL COMMENT '仕入先担当者電話番号',
  `KBSIHARAIHOUHOU` varchar(2) NOT NULL COMMENT '支払方法区分',
  `TXHURIKOMISAKI` varchar(50) DEFAULT NULL COMMENT '振込銀行口座',
  `VLNYUKINSAITO` smallint(6) NOT NULL COMMENT '支払入金サイト',
  `NRTANTOUJYUGYOIN` varchar(5) NOT NULL COMMENT '仕入担当者№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `AMKISYUKAIKAKE` decimal(11,2) DEFAULT NULL COMMENT '期首買掛残高',
  `AMKEIJYOU` decimal(11,2) DEFAULT NULL COMMENT '当期計上額',
  `AMSIHARAI` decimal(11,2) DEFAULT NULL COMMENT '当期支払額',
  `AMGENKAIKAKE` decimal(11,2) DEFAULT NULL COMMENT '現買掛残高',
  PRIMARY KEY (`NRTORIHIKISAKI`),
  CONSTRAINT `CT010_FK1` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `AT030` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入先№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CT011` (
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `DTHAKKOU` date NOT NULL COMMENT '発効日',
  `DTSIKKOU` date NOT NULL COMMENT '失効日',
  `KBSIIREUM` varchar(5) NOT NULL COMMENT '仕入単位',
  `QTSIIRETANNI` int(11) NOT NULL COMMENT '仕入単位数量',
  `VLKANZANKEISU` int(11) NOT NULL COMMENT '仕入単位換算係数',
  `PRSIIRETANKA` decimal(11,2) NOT NULL COMMENT '契約仕入単価',
  `VLLEADTIME` smallint(6) DEFAULT NULL COMMENT '標準発注リードタイム',
  PRIMARY KEY (`NRSYOHIN`,`NRTORIHIKISAKI`,`DTHAKKOU`),
  KEY `CT011_FK2` (`NRTORIHIKISAKI`),
  CONSTRAINT `CT011_FK1` FOREIGN KEY (`NRSYOHIN`) REFERENCES `BT020` (`NRSYOHIN`),
  CONSTRAINT `CT011_FK2` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `CT010` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CT100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CT100` (
  `NRSIIRE` varchar(7) NOT NULL,
  `KBAKADEN` varchar(2) NOT NULL COMMENT '赤黒',
  `FGVALID` varchar(1) NOT NULL COMMENT '効区',
  `KBSIIRE` varchar(2) NOT NULL COMMENT '仕入区分',
  `DTSIIRE` date NOT NULL COMMENT '仕入日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `NRSYOHIN` varchar(7) DEFAULT NULL COMMENT '仕入商品№',
  `TXSYOHIN` varchar(30) DEFAULT NULL COMMENT '商品名／摘要',
  `PRSIIRE` decimal(10,2) DEFAULT NULL COMMENT '仕入単価',
  `KBCURRENCY` varchar(3) DEFAULT NULL COMMENT '通貨',
  `QTSIIRE` int(11) DEFAULT NULL COMMENT '仕入数量',
  `KBSIIREUM` varchar(5) DEFAULT NULL COMMENT '仕入単位区分',
  `AMSIIRE` decimal(11,2) NOT NULL COMMENT '税抜仕入額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `NRSIHARAIIRAI` varchar(7) DEFAULT NULL COMMENT '支払依頼№',
  `DTCREATE` datetime NOT NULL COMMENT '記録日時',
  `DTNEND` smallint(6) NOT NULL COMMENT '取引年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '取引月序',
  `AMSIIRENAIKA` decimal(11,2) NOT NULL COMMENT '税抜内貨仕入額',
  PRIMARY KEY (`NRSIIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='買掛増減№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CT110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CT110` (
  `NRSIHARAIIRAI` varchar(7) NOT NULL,
  `DTSIHARAIIRAI` date NOT NULL COMMENT '依頼日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `TXSEIKYUNO` varchar(20) DEFAULT NULL COMMENT '仕入先請求番号',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `FGSYOUNIN` varchar(1) NOT NULL COMMENT '支払承認フラグ',
  `NRSIHARAI` varchar(7) DEFAULT NULL COMMENT '支払指示№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `KBSIHARAIHOUHOU` varchar(2) NOT NULL COMMENT '支払方法区分',
  `AMSIHARAI` decimal(11,2) DEFAULT NULL COMMENT '税抜支払依頼額',
  `AMSIHARAINAIKA` int(11) DEFAULT NULL COMMENT '税抜内貨支払額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  PRIMARY KEY (`NRSIHARAIIRAI`),
  UNIQUE KEY `CT110_SK1` (`NRTORIHIKIKANRI`),
  KEY `CT110_FK1` (`NRTORIHIKISAKI`),
  CONSTRAINT `CT110_FK1` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `CT010` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支払依頼№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CT120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CT120` (
  `NRSIHARAI` varchar(7) NOT NULL,
  `DTSIHARAI` date NOT NULL COMMENT '支払日',
  `KBSIHARAIHOUHOU` varchar(2) NOT NULL COMMENT '支払方法区分',
  `KBCURRENCY` varchar(3) DEFAULT NULL COMMENT '通貨',
  `AMJITSUSIHARAI` int(11) DEFAULT NULL COMMENT '内貨実際支払額',
  `AMTESURYO` int(11) DEFAULT NULL COMMENT '手数料',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `AMSIHARAI` decimal(11,2) DEFAULT NULL COMMENT '税込支払指示額',
  PRIMARY KEY (`NRSIHARAI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支払指示№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT010` (
  `NRTORIHIKISAKI` varchar(8) NOT NULL,
  `CDKAKERITSURANK` varchar(2) NOT NULL COMMENT '掛率ランクＣ',
  `TXTANTOUBUSYO` varchar(30) NOT NULL COMMENT '客先担当部署',
  `TXTANTOUSYA` varchar(40) DEFAULT NULL COMMENT '客先担当者名',
  `TXTANTOUSYASYOKUI` varchar(10) DEFAULT NULL COMMENT '客先担当者職位',
  `TXTANTOUSYAEMAIL` varchar(40) DEFAULT NULL COMMENT '客先担当者メアド',
  `TXTANTOUSYADENWA` varchar(20) DEFAULT NULL COMMENT '客先担当者電話番号',
  `KBSEIKYUHOUSHIKI` varchar(2) NOT NULL COMMENT '請求方式区分',
  `TXSIMEBI` varchar(10) NOT NULL COMMENT '締め日',
  `CDNOUHINSYOYOSHIKI` varchar(4) DEFAULT NULL COMMENT '納品書様式コード',
  `KBNYUKINHOUHOU` varchar(2) NOT NULL COMMENT '標準入金方法区分',
  `VLNYUKINSAITO` smallint(6) NOT NULL COMMENT '売上入金サイト',
  `AMYOSHIN` int(11) NOT NULL COMMENT '与信限度額',
  `NRTANTOUJYUGYOIN` varchar(5) NOT NULL COMMENT '担当営業№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `AMKISYUURIKAKE` int(11) DEFAULT NULL COMMENT '期首売掛残高',
  `AMKEIJYOU` int(11) DEFAULT NULL COMMENT '当期計上額',
  `AMKAISYU` int(11) DEFAULT NULL COMMENT '当期回収額',
  `AMGENURIKAKE` int(11) DEFAULT NULL COMMENT '現売掛残高',
  PRIMARY KEY (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顧客№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT011` (
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `SQSYUKKASAKI` smallint(6) NOT NULL COMMENT '出荷先行',
  `TXKANJI` varchar(40) NOT NULL COMMENT '出荷先名',
  `NRYUBIN` varchar(8) NOT NULL COMMENT '郵便番号',
  `TXJYUSYO` varchar(40) NOT NULL COMMENT '住所',
  `NRDENWA` varchar(14) NOT NULL COMMENT '代表電話番号',
  `NRFAX` varchar(14) DEFAULT NULL COMMENT 'FAX番号',
  `VLUNSOULT` smallint(6) NOT NULL COMMENT '運送リードタイム',
  PRIMARY KEY (`NRTORIHIKISAKI`,`SQSYUKKASAKI`),
  CONSTRAINT `DT011_FK1` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `DT010` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT020` (
  `CDKAKERITSURANK` varchar(2) NOT NULL,
  `TXKAKERITSURANK` varchar(20) NOT NULL COMMENT 'ランク記述',
  `VLKAKERITSU` decimal(3,2) NOT NULL COMMENT '掛率',
  PRIMARY KEY (`CDKAKERITSURANK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='掛率ランクＣ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT100` (
  `NRURIAGE` varchar(7) NOT NULL,
  `KBAKADEN` varchar(2) NOT NULL COMMENT '赤黒',
  `FGVALID` varchar(1) NOT NULL COMMENT '効区',
  `KBURIAGE` varchar(2) NOT NULL COMMENT '売上区分',
  `DTURIAGE` date NOT NULL COMMENT '売上日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `NRSYOHIN` varchar(7) DEFAULT NULL COMMENT '売上商品№',
  `TXSYOHIN` varchar(30) DEFAULT NULL COMMENT '商品名／摘要',
  `PRHANBAI` int(11) DEFAULT NULL COMMENT '標準販売価格',
  `PRURIAGE` int(11) DEFAULT NULL COMMENT '売上単価',
  `QTURIAGE` int(11) NOT NULL COMMENT '売上数量',
  `KBURIAGEUM` varchar(5) NOT NULL COMMENT '売上単位区分',
  `AMURIAGE` int(11) NOT NULL COMMENT '税抜売上額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  `AMGENKA` int(11) DEFAULT NULL COMMENT '売上原価',
  `NRSEIKYU` varchar(7) DEFAULT NULL COMMENT '請求№',
  `NRJYUGYOIN` varchar(5) DEFAULT NULL COMMENT '担当営業№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `DTCREATE` datetime NOT NULL COMMENT '記録日時',
  `DTNEND` smallint(6) NOT NULL COMMENT '取引年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '取引月序',
  `AMNEBIKI` int(11) NOT NULL COMMENT '値引額',
  `AMARARI` int(11) NOT NULL COMMENT '粗利額',
  PRIMARY KEY (`NRURIAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売掛増減№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT110` (
  `NRSEIKYU` varchar(7) NOT NULL,
  `DTSEIKYU` date NOT NULL COMMENT '請求日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `DTHAKKOU` date DEFAULT NULL COMMENT '発行日',
  `DTNYUKIN` date DEFAULT NULL COMMENT '入金確認日',
  `AMNYUKIN` int(11) DEFAULT NULL COMMENT '前回以降入金額',
  `AMSEIKYU` int(11) NOT NULL COMMENT '請求額',
  `STSEIKYU` varchar(2) NOT NULL COMMENT '請求状況',
  PRIMARY KEY (`NRSEIKYU`),
  KEY `DT110_FK1` (`NRTORIHIKISAKI`),
  CONSTRAINT `DT110_FK1` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `DT010` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='請求№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DT120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DT120` (
  `NRJYURYOU` varchar(7) NOT NULL,
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `DTJYURYOU` date NOT NULL COMMENT '受領日',
  `KBNYUKINHOUHOU` varchar(2) NOT NULL COMMENT '入金方法区分',
  `AMJYURYOU` int(11) NOT NULL COMMENT '受領額',
  `AMTESURYOU` int(11) DEFAULT NULL COMMENT '手数料額',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  PRIMARY KEY (`NRJYURYOU`),
  UNIQUE KEY `DT120_SK1` (`NRTORIHIKIKANRI`),
  KEY `DT120_FK1` (`NRTORIHIKISAKI`),
  CONSTRAINT `DT120_FK1` FOREIGN KEY (`NRTORIHIKISAKI`) REFERENCES `DT010` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受領№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ET010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ET010` (
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRLOCATION` varchar(5) DEFAULT NULL COMMENT '標準ロケ№',
  `QTANZENZAIKO` int(11) DEFAULT NULL COMMENT '安全在庫数',
  `QTJYOUGENZAIKO` int(11) DEFAULT NULL COMMENT '上限在庫数',
  `QTKISYUZAIKO` int(11) DEFAULT NULL COMMENT '期首在庫数',
  `QTNYUKO` int(11) DEFAULT NULL COMMENT '当期入庫数',
  `QTSYUKKO` int(11) DEFAULT NULL COMMENT '当期出庫数',
  `AMKISYUZAIKO` int(11) DEFAULT NULL COMMENT '期首在庫額',
  `AMNYUKO` int(11) DEFAULT NULL COMMENT '当期入庫額',
  `AMSYUKKO` int(11) DEFAULT NULL COMMENT '当期出庫額',
  `QTGENZAIKO` int(11) DEFAULT NULL COMMENT '現在庫数',
  `AMGENZAIKO` int(11) DEFAULT NULL COMMENT '現在庫額',
  `PRIDOUHEIKIN` int(11) DEFAULT NULL COMMENT '移動平均単価',
  PRIMARY KEY (`NRSYOHIN`,`NRSOUKO`),
  KEY `ET010_FK2` (`NRSOUKO`),
  CONSTRAINT `ET010_FK1` FOREIGN KEY (`NRSYOHIN`) REFERENCES `BT020` (`NRSYOHIN`),
  CONSTRAINT `ET010_FK2` FOREIGN KEY (`NRSOUKO`) REFERENCES `BT030` (`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ET100`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ET100` (
  `NRUKEBARAI` varchar(7) NOT NULL,
  `KBAKADEN` varchar(2) NOT NULL COMMENT '赤黒',
  `FGVALID` varchar(1) NOT NULL COMMENT '効区',
  `KBUKEBARAI` varchar(2) NOT NULL COMMENT '受払区分',
  `DTUKEBARAI` date NOT NULL COMMENT '受払日',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRIDOUSOUKO` varchar(5) DEFAULT NULL COMMENT '移動倉庫№',
  `NRTORIHIKISAKI` varchar(8) DEFAULT NULL COMMENT '取引先№',
  `SQSYUKKASAKI` smallint(6) DEFAULT NULL COMMENT '出荷先行番',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `TXSYOHIN` varchar(30) DEFAULT NULL COMMENT '商品名／摘要',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `QTUKEBARAI` int(11) DEFAULT NULL COMMENT '受払数量',
  `AMUKEBARAI` int(11) DEFAULT NULL COMMENT '受払金額',
  `AMSAGAKU` int(11) DEFAULT NULL COMMENT '取引差額',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `DTCREATE` datetime NOT NULL COMMENT '記録日時',
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `SQMSEQ` smallint(6) NOT NULL COMMENT '月度',
  `TXAITESAKI` varchar(40) DEFAULT NULL COMMENT '相手先名',
  PRIMARY KEY (`NRUKEBARAI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受払№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ET200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ET200` (
  `NRTORIHIKIKANRI` varchar(7) NOT NULL,
  `KBYOTEI` varchar(2) NOT NULL COMMENT '受払予定区分',
  `DTYOTEI` date NOT NULL COMMENT '受払予定日',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRIDOUSOUKO` varchar(5) DEFAULT NULL COMMENT '移動倉庫№',
  `NRTORIHIKISAKI` varchar(8) DEFAULT NULL COMMENT '取引先№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `QTYOTEI` int(11) DEFAULT NULL COMMENT '受払予定数',
  `NRSANSYOU` varchar(15) NOT NULL COMMENT '参照№',
  `TXAITESAKI` varchar(40) DEFAULT NULL COMMENT '相手先名',
  PRIMARY KEY (`NRTORIHIKIKANRI`),
  KEY `ET200_FK1` (`NRSYOHIN`,`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引管理№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `FT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FT010` (
  `NRHATTYU` varchar(7) NOT NULL,
  `DTHATTYU` date NOT NULL COMMENT '発注日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `NRJYUGYOIN` varchar(5) NOT NULL COMMENT '発注担当№',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '入荷予定倉庫№',
  `FGKAKUNIN` varchar(1) NOT NULL COMMENT '納期確認',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `DTKIBOUNOUKI` date NOT NULL COMMENT '希望納期初期値',
  `DTHAKKO` date DEFAULT NULL COMMENT '発注書発行日',
  `DTTORIKESHI` date DEFAULT NULL COMMENT '取消日',
  `STHATTYU` varchar(2) NOT NULL COMMENT '発注状況',
  PRIMARY KEY (`NRHATTYU`),
  KEY `FT010_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='発注№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `FT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FT011` (
  `NRHATTYU` varchar(7) NOT NULL COMMENT '発注№',
  `SQHATTYU` smallint(6) NOT NULL COMMENT '発注行',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '発注商品№',
  `PRHATTYU` decimal(10,2) NOT NULL COMMENT '発注単価',
  `QTHATTYU` int(11) NOT NULL COMMENT '発注数量',
  `DTKIBOUNOUKI` date NOT NULL COMMENT '希望納期',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `DTHAKKOU` date NOT NULL COMMENT '発効日',
  `QTHATTYUKANZAN` int(11) NOT NULL COMMENT '在庫換算数',
  PRIMARY KEY (`NRHATTYU`,`SQHATTYU`),
  KEY `FT011_FK2` (`NRSYOHIN`,`NRTORIHIKISAKI`,`DTHAKKOU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `FT012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FT012` (
  `NRHATTYU` varchar(7) NOT NULL COMMENT '発注№',
  `SQHATTYU` smallint(6) NOT NULL COMMENT '発注行',
  `SQNYUKA` smallint(6) NOT NULL COMMENT '入荷行',
  `DTYOTEINYUKA` date NOT NULL COMMENT '予定入荷日',
  `FGKAKUNIN` varchar(1) NOT NULL COMMENT '納期確認',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '入荷商品№',
  `QTYOTEISIIRE` int(11) NOT NULL COMMENT '仕入予定数',
  `QTJITSUSIIRE` int(11) DEFAULT NULL COMMENT '実際仕入数',
  `QTDEFECT` int(11) DEFAULT NULL COMMENT '不合格数',
  `PRSIIRE` decimal(10,2) NOT NULL COMMENT '仕入単価',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `NRLOCATION` varchar(5) DEFAULT NULL COMMENT '入庫ロケ№',
  `NRNYUKA` varchar(7) DEFAULT NULL COMMENT '入荷№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `NRSOUKO` varchar(5) DEFAULT NULL COMMENT '予定入荷倉庫№',
  `DTNYUKA` date DEFAULT NULL COMMENT '実際入荷日',
  `QTYOTEINYUKO` int(11) DEFAULT NULL COMMENT '入庫予定数',
  `QTJITSUNYUKO` int(11) DEFAULT NULL COMMENT '実際入庫数',
  `AMSIIREGAIKA` decimal(11,2) DEFAULT NULL COMMENT '外貨仕入額',
  `AMSIIRENAIKA` int(11) DEFAULT NULL COMMENT '内貨仕入額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  PRIMARY KEY (`NRHATTYU`,`SQHATTYU`,`SQNYUKA`),
  UNIQUE KEY `FT012_SK1` (`NRTORIHIKIKANRI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `FT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FT020` (
  `NRNYUKA` varchar(7) NOT NULL,
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `DTNYUKA` date NOT NULL COMMENT '入荷日',
  `DTSIIRE` date NOT NULL COMMENT '仕入計上日',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '入荷倉庫№',
  `STNYUKA` varchar(2) NOT NULL COMMENT '入荷状況',
  PRIMARY KEY (`NRNYUKA`),
  KEY `FT020_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入荷№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT010` (
  `NRJYUTYU` varchar(7) NOT NULL,
  `DTJYUTYU` date NOT NULL COMMENT '受注日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `SQSYUKKASAKI` smallint(6) NOT NULL COMMENT '出荷先行番',
  `TXTYUBAN` varchar(15) DEFAULT NULL COMMENT '顧客注文番号',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '出荷予定倉庫№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `DTTORIKESHI` date DEFAULT NULL COMMENT '取消日',
  `NRMITSUMORI` varchar(7) DEFAULT NULL COMMENT '見積№',
  `SQVERSION` smallint(6) DEFAULT NULL COMMENT '見積版№',
  `STJYUTYU` varchar(2) NOT NULL COMMENT '受注状況',
  PRIMARY KEY (`NRJYUTYU`),
  KEY `GT010_FK1` (`NRTORIHIKISAKI`,`SQSYUKKASAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受注№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT011` (
  `NRJYUTYU` varchar(7) NOT NULL COMMENT '受注№',
  `SQJYUTYU` smallint(6) NOT NULL COMMENT '受注行',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '受注商品№',
  `PRJYUTYU` int(11) NOT NULL COMMENT '受注単価',
  `QTJYUTYU` int(11) NOT NULL COMMENT '受注数量',
  `DTKIBOUNOUKI` date NOT NULL COMMENT '希望納期',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `QTSYUKKAZUMI` int(11) DEFAULT NULL COMMENT '出荷済数量',
  `QTSYUKKAZAN` int(11) DEFAULT NULL COMMENT '出荷残数量',
  PRIMARY KEY (`NRJYUTYU`,`SQJYUTYU`),
  KEY `GT011_FK2` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT012` (
  `NRJYUTYU` varchar(7) NOT NULL COMMENT '受注№',
  `SQJYUTYU` smallint(6) NOT NULL COMMENT '受注行',
  `SQSYUKKA` smallint(6) NOT NULL COMMENT '出荷行',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '出荷倉庫№',
  `DTYOTEISYUKKA` date NOT NULL COMMENT '予定出荷日',
  `QTYOTEISYUKKA` int(11) NOT NULL COMMENT '出荷指示数',
  `PRSYUKKO` int(11) DEFAULT NULL COMMENT '出庫単価',
  `PRSYUKKA` int(11) NOT NULL COMMENT '販売価格',
  `QTJITSUSYUKKA` int(11) DEFAULT NULL COMMENT '出荷実績数',
  `QTTORIKESHI` int(11) DEFAULT NULL COMMENT '出荷取消数',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `NRSYUKKA` varchar(7) DEFAULT NULL COMMENT '出荷№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  `TXBUNNOU` varchar(5) NOT NULL COMMENT '分納マーク',
  PRIMARY KEY (`NRJYUTYU`,`SQJYUTYU`,`SQSYUKKA`),
  UNIQUE KEY `GT012_SK1` (`NRTORIHIKIKANRI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT020` (
  `NRSYUKKA` varchar(7) NOT NULL,
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `SQSYUKKASAKI` smallint(6) NOT NULL COMMENT '出荷先行番',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '出荷倉庫№',
  `DTSYUKKA` date NOT NULL COMMENT '出荷日',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRSEIKYU` varchar(7) DEFAULT NULL COMMENT '都度請求№',
  `TMHAKKOU` datetime DEFAULT NULL COMMENT '発行日時',
  `TMKANRYO` datetime DEFAULT NULL COMMENT '完了日時',
  `STSYUKKA` varchar(2) NOT NULL COMMENT '状況区分',
  PRIMARY KEY (`NRSYUKKA`),
  UNIQUE KEY `GT020_SK1` (`NRSEIKYU`),
  KEY `GT020_FK1` (`NRTORIHIKISAKI`,`SQSYUKKASAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出荷№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT030` (
  `NRMITSUMORI` varchar(7) NOT NULL COMMENT '見積№',
  `SQVERSION` smallint(6) NOT NULL COMMENT '見積版№',
  `DTMITSUMORI` date NOT NULL COMMENT '見積日',
  `NRTORIHIKISAKI` varchar(8) DEFAULT NULL COMMENT '顧客№',
  `SQSYUKKASAKI` smallint(6) DEFAULT NULL COMMENT '出荷先行番',
  `TXKOKYAKUMEI` varchar(40) DEFAULT NULL COMMENT '未登録顧客名',
  `TXTYUBAN` varchar(15) DEFAULT NULL COMMENT '顧客注文番号',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRJYUTYU` varchar(7) DEFAULT NULL COMMENT '受注№',
  PRIMARY KEY (`NRMITSUMORI`,`SQVERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `GT031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GT031` (
  `NRMITSUMORI` varchar(7) NOT NULL COMMENT '見積№',
  `SQVERSION` smallint(6) NOT NULL COMMENT '見積版№',
  `SQMITSUMORI` smallint(6) NOT NULL COMMENT '見積行',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '見積商品№',
  `PRJYUTYU` int(11) NOT NULL COMMENT '見積単価',
  `QTJYUTYU` int(11) NOT NULL COMMENT '注文数量',
  `DTKIBOUNOUKI` date NOT NULL COMMENT '希望納期',
  PRIMARY KEY (`NRMITSUMORI`,`SQVERSION`,`SQMITSUMORI`),
  KEY `GT031_FK1` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `HT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HT010` (
  `NRSIIREHURIKAE` varchar(7) NOT NULL,
  `KBSIIREHURIKAE` varchar(2) NOT NULL COMMENT '振替区分',
  `DTTORIHIKI` date NOT NULL COMMENT '取引日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `AMTORIHIKI` int(11) NOT NULL COMMENT '税抜取引額',
  `TXTEKIYO` varchar(30) DEFAULT NULL COMMENT '振替摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  PRIMARY KEY (`NRSIIREHURIKAE`),
  UNIQUE KEY `HT010_SK1` (`NRTORIHIKIKANRI`),
  KEY `HT010_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入振替№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `HT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HT020` (
  `NRTOKUSYUSIIRE` varchar(7) NOT NULL,
  `KBTOKUSYUSIIRE` varchar(2) NOT NULL COMMENT '取引区分',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `DTTORIHIKI` date NOT NULL COMMENT '取引日',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '商品№',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '取引倉庫№',
  `NRLOCATION` varchar(5) NOT NULL COMMENT 'ロケ№',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `PRTORIHIKI` decimal(10,2) NOT NULL COMMENT '取引単価',
  `QTTORIHIKI` int(11) NOT NULL COMMENT '取引数量',
  `KBTORIHIKIUM` varchar(5) NOT NULL COMMENT '取引単位区分',
  `PRUKEBARAI` int(11) DEFAULT NULL COMMENT '受払単価',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `QTTORIHIKITAN` int(11) NOT NULL COMMENT '在庫単位換算数',
  `AMTORIHIKI` decimal(10,2) DEFAULT NULL COMMENT '税抜取引額',
  `AMTORIHIKINAIKA` int(11) DEFAULT NULL COMMENT '内貨税抜取引額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  `DTHAKKOU` date NOT NULL COMMENT '発効日',
  PRIMARY KEY (`NRTOKUSYUSIIRE`),
  UNIQUE KEY `HT020_SK1` (`NRTORIHIKIKANRI`),
  KEY `HT020_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特殊仕入№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `JT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JT010` (
  `NRURIAGEHURIKAE` varchar(7) NOT NULL,
  `KBURIAGEHURIKAE` varchar(2) NOT NULL COMMENT '振替区分',
  `DTTORIHIKI` date NOT NULL COMMENT '取引日',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `AMTORIHIKI` decimal(10,2) NOT NULL COMMENT '税抜取引額',
  `TXTEKIYO` varchar(30) NOT NULL COMMENT '振替摘要',
  `NRSEIKYU` varchar(7) NOT NULL COMMENT '都度請求№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `AMTAX` int(11) NOT NULL COMMENT '消費税額',
  PRIMARY KEY (`NRURIAGEHURIKAE`),
  UNIQUE KEY `JT010_SK1` (`NRTORIHIKIKANRI`),
  KEY `JT010_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売上振替№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `JT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JT020` (
  `NRTOKUSYUURIAGE` varchar(7) NOT NULL,
  `KBTOKUSYUURIAGE` varchar(2) NOT NULL COMMENT '取引区分',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `SQSYUKKASAKI` smallint(6) NOT NULL COMMENT '出荷先行番',
  `DTTORIHIKI` date NOT NULL COMMENT '取引日',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '商品№',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '取引倉庫№',
  `NRLOCATION` varchar(5) NOT NULL COMMENT '入庫ロケ№',
  `PRTORIHIKI` int(11) NOT NULL COMMENT '取引単価',
  `QTTORIHIKI` int(11) NOT NULL COMMENT '取引数量',
  `PRUKEBARAI` int(11) DEFAULT NULL COMMENT '受払単価',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRSEIKYU` varchar(7) DEFAULT NULL COMMENT '都度請求№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `AMTORIHIKI` int(11) DEFAULT NULL COMMENT '税抜取引額',
  `AMTAX` int(11) DEFAULT NULL COMMENT '消費税額',
  PRIMARY KEY (`NRTOKUSYUURIAGE`),
  UNIQUE KEY `JT020_SK1` (`NRTORIHIKIKANRI`),
  KEY `JT020_FK1` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特殊売上№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `KT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KT010` (
  `NRTANAOROSHI` varchar(7) NOT NULL,
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRLOCATION` varchar(5) DEFAULT NULL COMMENT 'ロケ№',
  `DTKIJYUN` datetime DEFAULT NULL COMMENT '調査基準日時',
  `DTKOUSHIN` datetime DEFAULT NULL COMMENT '確定更新日時',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `STTANAOROSHI` varchar(2) NOT NULL COMMENT '処理状況',
  PRIMARY KEY (`NRTANAOROSHI`),
  UNIQUE KEY `KT010_SK1` (`NRTORIHIKIKANRI`),
  KEY `KT010_FK1` (`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='棚卸№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `KT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KT011` (
  `NRTANAOROSHI` varchar(7) NOT NULL COMMENT '棚卸№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '商品№',
  `NRLOCATION` varchar(5) NOT NULL COMMENT 'ロケ№',
  `PRUKEBARAI` int(11) DEFAULT NULL COMMENT '受払単価',
  `QTTYOUBO` int(11) DEFAULT NULL COMMENT '帳簿在庫数量',
  `QTJITSUTANA` int(11) DEFAULT NULL COMMENT '実棚数量',
  `QTSASUU` int(11) DEFAULT NULL COMMENT '実棚差数',
  `AMSAGAKU` int(11) DEFAULT NULL COMMENT '実棚差額',
  PRIMARY KEY (`NRTANAOROSHI`,`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `KT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KT020` (
  `NRZAIKOIDOU` varchar(7) NOT NULL,
  `DTSHIJI` date NOT NULL COMMENT '指示日',
  `NRSOUKOFROM` varchar(5) NOT NULL COMMENT '元倉庫№',
  `NRSOUKOTO` varchar(5) NOT NULL COMMENT '先倉庫№',
  `DTKANRYOYOTEI` date NOT NULL COMMENT '完了予定日',
  `TMHAKKOU` datetime DEFAULT NULL COMMENT '発行日時',
  `TMKANRYO` datetime DEFAULT NULL COMMENT '完了日時',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `STZAIKOIDOU` varchar(2) NOT NULL COMMENT '状況区分',
  PRIMARY KEY (`NRZAIKOIDOU`),
  UNIQUE KEY `KT020_SK1` (`NRTORIHIKIKANRI`),
  KEY `KT020_FK1` (`NRSOUKOFROM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移動指示№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `KT021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KT021` (
  `NRZAIKOIDOU` varchar(7) NOT NULL COMMENT '移動指示№',
  `SQZAIKOIDOU` smallint(6) NOT NULL COMMENT '指示行',
  `NRLOCATIONTO` varchar(5) DEFAULT NULL COMMENT '先ロケ№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '商品№',
  `QTIDOU` int(11) NOT NULL COMMENT '移動数量',
  `PRIDOU` int(11) DEFAULT NULL COMMENT '取引単価',
  `NRTORIHIKIKANRIFROM` varchar(7) NOT NULL COMMENT '出庫管理№',
  `NRTORIHIKIKANRITO` varchar(7) NOT NULL COMMENT '入庫管理№',
  PRIMARY KEY (`NRZAIKOIDOU`,`SQZAIKOIDOU`),
  UNIQUE KEY `KT021_SK1` (`NRTORIHIKIKANRIFROM`),
  UNIQUE KEY `KT021_SK2` (`NRTORIHIKIKANRITO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `KT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KT030` (
  `NRZAIKOHURIKAE` varchar(7) NOT NULL,
  `KBZAIKOHURIKAE` varchar(2) NOT NULL COMMENT '振替区分',
  `DTHURIKAE` date NOT NULL COMMENT '振替日',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `NRLOCATION` varchar(5) NOT NULL COMMENT 'ロケ№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `QTHURIKAE` int(11) DEFAULT NULL COMMENT '振替数量',
  `AMHURIKAE` int(11) DEFAULT NULL COMMENT '振替金額',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  PRIMARY KEY (`NRZAIKOHURIKAE`),
  UNIQUE KEY `KT030_SK1` (`NRTORIHIKIKANRI`),
  KEY `KT030_FK1` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在庫振替№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `LT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LT010` (
  `NRSET` varchar(7) NOT NULL,
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `DTYOTEI` date NOT NULL COMMENT '作業予定日',
  `TMHAKKOU` datetime DEFAULT NULL COMMENT '発行日時',
  `TMJISSEKI` datetime DEFAULT NULL COMMENT '実際完了日時',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT 'セット品内部商品№',
  `QTSHIJI` int(11) NOT NULL COMMENT '予定セット数',
  `QTJISSEKI` int(11) DEFAULT NULL COMMENT '実績セット数',
  `AMJISSEKI` int(11) DEFAULT NULL COMMENT '実績取引額',
  `NRLOCATION` varchar(5) DEFAULT NULL COMMENT 'ロケ№',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `TXTEKIYO` varchar(300) DEFAULT NULL COMMENT '摘要',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `STSET` varchar(2) NOT NULL COMMENT '指示状況',
  PRIMARY KEY (`NRSET`),
  UNIQUE KEY `LT010_SK1` (`NRTORIHIKIKANRI`),
  KEY `LT010_FK1` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='セット指示№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `LT011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LT011` (
  `NRSET` varchar(7) NOT NULL COMMENT 'セット指示№',
  `SQKOUSEI` smallint(6) NOT NULL COMMENT '構成行',
  `NRCHILD` varchar(7) NOT NULL COMMENT '構成品内部商品№',
  `QTSHIJI` int(11) DEFAULT NULL COMMENT '予定取引数',
  `QTJISSEKI` int(11) DEFAULT NULL COMMENT '実績取引数',
  `PRTORIHIKI` int(11) DEFAULT NULL COMMENT '取引単価',
  `NRLOCATION` varchar(5) DEFAULT NULL COMMENT 'ロケ№',
  `TXLOTNUMBER` varchar(40) DEFAULT NULL COMMENT 'ロット№',
  `NRTORIHIKIKANRI` varchar(7) NOT NULL COMMENT '取引管理№',
  `AMJISSEKI` int(11) DEFAULT NULL COMMENT '実績取引額',
  PRIMARY KEY (`NRSET`,`SQKOUSEI`),
  UNIQUE KEY `LT011_SK1` (`NRTORIHIKIKANRI`),
  KEY `LT011_FK2` (`NRCHILD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT010` (
  `DTNEND` smallint(6) NOT NULL,
  `AMURIKISYUZAN` bigint(20) DEFAULT NULL COMMENT '期首売掛残高',
  `AMURISYUK` bigint(20) DEFAULT NULL COMMENT '期間出荷売上額',
  `AMURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上',
  `AMURIHENPIN` bigint(20) DEFAULT NULL COMMENT '期間出荷返品額',
  `AMURIZATSUEKI` bigint(20) DEFAULT NULL COMMENT '期間雑益売上額',
  `AMURIZATSUSON` bigint(20) DEFAULT NULL COMMENT '期間雑損振替額',
  `AMURISOUSAI` bigint(20) DEFAULT NULL COMMENT '期間売上相殺額',
  `AMURINEBIKI` bigint(20) DEFAULT NULL COMMENT '期間営業値引額',
  `AMURIHANHURI` bigint(20) DEFAULT NULL COMMENT '期間販売費振替',
  `AMURIJYURYO` bigint(20) DEFAULT NULL COMMENT '期間売上受領額',
  `AMURIGENKA` bigint(20) DEFAULT NULL COMMENT '期間売上原価',
  `AMURITAX` bigint(20) DEFAULT NULL COMMENT '期間売上消費税',
  `AMKAIKISYUZAN` bigint(20) DEFAULT NULL COMMENT '期首買掛残高',
  `AMKAINYUK` bigint(20) DEFAULT NULL COMMENT '期間入荷仕入額',
  `AMKAITYOK` bigint(20) DEFAULT NULL COMMENT '期間直入荷仕入',
  `AMKAIHENPIN` bigint(20) DEFAULT NULL COMMENT '期間入荷返品額',
  `AMKAIZATSUEKI` bigint(20) DEFAULT NULL COMMENT '期間雑益振替額',
  `AMKAIZATSUSON` bigint(20) DEFAULT NULL COMMENT '期間雑損仕入額',
  `AMKAISOUSAI` bigint(20) DEFAULT NULL COMMENT '期間仕入相殺額',
  `AMKAIGENKA` bigint(20) DEFAULT NULL COMMENT '期間原価振替額',
  `AMKAISIHARAI` bigint(20) DEFAULT NULL COMMENT '期間仕入支払額',
  `AMKAITAX` bigint(20) DEFAULT NULL COMMENT '期間仕入消費税',
  `AMZAIKISYUZAN` bigint(20) DEFAULT NULL COMMENT '期首在庫残高',
  `AMZAINYUK` bigint(20) DEFAULT NULL COMMENT '期間仕入入庫額',
  `AMZAINYUKHEN` bigint(20) DEFAULT NULL COMMENT '期間仕入返品額',
  `AMZAISYUK` bigint(20) DEFAULT NULL COMMENT '期間売上出庫額',
  `AMZAISYUKHEN` bigint(20) DEFAULT NULL COMMENT '期間売上返品額',
  `AMZAIIDOU` bigint(20) DEFAULT NULL COMMENT '期間移動額',
  `AMZAIGENMOU` bigint(20) DEFAULT NULL COMMENT '期間減耗額',
  `AMZAIHYOKAZON` bigint(20) DEFAULT NULL COMMENT '期間評価損額',
  `AMZAIHYOKAEKI` bigint(20) DEFAULT NULL COMMENT '期間評価益額',
  `AMZAISIKAKARI` bigint(20) DEFAULT NULL COMMENT '期間仕掛出庫額',
  `AMZAIZATSUSON` bigint(20) DEFAULT NULL COMMENT '期間雑損額',
  `AMZAIZATSUEKI` bigint(20) DEFAULT NULL COMMENT '期間雑益額',
  `AMZAIKANSEI` bigint(20) DEFAULT NULL COMMENT '期間完成入庫額',
  `AMZAIKAKOUHI` bigint(20) DEFAULT NULL COMMENT '期間加工費繰入',
  `AMZAIZOUGEN` bigint(20) DEFAULT NULL COMMENT '期間棚増減額',
  `AMURIARARI` bigint(20) DEFAULT NULL COMMENT '期間粗利額',
  `AMURIMATSUZAN` bigint(20) DEFAULT NULL COMMENT '期末売掛残高',
  `AMKAIMATSUZAN` bigint(20) DEFAULT NULL COMMENT '期末買掛残高',
  `AMZAIKIMATSUZAN` bigint(20) DEFAULT NULL COMMENT '期末在庫残高',
  PRIMARY KEY (`DTNEND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年度';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT020` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `AMURIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首売掛残高',
  `AMURISYUK` int(11) DEFAULT NULL COMMENT '期間出荷売上額',
  `AMURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上',
  `AMURIHENPIN` int(11) DEFAULT NULL COMMENT '期間出荷返品額',
  `AMURIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益売上額',
  `AMURIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損振替額',
  `AMURISOUSAI` int(11) DEFAULT NULL COMMENT '期間売上相殺額',
  `AMURINEBIKI` int(11) DEFAULT NULL COMMENT '期間営業値引額',
  `AMURIHANHURI` int(11) DEFAULT NULL COMMENT '期間販売費振替',
  `AMURIJYURYO` int(11) DEFAULT NULL COMMENT '期間売上受領額',
  `AMURIGENKA` int(11) DEFAULT NULL COMMENT '期間売上原価',
  `AMURITAX` int(11) DEFAULT NULL COMMENT '期間売上消費税',
  `AMKAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首買掛残高',
  `AMKAINYUK` int(11) DEFAULT NULL COMMENT '期間入荷仕入額',
  `AMKAITYOK` int(11) DEFAULT NULL COMMENT '期間直入荷仕入',
  `AMKAIHENPIN` int(11) DEFAULT NULL COMMENT '期間入荷返品額',
  `AMKAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益振替額',
  `AMKAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損仕入額',
  `AMKAISOUSAI` int(11) DEFAULT NULL COMMENT '期間仕入相殺額',
  `AMKAIGENKA` int(11) DEFAULT NULL COMMENT '期間原価振替額',
  `AMKAISIHARAI` int(11) DEFAULT NULL COMMENT '期間仕入支払額',
  `AMKAITAX` int(11) DEFAULT NULL COMMENT '期間仕入消費税',
  `AMZAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首在庫残高',
  `AMZAINYUK` int(11) DEFAULT NULL COMMENT '期間仕入入庫額',
  `AMZAINYUKHEN` int(11) DEFAULT NULL COMMENT '期間仕入返品額',
  `AMZAISYUK` int(11) DEFAULT NULL COMMENT '期間売上出庫額',
  `AMZAISYUKHEN` int(11) DEFAULT NULL COMMENT '期間売上返品額',
  `AMZAIIDOU` int(11) DEFAULT NULL COMMENT '期間移動額',
  `AMZAIGENMOU` int(11) DEFAULT NULL COMMENT '期間減耗額',
  `AMZAIHYOKAZON` int(11) DEFAULT NULL COMMENT '期間評価損額',
  `AMZAIHYOKAEKI` int(11) DEFAULT NULL COMMENT '期間評価益額',
  `AMZAISIKAKARI` int(11) DEFAULT NULL COMMENT '期間仕掛出庫額',
  `AMZAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損額',
  `AMZAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益額',
  `AMZAIKANSEI` int(11) DEFAULT NULL COMMENT '期間完成入庫額',
  `AMZAIKAKOUHI` int(11) DEFAULT NULL COMMENT '期間加工費繰入',
  `AMZAIZOUGEN` int(11) DEFAULT NULL COMMENT '期間棚増減額',
  `AMURIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  `AMURIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末売掛残高',
  `AMKAIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末買掛残高',
  `AMZAIKIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末在庫残高',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT030` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `AMZAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首在庫残高',
  `QTZAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首在庫残数',
  `AMZAINYUK` int(11) DEFAULT NULL COMMENT '期間仕入入庫額',
  `QTZAINYUK` int(11) DEFAULT NULL COMMENT '期間仕入入庫数',
  `AMZAINYUKHEN` int(11) DEFAULT NULL COMMENT '期間仕入返品額',
  `QTZAINYUKHEN` int(11) DEFAULT NULL COMMENT '期間仕入返品数',
  `AMZAISYUK` int(11) DEFAULT NULL COMMENT '期間売上出庫額',
  `QTZAISYUK` int(11) DEFAULT NULL COMMENT '期間売上出庫数',
  `AMZAISYUKHEN` int(11) DEFAULT NULL COMMENT '期間売上返品額',
  `QTZAISYUKHEN` int(11) DEFAULT NULL COMMENT '期間売上返品数',
  `AMZAIIDOU` int(11) DEFAULT NULL COMMENT '期間移動額',
  `QTZAIIDOU` int(11) DEFAULT NULL COMMENT '期間移動数',
  `AMZAIGENMOU` int(11) DEFAULT NULL COMMENT '期間減耗額',
  `QTZAIGENMOU` int(11) DEFAULT NULL COMMENT '期間減耗数',
  `AMZAIHYOKAZON` int(11) DEFAULT NULL COMMENT '期間評価損額',
  `AMZAIHYOKAEKI` int(11) DEFAULT NULL COMMENT '期間評価益額',
  `AMZAISIKAKARI` int(11) DEFAULT NULL COMMENT '期間仕掛出庫額',
  `QTZAISIKAKARI` int(11) DEFAULT NULL COMMENT '期間仕掛出庫数',
  `AMZAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損額',
  `QTZAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損数',
  `AMZAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益額',
  `QTZAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益数',
  `AMZAIKANSEI` int(11) DEFAULT NULL COMMENT '期間完成入庫額',
  `QTZAIKANSEI` int(11) DEFAULT NULL COMMENT '期間完成入庫数',
  `AMZAIKAKOUHI` int(11) DEFAULT NULL COMMENT '期間加工費繰入',
  `AMZAIZOUGEN` int(11) DEFAULT NULL COMMENT '期間棚増減額',
  `QTZAIZOUGEN` int(11) DEFAULT NULL COMMENT '期間棚増減数',
  `AMZAIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  `AMZAIKIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末在庫残高',
  `QTZAIKIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末在庫残数',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRSYOHIN`),
  KEY `YT030_FK1` (`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT031` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `NRSOUKO` varchar(5) NOT NULL COMMENT '倉庫№',
  `AMZAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首在庫残高',
  `QTZAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首在庫残数',
  `AMZAINYUK` int(11) DEFAULT NULL COMMENT '期間仕入入庫額',
  `QTZAINYUK` int(11) DEFAULT NULL COMMENT '期間仕入入庫数',
  `AMZAINYUKHEN` int(11) DEFAULT NULL COMMENT '期間仕入返品額',
  `QTZAINYUKHEN` int(11) DEFAULT NULL COMMENT '期間仕入返品数',
  `AMZAISYUK` int(11) DEFAULT NULL COMMENT '期間売上出庫額',
  `QTZAISYUK` int(11) DEFAULT NULL COMMENT '期間売上出庫数',
  `AMZAISYUKHEN` int(11) DEFAULT NULL COMMENT '期間売上返品額',
  `QTZAISYUKHEN` int(11) DEFAULT NULL COMMENT '期間売上返品数',
  `AMZAIIDOU` int(11) DEFAULT NULL COMMENT '期間移動額',
  `QTZAIIDOU` int(11) DEFAULT NULL COMMENT '期間移動数',
  `AMZAIGENMOU` int(11) DEFAULT NULL COMMENT '期間減耗額',
  `QTZAIGENMOU` int(11) DEFAULT NULL COMMENT '期間減耗数',
  `AMZAIHYOKAZON` int(11) DEFAULT NULL COMMENT '期間評価損額',
  `AMZAIHYOKAEKI` int(11) DEFAULT NULL COMMENT '期間評価益額',
  `AMZAISIKAKARI` int(11) DEFAULT NULL COMMENT '期間仕掛出庫額',
  `QTZAISIKAKARI` int(11) DEFAULT NULL COMMENT '期間仕掛出庫数',
  `AMZAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損額',
  `QTZAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損数',
  `AMZAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益額',
  `QTZAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益数',
  `AMZAIKANSEI` int(11) DEFAULT NULL COMMENT '期間完成入庫額',
  `QTZAIKANSEI` int(11) DEFAULT NULL COMMENT '期間完成入庫数',
  `AMZAIKAKOUHI` int(11) DEFAULT NULL COMMENT '期間加工費繰入',
  `AMZAIZOUGEN` int(11) DEFAULT NULL COMMENT '期間棚増減額',
  `QTZAIZOUGEN` int(11) DEFAULT NULL COMMENT '期間棚増減数',
  `AMZAIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  `AMZAIKIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末在庫残高',
  `QTZAIKIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末在庫残数',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRSYOHIN`,`NRSOUKO`),
  KEY `YT031_FK2` (`NRSYOHIN`,`NRSOUKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT040`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT040` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `AMKAIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首買掛残高',
  `AMKAINYUK` int(11) DEFAULT NULL COMMENT '期間入荷仕入額',
  `AMKAITYOK` int(11) DEFAULT NULL COMMENT '期間直入荷仕入',
  `AMKAIHENPIN` int(11) DEFAULT NULL COMMENT '期間入荷返品額',
  `AMKAIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益振替額',
  `AMKAIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損仕入額',
  `AMKAISOUSAI` int(11) DEFAULT NULL COMMENT '期間仕入相殺額',
  `AMKAIGENKA` int(11) DEFAULT NULL COMMENT '期間原価振替額',
  `AMKAISIHARAI` int(11) DEFAULT NULL COMMENT '期間支払額',
  `AMKAITAX` int(11) DEFAULT NULL COMMENT '期間消費税',
  `AMKAIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末買掛残高',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRTORIHIKISAKI`),
  KEY `YT040_FK2` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT041`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT041` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '仕入先№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `AMKAINYUK` int(11) DEFAULT NULL COMMENT '期間入荷仕入額',
  `QTKAINYUK` int(11) DEFAULT NULL COMMENT '期間入荷仕入数',
  `AMKAITYOK` int(11) DEFAULT NULL COMMENT '期間直入荷仕入額',
  `QTKAITYOK` int(11) DEFAULT NULL COMMENT '期間直入荷仕入数',
  `AMKAIHENPIN` int(11) DEFAULT NULL COMMENT '期間入荷返品額',
  `QTKAIHENPIN` int(11) DEFAULT NULL COMMENT '期間入荷返品数',
  `AMKAIGENKA` int(11) DEFAULT NULL COMMENT '期間原価振替額',
  `AMKAITAX` int(11) DEFAULT NULL COMMENT '期間仕入消費税',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRTORIHIKISAKI`,`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT050`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT050` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `AMURIKISYUZAN` int(11) DEFAULT NULL COMMENT '期首売掛残高',
  `AMURISYUK` int(11) DEFAULT NULL COMMENT '期間出荷売上額',
  `AMURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上',
  `AMURIHENPIN` int(11) DEFAULT NULL COMMENT '期間出荷返品額',
  `AMURIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益売上額',
  `AMURIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損振替額',
  `AMURISOUSAI` int(11) DEFAULT NULL COMMENT '期間売上相殺額',
  `AMURINEBIKI` int(11) DEFAULT NULL COMMENT '期間営業値引額',
  `AMURIHANHURI` int(11) DEFAULT NULL COMMENT '期間販売費振替',
  `AMURIJYURYO` int(11) DEFAULT NULL COMMENT '期間受領額',
  `AMURIGENKA` int(11) DEFAULT NULL COMMENT '期間売上原価',
  `AMURITAX` int(11) DEFAULT NULL COMMENT '期間消費税',
  `AMURIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  `AMURIMATSUZAN` int(11) DEFAULT NULL COMMENT '期末売掛残高',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRTORIHIKISAKI`),
  KEY `YT050_FK2` (`NRTORIHIKISAKI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT051`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT051` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRTORIHIKISAKI` varchar(8) NOT NULL COMMENT '顧客№',
  `NRSYOHIN` varchar(7) NOT NULL COMMENT '内部商品№',
  `AMURISYUK` int(11) DEFAULT NULL COMMENT '期間出荷売上額',
  `QTURISYUK` int(11) DEFAULT NULL COMMENT '期間出荷売上数',
  `AMURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上額',
  `QTURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上数',
  `AMURIHENPIN` int(11) DEFAULT NULL COMMENT '期間出荷返品額',
  `QTURIHENPIN` int(11) DEFAULT NULL COMMENT '期間出荷返品数',
  `AMURINEBIKI` int(11) DEFAULT NULL COMMENT '期間営業値引額',
  `AMURIHANHURI` int(11) DEFAULT NULL COMMENT '期間販売費振替',
  `AMURIGENKA` int(11) DEFAULT NULL COMMENT '期間売上原価',
  `AMURITAX` int(11) DEFAULT NULL COMMENT '期間売上消費税',
  `AMURIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRTORIHIKISAKI`,`NRSYOHIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `YT060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `YT060` (
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月序',
  `NRTANTOUJYUGYOIN` varchar(5) NOT NULL COMMENT '担当営業№',
  `AMURISYUK` int(11) DEFAULT NULL COMMENT '期間出荷売上額',
  `AMURITYOK` int(11) DEFAULT NULL COMMENT '期間直出荷売上',
  `AMURIHENPIN` int(11) DEFAULT NULL COMMENT '期間出荷返品額',
  `AMURIZATSUEKI` int(11) DEFAULT NULL COMMENT '期間雑益売上額',
  `AMURIZATSUSON` int(11) DEFAULT NULL COMMENT '期間雑損振替額',
  `AMURINEBIKI` int(11) DEFAULT NULL COMMENT '期間営業値引額',
  `AMURIHANHURI` int(11) DEFAULT NULL COMMENT '期間販売費振替',
  `AMURIGENKA` int(11) DEFAULT NULL COMMENT '期間売上原価',
  `AMURITAX` int(11) DEFAULT NULL COMMENT '期間売上消費税',
  `AMURIARARI` int(11) DEFAULT NULL COMMENT '期間粗利額',
  PRIMARY KEY (`DTNEND`,`DTMSEQ`,`NRTANTOUJYUGYOIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT010` (
  `IDVARIANT` varchar(20) NOT NULL,
  `TXNAME` varchar(10) NOT NULL COMMENT '変数名',
  `TXTYPE` varchar(10) NOT NULL COMMENT '変数値タイプ',
  `TXVALUE` varchar(100) NOT NULL COMMENT '変数値',
  `TXREMARKS` varchar(300) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`IDVARIANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='変数ＩＤ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT020` (
  `IDUSER` varchar(5) NOT NULL,
  `TXNAME` varchar(30) NOT NULL COMMENT '漢字名',
  `TXPASSWORD` varchar(50) NOT NULL COMMENT 'パスワード',
  `DTVALID` date NOT NULL COMMENT '発効日',
  `DTEXPIRE` date DEFAULT NULL COMMENT '失効日',
  `TXEMAIL` varchar(40) DEFAULT NULL COMMENT 'メールアドレス',
  `TXMENUS` varchar(30) NOT NULL COMMENT '利用可能メニュー',
  `NREMPLOYEE` varchar(5) DEFAULT NULL COMMENT '従業員№',
  PRIMARY KEY (`IDUSER`),
  KEY `ZT020_FK1` (`NREMPLOYEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザＩＤ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT030` (
  `IDNUMBER` varchar(20) NOT NULL,
  `TXPREFIX` varchar(4) DEFAULT NULL COMMENT '冒頭文字',
  `NRNUMDIGIT` smallint(6) NOT NULL COMMENT '数字桁数',
  `NRCURRENT` int(11) DEFAULT NULL COMMENT '番号現在値',
  `FGWITHCD` varchar(1) NOT NULL COMMENT 'ＣＤ付加フラグ',
  PRIMARY KEY (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='番号ＩＤ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT040`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT040` (
  `IDUSERKUBUN` varchar(20) NOT NULL COMMENT 'ユーザ区分ＩＤ',
  `KBUSERKUBUN` varchar(2) NOT NULL COMMENT 'ユーザ区分値',
  `TXUSERKUBUN` varchar(20) NOT NULL COMMENT '区分値摘要',
  `SQLIST` smallint(6) NOT NULL COMMENT '一覧順序',
  PRIMARY KEY (`IDUSERKUBUN`,`KBUSERKUBUN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT050`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT050` (
  `NRSESSION` varchar(7) NOT NULL,
  `DTLOGIN` datetime NOT NULL COMMENT 'ログイン日時',
  `DTLOGOUT` datetime DEFAULT NULL COMMENT 'ログアウト日時',
  `IDUSER` varchar(5) NOT NULL COMMENT 'ユーザＩＤ',
  `TXIPADDRESS` varchar(20) NOT NULL COMMENT 'IPアドレス',
  `VLVERSION` varchar(10) NOT NULL COMMENT '処理系バージョン',
  `KBSESSIONSTATUS` varchar(2) DEFAULT NULL COMMENT '終了状態コード',
  PRIMARY KEY (`NRSESSION`),
  KEY `ZT050_FK1` (`IDUSER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='セッション№';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT051`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT051` (
  `NRSESSION` varchar(7) NOT NULL COMMENT 'セッション№',
  `SQPROGRAM` smallint(6) NOT NULL COMMENT 'PGM行番',
  `IDMENU` varchar(2) NOT NULL COMMENT 'メニュー区分',
  `IDPROGRAM` varchar(10) NOT NULL COMMENT 'プログラムＩＤ',
  `TXPROGRAM` varchar(30) NOT NULL COMMENT '（プログラム名）',
  `DTSTART` datetime NOT NULL COMMENT '利用開始日時',
  `DTEND` datetime DEFAULT NULL COMMENT '利用終了日時',
  `KBPROGRAMSTATUS` varchar(2) DEFAULT NULL COMMENT '終了状態コード',
  `TXERRORLOG` varchar(300) DEFAULT NULL COMMENT 'エラーログ',
  PRIMARY KEY (`NRSESSION`,`SQPROGRAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT060`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT060` (
  `DTSTART` date NOT NULL,
  `VLTAXRATE` decimal(3,0) NOT NULL COMMENT '消費税率',
  PRIMARY KEY (`DTSTART`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='税率開始日';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT070`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT070` (
  `KBCALENDAR` varchar(2) NOT NULL COMMENT 'カレンダー区分',
  `DTOFF` date NOT NULL COMMENT '休日日付',
  `TXOFF` varchar(20) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`KBCALENDAR`,`DTOFF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT080`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT080` (
  `KBCURRENCY` varchar(3) NOT NULL COMMENT '通貨区分',
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `VLRATEB` float NOT NULL COMMENT 'ＴＴＢレート',
  `VLRATEM` float NOT NULL COMMENT 'ＴＴＭレート',
  `VLRATES` float NOT NULL COMMENT 'ＴＴＳレート',
  PRIMARY KEY (`KBCURRENCY`,`DTNEND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ZT081`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ZT081` (
  `KBCURRENCY` varchar(3) NOT NULL COMMENT '通貨区分',
  `DTNEND` smallint(6) NOT NULL COMMENT '年度',
  `DTMSEQ` smallint(6) NOT NULL COMMENT '月度',
  `VLRATEB` float NOT NULL COMMENT 'ＴＴＢレート',
  `VLRATEM` float NOT NULL COMMENT 'ＴＴＭレート',
  `VLRATES` float NOT NULL COMMENT 'ＴＴＳレート',
  PRIMARY KEY (`KBCURRENCY`,`DTNEND`,`DTMSEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



