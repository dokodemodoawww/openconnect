set names utf8;
set foreign_key_checks=0;
drop database if exists ichigoichie;
create database if not exists ichigoichie;
use ichigoichie;


/* テーブル作成 */
/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
/* ユーザー */
/*
drop table if exists user;
create table user (  /* ユーザーのテーブルを作る */
user_id int not null auto_increment,  /* ユーザーに番号を割り振る、自動連番 */
password varchar(255) not null,   /* ユーザーのログイン用パスワード */
name varchar(255) default "　",  /* ユーザー名 */
name_f varchar(255) default "　",  /* ユーザー名(ふりがな) */
postal varchar(255) not null default "　",/*郵便番号*/
address varchar(255) not null default "　",/*住所*/
tel_number varchar(255) not null default "　",/*電話番号*/
email varchar(255) not null unique,/*メールアドレス*/
sex varchar(10) not null default "　",/*性別*/
birthday date not null default 00000000,/*生年月日*/
handle_name varchar(16),
register_day datetime not null default 00000000000000,/*登録日*/
update_day datetime not null default 00000000000000,/*更新日*/
userdel_flg boolean not null default FALSE,/*退会フラグ*/
login_flg boolean not null default FALSE,/*ログインフラグ*/
user_flg int not null default 1,/*ユーザーを判別するフラグ 1.一般ユーザー 2.管理者 3.テストユーザー 4.出品者*/
PRIMARY KEY (user_id)  /* idの重複、null禁止 */
);
*/

/* データ登録 */
/* ユーザー 一覧 / ユーザーID/パスワード/ユーザー名/ユーザー名(ふりがな)/郵便番号/住所/電話番号/メールアドレス/性別/生年月日/登録日/更新日/退会フラグ/ログインフラグ/ユーザーフラグ*/
/*
insert into user(user_id,password,name,name_f,postal,address,tel_number,email,sex,birthday,handle_name,register_day,update_day,userdel_flg,login_flg,user_flg)values
(1,"12345678","テスト管理者","てすとかんりしゃ","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","0312345678","testadmin@gmail.com","男","1993-12-24","test","2016-07-01 13:00:00","2016-07-11 12:11:25",FALSE,FALSE,"2"),
(2,"internous01","井上琢磨","いのうえたくま","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","09012341234","takuma.inoue@gmail.com","男","1990-09-25","taku","2016-07-01 13:00:00","2016-07-11 13:54:20",FALSE,FALSE,"2"),
(3,"internous01","原田美由貴","はらだみゆき","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","09045674567","miyuki.harada@gmail.com","女","1992-05-03","miyu","2016-07-01 13:00:00","2016-07-11 13:00:00",FALSE,FALSE,"2");
*/



drop table if exists customer_info;
create table customer_info (
customer_id int(10) not null primary key auto_increment comment '顧客ID',
customer_name varchar(100) not null comment '顧客名',
customer_pass varchar(32) not null comment 'パスワード',
email_address varchar(100) not null comment 'メールアドレス',
tel_number varchar(11) not null comment '電話番号',
customer_address varchar(100) not null comment '住所',
address_number varchar(30) not null comment '番地',
customer_postcode int(7) not null comment '郵便番号',
customer_age tinyint not null comment '年齢',
unique_id varchar(30) comment '固有ID'
);

drop table if exists merchandise_info;
create table merchandise_info (
item_id tinyint not null primary key auto_increment comment '商品ID',
item_name varchar(50) not null comment '商品名',
price int(10) not null comment '値段',
img varchar(200) not null
);

drop table if exists shop_info;
create table shop_info(
shop_id tinyint not null primary key comment '店舗ID',
shop_name varchar(30) not null comment '店舗名',
shop_address varchar(100) not null comment '住所',
shop_postcode int(7) not null comment '郵便番号'
);

drop table if exists inventory_info;
create table inventory_info(
shop_id tinyint not null comment '店舗ID',
foreign key(shop_id) references shop_info(shop_id),
item_id tinyint not null comment '商品ID',
foreign key(item_id) references merchandise_info(item_id),
item_count tinyint not null comment '商品個数',
rental_date date not null comment 'レンタル日'
);


drop table if exists calendar;
create table calendar(
day date not null comment '日付',
shop_id tinyint comment '店舗ID',
foreign key(shop_id) references shop_info(shop_id),
item_id tinyint comment '商品ID',
foreign key(item_id) references merchandise_info(item_id)
);

drop table if exists purchase_history;
create table purchase_history(
customer_id int(10) not null comment '顧客ID',
rental_date date not null comment 'レンタル日',
sales_count int(3) not null comment '購入数',
unit_price int(10) not null comment '価格',
shop_id tinyint not null comment '店舗ID',
item_id tinyint not null comment '商品ID'
);

drop table if exists mail_magazine;
create table mail_magazine(
title varchar(100) comment 'タイトル',
contents text comment 'メール内容'
);

drop table if exists administrator;
create table administrator(
admin_id varchar(25) not null comment '管理者ID',
admin_pass varchar(25) not null comment '管理者パスワード'
);

set foreign_key_checks=1;

insert into merchandise_info values
(1, '浴衣', 5000,'img/4.jpg'),
(2, '振袖', 19000,'img/1.jpg'),
(3, '甚平', 4000,'img/2.jpg'),
(4, '単衣', 6000,'img/hitoe.jpg'),
(5, '袴', 10000,'img/3.jpg'),
(6, '七五三用着物', 16000,'img/gosai.jpg');

insert into shop_info values
(1, '一期一会御茶ノ水店', '東京都文京区湯島3-2-12　御茶ノ水天神ビル2F', 1130034),
(2, '一期一会浅草店', '東京都台東区浅草1-41-4', 1110032),
(3, '一期一会お台場店', '東京都港区台場1-7-1 アクアシティお台場6F', 1350091),
(4, '一期一会原宿店', '東京都渋谷区 神宮前6-1-9', 1500001);

insert into administrator values
('internousdev02', 'internous01'),
('aiueo', '12345'),
('yokohama' ,'gogo225');

drop table if exists order_info;
create table order_info (
customer_id int(10) not null comment '顧客ID',
shop_id tinyint not null comment '店舗ID',
foreign key(shop_id) references shop_info(shop_id),
item_id tinyint not null comment '商品ID',
foreign key(item_id) references merchandise_info(item_id),
unit_price int(10) not null comment '価格',
payment_method tinyint not null comment '支払い方法',
credit_number bigint(16) not null comment 'クレジット番号',
security_code int(4) not null comment 'セキュリティコード',
expiration_date varchar(6) not null comment '有効期限',
rental_date date not null comment 'レンタル日'
);



drop table if exists purchase_history;
create table purchase_history(
customer_id int(10) not null,
rental_date date not null,
sales_count int(3) not null,
unit_price int(10) not null,
shop_id tinyint not null,
item_id tinyint not null
);



insert into customer_info values (1, 'やまーだ', 'fjfjfjfj', 'yamada@co.jp', 09000000000, '山田のおうち', 1234, 1234567, 65, null);
insert into customer_info values (2, 'かずゆーき', 'fjfjfjfj', 'kazuyuki@co.jp', 09000000000, '和幸のおうち', 1234, 1234567, 24, null);
insert into customer_info values (3, 'あきもーと', 'fjfjfjfj', 'akimoto@co.jp', 09000000000, '秋元のおうち', 1234, 1234567, 33, null);
insert into customer_info values (4, 'こうへいへーい', 'fjfjfjfj', 'kouhei@co.jp', 09000000000, '浩平のおうち', 1234, 1234567, 80, null);
insert into customer_info values (5, '松浦', 'matsura', 'matsura@co.jp', 09000000000, '松浦のおうち', 1234, 1234567, 50, null);
insert into customer_info values (6, 'たかや', 'takaya', 'takaya@co.jp', 09000000000, '高谷のおうち', 1234, 1234567, 30, null);
insert into customer_info values (7, '新田', 'nitta', 'nitta@co.jp', 09000000000, 'nittaのおうち', 1234, 1234567, 45, null);
insert into customer_info values (8, 'izumi', 'izumi', 'izumi@co.jp', 09000000000, 'izumiのおうち', 1234, 1234567, 19, null);

insert into inventory_info values (1, 1, 19, '2015-08-15'),
(1, 1, 0, '2015-08-16');


insert into purchase_history values (1, "20150730", 5, 19000, 1, 1);
insert into purchase_history values (2, "20150830", 4, 5000, 1, 3);
insert into purchase_history values (3, "20150830", 2, 4000, 2, 6);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 5000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 5000, 1, 2);
insert into purchase_history values (8, "20150831", 4, 5000, 1, 6);
insert into purchase_history values (1, "20150730", 5, 19000, 1, 1);
insert into purchase_history values (2, "20150830", 4, 5000, 1, 4);
insert into purchase_history values (3, "20150830", 2, 90000, 2, 2);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 5000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 19000, 1, 1);
insert into purchase_history values (8, "20150831", 4, 19000, 1, 6);
insert into purchase_history values (2, "20150830", 4, 19000, 1, 6);
insert into purchase_history values (3, "20150830", 2, 90000, 2, 2);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 19000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 19000, 1, 2);
insert into purchase_history values (8, "20150831", 4, 19000, 1, 6);
insert into purchase_history values (1, "20150730", 5, 19000, 1, 6);
insert into purchase_history values (2, "20150830", 4, 19000, 1, 4);
insert into purchase_history values (3, "20150830", 2, 90000, 2, 1);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 19000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 19000, 1, 1);
insert into purchase_history values (8, "20150831", 4, 19000, 1, 6);
insert into purchase_history values (1, "20150730", 5, 19000, 1, 1);
insert into purchase_history values (2, "20150830", 4, 19000, 1, 3);
insert into purchase_history values (3, "20150830", 2, 90000, 2, 5);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 19000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 5000, 1, 2);
insert into purchase_history values (8, "20150831", 4, 5000, 1, 6);
insert into purchase_history values (1, "20150730", 5, 19000, 1, 1);
insert into purchase_history values (2, "20150830", 4, 5000, 1, 4);
insert into purchase_history values (3, "20150830", 2, 4000, 2, 2);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 5000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 5000, 1, 1);
insert into purchase_history values (8, "20150831", 4, 5000, 1, 6);
insert into purchase_history values (2, "20150830", 4, 90000, 1, 4);
insert into purchase_history values (3, "20150830", 2, 4000, 2, 2);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 5000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 5000, 1, 2);
insert into purchase_history values (8, "20150831", 4, 5000, 1, 6);
insert into purchase_history values (1, "20150730", 5, 19000, 1, 1);
insert into purchase_history values (2, "20150830", 4, 5000, 1, 4);
insert into purchase_history values (3, "20150830", 2, 4000, 2, 1);
insert into purchase_history values (4, "20150831", 1, 6000, 2, 5);
insert into purchase_history values (5, "20150831", 9, 5000, 2, 2);
insert into purchase_history values (6, "20150730", 11, 10000, 1, 3);
insert into purchase_history values (7, "20150830", 5, 5000, 1, 1);
insert into purchase_history values (8, "20150831", 4, 5000, 1, 6);

insert into mail_magazine values("MAILMAGAZINE 一期一会 ７月２２日号",
"こんにちは！一期一会からお知らせです。\\n▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△\\n７月２５日（土） 第３８回隅田川花火大会 開催されます！！\\n花火大会会場に近い浅草店、是非共ご利用くださいませ。\\n\\n浴衣　１日レンタル料金　5000円\\n甚平　１日レンタル料金　4000円\\n\\n▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△\\n\\n近日開催予定花火大会、まだまだありますのでお手軽レンタル一期一会ご利用お待ちしております。\\n\\n……………………………………………………………\\n(c)一期一会\\n\\n一期一会\\nhttp://internousdev-a.com/Ichigoichie/\\n\\nこちらのメールアドレスは発信専用となっておりますので返信できません。\\nご注意ください。"
);
