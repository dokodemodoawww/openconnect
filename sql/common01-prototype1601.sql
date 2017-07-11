set name utf8;
set foreign_key_checks=0;
drop database if exists struts2;
create database struts2;
use struts2;

create table login_table(
id varchar(255),
password varchar(255)
);

insert into login_table values("test","test");
insert into login_table values("taro","123");
insert into login_table values("jiro","123");
insert into login_table values("hanako","123");

CREATE TABLE struts2.user

(
    user_id                     INT auto_increment,
    password                    VARCHAR(255),
    user_name                   VARCHAR(50) NOT NULL,
    name_kana                   VARCHAR(50),
    mail_adress                 VARCHAR(100),
    credit_number               VARCHAR(4),
    token                       VARCHAR(255),
    unique_id                   VARCHAR(50),
    oauth_name                  VARCHAR(50),
    registration_date           DATETIME NOT NULL,
    update_date                 DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id)
);