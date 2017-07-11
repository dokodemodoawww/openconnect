set names utf8;
drop database if exists aquarium;
create database aquarium;
use aquarium;
set foreign_key_checks=0:

/* Drop Tables */
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS orderinformation;
DROP TABLE IF EXISTS shop;
DROP TABLE IF EXISTS administrator;
/* Create Tables */


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
CREATE TABLE user
(
	user_id int NOT NULL AUTO_INCREMENT comment 'ユーザーID',
	login_id varchar(100) NOT NULL UNIQUE comment 'ログインID(メールアドレス)',
	password varchar(32) NOT NULL comment 'パスワード',
	user_name varchar(32) NOT NULL comment '名前',
	user_name_kana varchar(100) NOT NULL comment 'ふりがな',
	tel_number varchar(13) NOT NULL comment '電話番号',
	postal_code varchar(8) NOT NULL comment '郵便番号',
	address varchar(255) NOT NULL comment '住所',
	unique_id varchar(30) comment '固有ID',
	registered_date date comment '登録日',
	renew_date date comment '更新日',
	PRIMARY KEY (user_id)
);
CREATE TABLE ticket
(
	item_id int NOT NULL AUTO_INCREMENT comment '商品ID',
	shop_id int NOT NULL comment '店舗ID',
	item_name varchar(100) NOT NULL comment '商品名',
	unit_price float NOT NULL comment '単価',
	PRIMARY KEY (item_id)
);
CREATE TABLE card
(
	card_id int NOT NULL AUTO_INCREMENT comment 'クレジットID',
	user_id int NOT NULL comment 'ユーザーID',
	card_company varchar(255) NOT NULL comment 'クレジットカード会社名',
	card_number int NOT NULL comment 'カード番号',
	expired_date date NOT NULL comment '有効期限',
	security_code varchar(4) NOT NULL comment 'セキュリティーコード',
	PRIMARY KEY (card_id)
);
CREATE TABLE orderinformation
(
	order_id int NOT NULL AUTO_INCREMENT comment '注文ID',
	user_id int NOT NULL comment 'ユーザーID',
	item_id int NOT NULL comment '商品ID',
	quantity int NOT NULL comment '購入枚数',
	total_amount float NOT NULL comment '合計額',
	payment_method varchar(30) NOT NULL comment '支払い方法',
	card_id int,
	purchase_date timestamp default current_timestamp() comment '購入日',
	PRIMARY KEY (order_id)
);
CREATE TABLE shop
(
	shop_id int NOT NULL AUTO_INCREMENT comment '店舗ID',
	shop_name varchar(100) NOT NULL comment '店舗名',
	shop_address varchar(255) NOT NULL comment '店舗住所',
	shop_postal_code varchar(8) NOT NULL comment '店舗郵便番号',
	PRIMARY KEY (shop_id)
);
CREATE TABLE administrator
(
	admin_id varchar(16) NOT NULL comment '管理者ID',
	admin_password varchar(32) NOT NULL comment '管理者パスワード',
	is_login boolean NOT NULL comment 'ログイン確認',
	PRIMARY KEY (admin_id)
);
/* Create Foreign Keys */

ALTER TABLE ticket
	ADD FOREIGN KEY (shop_id)
	REFERENCES shop (shop_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	;
ALTER TABLE card
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	;
ALTER TABLE orderinformation
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	;
ALTER TABLE orderinformation
	ADD FOREIGN KEY (item_id)
	REFERENCES ticket (item_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	;
ALTER TABLE orderinformation
	ADD FOREIGN KEY (card_id)
	REFERENCES card (card_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
	;

/* 管理者情報登録 */
INSERT INTO administrator(admin_id, admin_password, is_login)
VALUES("test", "admin", false);

/* 店舗情報　*/
INSERT INTO shop(shop_name, shop_address, shop_postal_code)
VALUES("谷the湾", "東京都文京区11-1-1", "001-0001");

/* チケット情報　*/
INSERT INTO ticket(shop_id, item_name, unit_price)
VALUES
(1, "水族館チケット 大人", 2500),
(2, "水族館チケット 子供", 1500);


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
/* 会員情報　*/
INSERT INTO user(login_id, password, user_name, user_name_kana, tel_number, postal_code, address)
VALUES
("test01@email.jp", "test", "東京太郎", "とうきょうたろう", "123-456-789", "022-1234", "東京都大田区11-15-1"),
("test02@email.jp", "test", "東京次郎", "とうきょうじろう", "789-654-321", "022-1234", "東京都文京区1-18-1");

/* クレジットカード情報　*/
INSERT INTO card(user_id, card_company, card_number, expired_date,security_code)
VALUES
(1, "VISA", 123456789, "2015-12-31", "9999"),
(2, "VISA", 987654321, "2016-12-31", "9999");

/* 注文情報　*/
INSERT INTO orderinformation(user_id, item_id, quantity, total_amount, payment_method, card_id, purchase_date)
VALUES
(1, 1, 2, "5000", "クレジットカード", 1, "2015-09-18"),
(1, 2, 3, "6000", "クレジットカード", 1, "2015-09-18"),
(2, 1, 2, "5000", "クレジットカード", 2, "2015-09-22");
