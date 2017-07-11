set names utf8;
set foreign_key_checks=0;
drop database if exists world_travel;
create database world_travel default character set utf8 collate utf8_general_ci;
use world_travel;


create table item_lists(
item_id int primary key not null auto_increment,
item_name varchar(100) unique not null,
item_price int not null,
stock int comment ""
);


create table historys(
user_id varchar(20) not null,
item_id int not null,
item_count int not null,
total_amount int,
user_ip varchar(15),
inquiry int not null,
order_day timestamp not null default current_timestamp
);


create table cart_lists(
user_ip varchar(15) not null comment "",
mac_address varchar(17) not null comment "",
user_id varchar(20) not null comment "",
item_id int not null comment "",
item_count int comment "",
total_amount int comment ""
);

insert into historys(user_id,item_id,item_count,total_amount,user_ip,inquiry) values
('test',1,10,1000000,'192.168.001.140',1111);

insert into cart_lists values
('192.168.001.140','44-8A-5B-A2-E4-FC','test',1,10,1000000);

insert into item_lists values
(1,'ピラミッドを見に行く・エジプト旅行',90000,999999),
(2,'ギャンブルの聖地ラスベガスへ・アメリカ旅行',50000,999999),
(3,'ショッピング＆グルメの祭典ソウルへ・韓国旅行',60000,999999),
(4,'イースター島でモアイ像を見る・チリ旅行',100000,999999),
(5,'台北（タイペイ）の活気ある屋台で食べ歩き!!・台湾旅行',70000,999999),
(6,'ホノルルの綺麗なビーチでまったりバカンス・ハワイ旅行',80000,999999),
(7,'冬の季節でもグアムで海へ!!アメリカ旅行',80000,999999),
(8,'香港で夜景、多彩なエンタテインメントを楽しむ・中国旅行',40000,999999),
(9,'パリで大人の落ち着いた雰囲気を・フランス旅行',90000,999999),
(10,'神々の島、バリ島へ・インドネシア旅行',60000,999999),
(11,'シンガポールでマーライオンを是非!!・シンガポール旅行',10000,999999),
(12,'バンコクにて、美しい極彩色の寺院や王宮の参拝・タイ旅行',30000,999999),
(13,'「永遠の都」ローマをご堪能あれ・イタリア旅行',70000,999999),
(14,'「芸術の都」バルセロナをご堪能あれ・スペイン旅行',60000,999999),
(15,'プーケットで多彩なビーチで飽きさせない・タイ旅行',60000,999999),
(16,'イスタンブールで歴史的な文化遺産に触れる・トルコ旅行',90000,999999),
(17,'サイパンでマリンスポーツ、ゴルフ、ダイビングなど!!・サイパン旅行',80000,999999),
(18,'ロンドンで荘重感ある建物と緑豊かな公園を堪能・イギリス旅行',90000,999999),
(19,'ニューヨークにて自由の女神を生で見よう!!・アメリカ旅行',70000,999999),
(20,'秋葉原にて、アニメ文化堪能・日本旅行',100000,999999);