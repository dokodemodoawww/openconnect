set names utf8;
set foreign_key_checks=0;
drop database if exists baseballticket;
create database if not exists baseballticket;
use baseballticket;


#購入履歴
create table history(
user_id tinyint not null comment 'ユーザーID',
purchaseDate varchar(16) not null comment '購入日',
ticket_number varchar(5) comment 'チケット番号'
);

#チームテーブル作成
create table team(
team_id tinyint primary key not null auto_increment comment 'チームID',
team_name varchar(50) not null comment 'チーム名'
);

#カートテーブル作成
create table cart(
user_id tinyint not null comment 'ユーザー番号',
game_id varchar(5) not null comment 'ゲームID',
item_name varchar(100) comment 'アイテム名',
item_count int(4) comment 'アイテム数'
);

#座席情報テーブル作成
create table seating(
stadium_id tinyint not null comment '試合会場ID',
stadium_name varchar(50) comment '会場名',
area_id tinyint comment '座席エリア',
area varchar(1) comment 'エリア箇所',
max_seats int(5) comment 'エリア席上限数',
remaining_seats int(5) comment 'エリア残り席数',
price int(5) not null comment '値段'
);


#試合内容テーブル作成
create table game(
game_id varchar(5) primary key not null comment 'ゲームID',
team_id tinyint not null comment '出場チーム1ID',
team2_id tinyint not null comment '出場チーム2ID',
stadium_id tinyint not null comment 'スタジアムID'
);


#チーム名とチームIDを入力
insert into team values
(1, '読売ジャイアンツ/Yomiuri Giants'),
(2, '東京ヤクルトスワローズ/Tokyo Yakuruto Swallows'),
(3, '横浜DeNAベイスターズ/Yokohama DeNA Baystars'),
(4, '中日ドラゴンズ/Chunichi Dragons'),
(5, '阪神タイガース/Hanshin Tigers'),
(6, '広島東洋カープ/Hiroshima Toyo Carp');

#値段を入力
insert into seating values
(1, '横浜スタジアム/Yokohama Stadium', 1, 'A', 5250, 5250, 3700),
(1, '横浜スタジアム/Yokohama Stadium', 1, 'B', 5250, 5250, 2500),
(1, '横浜スタジアム/Yokohama Stadium', 1, 'C', 5250, 5250, 2200),
(1, '横浜スタジアム/Yokohama Stadium', 1, 'D', 5250, 5250, 2000),
(1, '横浜スタジアム/Yokohama Stadium', 2, 'A', 3000, 3000, 4800),
(1, '横浜スタジアム/Yokohama Stadium', 2, 'B', 3000, 3000, 4500),
(1, '横浜スタジアム/Yokohama Stadium', 2, 'C', 3000, 3000, 4100),
(2, 'ナゴヤドーム/Nagoya Dome', 1, 'A', 8000, 8000, 3200),
(2, 'ナゴヤドーム/Nagoya Dome', 1, 'B', 8000, 8000, 2700),
(2, 'ナゴヤドーム/Nagoya Dome', 1, 'C', 8000, 8000, 2500),
(2, 'ナゴヤドーム/Nagoya Dome', 2, 'A', 3000, 3000, 5000),
(2, 'ナゴヤドーム/Nagoya Dome', 2, 'B', 3000, 3000, 4800),
(2, 'ナゴヤドーム/Nagoya Dome', 2, 'C', 3000, 3000, 4600),
(2, 'ナゴヤドーム/Nagoya Dome', 2, 'D', 3000, 3000, 4200),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 1, 'A', 5000, 5000, 3000),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 1, 'B', 5000, 5000, 1800),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 1, 'C', 5000, 5000, 900),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 2, 'A', 3600, 3600, 23000),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 2, 'B', 3600, 3600, 17500),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 2, 'C', 3600, 3600, 12000),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 2, 'D', 3600, 3600, 10500),
(3, '阪神甲子園球場/Hanshin Koshien Kyujo', 2, 'E', 3600, 3600, 8700);