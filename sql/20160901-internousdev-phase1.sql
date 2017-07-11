set names utf8;
set foreign_key_checks=0;
drop database if exists internousdev;
create databse if not exists internousdev;
use internousdev;


/* イベント情報
 * 記事ID = id
 * 商品名 = goods
 * 本文 = text
 * 画像URL = picture_url
 * サイトID = site_id
 */

CREATE TABLE event_info(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT comment '記事ID',
goods VARCHAR(50) NOT NULL comment '商品名',
text text NOT NULL comment '本文',
picture_url VARCHAR(255) comment '画像URL',
site_id INT NOT NULL comment 'サイトID',
foreign key(site_id) references openconnect.site( site_id )
);

/* 学ぶ記事
 * 記事ID = id
 * タイトル = title
 * 本文 = text
 * 画像URL = picture_url
 * 作成日時 = create_day
 */

CREATE TABLE article_study(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT comment '記事ID',
title VARCHAR(50) NOT NULL comment 'タイトル',
text text NOT NULL comment '本文',
picture_url VARCHAR(255) comment '画像URL',
create_day datetime NOT NULL comment '作成日時');

/* ブログ記事
 * ブログID = id
 * タイトル = title
 * 著者 = writer_name
 * 本文 = text
 * 画像URL = picture_url
 * 作成日時 = create_day
 */

CREATE TABLE article_blog(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT comment 'ブログID',
title VARCHAR(50) NOT NULL comment 'タイトル',
writer_name VARCHAR(16) NOT NULL comment '著者',
text text NOT NULL comment '本文',
picture_url VARCHAR(255) comment '画像URL',
create_day datetime NOT NULL comment '作成日時');

/* チャットルーム情報
 * 部屋ID = id
 * 部屋名 = room_name
 * コメント = comment
 * 入室パスワード = password
 * 管理パスワード = admin_password
 */

CREATE TABLE chat_info(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT comment '部屋ID',
room_name VARCHAR(16) NOT NULL comment '部屋名',
comment VARCHAR(32) comment 'コメント',
password VARCHAR(8) comment '入室パスワード',
admin_password VARCHAR(8) NOT NULL comment '管理パスワード',
count INT UNSIGNED NOT NULL DEFAULT '0' comment'人数');

/* チャット
 * 部屋ID = id
 * ハンドルネーム = handle_name
 * テキストカラー = text_color
 * 投稿時間 = text_time
 * チャット内容 = text
 */

CREATE TABLE chat(
id INT NOT NULL comment '部屋ID',
handle_name VARCHAR(16) NOT NULL comment 'ハンドルネーム',
text_color VARCHAR(7) comment 'テキストカラー',
text_time datetime comment '投稿時間',
text VARCHAR(255) comment 'チャット内容');

/*クイズ
 * クイズID=id
 * 難易度＝diffculty
 * 問題文＝text
 * 選択肢1＝answer1
 * 選択肢2＝answer2
 * 選択肢3＝answer3
 * 選択肢4＝answer4
 * 正解＝correct
 * 解説＝explanation
 * 作成日時＝create_day
 */

CREATE TABLE question(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT comment 'クイズID',
difficulty INT NOT NULL comment '難易度',
text  VARCHAR(300) NOT NULL comment '問題文',
answer1 VARCHAR(300) NOT NULL comment '選択肢1',
answer2 VARCHAR(300) NOT NULL comment '選択肢2',
answer3 VARCHAR(300) NOT NULL comment '選択肢3',
answer4 VARCHAR(300) comment '選択肢4',
correct INT NOT NULL comment '正解',
explanation VARCHAR(300) comment '解説',
create_day  datetime NOT NULL comment '作成日時');

/* ブログコメント
 * コメント番号 = id
 * 名前 = name
 * タイトル = title
 * 本文 = text
 * 作成日時 = create_day
 * コメント数 = comment_count
 */

CREATE TABLE blog_comment(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT comment 'コメント番号',
name VARCHAR(16) NOT NULL comment '名前',
title VARCHAR(30) NOT NULL comment 'タイトル',
text text NOT NULL comment '本文',
create_day datetime NOT NULL comment '作成日時',
blog_id INT NOT NULL comment 'ブログID');


/* 以下テスト用データ*/

/* イベント情報*/
INSERT INTO event_info(id,goods,text,picture_url,site_id)VALUES
(1,"柴犬","元気いっぱいな女の子です。","img/dog1.JPG","1"),
(2,"マルチーズ","元気いっぱいな男の子です。","img/dog2.JPG","2");


/* 学ぶ記事 */
INSERT INTO article_study(id,title,text,picture_url,create_day)VALUES
(1,"学ぶ記事について","
学ぶ記事では現在受講中カレッジ生及び、これから受講するか検討されてる方々に
今後の為になる、IT業界に関連する事や学習する上で役立つ情報をお届けします。これからもinternousdevを宜しくお願いします。
","img/slash.PNG","20160101010101"),
(2,"学ぶ記事について","
学ぶ記事では現在受講中カレッジ生及び、これから受講するか検討されてる方々に
今後の為になる、IT業界に関連する事や学習する上で役立つ情報をお届けします。これからもinternousdevを宜しくお願いします。
","img/slash.PNG","20160202020202"),
(3,"学ぶ記事について","
学ぶ記事では現在受講中カレッジ生及び、これから受講するか検討されてる方々に
今後の為になる、IT業界に関連する事や学習する上で役立つ情報をお届けします。これからもinternousdevを宜しくお願いします。
","img/slash.PNG","20160303030303");

/* ブログ記事 */
INSERT INTO article_blog(id,title,writer_name,text,picture_url,create_day)VALUES
(1,"本ブログについて","ブログ管理スタッフ","
本ブログでは現在受講中カレッジ生及び、これから受講するか検討されてる方々に
今後の為になる、IT業界に関連する事やプログラマとって役立つ情報をお届けします。これからもinternousdevを宜しくお願いします。
","img/slash.PNG","20160303030303"),
(2,"本ブログについて","ブログ管理スタッフ","本ブログでは現在受講中カレッジ生及び、これから受講するか検討されてる方々に
今後の為になる、IT業界に関連する事やプログラマとって役立つ情報をお届けします。これからもinternousdevを宜しくお願いします。
","img/slash.PNG","20160404040404");

/* チャットルーム */
INSERT INTO chat_info(id,room_name,comment,password,admin_password)VALUES
(1,"MongoDBにつて","Msongoについて学びたい人集合","1111","1111"),
(2,"オブジェクト指向について","オブジェクト指向について教えて下さい","2222","2222"),
(3,"インターノウスカレッジ","フリートークをしよう！！","3333","3333");

/* チャット */
INSERT INTO chat(id,handle_name,text_color,text_time,text)VALUES
(1,"江森壮太","black","2016/05/05/ 05:05:05","こんにちは！江森です。"),
(2,"我孫子春菜","red","2016/06/06/ 06:06:06","お疲れ様です。我孫子です。"),
(3,"松崎右京","green","2016/07/07/ 07:07:07","松崎です。よろしくお願いします。");

/*クイズ*/
INSERT INTO question(id,difficulty,text,answer1,answer2,answer3,answer4,correct,explanation,create_day)VALUES
(1,1,"信号機の進めの色は？","赤","黄色","青","白",3,"信号機は赤が止まれ、黄色が注意、青が進めです","20160101010101"),
(2,2,"山の日はいつ","8/10","8/11","8//12","8/13",2,"山の日は、2014年（平成26年）に制定され、2016年（平成28年）に施行された日本の国民の祝日の一つである。","20160202020202"),
(3,3,"次のうち、俳句の季語として認定されていないものはどれ？","サザン","チューブ","ユーミン","山下達郎",2,"解説なし","20160303030303"),
(4,1,"100円ショップ「ザ・ダイソー」で知られる大創産業の本社がある都道府県は？","神奈川県","京都府","福岡県","広島県",4,"解説なし","20160104040404"),
(5,3,"1866年、プロイセンとオーストリアの間に勃発した「普墺戦争」の別名は？","七年間戦争","七週間戦争","七ヶ月戦争","七日間戦争",2,"解説なし","20160303030305"),
(6,3,"1928年に、香川県の安戸池で野網和三郎が日本で初めて養殖に成功した魚は？","アジ","ヒラメ","タイ","ハマチ",4,"解説なし","20160303030306"),
(7,3,"1950年から1967年まで東京新聞などに連載されたある戦国武将を主人公とする作家・山岡荘八の代表作は？","『織田信長』","『豊臣秀吉』","『今川義元』","『徳川家康』",4,"解説なし","20160303030307"),
(8,3,"1975年に出版された当時の沖縄を撮影している東松照明の写真集は？","『星雲の鉛筆』","『地球の鉛筆』","『月の鉛筆』","『太陽の鉛筆』",4,"解説なし","20160303030308"),
(9,3,"1983年にアップル社が発売したオフィス向けのパソコンは？","Lisa","Yuki","Aiko","Anna",1,"解説なし","20160303030309"),
(10,1,"1986年の「新語・流行語大賞」の新語部門金賞を「究極」で受賞した、漫画『美味しんぼ』の原作者は？","花咲アキラ","小池一夫","武論尊","雁屋哲",4,"解説なし","20160303030310"),
(11,1,"1987年に、小説『優駿』で「JRA賞馬事文化賞」の最初の受賞者となった作家は？","山野浩一","寺山修司","宮本輝","椎名誠",3,"解説なし","20160303030311"),
(12,1,"1991年に、安達祐実が出演した「具が大きい！」のCMで話題となった、ハウス食品から発売されていたカレーは？","ザ・カリー","カレーマルシェ","カリー工房","カレー職人",3,"解説なし","20160303030312"),
(13,2,"2004年に刊行されベストセラーとなった、富山大学の名誉教授・横山泰行の著書は『「のび太」という生きかた』ですがその続編として、2012年に刊行された本は？","『「のび太」という生きかた』","『「ジャイアン」という生きかた』","『「スネ夫」という生きかた』","『「ドラえもん」という生きかた』",3,"解説なし","20160303030313"),
(14,2,"2007年に亡くなっている「ビアハンター」の異名をとったアメリカのビール評論家は？","ボブ・ディラン","マイケル・ジャクソン","スティービー・ワンダー","レイ・チャールズ",2,"解説なし","20160303030314"),
(15,2,"2009年10月に東京・赤坂に1号店がオープンした多くの芸能人が考案したメニューがウリの飲食店は？","芸能人焼肉部","芸能人カレー部","芸能人ラーメン部","芸能人スイーツ部",2,"解説なし","20160303030315");