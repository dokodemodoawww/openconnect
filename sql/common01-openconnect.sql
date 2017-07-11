set names utf8;
set foreign_key_checks=0;
drop database if exists openconnect;
create database if not exists openconnect;
use openconnect;

drop table if exists attendance;
drop table if exists books;
drop table if exists books_borrow;
drop table if exists decision;
drop table if exists decision_detail;
drop table if exists kesseki;
drop table if exists mendan;
drop table if exists projects;
drop table if exists project_progress;
drop table if exists  project_status;
drop table if exists schedule;
drop table if exists students;
drop table if exists syusseki;
drop table if exists tikoku;
drop table if exists users;

drop table if exists user;
drop table if exists site;
drop table if exists master;

drop database if exists openconnect;
create database openconnect;
use openconnect;

/* 年月日をnot nullに戻す */
create table attendance(
at_year int  comment '手入力の報告年',
at_month int comment '手入力の報告月',
at_day int  comment '手入力の報告日',
at_date timestamp not null default current_timestamp comment '日付',
user_id int not null comment '生徒ID',
attendance varchar(50) comment '出欠状況',
reason text comment'備考',
foreign key(user_id) references users(user_id) on update cascade on delete cascade
);

/*サブプロジェクト / 書籍一覧 */
create table books(
book_id int primary key not null auto_increment comment 'ブックID',
title varchar(100) not null unique comment 'タイトル'
);

create table decision(
registration date comment '登録日',
user_id int comment 'ユーザーID',
project_id int comment 'プロジェクト名',
decision_id int primary key auto_increment comment '決裁ID',
decision_name varchar(100) comment '案件名',
detail varchar(255) comment '詳細',
i_drafting_id varchar(100) comment '実施起案番号',
i_approval_id varchar(100) comment '実施決裁番号',
a_drafting_id varchar(100) comment '契約起案番号',
cd_id varchar(100) comment '契約決裁番号',
i_a_d_id varchar(100) comment '実施兼契約起案番号',
i_a_id varchar(100) comment '実施兼契約番号',
foreign key(user_id) references users(user_id) on update cascade on delete cascade,
foreign key(project_id) references projects(project_id) on update cascade on delete cascade
);

create table decision_detail(
project_id int not null comment 'プロジェクトID',
day date comment '日付',
decision_type varchar(100)  comment '決裁種類',
decision_status varchar(100) comment '決裁状況',
user_id int comment 'ユーザーID',
item_name varchar(100) comment '案件名',
summary varchar(255) comment '概要',
cause varchar(255) comment '理由',
start_day date comment '開始日',
end_day date comment '終了日',
plan varchar(255) comment '実施計画の資料',
persons int comment '人数',
password varchar(100) comment 'パスワード',
decision_id int comment '決裁ID',
decision_detail_id int primary key auto_increment comment '決裁手続きID',
foreign key(decision_id) references decision(decision_id) on update cascade on delete cascade,
foreign key(user_id) references users(user_id) on update cascade on delete cascade,
foreign key(project_id) references projects(project_id) on update cascade on delete cascade
);

/* 欠席登録 *
 * 管理番号 = number
 * 名前 = name
 * 欠席理由 = reason
 */
create table kesseki(
number varchar(5) comment '管理番号',
name varchar(50) comment '名前',
reason varchar(50) comment '欠席理由'
) comment = '欠席登録テーブル';

create table master(
level_id int not null comment '権限レベルID',
level_name varchar(10) not null comment '権限レベル名'
) comment='権限マスターテーブル';

/* 面談登録 *
 * 管理番号 = number
 * 名前 = name
 * 面談開始時間 = time
 */
create table mendan(
number varchar(5) comment '管理番号',
name varchar(50) comment '名前',
time varchar(6) comment '面談開始時間'
) comment = '面談登録テーブル';

/*サブプロジェクト */


create table projects(
project_id int primary key not null auto_increment comment 'プロジェクトID',
project_name varchar(100) not null comment 'プロジェクト名',
manager_id int not null comment 'リーダーID',
sub_manager_id int not null comment 'サブリーダーID',
start_date date comment '開始日',
end_date date comment '終了日',
note varchar(255) comment 'メモ',
foreign key(manager_id) references users(user_id) on update cascade on delete cascade,
foreign key(sub_manager_id) references users(user_id) on update cascade on delete cascade
) comment='プロジェクト一覧テーブル';

create table project_status(
project_id int not null comment 'プロジェクトID',
a_envstart date comment 'A環境開始日',
a_envend date comment 'A環境終了日',
b_envstart date comment 'B環境開始日',
b_envend date comment 'B環境終了日',
r_envstart date comment 'リリース環境開始日',
r_envend date comment 'リリース環境終了日',
aws_status varchar(50) default '' comment 'AWSリリース状況',
note varchar(255) default '' comment 'メモ',
status_id int primary key auto_increment comment 'リリース状況ID',
foreign key(project_id) references projects(project_id) on update cascade on delete cascade
) comment='プロジェクトリリース状況一覧';

create table project_progress(
progress_id int auto_increment key comment '進捗状況ID',
project_id int comment 'プロジェクトID',
project_day date not null comment 'プロジェクト進捗日付',
project_plan varchar(255) comment '進捗予定',
project_result varchar(255) comment '進捗結果',
other varchar(255) comment 'その他報告',
foreign key(project_id) references projects(project_id) on update cascade on delete cascade
);

create table schedule(
id int primary key auto_increment comment 'スケジュールID',
start_day date not null comment '開始日',
end_day date comment '終了日',
title varchar(100) not null comment '件名',
content varchar(100) comment '内容',
memo_text text comment 'メモ内容'
);

insert into schedule(id,start_day,end_day,title,content) values
(1,"2017-06-15","2017-06-20","実装","実装"),
(2,"2017-06-18","2017-06-25","実装2","実装2");


/* サイト一覧情報 */
create table site(
site_id int primary key not null auto_increment comment 'サイトID',
site_name varchar(100) not null comment 'サイト名',
site_url varchar(255) not null unique comment 'サイトURL',
site_article text comment 'サイト記事',
genre varchar(50) comment 'ジャンル',
picture varchar(255) comment '画像',
banner varchar(80) comment 'バナー',
year int comment '作成年度'
) comment='サイト情報格納テーブル';

/* カレッジ生名簿 *
 * 管理番号 = number
 * 名前 = name
 * ふりがな = symbol
 * 入校年月 = entrance
 */
create table students(
number varchar(5) comment '管理番号',
name varchar(50) comment '名前',
symbol varchar(50) comment 'ふりがな',
entrance varchar(10) comment '入校年月',
PRIMARY KEY (number)
) comment = 'カレッジ生テーブル';



/* 出席登録 *
 * 管理番号 = number
 * 名前 = name
 */
create table syusseki(
number varchar(5) comment '管理番号',
name varchar(50) comment '名前'
) comment = '出席登録テーブル';


/* 遅刻登録 *
 * 管理番号 = number
 * 名前 = name
 * 遅刻理由 = reason
 */
create table tikoku(
number varchar(5) comment '管理番号',
name varchar(50) comment '名前',
reason varchar(50) comment '遅刻理由'
) comment = '遅刻登録テーブル';

CREATE TABLE user (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ユーザーID',
  `password` varchar(255) NOT NULL COMMENT 'パスワード',
  `name` varchar(255) COMMENT '名前',
  `name_f` varchar(255) COMMENT '名前(ふりがな)',
  `postal` varchar(255) NOT NULL COMMENT '郵便番号',
  `address` varchar(255) NOT NULL COMMENT '住所',
  `tel_number` varchar(255) NOT NULL COMMENT '電話番号',
  `email` varchar(255) NOT NULL COMMENT 'メールアドレス',
  `sex` varchar(10) NOT NULL COMMENT '性別',
  `birthday` date NOT NULL COMMENT '誕生日',
  `handle_name` varchar(16) COMMENT 'ハンドルネーム',
  `register_day` datetime NOT NULL COMMENT '登録日',
  `update_day` datetime NOT NULL COMMENT '更新日',
  `userdel_flg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退会フラグ',
  `login_flg` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'ログインフラグ',
  `user_flg` int(11) NOT NULL DEFAULT '1' COMMENT 'ユーザーフラグ',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) COMMENT='ユーザー情報格納テーブル';

create table users (
user_id int primary key not null auto_increment comment 'ユーザーID',
password varchar(255) not null comment 'パスワード',
family_name varchar(50)  comment '姓(英語)',
given_name varchar(50)  comment '名(英語)',
family_name_kanji varchar(50) not null comment '姓(漢字)',
family_name_kana varchar(50) not null comment '姓(ふりがな)',
given_name_kanji varchar(50) not null comment '名(漢字)',
given_name_kana varchar(50)  not null comment '名(ふりがな)',
postal varchar(255) comment '郵便番号',
address varchar(255) comment '住所',
phone_number varchar(255) comment '電話番号',
phone_email varchar(255) not null comment 'メールアドレス',
mobile_number varchar(255) comment '携帯電話番号',
mobile_email varchar(255) unique comment '携帯メールアドレス',
sex varchar(10)  comment '性別',
birthday date comment '誕生日',
userdel_flg boolean default FALSE comment '退会フラグ',
login_flg boolean default FALSE comment 'ログインフラグ',
user_flg int not null default 1 comment 'ユーザーフラグ',
year varchar(4) not null comment '受講年',
month varchar(2) not null comment '受講開始月',
oauth_id varchar(255) comment 'OAuthID',
oauth_name int default 0 comment 'OAuth名',
oauth_account varchar(100) comment 'OAuthアカウント',
register_day datetime comment '登録日',
update_day datetime comment '更新日'
)comment = 'ユーザー情報格納テーブル';
