set names utf8;
drop database if exists gtickets;
create database if not exists gtickets;
use gtickets;
set foreign_key_checks=0;

DROP TABLE IF EXISTS Concert_Hall_info;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS administer;
DROP TABLE IF EXISTS concert_info;
DROP TABLE IF EXISTS order_info;


set foreign_key_checks=0;
/* Create Tables */

CREATE TABLE administer
(
	admin_id varchar(10) NOT NULL,
	admin_pass varchar(10) NOT NULL,
	login boolean NOT NULL
);


CREATE TABLE Concert_Hall_info
(
	hall_id int(3) NOT NULL AUTO_INCREMENT,
	hall_name varchar(20) NOT NULL,
	hall_address varchar(100) NOT NULL,
	latitude double(9,6) NOT NULL,
	longtitude double(9,6) NOT NULL,
	tell_number varchar(11) NOT NULL,
	PRIMARY KEY (hall_id)
);


CREATE TABLE concert_info
(
	concert_id int(3) NOT NULL AUTO_INCREMENT,
	concert_name varchar(50) NOT NULL,
	date date NOT NULL,
	place varchar(100) NOT NULL,
	stock int(6)unsigned NOT NULL,
	unit_price int(5) NOT NULL,
	details text NOT NULL,
	PRIMARY KEY (concert_id)
);


CREATE TABLE order_info
(
	concert_id int(3) NOT NULL,
	quantity int(1) NOT NULL,
	total int(6) NOT NULL,
	-- 1:クレジットカード
	-- 2:銀行振込
	-- 3.代引き
	method int(1) NOT NULL COMMENT '1:クレジットカード
2:銀行振込
3.代引き',
	card_company int(1) COMMENT '1:VISA
2:MASTER
3:JCB
4:AMERICAN EXPRESS',
	card_number bigint(16),
	security_code int(4),
	-- データベースに挿入された日時
	purchase_date timestamp DEFAULT current_timestamp NOT NULL COMMENT 'データベースに挿入された日時',

	e_mail varchar(100) NOT NULL,
	order_number int not null primary key auto_increment
);

CREATE TABLE user_info
(
	user_name varchar(20) NOT NULL,
	phonetic varchar(30) NOT NULL,
	password varchar(16) NOT NULL,
	e_mail varchar(100) NOT NULL,
	tel_number varchar(11) NOT NULL,
	postal int(7) NOT NULL,
	address varchar(50) NOT NULL,
	PRIMARY KEY (e_mail),
	unique_id varchar(30)
);



/* Create Foreign Keys */

ALTER TABLE order_info
	ADD FOREIGN KEY (concert_id)
	REFERENCES concert_info (concert_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



ALTER TABLE order_info
	ADD FOREIGN KEY (e_mail)
	REFERENCES user_info(e_mail)
	on update cascade on delete cascade
;

/* 2017.6改修時：クレジットカード情報テーブルの作成*/
create table credit(
user_id int not null comment 'ユーザーID',
credit_type int not null comment 'クレジットの種類',
credit_number varchar(16) not null comment 'カード番号',
name_e varchar(50) not null comment '姓名（ローマ字）',
security_code varchar(4) not null comment 'セキュリティコード',
expiration_month varchar(2) not null comment '有効期限（月）',
expiration_year varchar(2) not null comment '有効期限（年）',
registration_date timestamp not null default current_timestamp comment '登録日',
updated_date timestamp not null default current_timestamp on update current_timestamp comment '更新日'
);


insert into user_info value('aaa','あああ','aaaaaaaa','aaaaa@yahoo.co.jp','11111111111',1234567, 'aaaaaaaaaaaaaaa', '1');
insert into user_info value('bbb','あべひろし','bbbbbbbb','bbbbb@yahoo.co.jp','11111111111',1234567, 'bbbbbbbbbbbbbbb', '2');
insert into administer value('admin', 'admin', false);
insert into Concert_Hall_info value (1, '東京芸術劇場コンサートホール', '東京都豊島区西池袋1-8-1', 35.72949, 139.708075, '0353912111' );
insert into Concert_Hall_info value (2, 'TOKYO DOME CITY HALL', '東京都文京区後楽1−3−61', 35.704663, 139.753342, '0358009999' );
insert into Concert_Hall_info value (3, '東京GLOBE座', '東京都新宿区百人町3−1−2', 35.704764, 139.700355, '0333664020' );
insert into Concert_Hall_info value (4, '文京シビックホール', '東京都文京区春日1−16−21', 35.708034, 139.752475, '0358031100' );
insert into concert_info value(1, 'ドラゴンクエスト', 20150831, '東京芸術劇場コンサートホール', 1000, 7000, '『ドラゴンクエストの世界 ～すぎやまこういちと東京フィルハーモニー交響楽団～');
insert into concert_info value(2, '僕の私の塊魂', 20150916, 'TOKYO DOME CITY HALL', 1000, 6500, '『みんな大好き塊魂』の「塊オンザスウィング」');
insert into concert_info value(3, 'チョコボの不思議なダンジョン', 20150926, '東京GLOBE座', 1000, 6000, 'みんなでせーの、「「「「「ブラボー！」」」」」');
insert into concert_info value(4, 'ファイナルファンタジー', 20150930, '文京シビックホール', 1000, 7000, 'FF5,8,9,13をロンドン交響楽団が来日演奏！');
