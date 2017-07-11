set names utf8;
set foreign_key_checks=0;
drop database if exists chocotime;
create database chocotime;
use chocotime;

/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
-- user table
create table user(
password varchar(255) comment'パスワード',
name varchar(100) not null comment'会員名',
kana varchar(50) comment'カナ',
post_number varchar(7) comment'郵便番号',
address  varchar(100) comment'住所',
address_2 varchar(50) comment'住所2',
address_3 varchar(100) comment'住所3',
phone_number varchar(13) comment'電話番号',
email_address varchar(100) comment'メールアドレス',
creditcard varchar(4) comment'クレジットカード',
credit_token varchar(255) comment'クレジットトークン',
unique_id varchar(50) comment'固有ID',
oauth_name varchar(50) comment'OAuth名',
registration_date datetime not null comment'登録日',
updated_date datetime not null comment'更新日',
unique(name,email_address),
index(name)
);
/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
-- insert date user
insert into user values("test",
                        "テストユーザー1",
                        "てすとゆーざーいち",
                        "1234567",
                        "東京都",
                        "千代田区",
                        "1234",
                        "00000000000",
                        "test@gmail.com",
                        "1234",
                        "token",
                        "unique_id",
                        "testuser",
                        "2015/01/01",
                        "2015/01/01"
);

insert into user values("test",
                        "テストユーザー2",
                        "てすとゆーざーに",
                        "1234567",
                        "東京都",
                        "千代田区",
                        "1234",
                        "00000000000",
                        "test2@gmail.com",
                        null,
                        null,
                        null,
                        null,
                        "2015/01/01",
                        "2015/01/01"
);

-- item table

create table item(
id int not null primary key auto_increment comment'商品ID',
item_name varchar(100) not null comment'商品名',
price float not null comment'単価',
stock_amount int not null default'0' comment'在庫数',
sales_amount int default'0' comment'売り上げ数',
item_detail text not null comment'商品詳細',
img_path varchar(255) not null comment'イメージファイルパス',
registration_date datetime not null comment'登録日',
flg int not null default'0' comment'削除フラグ',
index(id)
);

-- insert date item table
insert into item values(
	1, "キャメロン",
	1000,
	50,
	50,
	"女子に一番人気！女の子友達と食べるならこれがいい！",
	"choko6.jpg",
	"2016/01/01",
	"0"
);

insert into item values(
	2, "ボンボンショコラ",
	1000,
	50,
	49,
	"老若男女で食べれるのでプレゼントの定番！",
	"choko7.jpg",
	"2016/01/02",
	"0"
);

insert into item values(
	3, "バレンシアの月",
	1000,
	50,
	48,
	"バレンシアで作ったチョコの味を完全再現！",
	"choko8.jpg",
	"2016/01/03",
	"0"
);

insert into item values(
	4, "maQザッハ",
	1000,
	50,
	47,
	"ダイヤ型の珍しいチョコレート！人気ランキング1位のキャメロンが出した新作2つ目！",
	"choko9.jpg",
	"2016/01/04",
	"0"
);

insert into item values(
	5, "コローデル・ブルネッロ",
	1000,
	50,
	46,
	"いろいろな形があるので形で楽しみたいならこれが人気！",
	"choko10.jpg",
	"2016/01/05",
	"0"
);

insert into item values(
	6, "デルレイ",
	1000,
	50,
	45,
	"デルレイが作ったまろやかなハーモ二ーが奏でるしなになっています！",
	"choko11.jpg",
	"2016/01/06",
	"0"
);

insert into item values(
	7, "ハートコック",
	1000,
	50,
	44,
	"パートナーにあげるなら喜んでもらうならこれがいい！",
	"choko12.jpg",
	"2016/01/07",
	"0"
);

insert into item values(
	8, "ペペラッチャ",
	1000,
	50,
	43,
	"心が落ち着いきたいのならこれがいいです！",
	"choko13.jpg",
	"2016/01/08",
	"0"
);

insert into item values(
	9, "ダリォウ",
	1000,
	50,
	42,
	"カカオ成分が十分に含まれているので美容や健康などにはとても効き目があります。少し苦いですが！",
	"choko14.jpg",
	"2016/01/09",
	"0"
);

insert into item values(
	10, "ピエーナマコロニー",
	1000,
	50,
	41,
	"2つの箱にチョコレートが入った！",
	"choko15.jpg",
	"2016/01/10",
	"0"
);

insert into item values(
	11, "ピエール・ランテ",
	1000,
	50,
	40,
	"あのキャメロン・ピィエーロが作ったチョコレートが早くも登場！",
	"choko1.jpg",
	"2016/01/11",
	"0"
);

insert into item values(
	12, "キャスカ",
	1000,
	50,
	39,
	"9種類のチョコレートがそれぞれの味をかもし出し手いるので一つ一つが絶品！",
	"choko2.jpg",
	"2016/01/12",
	"0"
);

insert into item values(
	13, "マイルドカカオ",
	1000,
	50,
	38,
	"有名店のVAIORAが作った本格派でビターな味です！",
	"choko3.jpg",
	"2016/01/13",
	"0"
);

insert into item values(
	14, "ココアマロン",
	1000,
	50,
	37,
	"ココアとマロンの味が融合し相乗効果が舞い上がる！",
	"choko4.jpg",
	"2016/01/14",
	"0"
);

insert into item values(
	15, "ヒストリー",
	1000,
	50,
	36,
	"自分のご褒美にはこれを！",
	"choko5.jpg",
	"2016/01/15",
	"0"
);


-- admim table

create table admin(
id varchar(25)  not null unique comment'管理者ID',
password varchar(255) not null comment'管理者パスワード'
);

-- insert date admin table

insert into admin values("1",
                        "1234"
);

-- history table

create table history(
history_id int not null primary key  auto_increment comment'履歴ID',
user_name varchar(100) not null comment'会員名',
item_id int not null comment'商品ID',
item_name varchar(100) comment'商品名',
price float default'0' comment'単価',
quantity int default'0' comment'数量',
method_of_payment int not null default'0' comment'支払い方法',
purchase_date datetime comment'購入日',
FOREIGN KEY(user_name) REFERENCES user(name) on update cascade on delete cascade,
FOREIGN KEY(item_id)   REFERENCES item(id) on update cascade on delete cascade
);

-- cart table

create table cart(
name varchar(100) not null comment'会員名',
item_id int not null comment'商品ID',
item_name varchar(100) comment'商品名',
price float default'0' comment'単価',
quantity int default'0' comment'数量',
FOREIGN KEY(name) REFERENCES user(name) on update cascade on delete cascade,
FOREIGN KEY(item_id)   REFERENCES item(id) on update cascade on delete cascade
);