set names utf8;
set foreign_key_checks=0;
drop database if exists bookmanager09;
create database bookmanager09;
use bookmanager09;


create table categories(
  bookid int(255) not null primary key auto_increment comment '書籍ID',
  booktitle varchar(255) not null comment '書籍名',
  numberofbooks int(255) not null comment '冊数',
  numberofstocks int (255) not null comment '在庫数'
);

/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table user(
  userid varchar(255) not null primary key comment 'ユーザーID',
  password varchar(255) not null comment 'パスワード'
);
/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
insert into users(userid,password) values
("internous","internous01"),
("test","test"),
("takuma.inoue","123"),
("miyuki.harada","123");