set names utf8;
set foreign_key_checks=0;
drop database if exists gpscoffee;
create database gpscoffee default character set utf8;
use gpscoffee;


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
/* プレミアム会員情報テーブル	*/
drop table if exists premium_membership;
create table premium_membership(
	id int(4) primary key auto_increment comment 'アカウント番号',
	premium_id varchar(30) unique comment 'プレミアムID',
	premium_pass varchar(30) comment 'プレミアムパスワード',
	name varchar(30) comment '名前',
	phone_number varchar(30) comment '電話番号',
	register_date timestamp default current_timestamp comment '登録日時',
	update_date timestamp comment '更新日時',
	delete_date timestamp comment '削除日時'
);


/* コーヒー豆情報テーブル */
drop table if exists bean_goods;
create table bean_goods(
	goods_id int(3) primary key comment '商品ID',
	bean_name varchar(30) unique comment 'コーヒー豆の種類',
	direct_from varchar(30) comment '産地',
	price int(4) comment 'グラム単価',
	bitterness int(3) comment '苦味の度合い',
	sourness int(3) comment '酸味の度合い',
	depth int(3) comment 'コクの度合い',
	image_url varchar(255) comment '画像URL',
	premium_image_url varchar(255) comment 'プレミアム画像URL',
	description varchar(500) comment 'コーヒー豆の説明'
);

/* 店舗情報テーブル */
drop table if exists store_list;
create table store_list(
	shop_id int(3) primary key comment '店舗ID',
	shop_name varchar(50) comment '店舗名',
	zipcode varchar(8) comment '店舗郵便番号',
	shop_address varchar(255) comment '店舗住所',
	shop_number varchar(30) comment '店舗電話番号',
	administrator_id varchar(30) comment '管理用ID',
	administrator_pass varchar(30) comment '管理用パスワード',
	administrator_name varchar(255) comment '管理者名'
);

/* 店舗商品テーブル */
drop table if exists store_goods;
create table store_goods(
	shop_id int(3) comment '管理店舗ID',
	goods_id int(3) comment '商品ID',
	stock int(5) comment 'グラム在庫',
	unique(shop_id,goods_id)
);

/* 予約情報テーブル */
drop table if exists reservation;
create table reservation(
	shop_id int(3) comment '受注店舗ID',
	inquiry int(14) primary key auto_increment comment '受注番号',
	premium_id varchar(30) comment 'プレミアム会員ID',
	bean_name varchar(30) comment'コーヒー豆の種類',
	bean_roast int(1) comment'焙煎方法',
	bean_grind int(1) comment'挽き方',
	gram int(5) comment'受注グラム',
	drink int(2) comment'ドリンク個数',
	total_amount int(5) comment'豆ごとの小計',
	reservation_time timestamp default current_timestamp comment'予約受注時刻',
	delivery_time timestamp default 0 comment'商品受け渡し時刻',
	order_code int(10) comment'識別用コード'
);

/* 購入履歴情報テーブル */
drop table if exists history;
create table history(
	shop_id int(3) comment'受注店舗ID',
	inquiry int(14) not null comment'受注番号',
	premium_id varchar(30) comment'プレミアム会員ID',
	bean_name varchar(30) comment'コーヒー豆の種類',
	bean_roast int(1) comment'焙煎方法',
	bean_grind int(1) comment'挽き方',
	gram int(5) comment'受注グラム',
	drink int(2) comment'ドリンク個数',
	total_amount int(5) comment'豆ごとの小計',
	delivery_time timestamp default current_timestamp comment'商品受け渡し時刻',
	order_code int(10) comment'識別用コード'
);

/*テスト登録者情報の挿入*/
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test','test','山田太郎','000-0000-1001');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test2','test2','鈴木花子','000-0000-1002');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test3','test3','山田三郎','000-0000-1003');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test4','test4','山田四郎','000-0000-1004');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test5','test5','山田五郎','000-0000-1005');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test6','test6','山田六郎','000-0000-1006');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test7','test7','山田七郎','000-0000-1007');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test8','test8','山田八郎','000-0000-1008');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test9','test9','山田九郎','000-0000-1009');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test10','test10','山田十郎','000-0000-1010');


/*商品情報のレコード挿入*/
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(1,	'ブラジル・サンマリノ',			'南米・ブラジル',		425,	80,80,40,'goods/1.jpg','Premium/PremiumImg1.jpg', '豆が樹上で完熟するまで熟成させた栽培方法を採用。強烈な主張を持つコクと甘み。 「これぞ、ブラジル産」と言わしめる力強さを持ち合わせています。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(2,	'ブラジル・ピーベリー',			'南米・ブラジル',		303,	60,40,40,'goods/2.jpg','Premium/PremiumImg2.jpg', 'ナッツ系の甘い芳ばしい香り。飲み口はクセがなく多くの人に好まれる優しい風味ですが、しっかりとコクがあり飲み応えがあります。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(3,	'コロンビア・ナリーニョ',		'南米・コロンビア',		390,	80,40,100,'goods/3.jpg','Premium/PremiumImg3.jpg', '力強い香りと、 味わいに奥行きのある苦味・酸味・甘味が調和する―コロンビアの中でも他州には無いナリーニョならではの味わいです。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(4,	'エメラルドマウンテン',			'南米・コロンビア',		549,	60,40,100,'goods/4.jpg','Premium/PremiumImg4.jpg', '宝石エメラルドの名を冠した、最高級コロンビア豆。素晴らしく芳醇な香りは他のコーヒー豆には決して出せません。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(5,	'グアテマラ・アンテグア',		'南米・グアテマラ',		410,	20,100,80,'goods/5.jpg','Premium/PremiumImg5.jpg', 'すばらしい深みのあるエレガントで洗練された複雑なコーヒー。雨季と乾季のハッキリした気候は、世界的に高く評価されている風味の源となっています。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(6,	'スマトラ・マンデリン',			'アジア・インドネシア',		425,	100,40,60,'goods/6.jpg','Premium/PremiumImg6.jpg', '芳醇なコクにやわらかな苦味、 飲んだ時に広がる深みのある上品な味わいと香り。トップクラスの人気を誇るインドネシアの代表的な銘柄です。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(7,	'キリマンジャロAAキボー',		'アフリカ・タンザニア',		480,	40,100,60,'goods/7.jpg','Premium/PremiumImg7.jpg', '「キボー」とは、タンザニアで収穫されるコーヒーの中で選りすぐった最高級のコーヒー豆の総称。力強くもやさしいコーヒー、酸味好きの方にはぜひおすすめ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(8,	'エチオピア・Ｇ４',			'アフリカ・エチオピア',		390,	40,80,80,'goods/8.jpg','Premium/PremiumImg8.jpg', '濃厚なコク、キリっとした苦味にアフターフレーバーに残るほんのり甘い香りをお楽しみ頂けます。 ミルクとの相性もバッチリ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(9,	'コスタリカ・コーラルマウンテン',	'中米・コスタリカ',		391,	60,60,80,'goods/9.jpg','Premium/PremiumImg9.jpg', '大変上品で繊細な酸味、完熟豆の甘み、芳醇な香りとしっかりとしたコクが味わえる逸品。マイルドコーヒー好き、さっぱりとした味わい、香りにこだわる方へ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(10,'ブルーマウンテンNO.1',			'中米カリブ海・ジャマイカ',	1480,	20,40,60,'goods/10.jpg','Premium/PremiumImg10.jpg','優雅な香り、調和の取れた甘味のある味わいから"コーヒーの王様"と称されるブルーマウンテン。その中でも一番品質の良い等級が「No1」です。');


/* 店舗商品のレコード挿入*/
insert into store_goods(shop_id,goods_id,stock)value(1,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(3,10,1000);

insert into store_goods(shop_id,goods_id,stock)value(4,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,10,1000);

insert into store_goods(shop_id,goods_id,stock)value(5,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(6,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(7,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(8,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(9,5,1000);

insert into store_goods(shop_id,goods_id,stock)value(10,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(11,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(12,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(13,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(14,10,1000);
insert into store_goods(shop_id,goods_id,stock)value(15,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(16,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(17,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(18,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(19,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(20,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(21,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(22,8,1000);


/* 店舗情報レコード挿入 */
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(1,'有楽町駅前店','100-0005','東京都千代田区丸の内3-6-11','06-0221-5795','test','tiyoda','千代田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(2,'日本橋兜町店','103-0026','東京都中央区日本橋兜町8-11','06-0223-1457','test','nihonbasi','中央一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(3,'田町センタービル店','105-0023','東京都港区芝浦5-34-7田町センタービル','06-0231-2498','test','tamati','港一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(4,'西新宿1丁目店（本店）','160-0022','東京都新宿区1-13-8朝日新宿ビル','06-0235-1168','test','nisisinnzyuku','新宿一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(5,'本郷三丁目店','160-0022','東京都文京区本郷2-40-18','06-0337-2159','test','hongou','文京一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(6,'御徒町南口店','110-0005','東京都台東区上野5-20-6','06-0371-1168','test','okatimati','台東一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(7,'両国東口店','130-0026','東京都墨田区両国3-26-5','06-0344-8694','test','ryougoku','墨田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(8,'東陽町店','135-0016','東京都江東区東陽4-5-18 メトロハイツ東陽','06-0359-2694','test','touyou','江東一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(9,'目黒東口店','141-0021','東京都品川区上大崎2-14-5','06-0337-1171','test','meguro','品川一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(10,'自由ヶ丘店','152-0035','東京都目黒区自由が丘2-1','06-0569-3963','test','jiyuugaoka','目黒一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(11,'蒲田東口店','144-0052','東京都大田区蒲田5-11-10','06-0335-6562','test','kamata','大田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(12,'三軒茶屋2丁目店','154-0024','東京都世田谷区三軒茶屋2-14-13','06-0340-5223','test','sangendyaya','世田谷一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(13,'渋谷1丁目店','150-0002','東京都渋谷区渋谷1-14-15','06-0529-2314','test','sibuya','渋谷一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(14,'鷺ノ宮店','165-0032','東京都中野区鷺宮3-19-5','06-0422-1176','test','saginomiya','中野一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(15,'荻窪南口店','167-0051','東京都杉並区荻窪5-29-7','06-0321-6028','test','ogikubo','杉並一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(16,'ルミネ池袋店','171-0021','東京都豊島区西池袋1-11-1 ルミネ池袋店B1F','06-0378-4154','test','lumine','豊島一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(17,'ビーンズ赤羽店','115-0045','東京都北区赤羽1-1-1 ビーンズ赤羽','06-0356-2785','test','beans','北一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(18,'日暮里駅前店','116-0013','東京都荒川区西日暮里2-19-7 東忠ビル1F','06-0386-8254','test','nippori','荒川一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(19,'上板橋南口店','174-0076','東京都板橋区上板橋2-36-8','06-0345-2660','test','kamiitabasi','板橋一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(20,'大泉学園駅前店','178-0063','東京都練馬区東大泉1-31-3 太田ビル1F','06-0355-1420','test','ooizumi','練馬一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(21,'北千住西口店','120-0034','東京都足立区千住3-92','06-0361-6882','test','kitasenju','足立一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(22,'京成青砥店','125-0062','東京都葛飾区青戸3-39-11','06-0371-0759','test','keiseiaoto','葛飾一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(23,'小岩ポポ店','133-0056','東京都江戸川区南小岩6-31-2','06-0391-1185','test','koiwapopo','江戸川一郎');

/* 予約情報レコード挿入 */
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','ブラジル・サンマリノ',3,4,200,0,850,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','ブラジル・ピーベリー',2,2,60,3,182,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','コロンビア・ナリーニョー',2,2,500,0,1950,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(2,'test2','グアテマラ・アンテグア',4,4,200,0,820,'2015-05-12 11:30:00','2015-05-12 15:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(2,'test2','グアテマラ・アンテグア',4,4,200,0,820,'2015-05-13 11:30:00','2015-05-13 15:30:00');

/* 購入履歴情報レコード挿入 */
insert into history values(1, 1,"test","ブラジル・サンマリノ"	,	3,3,100,0,425,"2015/5/1 10:00",1);
insert into history values(1, 2,"test","ブラジル・ピーベリー"	,	3,3,100,0,303,"2015/05/02 11:00",2);
insert into history values(1, 3,"test","コロンビア・ナリーニョ"	,	3,3,100,0,390,"2015/05/03 12:00",3);
insert into history values(1, 4,"test","エメラルドマウンテン"	,	3,3,100,0,549,"2015/05/04 13:00",4);
insert into history values(1, 5,"test","グアテマラ・アンテグア"	,	3,3,100,0,410,"2015/05/05 14:00",5);
insert into history values(1, 6,"test","スマトラ・マンデリン"	,	3,3,100,0,425,"2015/05/06 15:00",6);
insert into history values(1, 7,"test","キリマンジャロAAキボー"	,	3,3,100,0,480,"2015/05/07 16:00",7);
insert into history values(1, 8,"test","エチオピア・Ｇ４"	,	3,3,100,0,390,"2015/05/08 17:00",8);
insert into history values(1, 9,"test","コスタリカ・コーラルマウンテン",3,3,100,0,391,"2015/05/09 18:00",9);
insert into history values(1,10,"test","ブルーマウンテンNO.1",		3,3,100,0,1480,"2015/05/10 19:00",10);
insert into history values(1,11,"test2","ブラジル・サンマリノ",		3,3,100,0,425,"2015/05/11 20:00",11);
insert into history values(1,12,"test2","ブラジル・ピーベリー",		3,3,100,0,303,"2015/05/12 21:00",12);
insert into history values(1,13,"test2","コロンビア・ナリーニョ",	3,3,100,0,390,"2015/05/13 22:00",13);
insert into history values(1,14,"test2","エメラルドマウンテン",		3,3,100,0,549,"2015/05/14 23:00",14);
insert into history values(1,15,"test2","グアテマラ・アンテグア",	3,3,100,0,410,"2015/05/16 0:00",15);
insert into history values(1,16,"test2","スマトラ・マンデリン",		3,3,100,0,425,"2015/05/17 1:00",16);
insert into history values(1,17,"test2","キリマンジャロAAキボー",	3,3,100,0,480,"2015/05/18 2:00",17);
insert into history values(1,18,"test2","エチオピア・Ｇ４",		3,3,100,0,390,"2015/05/19 3:00",18);
insert into history values(1,19,"test2","コスタリカ・コーラルマウンテン",3,3,100,0,391,"2015/05/20 4:00",19);
insert into history values(1,20,"test2","ブルーマウンテンNO.1",		3,3,100,0,1480,"2015/05/21 5:00",20);
insert into history values(1,21,"test3","ブラジル・サンマリノ",		3,3,100,0,425,"2015/05/22 6:00",21);
insert into history values(1,22,"test3","ブラジル・ピーベリー",		3,3,100,0,303,"2015/05/23 7:00",22);
insert into history values(1,23,"test3","コロンビア・ナリーニョ",	3,3,100,0,390,"2015/05/24 8:00",23);
insert into history values(1,24,"test3","エメラルドマウンテン",		3,3,100,0,549,"2015/05/25 9:00",24);
insert into history values(1,25,"test3","グアテマラ・アンテグア",	3,3,100,0,410,"2015/05/26 10:00",25);

=======
set names utf8;

drop database if exists gpscoffee;
create database gpscoffee default character set utf8;
use gpscoffee;

/* プレミアム会員情報テーブル	*/
drop table if exists premium_membership;
create table premium_membership(
	id int(4) primary key auto_increment,
	premium_id varchar(30) unique,
	premium_pass varchar(30),
	name varchar(30),
	phone_number varchar(30),
	register_date timestamp default current_timestamp,
	update_date timestamp,
	delete_date timestamp
);


/* コーヒー豆情報テーブル */
drop table if exists bean_goods;
create table bean_goods(
	goods_id int(3) primary key,
	bean_name varchar(30) unique,
	direct_from varchar(30),
	price int(4),
	bitterness int(3),
	sourness int(3),
	depth int(3),
	image_url varchar(255),
	premium_image_url varchar(255),
	description varchar(500)
);

/* 店舗情報テーブル */
drop table if exists store_list;
create table store_list(
	shop_id int(3) primary key,
	shop_name varchar(50),
	zipcode varchar(8),
	shop_address varchar(255),
	shop_number varchar(30),
	administrator_id varchar(30),
	administrator_pass varchar(30),
	administrator_name varchar(255)
);

/* 店舗商品テーブル */
drop table if exists store_goods;
create table store_goods(
	shop_id int(3),
	goods_id int(3),
	stock int(5),
	unique(shop_id,goods_id)
);

/* 予約情報テーブル */
drop table if exists reservation;
create table reservation(
	shop_id int(3),
	inquiry int(14) primary key auto_increment,
	premium_id varchar(30),
	bean_name varchar(30),
	bean_roast int(1),
	bean_grind int(1),
	gram int(5),
	drink int(2),
	total_amount int(5),
	reservation_time timestamp default current_timestamp,
	delivery_time timestamp default 0,
	order_code int(10)
);

/* 購入履歴情報テーブル */
drop table if exists history;
create table history(
	shop_id int(3),
	inquiry int(14) not null,
	premium_id varchar(30),
	bean_name varchar(30),
	bean_roast int(1),
	bean_grind int(1),
	gram int(5),
	drink int(2),
	total_amount int(5),
	delivery_time timestamp default current_timestamp,
	order_code int(10)
);

/*テスト登録者情報の挿入*/
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test','test','山田太郎','000-0000-1001');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test2','test2','鈴木花子','000-0000-1002');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test3','test3','山田三郎','000-0000-1003');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test4','test4','山田四郎','000-0000-1004');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test5','test5','山田五郎','000-0000-1005');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test6','test6','山田六郎','000-0000-1006');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test7','test7','山田七郎','000-0000-1007');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test8','test8','山田八郎','000-0000-1008');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test9','test9','山田九郎','000-0000-1009');
insert into premium_membership(premium_id,premium_pass,name,phone_number)value('test10','test10','山田十郎','000-0000-1010');


/*商品情報のレコード挿入*/
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(1,	'ブラジル・サンマリノ',			'南米・ブラジル',		425,	80,80,40,'goods/1.jpg','Premium/PremiumImg1.jpg', '豆が樹上で完熟するまで熟成させた栽培方法を採用。強烈な主張を持つコクと甘み。 「これぞ、ブラジル産」と言わしめる力強さを持ち合わせています。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(2,	'ブラジル・ピーベリー',			'南米・ブラジル',		303,	60,40,40,'goods/2.jpg','Premium/PremiumImg2.jpg', 'ナッツ系の甘い芳ばしい香り。飲み口はクセがなく多くの人に好まれる優しい風味ですが、しっかりとコクがあり飲み応えがあります。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(3,	'コロンビア・ナリーニョ',		'南米・コロンビア',		390,	80,40,100,'goods/3.jpg','Premium/PremiumImg3.jpg', '力強い香りと、 味わいに奥行きのある苦味・酸味・甘味が調和する―コロンビアの中でも他州には無いナリーニョならではの味わいです。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(4,	'エメラルドマウンテン',			'南米・コロンビア',		549,	60,40,100,'goods/4.jpg','Premium/PremiumImg4.jpg', '宝石エメラルドの名を冠した、最高級コロンビア豆。素晴らしく芳醇な香りは他のコーヒー豆には決して出せません。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(5,	'グアテマラ・アンテグア',		'南米・グアテマラ',		410,	20,100,80,'goods/5.jpg','Premium/PremiumImg5.jpg', 'すばらしい深みのあるエレガントで洗練された複雑なコーヒー。雨季と乾季のハッキリした気候は、世界的に高く評価されている風味の源となっています。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(6,	'スマトラ・マンデリン',			'アジア・インドネシア',		425,	100,40,60,'goods/6.jpg','Premium/PremiumImg6.jpg', '芳醇なコクにやわらかな苦味、 飲んだ時に広がる深みのある上品な味わいと香り。トップクラスの人気を誇るインドネシアの代表的な銘柄です。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(7,	'キリマンジャロAAキボー',		'アフリカ・タンザニア',		480,	40,100,60,'goods/7.jpg','Premium/PremiumImg7.jpg', '「キボー」とは、タンザニアで収穫されるコーヒーの中で選りすぐった最高級のコーヒー豆の総称。力強くもやさしいコーヒー、酸味好きの方にはぜひおすすめ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(8,	'エチオピア・Ｇ４',			'アフリカ・エチオピア',		390,	40,80,80,'goods/8.jpg','Premium/PremiumImg8.jpg', '濃厚なコク、キリっとした苦味にアフターフレーバーに残るほんのり甘い香りをお楽しみ頂けます。 ミルクとの相性もバッチリ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(9,	'コスタリカ・コーラルマウンテン',	'中米・コスタリカ',		391,	60,60,80,'goods/9.jpg','Premium/PremiumImg9.jpg', '大変上品で繊細な酸味、完熟豆の甘み、芳醇な香りとしっかりとしたコクが味わえる逸品。マイルドコーヒー好き、さっぱりとした味わい、香りにこだわる方へ。');
insert into bean_goods(goods_id,bean_name,direct_from,price,bitterness,sourness,depth,image_url,premium_image_url,description)value(10,'ブルーマウンテンNO.1',			'中米カリブ海・ジャマイカ',	1480,	20,40,60,'goods/10.jpg','Premium/PremiumImg10.jpg','優雅な香り、調和の取れた甘味のある味わいから"コーヒーの王様"と称されるブルーマウンテン。その中でも一番品質の良い等級が「No1」です。');


/* 店舗商品のレコード挿入*/
insert into store_goods(shop_id,goods_id,stock)value(1,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(1,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(2,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(3,10,1000);

insert into store_goods(shop_id,goods_id,stock)value(4,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(4,10,1000);

insert into store_goods(shop_id,goods_id,stock)value(5,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(6,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(7,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(8,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(9,5,1000);

insert into store_goods(shop_id,goods_id,stock)value(10,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(11,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(12,8,1000);
insert into store_goods(shop_id,goods_id,stock)value(13,9,1000);
insert into store_goods(shop_id,goods_id,stock)value(14,10,1000);
insert into store_goods(shop_id,goods_id,stock)value(15,1,1000);
insert into store_goods(shop_id,goods_id,stock)value(16,2,1000);
insert into store_goods(shop_id,goods_id,stock)value(17,3,1000);
insert into store_goods(shop_id,goods_id,stock)value(18,4,1000);
insert into store_goods(shop_id,goods_id,stock)value(19,5,1000);
insert into store_goods(shop_id,goods_id,stock)value(20,6,1000);
insert into store_goods(shop_id,goods_id,stock)value(21,7,1000);
insert into store_goods(shop_id,goods_id,stock)value(22,8,1000);


/* 店舗情報レコード挿入 */
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(1,'有楽町駅前店','100-0005','東京都千代田区丸の内3-6-11','06-0221-5795','test','tiyoda','千代田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(2,'日本橋兜町店','103-0026','東京都中央区日本橋兜町8-11','06-0223-1457','test','nihonbasi','中央一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(3,'田町センタービル店','105-0023','東京都港区芝浦5-34-7田町センタービル','06-0231-2498','test','tamati','港一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(4,'西新宿1丁目店（本店）','160-0022','東京都新宿区1-13-8朝日新宿ビル','06-0235-1168','test','nisisinnzyuku','新宿一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(5,'本郷三丁目店','160-0022','東京都文京区本郷2-40-18','06-0337-2159','test','hongou','文京一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(6,'御徒町南口店','110-0005','東京都台東区上野5-20-6','06-0371-1168','test','okatimati','台東一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(7,'両国東口店','130-0026','東京都墨田区両国3-26-5','06-0344-8694','test','ryougoku','墨田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(8,'東陽町店','135-0016','東京都江東区東陽4-5-18 メトロハイツ東陽','06-0359-2694','test','touyou','江東一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(9,'目黒東口店','141-0021','東京都品川区上大崎2-14-5','06-0337-1171','test','meguro','品川一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(10,'自由ヶ丘店','152-0035','東京都目黒区自由が丘2-1','06-0569-3963','test','jiyuugaoka','目黒一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(11,'蒲田東口店','144-0052','東京都大田区蒲田5-11-10','06-0335-6562','test','kamata','大田一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(12,'三軒茶屋2丁目店','154-0024','東京都世田谷区三軒茶屋2-14-13','06-0340-5223','test','sangendyaya','世田谷一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(13,'渋谷1丁目店','150-0002','東京都渋谷区渋谷1-14-15','06-0529-2314','test','sibuya','渋谷一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(14,'鷺ノ宮店','165-0032','東京都中野区鷺宮3-19-5','06-0422-1176','test','saginomiya','中野一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(15,'荻窪南口店','167-0051','東京都杉並区荻窪5-29-7','06-0321-6028','test','ogikubo','杉並一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(16,'ルミネ池袋店','171-0021','東京都豊島区西池袋1-11-1 ルミネ池袋店B1F','06-0378-4154','test','lumine','豊島一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(17,'ビーンズ赤羽店','115-0045','東京都北区赤羽1-1-1 ビーンズ赤羽','06-0356-2785','test','beans','北一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(18,'日暮里駅前店','116-0013','東京都荒川区西日暮里2-19-7 東忠ビル1F','06-0386-8254','test','nippori','荒川一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(19,'上板橋南口店','174-0076','東京都板橋区上板橋2-36-8','06-0345-2660','test','kamiitabasi','板橋一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(20,'大泉学園駅前店','178-0063','東京都練馬区東大泉1-31-3 太田ビル1F','06-0355-1420','test','ooizumi','練馬一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(21,'北千住西口店','120-0034','東京都足立区千住3-92','06-0361-6882','test','kitasenju','足立一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(22,'京成青砥店','125-0062','東京都葛飾区青戸3-39-11','06-0371-0759','test','keiseiaoto','葛飾一郎');
insert into store_list(shop_id,shop_name,zipcode,shop_address,shop_number,administrator_id,administrator_pass,administrator_name)value(23,'小岩ポポ店','133-0056','東京都江戸川区南小岩6-31-2','06-0391-1185','test','koiwapopo','江戸川一郎');

/* 予約情報レコード挿入 */
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','ブラジル・サンマリノ',3,4,200,0,850,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','ブラジル・ピーベリー',2,2,60,3,182,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(1,'test','コロンビア・ナリーニョー',2,2,500,0,1950,'2015-05-12 12:30:00','2015-05-12 17:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(2,'test2','グアテマラ・アンテグア',4,4,200,0,820,'2015-05-12 11:30:00','2015-05-12 15:30:00');
insert into reservation(shop_id,premium_id,bean_name,bean_roast,bean_grind,gram,drink,total_amount,reservation_time,delivery_time)value(2,'test2','グアテマラ・アンテグア',4,4,200,0,820,'2015-05-13 11:30:00','2015-05-13 15:30:00');

/* 購入履歴情報レコード挿入 */
insert into history values(1, 1,"test","ブラジル・サンマリノ"	,	3,3,100,0,425,"2015/5/1 10:00",1);
insert into history values(1, 2,"test","ブラジル・ピーベリー"	,	3,3,100,0,303,"2015/05/02 11:00",2);
insert into history values(1, 3,"test","コロンビア・ナリーニョ"	,	3,3,100,0,390,"2015/05/03 12:00",3);
insert into history values(1, 4,"test","エメラルドマウンテン"	,	3,3,100,0,549,"2015/05/04 13:00",4);
insert into history values(1, 5,"test","グアテマラ・アンテグア"	,	3,3,100,0,410,"2015/05/05 14:00",5);
insert into history values(1, 6,"test","スマトラ・マンデリン"	,	3,3,100,0,425,"2015/05/06 15:00",6);
insert into history values(1, 7,"test","キリマンジャロAAキボー"	,	3,3,100,0,480,"2015/05/07 16:00",7);
insert into history values(1, 8,"test","エチオピア・Ｇ４"	,	3,3,100,0,390,"2015/05/08 17:00",8);
insert into history values(1, 9,"test","コスタリカ・コーラルマウンテン",3,3,100,0,391,"2015/05/09 18:00",9);
insert into history values(1,10,"test","ブルーマウンテンNO.1",		3,3,100,0,1480,"2015/05/10 19:00",10);
insert into history values(1,11,"test2","ブラジル・サンマリノ",		3,3,100,0,425,"2015/05/11 20:00",11);
insert into history values(1,12,"test2","ブラジル・ピーベリー",		3,3,100,0,303,"2015/05/12 21:00",12);
insert into history values(1,13,"test2","コロンビア・ナリーニョ",	3,3,100,0,390,"2015/05/13 22:00",13);
insert into history values(1,14,"test2","エメラルドマウンテン",		3,3,100,0,549,"2015/05/14 23:00",14);
insert into history values(1,15,"test2","グアテマラ・アンテグア",	3,3,100,0,410,"2015/05/16 0:00",15);
insert into history values(1,16,"test2","スマトラ・マンデリン",		3,3,100,0,425,"2015/05/17 1:00",16);
insert into history values(1,17,"test2","キリマンジャロAAキボー",	3,3,100,0,480,"2015/05/18 2:00",17);
insert into history values(1,18,"test2","エチオピア・Ｇ４",		3,3,100,0,390,"2015/05/19 3:00",18);
insert into history values(1,19,"test2","コスタリカ・コーラルマウンテン",3,3,100,0,391,"2015/05/20 4:00",19);
insert into history values(1,20,"test2","ブルーマウンテンNO.1",		3,3,100,0,1480,"2015/05/21 5:00",20);
insert into history values(1,21,"test3","ブラジル・サンマリノ",		3,3,100,0,425,"2015/05/22 6:00",21);
insert into history values(1,22,"test3","ブラジル・ピーベリー",		3,3,100,0,303,"2015/05/23 7:00",22);
insert into history values(1,23,"test3","コロンビア・ナリーニョ",	3,3,100,0,390,"2015/05/24 8:00",23);
insert into history values(1,24,"test3","エメラルドマウンテン",		3,3,100,0,549,"2015/05/25 9:00",24);
insert into history values(1,25,"test3","グアテマラ・アンテグア",	3,3,100,0,410,"2015/05/26 10:00",25);

>>>>>>> branch 'master' of https://github.com/internousdevwork/openconnect
