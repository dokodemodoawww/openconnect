set name utf8;
set foreign_key_checks=0;
drop database if exists prototype201411;
create database prototype201411;
use prototype201411;

drop table if exists ec_prototype;
drop table if exists proto;

create table if not exists login(
username varchar(100),
userId varchar(255),
password varchar(255)
);

insert into login values('aaa','aaa','1234');
insert into login values('bbb','bbb','1234');
insert into login values('ccc','ddd','1234');
insert into login values('ddd','ddd','1234');



create table if not exists proto(
id int,
name varchar(100),
goods varchar(100),
price int,
stock int
);

insert into proto(id,name,goods,price,stock)
values(1,'kuriya','book',100,3);

insert into proto(id,name,goods,price,stock)
values(2,'hosoya','sake',6000,33);

insert into proto(id,name,goods,price,stock)
values(3,'ikeda','book',100,3);

insert into proto(id,name,goods,price,stock)
values(4,'wada','vegitable',4000,30);

insert into proto(id,name,goods,price,stock)
values(5,'kishi','car',50000,29);
