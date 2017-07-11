set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1604;
create database prototype1604;
use prototype1604;

create table user(
	user_id int not null primary key auto_increment,
	user_name varchar(32),
	password varchar(255),
		oauth_id varchar(50),
	oauth_name varchar(50)
	);

insert into user(user_id,user_name,password)values
(1,"taro",123),
(2,"hana",456),
(3,"take",789);