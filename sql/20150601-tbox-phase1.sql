set names utf8;
set foreign_key_checks=0;
drop database if exists tbox;
create database if not exists tbox default character set utf8;
use tbox;

/* create tables */

create table administer(
	adminId varchar(10) not null,
	adminPassword varchar(10) not null
);


create table cardCompany(
	cardCompanyId int(2) not null,
	cardCompany varchar(30) not null,
	primary key(cardCompanyId)
);


create table color(
	colorId int(2) not null,
	colorName varchar(30) not null,
	colorImagePath varchar(30) not null,
	primary key(colorId)
);


create table itemInfo(
	itemId int(8) not null auto_increment,
	size varchar(2) not null,
	price int(6) not null,
	stock int(5) not null,
	imagePath varchar(50) not null,
	itemName varchar(60) not null,
	itemDeleteFlag boolean default '0' not null,
	primary key(itemId)
);

create table magazine(
	title varchar(30) not null,
	contents text not null
);


create table orderInfo(
	userId int(10) not null,
	itemId int(8) not null,
	quantity int(1) not null,
	total int(7) not null,
	paymentMethodId int(2) not null,
	cardCompanyId int(2) default 0,
	cardOwner varchar(30),
	expireDate varchar(8),
	cardNumber varchar(16),
	securityCode varchar(4),
	purchaseDate timestamp default current_timestamp not null
);


create table paymentMethod(
	paymentMethodId int(2) not null,
	paymentMethod varchar(30) not null,
	primary key(paymentMethodId)
);


create table shopInfo(
	shopName varchar(30) not null,
	shopAddress varchar(50) not null,
	shopPostal varchar(7) not null
);


create table carts(
	userId int not null,
	cartId int primary key auto_increment,
	itemId int not null,
	quantity int not null default 1,
	foreign key (userId)references openconnect.users(user_id));


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table userInfo(
	userName varchar(20) not null,
	userId int(10) not null auto_increment,
	loginId varchar(16) not null,
	password varchar(16) not null,
	email varchar(100) not null,
	telNumber varchar(12) not null,
	postal varchar(7) not null,
	address varchar(50) not null,
	uniqueID varchar(30),
	userDeleteFlag boolean default '0' not null,
	primary key(userID),
	unique(loginID),
	unique(email)
);


/* Q&Aのテーブル*/
create table QandA(
	id int not null auto_increment,
	lang varchar(3) not null,
	Q text not null,
	A text not null,
	primary key(id)
);


/* Create Foreign Keys */
alter table orderInfo
	add foreign key(cardCompanyId)
	references cardCompany (cardCompanyId)
	on update restrict
	on delete restrict
;


alter table orderInfo
	add foreign key(itemId)
	references itemInfo (itemId)
	on update restrict
	on delete restrict
;


alter table orderInfo
	add foreign key(paymentMethodId)
	references paymentMethod (paymentMethodId)
	on update restrict
	on delete restrict
;


alter table orderInfo
	add foreign key(userId)
	references userInfo (userId)
	on update restrict
	on delete restrict
;


/* 顧客情報 */
insert into userInfo(userName, loginId, password, email, telNumber, postal, address, userDeleteFlag)values
("taro", "yamadataro", "123123123", "yamada@gmail.com", "00011112222", "0001111", "東京都文京区/0-111", 0);

/* 管理者アカウント */
insert into administer(adminId, adminPassword)values
("admin", "123");


/* 商品情報 */
insert into itemInfo(size, price, stock, imagePath, itemName)values
("S", 980, 1000, "1_1.jpg", "よくわからない"),
("S", 980, 1000, "2_1.jpg", "おはよ"),
("S", 980, 1000, "3_1.jpg", "シンプル"),
("S", 980, 1000, "4_1.jpg", "ティー"),
("S", 980, 1000, "5_1.jpg", "セクシー"),
("S", 980, 1000, "6_1.jpg", "マッチョ"),
("S", 980, 1000, "7_1.jpg", "ゆでたまご"),
("S", 980, 1000, "8_1.jpg", "喫煙者"),
("S", 980, 1000, "9_1.jpg", "ハート"),
("S", 980, 1000, "10_1.jpg", "ビリヤード"),
("S", 980, 1000, "11_1.jpg", "カンガルー"),
("S", 980, 1000, "12_1.jpg", "鹿"),
("S", 980, 1000, "13_1.jpg", "ユニコーン"),
("S", 980, 1000, "14_1.jpg", "神様"),
("S", 980, 1000, "15_1.jpg", "かわいい"),
("S", 980, 1000, "16_1.jpg", "葉"),
("S", 980, 1000, "17_1.jpg", "妖怪"),
("S", 980, 1000, "18_1.jpg", "蜂"),
("S", 980, 1000, "19_1.jpg", "金魚"),
("S", 99980, 10, "20_1.jpg", "トムキャット"),
("M", 99980, 10, "20_1.jpg", "トムキャット"),
("L", 99980, 10, "20_1.jpg", "トムキャット"),
("S", 980, 1000, "21_1.jpg", "レッド"),
("S", 980, 1000, "22_1.jpg", "猫");
