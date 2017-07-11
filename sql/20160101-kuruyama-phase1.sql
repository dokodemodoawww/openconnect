set names utf8;
set foreign_key_checks=0;
drop database if exists kuruyama;
create database if not exists kuruyama;
use kuruyama;


drop table if exists ramen_items;
create table ramen_items (

item_id int primary key not null auto_increment,

item_name varchar(100) not null,

explanation varchar(100) not null,

category enum('ramen','topping') not null,

price int not null,

item_stock int not null,

img_path varchar(255) not null
);

/***************************
 * ramenデータベース 1:商品情報 2:購入履歴 3:カート
 **************************/
insert into ramen_items values(1,'しょうゆラーメン','醤油ベースのラーメン','ramen',500,10,'img/しょうゆラーメン.jpg');
insert into ramen_items values(2,'塩ラーメン','塩ベースのラーメン','ramen',600,10,'img/塩ラーメン.jpg');
insert into ramen_items values(3,'とんこつラーメン','とんこつベースのラーメン','ramen',700,10,'img/とんこつラーメン.jpg');
insert into ramen_items values(4,'味噌ラーメン','味噌ベースのラーメン','ramen',400,20,'img/味噌ラーメン.jpg');
insert into ramen_items values(5,'メンマ','やわらかい塩蔵メンマ','topping',50,200,'img/メンマ.jpg');
insert into ramen_items values(6,'チャーシュー','3日間煮込んだチャーシュー','topping',100,100,'img/チャーシュー.jpg');
insert into ramen_items values(7,'海苔','パリッとした焼海苔','topping',50,300,'img/海苔.jpg');
insert into ramen_items values(8,'味玉','しっかりと味の滲みこんだ味玉','topping',100,100,'img/味玉.jpg');
insert into ramen_items values(9,'レモンスライス','レモンスライス','topping',100,100,'img/レモンスライス.jpg');
insert into ramen_items values(10,'MOUNTもやし','もやし','topping',100,100,'img/もやし.jpg');
insert into ramen_items values(11,'コーン','コーンです','topping',1000,100,'img/コーン.jpg');
insert into ramen_items values(12,'DEATHラーメン','辛いです','ramen',600,100,'img/DEATHラーメン.jpg');
insert into ramen_items values(13,'ミルクラーメン','甘いです','ramen',600,100,'img/ミルクラーメン.jpg');
insert into ramen_items values(14,'顔ラーメン','顔です','ramen',500,100,'img/顔ラーメン.jpg');
insert into ramen_items values(15,'ラーメンバーガー','アメリカ産','ramen',500,100,'img/ラーメンバーガー.jpg');
insert into ramen_items values(16,'MEGAチャーシューメン','まるごと乗せました','ramen',700,100,'img/MEGAチャーシューメン.jpg');
insert into ramen_items values(17,'ダイエッターラーメン','カロリー0%','ramen',1100,100,'img/ダイエッターラーメン.jpg');



drop table if exists history;
create table history(

sales_id int primary key not null auto_increment,

id int not null,

item_name varchar(100),

number_of_items int not null,

purchase_date datetime not null,

postal_code varchar(8),

address varchar(100)
);
insert into history values
(1,1,"しょうゆラーメン",1,"2016-03-14 01:00:00","1111111","東京都文京区湯島1-1-1"),
(2,1,"塩ラーメン",2,"2016-03-15 01:00:00","1111111","東京都文京区湯島1-1-1"),
(3,3,"しょうゆラーメン",3,"2016-03-16 01:00:00","1111113","東京都文京区湯島1-1-3"),
(4,3,"塩ラーメン",2,"2016-03-16 01:00:00","1111113","東京都文京区湯島1-1-3"),
(5,6,"とんこつラーメン",1,"2016-03-17 01:00:00","1111116","東京都文京区湯島1-1-6"),
(6,6,"味噌ラーメン",1,"2016-03-17 01:00:00","1111116","東京都文京区湯島1-1-6");


drop table if exists cart;
create table cart(

cart_id int primary key not null auto_increment,

id int not null,

item_id int not null,

number_of_items int not null

);

drop table if exists temp;
create table temp(
temp_id int primary key auto_increment,
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
);
