set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1608;
create database prototype1608;
use prototype1608;

create table users(
id int primary key not null auto_increment,
username varchar(50) not null,
password varchar(50) not null
);

insert into users(username, password)values("yuyanagura","123");