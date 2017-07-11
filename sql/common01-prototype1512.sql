set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1512;
create database prototype1512;
use prototype1512;

create table user(
id int not null primary key auto_increment,
user varchar(100),
password varchar(255),
oauth_id varchar(50),
oauth_name varchar(15)
);

