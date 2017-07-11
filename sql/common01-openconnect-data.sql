use openconnect;
drop table if exists site;
create table site(
site_id int primary key not null auto_increment comment 'サイトID',
site_name varchar(100) not null comment 'サイト名',
site_url varchar(255) not null unique comment 'サイトURL',
site_article text comment 'サイト記事',
genre varchar(50) comment 'ジャンル',
picture varchar(255) comment '画像',
banner varchar(80) comment 'バナー',
year int comment '作成年度'
) comment='サイト情報格納テーブル';
insert into site(site_id,site_name,site_url,picture,year)
values
(  1,'BOOK MANAGER 1409','http://www.internousdev.com/bookmanager09/','bookmanager1409.png',2014),
(  2,'EC 1410','http://www.internousdev.com/ec10/','ec1410.png',2014),
(  3,'ATTENDANCE','http://www.internousdev.com/attendance/','attendance.png',2014),
(  4,'CHIKEZON','http://www.internousdev.com/chikezon/','chikezon.png',2014),
(  5,'ODEN','http://www.internousdev.com/oden/','oden.png',2015),
(  6,'SAKATIKE','http://www.internousdev.com/sakatike/','sakatike.png',2015),
(  7,'UESTO','http://www.inernousdev.com/uesto/','uesto.png',2015),
(  8,'TOURTIKE','http://www.internousdev.com/tourtike/','tourtike.png',2015),
(  9,'SOLARE','http://www.internousdev.com/solare/','solare.png',2015),
( 10,'WORLD TRAVEL','http://www.internousdev.com/worldtravel/','worldtravel.png',2015),
( 11,'YOU JUST JEWELRY','http://www.internousdev.com/youjustjewelry','youjustjewelry.png',2015),
( 12,'LA-POUPEE','http://www.internousdev.com/la-poupee/','la-poupee.png',2015),
( 13,'UCYCLE','http://www.internousdev.com/ucycle/','ucycle.png',2015),
( 14,'BASEBALL TICKET','http://www.internousdev.com/baseballticket','baseballticket.png',2015),
( 15,'ICHIGO ICHIE','http://www.internousdev.com/ichigoichie/','ichigoichie.png',2015),
( 16,'LIVE TICKETS','http://www.internousdev.com/livetickets/','livetickets.png',2015),
( 17,'TBOX','http://www.internousdev.com/tbox/','tbox.png',2015),
( 18,'G-TICKETS','http://www.internousdev.com/g-tickets/','g-tickets.png',2015),
( 19,'MUSICAL','http://www.internousdev.com/musical/','musical.png',2015),
( 20,'BIG GALAXY','http://www.internousdev.com/biggalaxy/','biggalaxy.png',2015),
( 21,'K-HOME','http://www.internousdev.com/k-home/','k-home.png',2015),
( 22,'AQUQRIUM','http://www.internousdev.com/aquqrium/','aquqrium.png',2015),
( 23,'LEREVE','http://www.internousdev.com/lereve/','lereve.png',2015),
( 24,'SHIZUKU','http://www.internousdev.com/shizuku/','shizuku.png',2015),
( 25,'FOOT PRINTER','http://www.internousdev.com/footprinter/','footprinter.png',2015),
( 26,'UKIUKI UTOPIA','http://www.internousdev.com/ukiukiutopia/','ukiukiutopia.png',2015),
( 27,'PIZZA SEIJIN','http://www.internousdev.com/pizzaseijin/','pizzaseijin.png',2015),
( 28,'CHOCO TIME','http://www.internousdev.com/chokotime/','chokotime.png',2015),
( 29,'CINEMA JAPAN','http://www.internousdev.com/cinemajapan/','cinemajapan.png',2015),
( 30,'KINNOSAWA','http://www.internousdev.com/kinnosawa/','kinnosawa.png',2015),
( 31,'RAKURAKU','http://www.internousdev.com/rakuraku/','rakuraku.png',2015),
( 32,'KURUYAMA','http://www.internousdev.com/kuruyama/','kuruyama.png',2016),
( 33,'MACKEY PARK','http://www.internousdev.com/mackeypark/','mackeypark.png',2016),
( 34,'GEKIDAN ROADSHOW','http://www.internousdev.com/gekidanroadshow/','gekidanroadshow.png',2016),
( 35,'GPS COFFEE','http://www.internousdev.com/gpscoffee/','gpscoffee.png',2016),
( 36,'MIRA-MODE','http://www.internousdev.com/mira-mode/','mira-mode.png',2016),
( 37,'REWRITE','http://www.internousdev.com/rewrite/','rewrite.png',2016),
( 38,'SAMURAI','http://www.internousdev.com/samurai/','samurai.png',2016),
( 39,'INTERNOUSDEV','http://www.internousdev.com/internousdev/','internousdev.png',2016),
( 40,'NAGOMI','http://www.internousdev.com/nagomi/','nagomi.png',2016),
( 41,'NOEL','http://www.internousdev.com/noell/','noel.png',2016),
( 42,'LUSSO','http://www.internousdev.com/lusso/','lusso.png',2016),
( 43,'DEBUT','http://www.internousdev.com/debut/','debut.png',2017),
( 44,'NADESHIKO','http://www.internousdev.com/nadeshiko/','nadeshiko.png',2016),
( 45,'SHIKI','http://www.internousdev.com/shiki/','shiki.png',2015),
( 46,'TOKYO RUNNER','http://www.internousdev.com/tokyorunner/','tokyorunner.png',2017),
( 47,'CATSNDOGS','http://www.internousdev.com/catsndogs/','catsndogs.png',2017),
( 48,'HAPPYBRIDAL','http://www.internousdev.com/happybridal/','happybridal.png',2017),
( 49,'HAPPYGIFT','http://www.internousdev.com/happygift/','happygift.png',2017),
( 50,'JUNEBRELLA','http://www.internousdev.com/junebrella','junebrella.png',2017),
( 51,'LEGMINA','http://www.internousdev.com/legmina/','legmina.png',2017),
( 52,'OUTDOOR','http://www.internousdev.com/outdoor/','outdoor.png',2017),
( 53,'UMARI','http://www.internousdev.com/umari/','umari.png',2017);