set name utf8;
set foreign_key_checks=0;
drop database if exists collegemaster;
create database collegemaster;
use collegemaster;

create table projects(
team varchar(255),
developed_year varchar(4),
developed_month varchar(2),
project_title varchar(255),
url varchar(255)
);


/*
insert into projects values
(
"201407<201407月生>",
"2014",
"07",
"某中小企業向け 書籍管理サイト［bookmanager07]",
"http://www.internousdev.com/bookmanager07/"
),
(
"201407<201407月生>",
"2014",
"08",
"某ショッピングサイト［shop]",
"http://www.internousdev.com/shop/"
),
(
"201408<201408月生>",
"2014",
"07",
"某中小企業向け 書籍管理サイト［bookmanager07]",
"http://www.internousdev.com/bookmanager07/"
),
*/