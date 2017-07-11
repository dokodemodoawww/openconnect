set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1512u2;
create database prototype1512u2;
use prototype1512u2;


create table user(
id int not null primary key auto_increment,
user varchar(100),
password varchar(255),
oauth_id varchar(50),
oauth_name varchar(15)
);


insert into user value
(1,"田部1","tabe1","",""),
(2,"田部2","tabe2","",""),
(3,"田部3","tabe3","","");
