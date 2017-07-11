set names utf8;
set foreign_key_checks=0;
drop database if exists lapoupee;
create database if not exists lapoupee;
use lapoupee;


create table temp(
temp_id int primary key auto_increment,
customer_name varchar(50),
customer_pass varchar(25),
mailaddress  varchar(50) unique not null,
postcode  varchar(7),
address  varchar(255),
tellnumber varchar(12),
housenumber varchar(100),
register_date timestamp default current_timestamp()
);

create table if not exists goods(
goods_id int(10) auto_increment,
goods_name varchar(100) unique not null,
stock int(4),
unit_price int(10),
primary key(goods_id)
);

/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table if not exists customer_info(
customer_id bigint(16) not null auto_increment,
customer_name varchar(50) not null,
customer_pass varchar(25) not null,
mailaddress  varchar(50) unique not null,
postcode  varchar(7) not null,
address  varchar(255) not null,
tellnumber varchar(12) not null,
housenumber varchar(100),
register_date timestamp default current_timestamp(),
primary key(customer_id)
);

create table if not exists order_info(
customer_id bigint(16) not null,
goods_id int(10) not null,
order_quantity int(3) not null,
total_amount int(10) not null,
pay_mathod int(1) not null,
credit_company int(1),
credit_number bigint(16),
con_set int(1),
bank_set int(1),
purchaseday timestamp default current_timestamp(),
foreign key(goods_id) references goods(goods_id)
);

create table if not exists cart(
temporary_id varchar(50) not null,
goods_name varchar(100) not null,
sales_count int(10) not null,
unit_price int(10) not null,
total_amount int(10) not null
);

alter table cart modify column total_amount bigint not null;

insert into goods(goods_name,stock,unit_price)values
("少年冒険者",50,6000),
("冒険者",80,5000),
("騎士",80,6000),
("魔法使い",60,3000),
("僧侶",60,7000),
("巫女",30,4000),
("ハーピィ",30,8000),
("妖精",30,6000),
("アラクネ",60,7000),
("デーモン",20,10000),
("デーモンロッド",60,5000),
("悪の魔法少女",30,8000),
("魔界騎士",50,9000),
("サイクロプス",60,8000),
("影",40,20000);

insert into customer_info(customer_name,customer_pass,mailaddress,postcode,address,tellnumber,housenumber)values
("ikeda","ikeda123","ikeda@ikeda.co.jp","1234567","東京都八王子市xxx","09012345678","1-1-1"),
("kuriya","kuriya","kuriya@kuriya.co.jp","1234567","東京都xxx","09012345678","1-1-1"),
("hosoya","hosoya","hosoya@hosoya.co.jp","1234567","東京都xxx","09012345678","1-1-1"),
("wada","wada","wada@wada.co.jp","1234567","東京都xxx","09012345678","1-1-1"),
("mito","mito","mito@mito.co.jp","1234567","東京都八王子市xxx","09012345678","1-1-1");
