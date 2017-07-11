set names utf8;
drop database if exists live;
create database if not exists live;
use live;
set foreign_key_checks=0;

drop table if exists ticket;
create table ticket (
ticket_id int(10) not null primary Key auto_increment,
ticket_name varchar(255) not null,
artist_name varchar(255) not null,
day date not null,
detail text not null,
stock int(10) not null,
unit_price int(10) not null
);


drop table if exists user;
create table user (  /* ユーザーのテーブルを作る */
user_id int not null auto_increment,  /* ユーザーに番号を割り振る、自動連番 */
password varchar(255) not null comment'パスワード' ,/* ユーザーのログイン用パスワード */
name varchar(255) comment'名前', /* ユーザー名 */
name_f varchar(255) comment'カナ',/* ユーザー名(ふりがな) */
postal varchar(255) not null comment'郵便番号',/*郵便番号*/
address varchar(255) not null comment'住所',/*住所*/
tel_number varchar(255) not null comment'電話番号',/*電話番号*/
email varchar(255) not null unique comment'メールアドレス',/*メールアドレス*/
sex varchar(10) not null comment'性別',/*性別*/
birthday date not null comment'生年月日',/*生年月日*/
handle_name varchar(16) comment'ハンドルネーム',
register_day datetime not null comment'登録日',/*登録日*/
update_day datetime not null comment'更新日',/*更新日*/
userdel_flg boolean not null default FALSE comment'退会フラグ',/*退会フラグ*/
login_flg boolean not null default FALSE comment'',/*ログインフラグ*/
user_flg int not null comment'ユーザーを判別するフラグ',/*ユーザーを判別するフラグ 1.一般ユーザー 2.管理者 3.テストユーザー 4.出品者*/
PRIMARY KEY (user_id)  comment'IDの重複禁止'/* idの重複、null禁止 */
);

drop table if exists order_info;
create table order_info (
customer_id int(10) not null　comment'',
foreign key(customer_id) references customer_info(customer_id)
ticket_id int(10) not null comment'チケットID',
order_quantity int(10) not null comment'注文数',
total_amount bigint(19) not null comment'総量',
pay_method int(1) not null comment'支払い方法',
credit_company int(1) not null comment'クレジットカード会社',
credit_number bigint(16) not null comment'クレジットカード番号',
name varchar(20) not null comment'名前',
security_code int(4) not null comment'セキュリティーコード',
shop_number int(1) not null comment'店番',
random_number varchar(13) not null comment'ランダム番号',
bank_number int(4) not null comment'銀行番号',
cash_on_delivery int(1) not null comment'代引き',
purchaseday timestamp not null comment'購入日'
);


drop table if exists history;
create table history(
temporary_id varchar(100) not null comment'仮ID',
ticket_name varchar(255) not null comment'チケットネーム',
artist_name varchar(255) not null comment'アーティスト名',
day date not null comment'日',
sales_count int(3) not null comment'売り上げ',
unit_price int(10) not null comment'団体価格',
total_amount int(100) not null　comment'総量'
);

drop table if exists administrator;
create table administrator(
admin_id varchar(25) not null comment'管理ID',
admin_pass varchar(25) not null　comment'管理パスワード'
);

insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('ラブライブ  Fan Meeting Tour 2015','μ.s','2015-07-25','あなたの街でラブライブ！',100,5000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('KTM TOUR 2015','ケツメイシ','2015-07-26',' シモネティーナと4人の賢者 失われた聖水を取り戻せ',100,6000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('UVERworld LIVE TOUR 2015','UVERworld','2015-07-28','騒げ！国立を揺らせ！！',100,10000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('きゃりーぱみゅぱみゅ JAPAN HALL TOUR Crazy Party Night 2015','きゃりーぱみゅぱみゅ','2015-07-29','乙女の心をくすぐるのはあなた。',100,8500);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('ラブライブ  Fan Meeting Tour 2015','μ.s','2015-07-25','あなたの街でラブライブ！',100,5000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('KTM TOUR 2015','ケツメイシ','2015-07-26',' シモネティーナと4人の賢者 失われた聖水を取り戻せ',100,6000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('UVERworld LIVE TOUR 2015','UVERworld','2015-07-28','騒げ！国立を揺らせ！！',100,10000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('きゃりーぱみゅぱみゅ JAPAN HALL TOUR Crazy Party Night 2015','きゃりーぱみゅぱみゅ','2015-07-29','乙女の心をくすぐるのはあなた。',100,8500);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('ラブライブ  Fan Meeting Tour 2015','μ.s','2015-07-25','あなたの街でラブライブ！',100,5000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('KTM TOUR 2015','ケツメイシ','2015-07-26',' シモネティーナと4人の賢者 失われた聖水を取り戻せ',100,6000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('UVERworld LIVE TOUR 2015','UVERworld','2015-07-28','騒げ！国立を揺らせ！！',100,10000);
insert into ticket(ticket_name,artist_name,day,detail,stock,unit_price)
values('きゃりーぱみゅぱみゅ JAPAN HALL TOUR Crazy Party Night 2015','きゃりーぱみゅぱみゅ','2015-07-29','乙女の心をくすぐるのはあなた。',100,8500);



insert into customer_info(
customer_name,customer_pass,mail_address,postcode,address1,address2,tel_number
)
values(
'Testtest','0214','aaa@','1820024','東京都調布市布田','１２３４番地','00000000000'
);
insert into customer_info(
customer_name,customer_pass,mail_address,postcode,address1,address2,tel_number
)
values(
'suzuki','1234','aaa@co.jp','1300026','東京都墨田区両国','５６７８番地','00000000000'
);

insert into customer_info(
customer_name,customer_pass,mail_address,postcode,address1,address2,tel_number
)
values(
'oki','0000','bbb@co.jp','1440034','東京都大田区西糀谷','７６５４番地','00000000000'
);
insert into order_info(
customer_id,ticket_id,order_quantity,total_amount,pay_method,credit_company,credit_number,name,security_code,shop_number,random_number,bank_number,cash_on_delivery,purchaseday
)
values(1,1,1,5000,2,1,1111111111111111111,"20",0000,1,"13",0004,0,'2015-06-04 13:06:00'
);

insert into history(
temporary_id,ticket_name,artist_name,day,sales_count,unit_price,total_amount
)
values("1","Mr.Children STADIUM TOUR 2015","Mr.Children","2015-07-14",1,12000,12000);

insert into history(
temporary_id,ticket_name,artist_name,day,sales_count,unit_price,total_amount
)
values("1","aiko Love Like Rock vol.7","aiko","2015-07-16",2,8000,16000);

insert into history(
temporary_id,ticket_name,artist_name,day,sales_count,unit_price,total_amount
)
values("1","KOBUKURO LIVE TOUR","コブクロ","2015-07-18",4,6000,24000
);

insert into administrator(
admin_id,admin_pass
)
values("internousdev","internous01"
);

