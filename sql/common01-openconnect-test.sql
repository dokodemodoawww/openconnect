set names utf8;
set foreign_key_checks=0;
drop database if exists openconnect;
create database if not exists openconnect;
use openconnect;

drop table if exists attendance;
drop table if exists books;
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

/* サイト一覧 */
create table site(
site_id int primary key not null auto_increment comment 'サイトID',
site_name varchar(100) not null comment 'サイト名',
site_url varchar(255) not null comment 'サイトURL',
picture varchar(255) comment '画像',
year int comment '作成年度'
) comment='サイト情報格納テーブル';

insert into site(site_id,site_name,site_url,picture,year)
values
(  1,'BOOK MANAGER 1409','http://www.internousdev.com/bookmanager09/','bookmanager1409.png',2014),
(  2,'EC 1410','http://www.internousdev.com/ec10/','ec1410.png',2014),
(  3,'ATTENDANCE','http://www.internousdev.com/attendance/','attendance.png',2014),
(  4,'CHIKEZON','http://www.internousdev.com/chikezon/','chikezon.png',2014),
(  5,'ODEN','http://www.internousdev.com/oden/','oden.png',2015),
(  6,'SAKATIKE','http://www.internousdev.com/sakatike/','sakatike.png',2015),
(  7,'UESTO','http://www.inernousdev.com/uesto/','uesto.png',2015),
(  8,'TOURTIKE','http://www.internousdev.com/tourtike/','tourtike.png',2015),
(  9,'SOLARE','http://www.internousdev.com/solare/','solare.png',2015),
( 10,'WORLD TRAVEL','http://www.internousdev.com/worldtravel/','worldtravel.png',2015),
( 11,'YOU JUST JEWELRY','http://www.internousdev.com/youjustjewelry','youjustjewelry.png',2015),
( 12,'LA-POUPEE','http://www.internousdev.com/la-poupee/','la-poupee.png',2015),
( 13,'UCYCLE','http://www.internousdev.com/ucycle/','ucycle.png',2015),
( 14,'BASEBALL TICKET','http://www.internousdev.com/baseballticket','baseballticket.png',2015),
( 15,'ICHIGO ICHIE','http://www.internousdev.com/ichigoichie/','ichigoichie.png',2015),
( 16,'LIVE TICKETS','http://www.internousdev.com/livetickets/','livetickets.png',2015),
( 17,'TBOX','http://www.internousdev.com/tbox/','tbox.png',2015),
( 18,'G-TICKETS','http://www.internousdev.com/g-tickets/','g-tickets.png',2015),
( 19,'MUSICAL','http://www.internousdev.com/musical/','musical.png',2015),
( 20,'BIG GALAXY','http://www.internousdev.com/biggalaxy/','biggalaxy.png',2015),
( 21,'K-HOME','http://www.internousdev.com/k-home/','k-home.png',2015),
( 22,'AQUQRIUM','http://www.internousdev.com/aquqrium/','aquqrium.png',2015),
( 23,'LEREVE','http://www.internousdev.com/lereve/','lereve.png',2015),
( 24,'SHIZUKU','http://www.internousdev.com/shizuku/','shizuku.png',2015),
( 25,'FOOT PRINTER','http://www.internousdev.com/footprinter/','footprinter.png',2015),
( 26,'UKIUKI UTOPIA','http://www.internousdev.com/ukiukiutopia/','ukiukiutopia.png',2015),
( 27,'PIZZA SEIJIN','http://www.internousdev.com/pizzaseijin/','pizzaseijin.png',2015),
( 28,'CHOCO TIME','http://www.internousdev.com/chokotime/','chokotime.png',2015),
( 29,'CINEMA JAPAN','http://www.internousdev.com/cinemajapan/','cinemajapan.png',2015),
( 30,'KINNOSAWA','http://www.internousdev.com/kinnosawa/','kinnosawa.png',2015),
( 31,'RAKURAKU','http://www.internousdev.com/rakuraku/','rakuraku.png',2015),
( 32,'KURUYAMA','http://www.internousdev.com/kuruyama/','kuruyama.png',2016),
( 33,'MACKEY PARK','http://www.internousdev.com/mackeypark/','mackeypark.png',2016),
( 34,'GEKIDAN ROADSHOW','http://www.internousdev.com/gekidanroadshow/','gekidanroadshow.png',2016),
( 35,'GPS COFFEE','http://www.internousdev.com/gpscoffee/','gpscoffee.png',2016),
( 36,'MIRA-MODE','http://www.internousdev.com/mira-mode/','mira-mode.png',2016),
( 37,'REWRITE','http://www.internousdev.com/rewrite/','rewrite.png',2016),
( 38,'SAMURAI','http://www.internousdev.com/samurai/','samurai.png',2016),
( 39,'INTERNOUSDEV','http://www.internousdev.com/internousdev/','internousdev.png',2016),
( 40,'NAGOMI','http://www.internousdev.com/nagomi/','nagomi.png',2016),
( 41,'NOEL','http://www.internousdev.com/noell/','noel.png',2016),
( 42,'LUSSO','http://www.internousdev.com/lusso/','lusso.png',2016),
( 43,'DEBUT','http://www.internousdev.com/debut/','debut.png',2017),
( 44,'NADESHIKO','http://www.internousdev.com/nadeshiko/','nadeshiko.png',2016),
( 45,'SHIKI','http://www.internousdev.com/shiki/','shiki.png',2015),
( 46,'TOKYO RUNNER','http://www.internousdev.com/tokyorunner/','tokyorunner.png',2017),
( 47,'CATSNDOGS','http://www.internousdev.com/catsndogs/','catsndogs.png',2017),
( 48,'HAPPYBRIDAL','http://www.internousdev.com/happybridal/','happybridal.png',2017),
( 49,'HAPPYGIFT','http://www.internousdev.com/happygift/','happygift.png',2017),
( 50,'JUNEBRELLA','http://www.internousdev.com/junebrella','junebrella.png',2017),
( 51,'LEGMINA','http://www.internousdev.com/legmina/','legmina.png',2017),
( 52,'OUTDOOR','http://www.internousdev.com/outdoor/','outdoor.png',2017),
( 53,'UMARI','http://www.internousdev.com/umari/','umari.png',2017);

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

/* 書籍一覧 */
create table books(
book_id int primary key not null auto_increment comment 'ブックID',
title varchar(100) not null unique comment 'タイトル',
sub_title varchar(100) comment 'サブタイトル',
author varchar(100) not null comment '著者',
publisher varchar(100) not null comment '出版社',
publish_day varchar(10) not null comment '出版日',
initial varchar(10) not null comment 'イニシャル(例:ア,カ,サ/A,B,C/数字)',
status_flg varchar(10) not null default '通常' comment '状態フラグ(1:通常,2:削除,3:紛失)',
regist_day datetime not null  default current_timestamp comment 'カレッジ登録日',
updated_day datetime not null  default current_timestamp on update current_timestamp comment '更新日'
);

insert into books
(book_id, title, sub_title, author, publisher, publish_day, initial)
values
(1, 'クラスタを自宅で学ぼう! Life Keeper超入門', 'CentOS6/LifeKeeper v9.01対応', '小野澤基文', 'インターノウス', '2017.05', 'カ'),
(2, 'プロになるためのWeb技術入門', 'なぜ、あなたはWebシステムを開発できないのか', '小森祐介', '技術評論社', '2010.04', 'ハ'),
(3, 'なぜ、あなたはJavaでオブジェクト指向開発ができないのか', 'Javaの壁を克服する実践トレーニング', '小森祐介', '技術評論社', '2004.12', 'ナ'),
(4, 'リーダブルコード', 'より良いコードを書くためのシンプルで実践的なテクニック', 'Dustin Boswell, Trevor Foucher', 'オライリージャパン', '2012.06', 'ラ'),
(5, 'Apacheハンドブック 第3版', '', 'Ben Laurie, Peter Laurie', 'オライリージャパン', '2003.09', 'A'),
(6, 'Apacheクックブック 第2版', 'Webサーバ管理者のためのレシピ集', 'Ken Coar, Rich Bowen', 'オライリージャパン', '2008.09', 'A'),
(7, 'Play Framework2 徹底入門', 'JavaではじめるアジャイルWeb開発', '掌田津耶乃, 原一浩', '翔泳社', '2013.12', 'P'),
(8, 'Javaプログラマ Silver SE8', 'オラクル認定資格教科書', '山本道子', '翔泳社', '2016.02', 'J'),
(9, 'Webコンポーネントディベロッパ(SJC-WC)',	'[SUN教科書] (試験番号:310-083)', '山本道子', '翔泳社', '2010.06', 'W'),
(10, 'スーパーエンジニアへの道', '技術リーダーシップの人間学', 'G.M.ワインバーグ', '共立出版', '1991.10', 'サ'),
(11, 'PMBOK 問題集', 'PMBOKガイド第5版対応', 'アイテック教育研究開発部, 吉沢正文', 'アイテック', '2014.03', 'P'),
(12, '10日でおぼえるLinuxサーバー入門教室', 'CentOS対応', '一戸英男', '翔泳社', '2012.11', 'その他'),
(13, 'ソフトウェア職人気質', '人を育て、システム開発を成功へと導くための重要キーワード', 'ピート マクブリーン', 'ピアソンエデュケーション', '2001.03', 'サ'),
(14, '速効!図解 Excel2007 総合版', 'Windows Vista・Office2007対応', '木村幸子', '毎日コミュニケーションズ', '2007.01', 'サ'),
(15, '10日でおぼえるデータモデリング入門教室', '', '筒井彰彦', '翔泳社', '2003.11', 'その他'),
(16, 'スッキリわかるJava入門 第2版 (カレッジ内1)', '', '中山清喬, 国本大悟', 'インプレス', '2014.08', 'サ'),
(17, 'PMP試験 合格虎の巻', '第5版対応版', '吉沢正文, 落合和雄, 庄司敏浩', 'アイテック', '2014.03', 'P'),
(18, 'やさしいJava 第2版', '', '高橋麻奈', 'ソフトバンクパブリッシング', '2002.04', 'ヤ'),
(19, 'Junit 実践入門', '体系的に学ぶユニットテストの技法 ', '渡辺修司', '技術評論社', '2012.11', 'J'),
(20, 'Amazon Web Services クラウドデザインパターン実装ガイド', '', '大澤文孝', '日経BP社', '2014.09', 'A'),
(21, 'データビジュアライゼーションのためのD3.js徹底入門', 'Wevで魅せる[グラフ&チャートの作り方]', '古籏一浩', 'SBクリエイティブ', '2014.05', 'タ'),
(22, '基本情報技術者 大滝みや子先生のかんたんアルゴリズム解法 第2版', '流れ図と擬似言語', '大滝みや子', 'リックテレコム', '2009.11', 'カ'),
(23, 'サーバサイドAjax入門', 'Java／PHP／ASP.NET連携でAjaxプログラミングを極める！', '山田祥寛', '翔泳社', '2006.09', 'サ'),
(24, 'PMPパーフェクトマスター', 'PMBOK第5版対応', '伊熊昭等, 鈴木安而, 海部雅之', '評言社', '2013.08', 'P'),
(25, '9割が無料で遊ぶソーシャルアプリのマネタイズの仕組み', '', '加藤友助, 寺尾剛, 桑田一生', '秀和システム', '2012.09', 'その他'),
(26, '業務システムのための上流工程入門', '要件定義から分析・設計まで', '渡辺幸三', '日本実業出版社', '2003.10', 'カ'),
(27, '2050年の世界', '英『エコノミスト』誌は予測する', '英『エコノミスト』編集部', '文藝春秋', '2012.08', 'その他'),
(28, 'ザ・ゴール　コミック版', '', 'エリヤフ・ゴールドラット, ジェフ・コックス', 'ダイヤモンド社', '2014.12', 'サ'),
(29, '2030年の世界経済', '新興国と先進国 共同リーダーシップの時代', 'イワン・ツェリッシェフ', 'エヌティティ出版', '2014.07', 'その他'),
(30, '世界のエリートが学んできた「自分で考える力」の授業', '', '狩野みき', '日本実業出版社', '2013.06', 'サ'),
(31, 'ビジョナリー カンパニー', '時代を超える生存の原則', 'ジェームズ・C・コリンズ, ジェリー・I・ポラス', '日経BP社', '1995.09', 'ハ'),
(32, '基礎からのサーブレット/JSP 第3版', '', '宮本信二', 'SBクリエイティブ', '2010.08', 'カ'),
(33, '栢木先生の基本情報技術者教室 (情報処理技術者試験)', '平成24年度 イメージ＆クレバー方式でよくわかる', '栢木厚', '技術評論社', '2011.12', 'カ'),
(34, 'カンタン Struts1.2 改訂版', '', '石井真, 阿島哲夫', '秀和システム', '2015.04', 'カ'),
(35, '基礎からのWebアプリケーション開発入門', 'Webサーバを作りながら学ぶ', '前橋和弥', '技術評論社', '2016.06', 'カ'),
(36, 'Emacs実践入門', '思考を直感的にコード化し、開発を加速する', '大竹智也', '技術評論社', '2012.03', 'E'),
(37, '現場で使えるMySQL', '', '松信嘉範', '翔泳社', '2006.03', 'カ'),
(38, 'Java ポケットリファレンス', '', '高江翼, 山田祥寛', '技術評論社', '2011.03', 'J'),
(39, '2030年 世界はこう変わる', 'アメリカ情報機関が分析した「17年後の未来」', '米国国家情報会議', '講談社', '2013.04', 'その他'),
(40, 'TED 驚異のプレゼン', '人を惹きつけ、心を動かす9つの法則', 'カーマイン・ガロ', '日経BP社', '2014.07', 'T'),
(41, 'Linuxでなんでも復活させる本', '', '日経Linux', '日経BP社', '2010..12', 'L'),
(42, 'Ubuntu9.04完全ガイド', '', 'インフォレスト', 'インフォレスト', '2009.07', 'U'),
(43, 'Apache HTTP Serverポケットリファレンス', '2.0/2.2系対応(Linux版/Windows版)', '高江賢', '技術評論社', '2010.05', 'A'),
(44, '詳解HTML&CSS&JavaScript辞典 改訂版', '', '大藤幹, 半場方人', '秀和システム', '2005.04', 'サ'),
(45, 'スッキリわかるJava入門 第2版 (カレッジ内2)', '', '中山清喬, 国本大悟', 'インプレス', '2014.08', 'サ');

insert into books
(book_id, title, sub_title, author, publisher, publish_day, initial, status_flg)
values
(46, 'EclipseではじめるJavaフレームワーク入門第4版', 'クラウド開発対応', '掌田津耶乃', '秀和システム', '2013.03', 'E', '紛失'),
(47, 'はじめてのJavaフレームワーク第3版', 'Struts2/Spring/Hibernate対応', '岡田賢治', '秀和システム', '2011.06', 'ハ', '紛失'),
(48, 'Eclipse 3.7 完全攻略', '', '宮本信二', 'ソフトバンククリエイティブ', '2011.10', 'E', '紛失'),
(49, '10日でおぼえるHTML5入門教室', '', '古籏一浩', '翔泳社', '2011.09', 'その他', '紛失'),
(50, '基本から学ぶHTML5+JavaScript', '', 'クジラ飛行机, 土井毅', 'SBクリエイティブ', '2012.04', 'カ', '紛失'),
(51, 'アプリを作ろう! HTML5入門', '', '山田祥寛', '日経BP社', '2012.06', 'ア', '紛失'),
(52, '独習Javaサーバサイド編 第2版', '', '山田祥寛', '翔泳社', '2013.01', 'タ', '紛失'),
(53, 'スッキリわかるJava入門 実践編', '', '中山清喬', 'インプレス', '2012.09', 'サ', '紛失');


/* 決裁 */
create table decision(
decision_id int primary key auto_increment comment '決裁ID',
project_id int unique not null comment 'プロジェクトID',
decision_name varchar(100) comment '案件名',
decision_type enum('実施', '契約', '実施兼契約') default '実施' comment '決裁種類',
decision_status tinyint(1) default 0 comment '決裁状況
( 0:作成中, 1:差し戻し中, 2:却下中, 3:申請中, 4:変更申請中, 5:全て承認済み, 6:遡求申請中, 7:リリース済み, 8:変更差し戻し中, ９:変更却下中, 10:遡求差し戻し中, 11:変更編集中, 12:遡求編集中 )',
permit_status tinyint(1) default 0 comment '承認状況(0:未承認, 1:リーダー1承認済み, 2:リーダー2承認済み, 0:先生承認済み)',
change_status tinyint(1) default 0 comment '変更有無( 0:通常, 1:変更あり )',
recourse_status tinyint(1) default 0 comment '遡求有無( 0:通常, 1:遡求あり )',
summary varchar(255) comment '概要',
cause varchar(255) comment '内容',
persons int comment '人数',
j_apply_day date comment '実施申請日',
k_apply_day date comment '契約/実施兼契約申請日',
s_apply_day date comment '遡求申請日',
start_day date comment '開始日',
end_day date comment '終了日',
bild_cost float comment '建設費用',
benefit float comment '損益利益',
amount_all float comment '合計金額',
prove int default 7 comment '開発端末',
total_prove int comment '合計開発端末',
re float default 0.6 comment 'リリース環境使用料',
total_re float comment '合計リリース環境使用料',
line int default 1 comment '回線使用料',
total_line int comment '合計回線使用料',
room float default 55.5 comment '施設使用料',
total_room float comment '合計施設使用料',
human int default 100 comment '開発要員',
total_human int comment '合計開発要員',
etc float default 0.5 comment '雑費' ,
total_etc float comment '合計雑費' ,
plan varchar(255) comment '実施計画の資料',
j_imp_id varchar(100) comment '実施起案番号',
j_dec_id varchar(100) comment '実施決裁番号',
k_imp_id varchar(100) comment '契約起案番号',
k_dec_id varchar(100) comment '契約決裁番号',
jk_imp_id varchar(100) comment '実施兼契約起案番号',
jk_dec_id varchar(100) comment '実施兼契約決裁番号',
j_drafter_id int comment'実施起案者ID',
k_drafter_id int comment'契約/実施兼契約起案者ID',
j_permiter_id1 int comment '実施_承認者ID(1人目:リーダー)',
j_permiter_id2 int comment '実施_承認者ID(2人目:リーダー)',
j_permiter_id3 int comment '実施_承認者ID(3人目:先生)',
k_permiter_id1 int comment '契約/実施兼契約_承認者ID(1人目:リーダー)',
k_permiter_id2 int comment '契約/実施兼契約_承認者ID(2人目:リーダー)',
k_permiter_id3 int comment '契約/実施兼契約_承認者ID(3人目:先生)',
s_permiter_id int comment '遡求承認者ID(先生)',

foreign key(project_id) references projects(project_id) on update cascade on delete cascade,
foreign key(j_drafter_id) references users(user_id) on update cascade on delete cascade,
foreign key(k_drafter_id) references users(user_id) on update cascade on delete cascade,
foreign key(j_permiter_id1) references users(user_id) on update cascade on delete cascade,
foreign key(j_permiter_id2) references users(user_id) on update cascade on delete cascade,
foreign key(j_permiter_id3) references users(user_id) on update cascade on delete cascade,
foreign key(k_permiter_id1) references users(user_id) on update cascade on delete cascade,
foreign key(k_permiter_id2) references users(user_id) on update cascade on delete cascade,
foreign key(k_permiter_id3) references users(user_id) on update cascade on delete cascade,
foreign key(s_permiter_id) references users(user_id) on update cascade on delete cascade
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
member_number int not null comment '人数',
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
team_name varchar(255) not null default '1stmonth' comment 'チーム名',
memo_text text comment 'メモ内容'
);



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
update_day datetime comment '更新日',
team_name varchar(255) not null default '1stmonth' comment 'チーム名',
user_icon varchar(50) default "pic/user_icon/syoki.png" comment '写真',
user_name varchar(50) not null comment 'フルネーム',
sns_id varchar(62) not null unique comment 'SNS用ID',
point int not null default 0 comment 'ポイント',
lv int not null default 1 comment 'レベル',
profile varchar(150) comment 'プロフィール',
delete_flg boolean not null default false comment '削除フラグ',
h_color varchar(50) not null default '#333333' comment 'ヘッターカラー',
b_color varchar(50) not null default '#ffffff' comment 'ボディカラー',
f_color varchar(50) not null default '#6ff5ef' comment 'フッターカラー')
comment = 'ユーザー情報格納テーブル';



/* 以下、SNSサイトのテーブル */




/* グループ情報 */
create table groups(
group_id int not null primary key auto_increment comment 'グループID',
group_name varchar(50) not null comment 'グループ名',
group_icon varchar(50) default "pic/group_icon/papurika01.jpg" comment 'グループイメージ',
created_at datetime not null  default current_timestamp comment '作成日'
);

/* グループメンバー情報 */
create table members(
group_id int not null comment 'グループID',
user_id int not null comment 'ユーザーID',
primary key(group_id, user_id),
foreign key(group_id) references groups(group_id),
foreign key(user_id) references users(user_id)
);

/* チャット投稿情報 */
create table messages(
message_id int not null primary key auto_increment comment '投稿ID',
receiver_id int comment  '受取人ID',
sender_id int not null comment '送信者ID',
group_id int comment 'グループID',
text varchar(255) not null comment '送信内容',
img varchar(50) comment '添付画像',
created_at timestamp not null default current_timestamp comment '投稿日時',
foreign key(receiver_id) references users(user_id),
foreign key(sender_id) references users(user_id),
foreign key(group_id) references groups(group_id)
);

/* タイムライン投稿情報 */
create table posts(
post_id int not null primary key auto_increment comment 'ポストID',
sender_id varchar(50) not null comment '送信者ID',
text varchar(255) not null comment '送信内容',
img varchar(50) comment '添付画像',
is_reply boolean default false comment 'このポストがリプライかどうか',
created_at timestamp not null default current_timestamp comment '送信日時',
re_post_id int comment '返信する場合の、返信先のポストID',
like_count int not null default 0 comment 'いいね',
index(sender_id)
);
/* リプライ情報(入れ子区間モデルの試験導入 by adachi) */
create table replys(
post_id int not null comment 'ポストID',
root_post_id int not null comment '大元の投稿のポストID（＠がついてないもの）',
area_l float not null,
area_r float not null,
foreign key(post_id) references posts(post_id),
foreign key(root_post_id) references posts(post_id)
);

-- /* タイムライン情報 */
-- create table timeline(
-- post_id int not null comment 'ポストID',
-- sender_id int not null comment '送信者ID',
-- follower_id int comment 'フォロワーID',
-- foreign key(sender_id) references users(user_id),
-- foreign key(follower_id) references users(user_id),
-- foreign key(post_id) references posts(post_id)
-- );

/* フォロー情報 */
create table follows(
follower_id int not null comment 'する側ID',
follow_id int not null comment 'される側ID',
primary key(follower_id, follow_id),
foreign key(follower_id) references users(user_id),
foreign key(follow_id) references users(user_id)
);

/* いいね情報 */
create table likes(
user_id int not null comment 'ユーザーID',
post_id int not null comment 'ポストID',
foreign key(user_id) references users(user_id),
foreign key(post_id) references posts(post_id)
);

/* チャット既読情報 */
create table read_flg(
message_id int not null comment'投稿ID',
user_id int not null comment 'ユーザーID',
foreign key(user_id) references users(user_id),
foreign key(message_id) references messages(message_id)
);


/* 通知情報 */
create table message(
user_id int not null comment 'ユーザーID',
msg varchar(255) not null comment'通知文',
url varchar(50) comment '通知文にリンクを貼る際のURL',
send_at timestamp not null default current_timestamp comment '送信日時',
foreign key(user_id) references users(user_id)
);


/* スタンプ情報 */
create table stamp(
stamp_id int not null primary key auto_increment comment 'スタンプID',
type_id int not null comment '種別ID',
lv int not null default 1 comment '使用可能レベル',
url varchar(255) not null
);


/* グループ画像 */
create table group_icon(
img_id int not null primary key auto_increment comment '画像ID',
url varchar(255) not null
);

/* ユーザー画像 */
create table user_icon(
img_id int not null primary key auto_increment comment '画像ID',
url varchar(255) not null
);









set names utf8;
set foreign_key_checks=0;
use openconnect;
delete from users;
insert into users values
(1,'testuser','test','user','テスト','てすと','ユーザー','ゆーざー','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test@gmail.com','09012345678','user.test@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','1:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(2,'internous01','inoue','takuma','井上','いのうえ','琢磨','たくま','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','takuma.inoue@gmail.com','09012345678','takuma.inoue@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','13','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','井上琢磨','2:井上琢磨','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(3,'internous01','harada','miyuki','原田','はらだ','美友貴','みゆき','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','miyuki.harada@gmail.com','09012345678','miyuki.harada@ne.jp','女','1992-05-03',FALSE,FALSE,'3','2010','13','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','原田美友貴','3:原田美友貴','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(4,'internous01','test','admin1','テスト','てすと','管理者1','かんりしゃ1','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test1@gmail.com','09012345678','admin.test1@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','4:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(5,'internous01','test','admin2','テスト','てすと','管理者2','かんりしゃ2','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test2@gmail.com','09012345678','admin.test2@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','5:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(6,'internous01','test','admin3','テスト','てすと','管理者3','かんりしゃ3','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test3@gmail.com','09012345678','admin.test3@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','6:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(7,'internous01','test','admin4','テスト','てすと','管理者4','かんりしゃ4','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test4@gmail.com','09012345678','admin.test4@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','7:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(8,'internous01','test','admin5','テスト','てすと','管理者5','かんりしゃ5','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test5@gmail.com','09012345678','admin.test5@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','8:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(9,'internous01','test','admin6','テスト','てすと','管理者6','かんりしゃ6','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test6@gmail.com','09012345678','admin.test6@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','9:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(10,'internous01','test','admin7','テスト','てすと','管理者7','かんりしゃ7','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test7@gmail.com','09012345678','admin.test7@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','10:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(11,'internous01','test','admin8','テスト','てすと','管理者8','かんりしゃ8','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test8@gmail.com','09012345678','admin.test8@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','11:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(12,'internous01','test','admin9','テスト','てすと','管理者9','かんりしゃ9','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test9@gmail.com','09012345678','admin.test9@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','12:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(13,'internous01','test','admin10','テスト','てすと','管理者10','かんりしゃ10','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','admin.test10@gmail.com','09012345678','admin.test10@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','test','13:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(14,'leader11','test','leader1','テスト','てすと','リーダー1','りーだー1','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','leader1.test@gmail.com','09012345678','leader1.test@ne.jp','男','1990-04-01',FALSE,FALSE,'2','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','14:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(15,'leader22','test','leader2','テスト','てすと','リーダー2','りーだー2','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','leader2.test@gmail.com','09012345678','leader2.test@ne.jp','男','1990-04-01',FALSE,FALSE,'2','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','15:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(16,'student1','nitabaru','kouhei','仁田原','にたばる','耕平','こうへい','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','kouhei.nitabaru@gmail.com','09012345678','kouhei.nitabaru@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','07','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','16:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(17,'student2','itou','tatsuhumi','伊藤','いとう','竜文','たつふみ','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','tatsuhumi.itou@gmail.com','09012345678','tatsuhumi.itou@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','07','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','17:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(18,'student3','sunakawa','minori','砂川','すなかわ','みのり','みのり','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','minori.sunakawa@gmail.com','09012345678','minori.sunakawa@ne.jp','女','1990-04-01',FALSE,FALSE,'1','2016','07','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','18:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(19,'student4','keduka','masahiro','毛塚','けづか','正広','まさひろ','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','masahiro.keduka@gmail.com','09012345678','masahiro.keduka@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','08','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','19:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(20,'student5','horiguchi','kennichi','堀口','ほりぐち','謙一','けんいち','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','kennichi.horiguchi@gmail.com','09012345678','kennichi.horiguchi@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','08','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','20:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(21,'student6','kiryuu','youichi','霧生','きりゅう','雄一','ゆういち','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','yuuichi.kiryuu@gmail.com','09012345678','yuuichi.kiryuu@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','08','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','21:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(22,'student7','hoshi','tatsuya','星','ほし','達也','たつや','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','tatsuya.hoshi@gmail.com','09012345678','tatsuya.hoshi@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','08','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','22:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(23,'student8','iwamoto','koumei','岩本','いわもと','興明','こうめい','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','koumei.iwamoto@gmail.com','09012345678','koumei.iwamoto@ne.jp','男','1990-04-01',FALSE,FALSE,'1','2016','08','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','23:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(24,'testuser','test','user','テスト','てすと','ユーザー1','ゆーざー1','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test1@gmail.com','09012345678','user.test1@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','24:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(25,'testuser','test','user','テスト','てすと','ユーザー2','ゆーざー2','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test2@gmail.com','09012345678','user.test2@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','25:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(26,'testuser','test','user','テスト','てすと','ユーザー3','ゆーざー3','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test3@gmail.com','09012345678','user.test3@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','26:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(27,'testuser','test','user','テスト','てすと','ユーザー4','ゆーざー4','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test4@gmail.com','09012345678','user.test4@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','27:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(28,'testuser','test','user','テスト','てすと','ユーザー5','ゆーざー5','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test5@gmail.com','09012345678','user.test5@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','28:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(29,'testuser','test','user','テスト','てすと','ユーザー6','ゆーざー6','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test6@gmail.com','09012345678','user.test6@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','29:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(30,'testuser','kikuchi','misa','菊地','きくち','未紗','みさ','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test7@gmail.com','09012345678','user.test7@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/music.jpg','菊地未紗','30:菊地未紗','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(31,'testuser','kishimoto','takuya','岸本','きしもと','拓也','たくや','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test8@gmail.com','09012345678','user.test8@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','SLUGくん','31:SLUGくん','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(32,'testuser','fukutani','kaito','福谷','ふくたに','海人','かいと','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test9@gmail.com','09012345678','user.test9@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/sarval.png','福谷海人','32:福谷海人','0','1000','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(33,'testuser','maeda','ryo','前田','まえだ','涼','りょう','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test10@gmail.com','09012345678','user.test10@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/knight.gif','前田涼','33:前田涼','0','100','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(34,'testuser','fukuda','sayaka','福田','ふくだ','早矢加','さやか','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test11@gmail.com','09012345678','user.test11@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/sakura.jpg','福田早矢加','34:福田早矢加','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(35,'testuser','narita','junki','成田','なりた','潤生','じゅんき','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test12@gmail.com','09012345678','user.test12@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/duck.jpg','成田潤生','35:成田潤生','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(36,'testuser','adachi','takahiro','足立','あだち','貴宏','たかひろ','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test13@gmail.com','09012345678','user.test13@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/manami.jpg','足立貴宏','36:足立貴宏','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(37,'testuser','ide','takeshi','井出','いで','剛志','たけし','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test14@gmail.com','09012345678','user.test14@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/ao.jpg','井出剛志','37:井出剛志','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(38,'testuser','test','user','テスト','てすと','ユーザー15','ゆーざー15','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test15@gmail.com','09012345678','user.test15@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','38:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(39,'testuser','test','user','テスト','てすと','ユーザー16','ゆーざー16','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test16@gmail.com','09012345678','user.test16@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','39:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(40,'testuser','test','user','テスト','てすと','ユーザー17','ゆーざー17','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','user.test17@gmail.com','09012345678','user.test17@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','test','40:test','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(41,'internous01','kazami','akira','風見','かざみ','顕','あきら','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','kazami@internous.co.jp','09012345678','kazami@internous.co.jp','男','2001-09-25',FALSE,FALSE,'3','2010','13','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','風見顕','41:風見顕','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef');


insert into follows(follower_id,follow_id) values(30,31),(31,30),(30,32),(32,30),(31,32),(32,31),(30,33),(33,30),(31,33),(33,31),(32,33),(33,32),(33,34),(34,33),(30,34),(34,30),(31,34),(34,31),(32,34),(34,3),(35,30),(30,35),(31,35),(35,31),(35,32),(32,35),(33,35),(35,33),(35,34),(34,35),(36,30),(30,36),(31,36),(36,31),(36,32),(32,36),(33,36),(36,33),(36,34),(34,36),(35,36),(36,35),
(37,30),(30,37),(31,37),(37,31),(37,32),(32,37),(33,37),(37,33),(37,34),(34,37),(35,37),(37,35),(37,36),(36,37),
(38,30),(30,38),(31,38),(38,31),(38,32),(32,38),(33,38),(38,33),(38,34),(34,38),(35,38),(38,35),(38,36),(36,38),(37,38),(38,37);

insert into groups(group_name,group_icon) values("legmina","pic/group_icon/tomato01.jpg"),("openconnect","pic/group_icon/tomato01.jpg"),("cetus","tomato030.jpg"),("bananalate","tomato030.jpg");

insert into members(group_id, user_id) values(1, 30),(1, 31),(1, 32),(1, 33),(1, 34),(2, 32),(2, 35);

insert into messages(sender_id,group_id,text) values(30,1,"グループを新設しました"),(35,2,"グループを新設しました");

insert into messages(sender_id,receiver_id,text) values(30,31,"（・ｘ・）"),(30,32,"｜ω：）"),(30,33,"（・ω｜"),(31,32,"（・ω・）"),(31,33,"（：：）"),(32,33,"v（・ω｜"),
(34,30,"v（・ω｜"),(34,31,"v（・ω｜"),(34,32,"v（・ω｜"),(34,33,"v（・ω｜"),
(35,30,"v（・ω｜"),(35,31,"v（・ω｜"),(35,32,"v（・ω｜"),(35,33,"v（・ω｜"),(35,34,"v（・ω｜"),
(36,30,"v（・ω｜"),(36,31,"v（・ω｜"),(36,32,"v（・ω｜"),(36,33,"v（・ω｜"),(36,34,"v（・ω｜"),(36,35,"v（・ω｜"),
(37,30,"v（・ω｜"),(37,31,"v（・ω｜"),(37,32,"v（・ω｜"),(37,33,"v（・ω｜"),(37,34,"v（・ω｜"),(37,35,"v（・ω｜"),(37,36,"v（・ω｜"),
(38,30,"v（・ω｜"),(38,31,"v（・ω｜"),(38,32,"v（・ω｜"),(38,33,"v（・ω｜"),(38,34,"v（・ω｜"),(38,35,"v（・ω｜"),(38,36,"v（・ω｜"),(38,37,"V");



insert into stamp(type_id,url) values
(1,"pic/stamp/01_hipota/hipota_01.jpg"),
(1,"pic/stamp/01_hipota/hipota_02.jpg"),
(1,"pic/stamp/01_hipota/hipota_03.jpg"),
(1,"pic/stamp/01_hipota/hipota_04.jpg"),
(1,"pic/stamp/01_hipota/hipota_05.jpg"),
(1,"pic/stamp/01_hipota/hipota_06.jpg"),
(1,"pic/stamp/01_hipota/hipota_07.jpg"),
(1,"pic/stamp/01_hipota/hipota_08.jpg"),
(1,"pic/stamp/01_hipota/hipota_09.jpg"),
(1,"pic/stamp/01_hipota/hipota_10.jpg"),
(1,"pic/stamp/01_hipota/hipota_11.jpg"),
(1,"pic/stamp/01_hipota/hipota_12.jpg"),
(1,"pic/stamp/01_hipota/hipota_13.jpg"),
(1,"pic/stamp/01_hipota/hipota_14.jpg"),
(1,"pic/stamp/01_hipota/hipota_15.jpg"),
(1,"pic/stamp/01_hipota/hipota_16.jpg"),
(1,"pic/stamp/01_hipota/hipota_17.jpg"),
(1,"pic/stamp/01_hipota/hipota_18.jpg"),
(1,"pic/stamp/01_hipota/hipota_19.jpg"),
(1,"pic/stamp/01_hipota/hipota_20.jpg"),
(1,"pic/stamp/01_hipota/hipota_21.jpg"),
(1,"pic/stamp/01_hipota/hipota_22.jpg"),
(1,"pic/stamp/01_hipota/hipota_23.jpg"),
(1,"pic/stamp/01_hipota/hipota_24.jpg"),
(1,"pic/stamp/01_hipota/hipota_25.jpg"),
(2,"pic/stamp/02_lion/lion_01.jpg"),
(2,"pic/stamp/02_lion/lion_02.jpg"),
(2,"pic/stamp/02_lion/lion_03.jpg"),
(2,"pic/stamp/02_lion/lion_04.jpg"),
(2,"pic/stamp/02_lion/lion_05.jpg"),
(2,"pic/stamp/02_lion/lion_06.jpg"),
(2,"pic/stamp/02_lion/lion_07.jpg"),
(2,"pic/stamp/02_lion/lion_08.jpg"),
(2,"pic/stamp/02_lion/lion_09.jpg"),
(2,"pic/stamp/02_lion/lion_10.jpg"),
(2,"pic/stamp/02_lion/lion_11.jpg"),
(2,"pic/stamp/02_lion/lion_12.jpg"),
(2,"pic/stamp/02_lion/lion_13.jpg"),
(2,"pic/stamp/02_lion/lion_14.jpg"),
(2,"pic/stamp/02_lion/lion_15.jpg"),
(2,"pic/stamp/02_lion/lion_16.jpg");

insert into stamp(type_id,lv,url) values
(3,2,"pic/stamp/03_ham/ham_01.jpg"),
(3,2,"pic/stamp/03_ham/ham_02.jpg"),
(3,2,"pic/stamp/03_ham/ham_03.jpg"),
(3,2,"pic/stamp/03_ham/ham_04.jpg"),
(3,2,"pic/stamp/03_ham/ham_05.jpg"),
(3,2,"pic/stamp/03_ham/ham_06.jpg"),
(3,2,"pic/stamp/03_ham/ham_07.jpg"),
(3,2,"pic/stamp/03_ham/ham_08.jpg"),
(3,2,"pic/stamp/03_ham/ham_09.jpg"),
(3,2,"pic/stamp/03_ham/ham_10.jpg"),
(3,2,"pic/stamp/03_ham/ham_11.jpg"),
(3,2,"pic/stamp/03_ham/ham_12.jpg"),
(3,2,"pic/stamp/03_ham/ham_13.jpg"),
(3,2,"pic/stamp/03_ham/ham_14.jpg"),
(3,2,"pic/stamp/03_ham/ham_15.jpg"),
(3,2,"pic/stamp/03_ham/ham_16.jpg"),
(3,2,"pic/stamp/03_ham/ham_17.jpg"),
(3,2,"pic/stamp/03_ham/ham_18.jpg"),
(3,2,"pic/stamp/03_ham/ham_19.jpg"),
(3,2,"pic/stamp/03_ham/ham_20.jpg"),
(3,2,"pic/stamp/03_ham/ham_21.jpg"),
(3,2,"pic/stamp/03_ham/ham_22.jpg"),
(3,2,"pic/stamp/03_ham/ham_23.jpg"),
(3,2,"pic/stamp/03_ham/ham_24.jpg"),
(3,2,"pic/stamp/03_ham/ham_25.jpg"),
(3,2,"pic/stamp/03_ham/ham_26.jpg"),
(3,2,"pic/stamp/03_ham/ham_27.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_01.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_02.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_03.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_04.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_05.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_06.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_07.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_08.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_09.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_10.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_11.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_12.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_13.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_14.jpg"),
(5,3,"pic/stamp/05_tareneko/tareneko_15.jpg"),
(4,4,"pic/stamp/04_joshi/joshi_01.png"),
(4,4,"pic/stamp/04_joshi/joshi_02.png"),
(4,4,"pic/stamp/04_joshi/joshi_03.png"),
(4,4,"pic/stamp/04_joshi/joshi_04.png"),
(4,4,"pic/stamp/04_joshi/joshi_05.png"),
(4,4,"pic/stamp/04_joshi/joshi_06.png"),
(4,4,"pic/stamp/04_joshi/joshi_07.png"),
(4,4,"pic/stamp/04_joshi/joshi_08.png"),
(4,4,"pic/stamp/04_joshi/joshi_09.png"),
(4,4,"pic/stamp/04_joshi/joshi_10.png"),
(4,4,"pic/stamp/04_joshi/joshi_11.png"),
(4,4,"pic/stamp/04_joshi/joshi_12.png"),
(4,4,"pic/stamp/04_joshi/joshi_13.png"),
(4,4,"pic/stamp/04_joshi/joshi_14.png"),
(4,4,"pic/stamp/04_joshi/joshi_15.png"),
(4,4,"pic/stamp/04_joshi/joshi_16.png"),
(4,4,"pic/stamp/04_joshi/joshi_17.png"),
(4,4,"pic/stamp/04_joshi/joshi_18.png"),
(4,4,"pic/stamp/04_joshi/joshi_19.png"),
(4,4,"pic/stamp/04_joshi/joshi_20.png"),
(4,4,"pic/stamp/04_joshi/joshi_21.png"),
(4,4,"pic/stamp/04_joshi/joshi_22.png"),
(4,4,"pic/stamp/04_joshi/joshi_23.png"),
(4,4,"pic/stamp/04_joshi/joshi_24.png"),
(4,4,"pic/stamp/04_joshi/joshi_25.png"),
(4,4,"pic/stamp/04_joshi/joshi_26.png"),
(4,4,"pic/stamp/04_joshi/joshi_27.png"),
(4,4,"pic/stamp/04_joshi/joshi_28.png"),
(4,4,"pic/stamp/04_joshi/joshi_29.png"),
(4,4,"pic/stamp/04_joshi/joshi_30.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_01.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_02.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_03.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_04.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_05.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_06.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_07.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_08.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_09.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_10.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_11.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_12.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_13.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_14.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_15.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_16.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_17.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_18.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_19.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_20.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_21.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_22.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_23.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_24.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_25.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_26.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_27.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_28.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_29.png"),
(6,4,"pic/stamp/06_shiropuu/shiropuu_30.png");


insert into group_icon(url) values
("pic/group_icon/allStars.jpg"),
("pic/group_icon/compan.jpg"),
("pic/group_icon/earphone.jpg"),
("pic/group_icon/fire.jpg"),
("pic/group_icon/marlboro.jpg"),
("pic/group_icon/mouse.jpg"),
("pic/group_icon/papurika01.jpg"),
("pic/group_icon/sevenStars.jpg"),
("pic/group_icon/tomato01.jpg"),
("pic/group_icon/wallet.jpg"),
("pic/group_icon/cat.jpg"),
("pic/group_icon/umbrella.jpg"),
("pic/group_icon/umbrella2.jpg"),
("pic/group_icon/raincoat.jpg"),
("pic/group_icon/fishing.jpg"),
("pic/group_icon/mountain.jpg"),
("pic/group_icon/winter_sports.jpg"),
("pic/group_icon/ski.jpg"),
("pic/group_icon/sea.gif"),
("pic/group_icon/watch.jpg");

insert into user_icon(url) values
("pic/user_icon/glass.jpg"),
("pic/user_icon/koduck.jpg"),
("pic/user_icon/nekoatsume.png"),
("pic/user_icon/penguin.png"),
("pic/user_icon/rakuseki.png"),
("pic/user_icon/root.jpg"),
("pic/user_icon/skull.png"),
("pic/user_icon/tennosuke.png"),
("pic/user_icon/union.jpg"),
("pic/user_icon/rafureshia.jpg"),
("pic/user_icon/hashibiro.jpg");




insert into users values
(-1,'bot01','bot','bot','bot','bot','bot','bot','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','bot01@gmail.com','09012345678','bot01@ne.jp','男','1993-12-24',FALSE,FALSE,'1','2016','04','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','TestTeam','pic/user_icon/syoki.png','テストbotくん','-1:テストbotくん','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef'),
(-2,'bot02','bot','bot','bot','bot','bot','bot','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','0123456789','bot02@gmail.com','09012345678','bot02@ne.jp','男','1990-09-25',FALSE,FALSE,'3','2010','13','','0','','2016-07-01 13:00:00','2016-07-01 13:00:00','AdminTeam','pic/user_icon/syoki.png','妹bot','-2:妹bot','0','1','よろしくお願いします',FALSE,'#333333','#ffffff','#6ff5ef');





set foreign_key_checks=1;