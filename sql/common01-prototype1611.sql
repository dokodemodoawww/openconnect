set name utf8;
set foreign_key_checks=0;
drop database if exists openconnect;
create database openconnect;
use openconnect;

create table users(
user_name varchar(50) not null,
password varchar(50) not null,
month varchar(50)
);

insert into users(user_name, password,month) values ("yuyanagura","123","3");
insert into users(user_name, password,month) values ("testuser01","123","3");
insert into users(user_name, password,month) values ("testuser02","123","3");
insert into users(user_name, password,month) values ("testuser03","123","3");
insert into users(user_name, password,month) values ("testuser04","123","3");
insert into users(user_name, password,month) values ("testuser05","123","3");
insert into users(user_name, password,month) values ("testuser06","123","3");
insert into users(user_name, password,month) values ("testuser07","123","3");
insert into users(user_name, password,month) values ("testuser08","123","3");
insert into users(user_name, password,month) values ("testuser09","123","3");
insert into users(user_name, password,month) values ("testuser10","123","3");
insert into users(user_name, password,month) values ("internous","internous","3");



