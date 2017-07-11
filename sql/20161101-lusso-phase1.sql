set name utf8;
set foreign_key_checks=0;
/*"lusso"データベース作成*/
drop database if exists lusso;
create database lusso;
use lusso;

/*@auhter HIDEYA SATO
 * @since 2016/11/15
 * @virsion 1.0
 */

/*アルコールカテゴリテーブル作成*/
create table alcohol_category(
master_id int primary key not null,
category  varchar(15) not null,
resistration_date datetime not null default CURRENT_TIMESTAMP,
updated_date datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


/*メニューテーブル作成*/
create table menu(
menu_id int  primary key not null,
master_id int not null,
alcohol_name varchar(15) not null,
alcohol_img_address text not null,
alcohol_content varchar(50) not null,
food_name varchar(15) not null ,
food_img_address text not null,
food_content varchar(50) not null,
resistration_date datetime not null default CURRENT_TIMESTAMP,
updated_date datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key(master_id) references alcohol_category(master_id)
);

/*クレジットカードテーブル作成*/
create table credit_card(
user_id  int not null,
card_brand varchar(15) not null,
name_e varchar(50) not null,
credit_number varchar(16) not null unique,
security_code int not null,
expiration_day varchar(7) not null,
resistration_date datetime not null default CURRENT_TIMESTAMP,
updated_date datetime not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key(user_id) references openconnect.users(user_id)
);

/*購入テーブル作成*/
create table purchase(
user_id  int not null,
alcohol_name varchar(15) not null,
food_name varchar(15) not null,
delivery_day varchar(10) not null,
purchase_day datetime not null default CURRENT_TIMESTAMP,
credit_number varchar(16) not null,
resistration_date datetime not null default CURRENT_TIMESTAMP,
updated_date datetime not null defaul  t CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
foreign key(user_id) references openconnect.users(user_id)
);


/*アルコールカテゴリへ値挿入*/
insert into alcohol_category(master_id,category)
values(1,"beer"),
(2,"whisky"),
(3,"sake");


/*メニューへ値挿入*/
insert into menu(menu_id,master_id,alcohol_name,alcohol_img_address,alcohol_content,food_name,food_img_address,food_content) values
(1,1,"TRIBUTE","tribute.jpg","delicious","FISH&CHIPS","fish_and_chips.jpg","delicious"),
(2,1,"PROPER JOB","properjob.jpg","delicious","FRESH SALAD","salad.jpg","delicious"),
(3,1,"SPIT FIRE","spitfire.jpg","delicious","NUTS","nuts.jpg","delicious"),
(4,2,"SILKTASSEL","silktassel.jpg","delicious","PASTO SALAMI","pasto_salami.jpg","delicious"),
(5,2,"CHIVAS REGAL","chivasregal.jpg","delicious","VANILLA PUDDING","vanilla_pudding.jpg","delicious"),
(6,2,"GLEN GARIOCH","glen_garioch.jpg","delicious","CIGER","cigar.jpg","delicious"),
(7,3,"HAKKAISAN","hakkaisan.jpg","delicious","CARPACCIO","carpaccio.jpg","delicious"),
(8,3,"KIKUYOI","kikuyoi.jpg","delicious","CLAMS","clams.jpg","delicious"),
(9,3,"KUBOTA","kubota.jpg","delicious","SEA URCHIN","sea_urchin.jpg","delicious");




/*"lusso_americanexpress"データベース作成*/
DROP DATABASE if EXISTS lusso_americanexpress;
CREATE DATABASE lusso_americanexpress;
use lusso_americanexpress;



/*クレジットカードテーブル作成*/
CREATE TABLE credit_card(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
name_e VARCHAR(50) NOT NULL,
credit_number VARCHAR(16) NOT NULL UNIQUE,
security_code int NOT NULL,
id_number int NOT NULL,
credit_limit int NOT NULL,
register_day datetime NOT NULL,
update_day datetime NOT NULL,
delete_flg boolean default false,
expiration_day VARCHAR(7) NOT NULL,
spend int default 0
);


/*クレジットカード情報挿入*/
insert into credit_card(login_id,name_e,credit_number,security_code,id_number,credit_limit,register_day,update_day,delete_flg,expiration_day,spend)values
("d","DDD","1111122222333334","645","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2019-08","20000"),
("e","EEE","1111112222223333","275","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2020-11","20000"),
("f","FFF","1111111222222233","324","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2021-12","20000");









/*"lusso_mastercard"データベース作成*/
DROP DATABASE if EXISTS lusso_mastercard;
CREATE DATABASE lusso_mastercard;
use lusso_mastercard;

/*クレジットカードテーブル作成*/
CREATE TABLE credit_card(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
name_e VARCHAR(50) NOT NULL,
credit_number VARCHAR(16) NOT NULL UNIQUE,
security_code int NOT NULL,
id_number int NOT NULL,
credit_limit int NOT NULL,
register_day datetime NOT NULL,
update_day datetime NOT NULL,
delete_flg boolean default false,
expiration_day VARCHAR(7) NOT NULL,
spend int default 0
);


/*クレジットカード情報挿入*/
insert into credit_card(login_id,name_e,credit_number,security_code,id_number,credit_limit,register_day,update_day,delete_flg,expiration_day,spend)values
("a","AAA","1122334455667788","1324","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2016-12","20000"),
("b","BBB","1112223334445556","1794","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2017-05","20000"),
("c","CCC","1111222233334444","5852","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2018-09","20000");







/*"lusso_visa"データベース作成*/
drop database if exists lusso_visa;
create database lusso_visa;
use lusso_visa;


/*クレジットカードテーブル作成*/
CREATE TABLE credit_card(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
name_e VARCHAR(50) NOT NULL,
credit_number VARCHAR(16) NOT NULL UNIQUE,
security_code int NOT NULL,
id_number int NOT NULL,
credit_limit int NOT NULL,
register_day datetime NOT NULL,
update_day datetime NOT NULL,
delete_flg boolean default false,
expiration_day VARCHAR(7) NOT NULL,
spend int default 0
);


/*クレジットカード情報挿入*/
insert into credit_card(login_id,name_e,credit_number,security_code,id_number,credit_limit,register_day,update_day,delete_flg,expiration_day,spend)values
("g","GGG","1111111122222222","174","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2022-06","20000"),
("h","HHH","1111111112222222","582","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2023-08","20000"),
("i","III","1111111111222222","6415","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2024-08","20000");



