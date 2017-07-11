set name utf8;
set foreign_key_checks=0;
drop database if exists prototype1603;
create database prototype1603;
use prototype1603;

create table user(
	id int not null primary key auto_increment,
	name varchar(32),
	email varchar(255),
	password varchar(255),
    uniqueId varchar(50),
	oauthName varchar(15)
);

insert into user values("1","taro","taro@gmail.com","123","",""),
("2","jiro","jiro@gmail.com","123","",""),
("3","saburo","saburo@gmail.com","123","",""),
("4","shiro","shiro@gmail.com","123","","");


create database country;
use country

create table temperature(
country varchar(32),
month int(32),
averagetemperature float(32));

insert into temperature(
country,month,averagetemperature)
values("japan","1","6"),("japan","2","6"),("japan","3","9"),("japan","4","14.5"),("japan","5","19"),("japan","6","22"),("japan","7","26"),("japan","8","22.5"),("japan","9","24.5"),("japan","10","18.5"),("japan","11","13.5"),("japan","12","8.5"),
("china","1","15"),("china","2","15.5"),("china","3","17.5"),("china","4","21"),("china","5","25.5"),("china","6","27"),("china","7","27.5"),("china","8","28.5"),("china","9","27.5"),("china","10","24.5"),("china","11","21"),("china","12","18"),
("india","1","13.5"),("india","2","16.5"), ("india","3","22"), ("india","4","28"), ("india","5","33"), ("india","6","33.5"), ("india","7","31"), ("india","8","30"), ("india","9","29"), ("india","10","26"), ("india","11","19.5"), ("india","12","15");
