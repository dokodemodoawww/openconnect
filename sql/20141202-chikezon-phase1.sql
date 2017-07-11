set names utf8;
set foreign_key_checks=0;
drop database if exists chikezon;
create database if not Exists chikezon;
use chikezon;


-- goodsテーブル作成
create table goods(
goods_id int(100) primary key auto_increment comment '商品ID',
goods_name varchar(255) not null comment '商品名',
price int comment '単価',
index(goods_id)
);

-- goods テーブルサンプル挿入 --
insert into goods(goods_id,goods_name,price) values
(1,"肩たたきチケット",1500),
(2,"某ねずみの国片道チケット",5000),
(3,"後楽園で僕と握手チケット",3000),
(4,"世界二周旅行券",20000),
(5,"雪かき体験チケット",5000),
(6,"ニトロサーカスチケット C席",4000),
(7,"黒鉛に導かれ者たちの宴(ダークカーニバル)チケット",1000),
(8,"木村カエレコンサートチケット",100),
(9,"ぐなっしー写真撮影チケット",0),
(10,"10億!!PIG宝くじ",10000);

-- customer_infoテーブル作成
create table customer_info(
customer_id int(100) primary key auto_increment comment '顧客ID',
customer_name varchar(255) not null comment '顧客名',
postcode varchar(255) not null comment '郵便番号',
address varchar(255) not null comment '住所',
telnumber varchar(12) not null comment '電話番号',
mailad varchar(255) unique not null comment 'メールアドレス',
customer_pass varchar(255) not null comment '顧客パスワード',
index(customer_id)
);

-- order_infoテーブル作成
create table order_info(
customer_id int(100) comment '顧客ID',
goods_id int(100) comment '商品ID',
order_count int(100) default 0 comment '注文数',
total_amount int comment '合計金額',
purchaseday timestamp default current_timestamp comment '購入日',
foreign key(customer_id) references customer_info(customer_id),
foreign key(goods_id) references goods(goods_id)
);

