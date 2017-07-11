set names utf8;
set foreign_key_checks=0;
drop database if exists uesto;
create database if not exists uesto;
use uesto;


drop table if exists goods;
drop table if exists customer;
drop table if exists order_info;

create table goods(
goods_id int(100) auto_increment comment '商品ID',
goods_name varchar(255) not null comment'商品名',
stock int(100) comment'在庫',
price int(100) comment'単価',
kcal int(100),
primary key(goods_id)
)
engine=MyISAM
default charset=utf8
comment='商品情報テーブル';

insert into goods values
("プロテインチョコ味",10,800,1),
("プロテインイチゴ味",9,900,1),
("プロテインブドウ味",50,700,1),
("えごま油(450ml)",100,2980,1),
("亜麻仁油(450ml)",100,2780,1),
("C1000ビタミンレモンゼリー",100,140,2),
("SOYJOY",100,100,1),
("REDBULL",100,298,1),
("カロリーメイト",100,150,1),
("プロテインダイエット",100,5000,3),
("おからクッキー",100,3000,2),
("カルシウムせんべい",100,300,1),
("グリーンスムージー",100,3000,3),
("アサイースムージー",100,3000,3),
("青汁",100,3000,1),
("トマトジュース500ｍｌ",100,300,1),
("野菜ジュース500ｍｌ",100,100,1),
("ヨーグルト",100,200,1),
("ノニジュース500ｍｌ",100,3000,1),
("黒ゴマ",100,300,1),
("ウエストローラー",100,1600,2),
("ダンベル(5kg)",100,1500,2),
("ダンベル(10kg)",100,3000,1),
("ダンベルセット",100,5000,2),
("サウナスーツ",100,8000,3),
("バランスボール",100,1000,3),
("ランニングマシン",100,50000,3),
("ぶら下がり健康器",100,8000,2),
("ダイエットシューズ",100,3000,3),
("ランニングシューズ",100,2980,3),
("健康ステッパー",100,14000,1),
("ヨガマット",100,1500,1),
("足つぼウォークマット",100,9500,1),
("ボディケアマシン",100,25000,1),
("スリムウォーク",100,1000,1),
("骨盤矯正ベルト",100,2500,1),
("マッサージチェア",100,200000,1),
("フットマッサージャー",100,20000,1),
("美容ローラー",100,25000,1),
("TRF　ダンササイズ",100,3000,1),
("母の愛(30粒)",100,4980,1),
("亜鉛　30粒",100,1000,1),
("スリムサプリ　30日分",100,2000,3),
("高麗人参",100,15000,1),
("グルコサミン＆コンドロイチン",100,400,1),
("ウコンサプリメント",100,650,1),
("カルシム＆マグネシウム",100,2000,1),
("コラーゲン",100,1000,1),
("コエンザイムＱ10",100,200,1),
("マルチビタミン",100,2500,1),
("ユーグレナ　90粒",100,7000,1),
("ビーポーレ　250ｇ",100,6000,1),
("カプサイシンサプリメント",100,2500,1),
("ヘム鉄サプリメント",100,600,1),
("葉酸サプリメント",100,1200,1),
("ハトムギ酵素",100,2700,1),
("オリゴ糖",100,500,1),
("アルギニンサプリメント",100,500,1),
("酵素にんにく卵黄",100,5000,1),
("卵とにんにく",100,1,1),
("ブートキャンプ",100,6800,3),
("クビレディ",100,7000,3),
("エアロバイク",100,35000,3),
("水素風呂",100,250000,1),
("アブトロニック",100,15000,2),
("ビール酵母",100,2000,1),
("バスソルト900ｇ",100,1000,1),
("水素発生入浴剤",100,1000,1),
("バラの入浴剤",100,1500,1),
("きのこセット",100,1500,1),
("アンパンマンDVD",100,1500,3),
("おから",100,1500,1),
("ヘルスケアレア",100,1500,4),
("レディス4",100,1500,2),
("健康グッズ",100,1500,1),
("ブート風呂増量版",100,1500,2),
("ヘルススケルター",100,1500,1),
("体重計",100,1500,3),
("亜鉛風呂",100,1500,3);


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table customer (
id INT(100) NOT NULL AUTO_INCREMENT comment '顧客ID',
customer_name VARCHAR(255) NOT NULL comment '顧客名',
user_id VARCHAR(255) UNIQUE NOT NULL comment 'ユーザーID',
pass VARCHAR(255) NOT NULL comment '顧客パスワード',
mailad  VARCHAR(255) NOT NULL comment 'メールアドレス',
postcode VARCHAR(7) NOT NULL comment '郵便番号',
address VARCHAR(255) NOT NULL comment '住所',
telnumber VARCHAR(12) NOT NULL comment '電話番号',
credit_number varchar(4) comment 'クレジットカード番号',
credit_token varchar(255) comment 'クレジットカードトークン',
cardNumber varchar(50) comment 'クレジットカード番号',
cardHolder varchar(255) comment 'クレジットカード所有者',
expirationdate varchar(20) comment '有効期限日',
securityCode varchar(4) comment 'セキュリティコード',
primary key(id)
)
engine=MyISAM
default charset=utf8
comment='顧客情報テーブル'
;

drop table if exists temp;
create table temp(
temp_id int primary key auto_increment,
user_id varchar(255),
user_name varchar(255),
password varchar(255),
email varchar(100),
cell_number varchar(15),
postal_code varchar(8),
address varchar(100),
card_number varchar(50),
card_holder varchar(255),
expiration_date varchar(20),
security_code varchar(4),
oauth_id varchar(50),
oauth_name varchar(50),
registration_date datetime
)
engine=MyISAM
default charset=utf8
comment='テンポラリテーブル'
;

create table order_info comment (
id varchar(100) comment '顧客ID',
goods_id int(100) comment '商品ID',
ORDER_COUNT int(100) comment '注文数',
PURCHASEDAY timestamp default current_timestamp() comment'購入日'
)
engine=MyISAM
default charset=utf8
comment='注文情報テーブル'
;
/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
INSERT INTO CUSTOMER(CUSTOMER_NAME,USER_ID,PASS,MAILAD,POSTCODE,ADDRESS,TELNUMBER,credit_token
)VALUES(
"黒柳","totto","madogiwa","totto@gmail.com","1234567","東京都八王子市xxx","09012345678","ab8b31e064a7cf9ef187fd53a7a11b2df9d31b5c0da5fe7876a3092ceaaeade3");

-- ORDERテーブルにサンプルデータの挿入
INSERT INTO ORDER_INFO(ID,GOODS_ID,ORDER_COUNT)VALUES(1,1,4);
