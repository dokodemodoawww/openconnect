set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1511u2;
create database prototype1511u2;
use prototype1511u2;

create table user(
id int not null primary key auto_increment,
name varchar(50),
email varchar(100) unique,
password varchar(100));

registration_date datetime;
update_date datetime;



insert into user values(1,"テストユーザー",
						"test@gmail.com",
						"test");

insert into user values(2,"テストユーザー2",
						"test2@gmail.com",
						"test");

insert into user values(3,"テストユーザー3",
						"test3@gmail.com",
						"test");

