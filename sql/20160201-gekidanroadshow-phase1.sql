set names utf8;
set foreign_key_checks=0;
drop database if exists gekidanroadshow;
create database gekidanroadshow;
use gekidanroadshow;


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table user(
id int not null auto_increment comment'',
user_id varchar(25) unique comment'',
user_name varchar(255) comment'',
password varchar(255) comment'',
user_kana varchar(255) comment'',
gender enum('male','female') comment'',
birthday date comment'',
email varchar(100) comment'',
credit_number varchar(4) comment'',
credit_token varchar(255) comment'',
oauth_id varchar(50) comment'',
oauth_name varchar(50) comment'',
registration_date datetime comment'',
updated_date datetime comment'',
postal_code varchar(8) comment'',
address varchar(100) comment'',
cell_number varchar(15) comment'',
primary key(id) comment''
);

create table site(
id int(10) NOT NULL AUTO_INCREMENT comment'',
name varchar(50) comment'',
url varchar(255) comment'',
PRIMARY KEY (id) comment''
);

create table admin(
id int(11) not null auto_increment comment'',
admin_id varchar(25) unique comment'',
admin_pass varchar(255) not null comment'',
primary key(id) comment''
);

-- tables
create table ticket(
ticket_id int not null primary key auto_increment comment'',
ticket_name varchar(100) not null comment'',
grade enum('S','A') not null comment'',
price int comment'',
bought_limit int comment'',
img varchar(100) comment''
);

create table order_history(
id int not null comment'',
order_id int not null primary key auto_increment comment'',
user_id varchar(25) comment'',
ticket_id int not null comment'',
lot int comment'',
order_date datetime comment'',
go_date datetime comment'',
foreign key(user_id) references user(user_id),
foreign key(ticket_id) references ticket(ticket_id)
);

create table temp(
id int not null auto_increment comment'',
user_id varchar(25) unique comment'',
user_name varchar(255) comment'',
password varchar(255) comment'',
user_kana varchar(255) comment'',
gender enum('male','female') comment'',
birthday date comment'',
email varchar(100) comment'',
credit_number varchar(4) comment'',
credit_fullnumber varchar(16) comment'',
credit_token varchar(255) comment'',
oauth_id varchar(50) comment'',
oauth_name varchar(50) comment'',
registration_date datetime comment'',
updated_date datetime comment'',
postal_code varchar(8) comment'',
address varchar(100) comment'',
cell_number varchar(15) comment'',
security_code varchar(4) comment'',
credit_name varchar(100) comment'',
credit_limit varchar(100) comment'',
primary key(id) comment''
);

-- ticket table insert
insert into ticket
(ticket_id,ticket_name,grade,price,bought_limit,img)values
(1,'les miserables','S',8000,150,'./img/LesMiserable01.jpg'),
(2,'les miserables','A',6000,300,'./img/LesMiserable01.jpg'),
(3,'phantom of opera','S',36000,150,'./img/ThePhantomOfTheOpera02.jpg'),
(4,'phantom of opera','A',25000,300,'./img/ThePhantomOfTheOpera02.jpg'),
(5,'cats','S',9000,150,'./img/CATS01.jpg'),
(6,'cats','A',6000,300,'./img/CATS01.jpg'),
(7,'弱虫ペダル','S',11000,150,'./img/yowamushipedaru01.jpg'),
(8,'弱虫ペダル','A',8500,300,'./img/yowamushipedaru01.jpg'),
(9,'lion king','S',9000,150,'./img/LionKing01.jpeg'),
(10,'lion king','A',6500,300,'./img/LionKing01.jpeg');

insert into admin
(admin_id,admin_pass)values
('1','admin01');
