set names utf8;set foreign_key_checks=0;drop database if exists tourticket;create database if not exists tourticket;use tourticket;drop table if exists ticket;create table ticket(ticket_id int(11) primary key auto_increment comment '商品ID',ticket_name varchar(255) unique comment '商品名',price int(14) comment '価格',stock int(14) comment '在庫') comment='商品情報テーブル';/************************************************************ 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  *************************************************************/drop table if exists user_info;create table user_info(id int(11) Primary key auto_increment comment 'アカウント番号',user_id varchar(255) unique comment 'ユーザーID',user_pass varchar(255) comment 'ユーザーPASS',last_name varchar(255) comment '苗字',first_name varchar(255) comment '名前',user_mail varchar(255) comment 'メールアドレス',gender enum('man','woman') comment '性別',birthday varchar(255) comment '生年月日',user_ip varchar(255) comment 'ユーザーIP',register_date timestamp comment '登録日時',update_date timestamp DEFAULT current_timestamp on update current_timestamp comment '更新日時',delete_date timestamp comment '退会日時') comment='会員情報テーブル';/************************************************************ 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  *************************************************************/drop table if exists user_address;create table user_address(user_id varchar(255) unique comment 'ユーザーID',zipcode varchar(255) comment '郵便番号',prefecture varchar(255) comment '都道府県',citytown varchar(255) comment '市区町村',house_number varchar(255) comment '番地') comment='顧客住所情報テーブル';drop table if exists cart;create table cart(user_ip varchar(255) comment 'ユーザーIP',mac_address varchar(255) comment 'MACアドレス',user_id varchar(255) comment 'ユーザーID',ticket_id int(11) comment '商品ID',ticket_name varchar(255) comment '商品名',ticket_count int(14) comment '購入枚数',total_amount int(14) comment '合計金額',token int(14) comment '識別用トークン') comment='カート情報テーブル';drop table if exists history;create table if not exists history(user_id varchar(255) comment 'ユーザーID',ticket_id int(11) comment '商品ID',ticket_count int(14) comment '購入枚数',total_amount int(14) comment '合計金額',user_ip varchar(255) comment 'ユーザーIP',order_day timestamp DEFAULT current_timestamp comment '購入確定日時',delete_day timestamp comment '購入履歴削除日時') comment='購入情報テーブル';INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(1,"南極でオーロラ感動ツアー ７泊８日",300000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(2,"ペルーの秘境！マチュピチュを散歩しよう！ ５泊６日",200000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(3,"エジプトでミイラ発掘体験 ８泊９日",350000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(4,"ウユニ塩湖、鏡の湖でラブラブツアー ６泊７日",200000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(5,"フランスでワインとチーズ食べ歩き ４泊５日",140000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(6,"アマゾン川でピラニア釣り ５泊６日",250000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(7,"リオでサンバカーニバル ６泊７日",300000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(8,"カンボジアアンコールワット探検隊 ４泊５日",250000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(9,"インドでカレー屋１０店制覇の旅！ ７泊８日",180000,5000);INSERT INTO ticket(ticket_id,ticket_name,price,stock)VALUES(10,"K－POPの本場でアイドルに会おう ３泊４日",190000,5000);