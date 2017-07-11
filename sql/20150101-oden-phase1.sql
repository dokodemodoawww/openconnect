set names utf8;
set foreign_key_checks=0;
drop database if exists oden;
create database oden;
use oden;



/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table user_log(
id int(99) primary key auto_increment comment '顧客ID',
user_name varchar(255) unique not null comment '顧客名',
password varchar(255) not null comment '顧客パスワード'
);
insert into user_log(id,user_name,password)value(1,"test","pass");

drop table if exists item;
create table item(
gazou varchar(255) primary key,
Item_name varchar(255) unique not null comment '商品名',
price int(255) not null comment '単価',
setumei varchar(255) not null
);

load data infile "20150101-oden-phase1-a-item.csv" into table item fields terminated by ',' enclosed by '"';

insert into item(gazou,Item_name,Price,Setumei)value
("img/motikin.png","餅巾着",1600,"出汁がしみた巾着と餅のハーモニーは最高！！");
("img/atuage.jpg","厚揚げ",2200,"食べ応えのある厚揚げを是非ご賞味ください！！");
("img/daikon.jpg","大根",500,"おでんと言えばこれ！！出汁のしみた大根がココロを癒します");
("img/tikuwabu.jpg","ちくわぶ",2000,"やさしい味で、他の種とも愛称抜群！！おでん界のサポート役");
("img/tamago.jpg","たまご",800,"秘伝の出汁につけたタマゴは、絶品の味。あなたを虜にして逃さない！！");
("img/konnyaku03.jpg","こんにゃく",600,"プルプル感が幅広い世代で支持！！あなたも支持者になりませんか？");
("img/hanpen.jpg","はんぺん",1500,"フワフロ感が、夢見心地にさせてくれるおでん界のアイドル的存在！！");
("img/gyusuji.jpg","牛すじ",2000,"肉と出しのハーモニーは絶品！！夜のお供に是非１ついかがですか？");
("img/tukune.jpg","つくね",2000,"大根との愛抜群称!!厳選した鶏肉をご賞味ください");
("img/image041.png","つみれ",1800,"魚肉と出汁の最強の組み合わせ！！");
("img/pic_ganmo01_03_l.jpg","がんもどき",600,"出汁が染みたガンモドキは、お酒のお伴に最高！！");
("img/brand_dish_image_370.jpg","白滝",400,"おでん界の脇役的存在ですが、はずすに外せないやつ他の種とも愛称抜群！！");

drop table if exists GoCartDTO;
create table GoCartDTO(user_name varchar(255) not null, item_name varchar(255) not null,price int(255) not null,kazu int(255) not null);
