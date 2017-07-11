set names utf8;
set foreign_key_checks=0;
drop database if exists ticket;
create database if not exists ticket;
use ticket;


drop table if exists ticket_data;
create table ticket_data(
id int not null primary key auto_increment,
day date not null,
game_name varchar(255) unique not null,
price int not null,
stock int not null
);


drop table if exists users;
create table users(
id int not null primary key auto_increment,
name varchar(255) not null,
mail_adress varchar(255) not null,
seibetu enum('man','woman') not null,
birthday date not null,
user_id varchar(255) unique not null,
user_pass varchar(255) not null
);



drop table if exists cart;
create table cart(
session_ID varchar(255) not null,
ticket_name varchar(255) not null,
sheets_number int(11) not null,
price int(11) not null,
total_price int(11) not null
);

drop table if exists purchase;
create table purchase(
name varchar(255),
ticket varchar(255),
sheets int,
total_price int,
foreign key(name)references users(user_id),
foreign key(ticket)references ticket_data(game_name)
);


insert into ticket_data(id,day,game_name,price,stock)
values(1,20150301,"日本代表対アルゼンチン代表",6000,30);
insert into ticket_data(id,day,game_name,price,stock)
values(2,20150301,"日本代表対ヨルダン代表",3000,80);
insert into ticket_data(id,day,game_name,price,stock)
values(3,20150301,"日本代表対オランダ代表",4000,50);
insert into ticket_data(id,day,game_name,price,stock)
values(4,20150301,"日本代表対スペイン代表",5000,40);
insert into ticket_data(id,day,game_name,price,stock)
values(5,20150301,"日本代表対ブラジル代表",7000,30);
