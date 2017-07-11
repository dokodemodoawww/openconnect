set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1509;
create database if not exists prototype1509;
use prototype1509;

drop table if exists login_table;
drop table if exists member_table;

create table login_table
(
    id varchar(255) binary not null,
    password varchar(255) binary not null,
    unique(id)
);

create table member_table
(
    id int(11) not null auto_increment,
    name varchar(255) binary not null,
    telnumber varchar(255) binary not null,
    email varchar(255) binary not null,
    primary key(id)
);