set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1606;
create database prototype1606;

use prototype1606;

create table user(
id int primary key not null auto_increment,
name varchar(255) not null unique,
password varchar(255) not null,
comment varchar(255)
);

insert into user(name, password, comment)values("taro","12345","テスト太郎です");