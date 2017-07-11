set names utf8;
set foreign_key_checks=0;
DROP database if EXISTS samurai;
CREATE database if not exists samurai;
use samurai;


CREATE TABLE product(
user_id int not null comment 'ユーザーID',
title varchar(30) not null comment 'タイトル',
product_img_pass varchar(255) not null comment 'コーディネート画像のパス'
);



CREATE TABLE cart(
user_id int not null comment 'ユーザーID',
item_id int not null comment 'アイテムID',

lot int comment '購入数'
);


CREATE TABLE admin(
admin_name varchar(20) not null primary key comment '管理者名',
admin_password varchar(20) not null comment '管理者パスワード'
);

CREATE TABLE order_history(
user_id int not null comment 'ユーザーID',
item_id int not null comment 'アイテムID',
order_lot int not null comment '購入数',
order_date date not null comment '購入日'
);
/*-----------------ここからインサート文-----------------*/

insert into Product(user_id,title,product_img_pass)values
(1,"　　　　侍傘　　　　　　　　&yen;5000(税抜き)","samuraikasa.jpg"),
(2,"　　　　侍ヅラ　　　　　　　&yen;3000(税抜き)","samuraidura.jpg"),
(3,"　　　　侍着物　　　　　　　&yen;10000(税抜き)","samuraikimono.jpg"),
(4,"　　　　侍箸　　　　　　　　&yen;3000(税抜き)","samuraihasi.jpg"),
(5,"　　　　侍鉢巻　　　　　　　&yen;2000(税抜き)","hatimaki.jpg");

insert into cart(user_id,item_id,lot)values
(1,1,1),(1,2,1);


insert into admin(admin_name,admin_password)values("admin","123");

insert into order_history(user_id,item_id,order_lot,order_date)values(1,1,1,cast('2016-08-02' as date));