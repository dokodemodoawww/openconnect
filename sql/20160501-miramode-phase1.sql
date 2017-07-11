set names utf8;
set foreign_key_checks=0;
drop database if exists miramode;
create database if not exists miramode;
use miramode;

/*@auhter
 * @since 2016/08/15
 * @virsion 1.0
 */

/*テーブル作成*/

/*コーディネート
 * ユーザーID = user_id
 * コーディネートID = coordinate_id
 * タイトル = title
 * 紹介文 = introduction
 * 投稿日 = post_date
 * コーディネート画像のパス = coordinate_img_pass
 * トップスのID = tops_id
 * トップスのブランド = tops_brand
 * ボトムスのID = bottoms_id
 * ボトムスのブランド = bottoms_brand
 * シューズのID = shoes_id
 * シューズのブランド = shoes_brand
 * アクセサリのID = accesaries_id
 * アクセサリのブランド = accesaries_brand
 * アウターのID = outer_id
 * アウターのブランド = outer_brand
 * オールインワンのID = allinone_id
 * オールインワンのブランド = allinone_brand
 * 性別 = men or women or kids の三択(1・女、2・男、3・子供) = gender
 * */
CREATE TABLE coordinate(
user_id int not null comment 'ユーザーID',
coordinate_id int not null auto_increment PRIMARY KEY comment 'コーディネートID',
title varchar(30) not null comment 'タイトル',
introduction varchar(255) not null comment '紹介文',
post_date date not null comment '投稿日',
coordinate_img_pass varchar(255) not null comment 'コーディネート画像のパス',
tops_id int comment 'トップスのID',
tops_brand varchar(30) comment 'トップスのブランド',
bottoms_id int comment 'ボトムスのID',
bottoms_brand varchar(30) comment 'ボトムスのブランド',
shoes_id int comment 'シューズのID',
shoes_brand varchar(30) comment 'シューズのブランド',
accesaries_id int comment 'アクセサリのID',
accesaries_brand varchar(30) comment 'アクセサリのブランド',
outer_id int comment 'アウターのID',
outer_brand varchar(30) comment 'アウターのブランド',
allinone_id int comment 'オールインワンのID',
allinone_brand varchar(30) comment 'オールインワンのブランド',
gender int comment '性別'
);

/*お気に入り
 * ユーザーID = user_id
 * コーディネートID = coordinate_id
 */
CREATE TABLE favorite(
user_id int not null comment 'ユーザーID',
coordinate_id int not null comment 'コーディネートID'
);

/*コメント
 *ユーザーID = user_id
 *コメント = comment
 *コーディネートID = coordinate_id
 *投稿日 = post_time
 *評価 = evaluation
 **/
CREATE TABLE comment(
user_id int not null comment 'ユーザーID',
comment varchar(255) comment 'コメント',
coordinate_id int not null comment 'コーディネートID',
post_time date comment '投稿日',
evaluation int comment '評価'
);

/*カート
 *ユーザーID = user_id
 *アイテムID = item_id
 * 購入数 = lot
 * */

CREATE TABLE cart(
user_id int not null comment 'ユーザーID',
item_id int not null comment 'アイテムID',
lot int comment '購入数'
);

/*アイテム
 * アイテムID = item_id
 * アイテム名 = item_name
 * カテゴリー = categpry 1=トップス、2=ボトムス、3=シューズ、4=アクセサリ、5=アウター、6=オールインワン
 * 値段 = price
 * アイテム画像パス = item_img_pass
 * 商品詳細 = item_detail
 * */
CREATE TABLE item(
item_id int not null auto_increment primary key comment 'アイテムID',
item_name varchar(50) not null unique key comment 'アイテム名',
category int not null comment 'カテゴリー',
price decimal(9,2) not null comment '値段',
item_img_pass varchar(255) not null comment 'アイテム画像パス',
item_detail varchar(255) not null comment '商品詳細'
);

/*管理者
 * 管理者名 = admin_name
 * 管理者パスワード = admin_password
 * */
CREATE TABLE admin(
admin_name varchar(20) not null primary key comment '管理者名',
admin_password varchar(20) not null comment '管理者パスワード'
);

/*注文履歴
 * ユーザーID = user_id
 * アイテムID = item_id
 * 購入数 = order_lot
 * 購入日 = oeder_date
 * */

CREATE TABLE order_history(
user_id int not null comment 'ユーザーID',
item_id int not null comment 'アイテムID',
order_lot int not null comment '購入数',
order_date date not null comment '購入日'
);
/*-----------------ここからインサート文-----------------*/

/*コーディネートインサート
*ユーザーID/コーディネートID/タイトル/紹介文/投稿日/コーディネート画像パス/トップスのID/トップスのブランド/ボトムスのID/ボトムスのブランド/シューズのID/シューズのブランド/アクセサリのID/アクセサリのブランド/アウターのID/アウターのブランド/オールインワンのID/オールインワンのブランド/性別*/
insert into coordinate(user_id,coordinate_id,title,introduction,post_date,coordinate_img_pass,tops_id,tops_brand,bottoms_id,bottoms_brand,shoes_id,shoes_brand,accesaries_id,accesaries_brand,outer_id,outer_brand,allinone_id,allinone_brand,gender)values
(1,1,"爽やかサロペット","デニムのサロペットを夏らしく白のバックと合わせてコーディネートしてみました。動きやすいのでアクティブな夏におススメです！",cast('2016-08-01' as date),"cordesample1.jpg",1,"",4,"",6,"",8,"",10,"",12,"",1),
(2,2,"メンズ風コーデ","ダメージデニムに黒を合わせて、メンズライクなコーデにしました。赤リップを使うことで、女性らしさを演出しています。",cast('2016-08-02' as date),"cordesample2.jpg",0,"",0,"",6,"mira-mode",0,"",0,"",0,"",1),
(3,3,"アクティブスタイルにしてみた","ブルーのシャツに黒パンを合わせてシンプルにしました。赤いスニーカーがアクセントです。",cast('2016-08-03' as date),"cordesample3.jpg",0,"",0,"",0,"",0,"",0,"",0,"",2),
(1,4,"少し背伸びをしてみました","メガネや時計などのアイテムを使って、大人女子を演出してみました。カラーを黒とブラウンで統一させて全体的なまとまり感を出してます。",cast('2016-08-04'as date),"cordesample4.jpg",0,"",0,"",0,"",0,"",0,"",0,"",3),
(2,5,"シンプル白シャツ","白シャツをメインにシンプルにまとめました。黒のパンツとシューズと合わせることで白シャツが映えるようにしています。簡単にできるコーデなので参考にしてもらえるとうれしいです。",cast('2016-08-05' as date),"cordesample5.jpg",0,"",0,"",6,"mira-mode",0,"",0,"",0,"",2),
(3,6,"イニシャルT","お気に入りのイニシャルTとニット帽を合わせたよ。全体的に寒色系でまとめました。ニットは今の時期少し暑かった…？",cast('2016-08-06' as date),"cordesample6.jpg",0,"",0,"",0,"",0,"",0,"",0,"",3);

/*お気に入りインサート
 * ユーザーID/コーディネートID*/
insert into favorite(user_id,coordinate_id)values(1,1),(2,2);

/*コメントインサート
 * ユーザーID/コメント/コーディネートID/投稿日/評価*/
insert into comment(user_id,comment,coordinate_id,post_time,evaluation)values
(1,"夏らしくていいと思います。早速参考にさせてもらいます。",1,cast('2016-08-01' as date),5),
(2,"まとまりがあっていいですね。サンダルをもっと夏らしいものにするとより素敵だと思いました。",1,cast('2016-08-01' as date),3),
(3,"とってもかっこいいです。女ウケはよさそうですね",2,cast('2016-08-02' as date),3),
(1,"ボーイッシュで良い感じですね。でも、アウターが重いかなって感じます",2,cast('2016-08-02' as date),2),
(2,"こういう感じ好きです。",3,cast('2016-08-03' as date),5),
(3,"アクセサリーが微妙。トップスがカッコいいので同じものを買おうと思います。",3,cast('2016-08-03' as date),2),
(1,"かわいいと思いました。うちの子のコーデの参考にします。",4,cast('2016-08-04' as date),4),
(2,"お母さんのセンスのよさが伝わります。同じボトムスを買いました～。",4,cast('2016-08-04' as date),5),
(3,"シンプルで好きです。彼に参考にしてもらおうと思いました。",5,cast('2016-08-05' as date),5),
(1,"少し寂しいかな？キャップとかアイテムをプラスしたらどうかな。",5,cast('2016-08-05' as date),2),
(1,"ニット帽が暑そう。夏なのでキャップとか麦わらがベスト",6,cast('2016-08-06' as date),2),
(2,"すそをロールアップしているところを参考にさせてもらいます。",6,cast('2016-08-06' as date),4);


/*カートインサート
 * ユーザーID/アイテムID/購入数*/
insert into cart(user_id,item_id,lot)values
(1,1,1),(1,2,1);

/*アイテムインサート
 * アイテムID/アイテム名/カテゴリ/値段/アイテム画像パス/商品詳細*/
insert into item(item_id,item_name,category,price,item_img_pass,item_detail)values
(1,"しましまタンクトップ",1,5000.00,"topssample1.jpg","しましまのタンクトップ、何に出も合わせやすいです。"),
(2,"ピンクのブラウス",1,5000.00,"topssample2.jpg","ピンクのブラウス。可愛いフリルがアクセントです。"),
(3,"ハートのロング丈Tシャツ",1,8000.00,"topssample3.jpg","大きなハートがアクセントのロング丈のTシャツです。これ１枚でも可愛いです。"),
(4,"ロールアップデニム",2,5000.00,"bottomssample1.jpg","キッズのデニム、1950年物です"),
(5,"黒パンツ",2,18000.00,"bottomssample2.jpg","黒のパンツです。オフィスでもオフでもオールマイティに活躍します。"),
(6,"白いスニーカー",3,6000.00,"shoessample1.jpg","白いスニーカーなので、何にでも合わせやすいです。マストアイテムです。"),
(7,"ブルーのパンプス",3,5000.00,"shoessample2.jpg","夏らしいブルーのパンプス。アンクルストラップがポイント。"),
(8,"シルバーアクセ",4,800.00,"accesample1.jpg","新作のシルバーアクセです。カッコいい系のコーデに合わせてみてください。"),
(9,"ビーズブレス",4,12000.00,"accesample2.jpg","涼しげな水色のビーズブレスレットです。シンプルなワンピなどに合わせてみてはいかがですか。"),
(10,"ミリタリージャケット",5,36000.00,"outersample1.jpg","かわいめのミリタリージャケット。冬におススメ。"),
(11,"ピンクトレンチ",5,48000.00,"outersample2.jpg","ピンクのトレンチコート。これ一枚で主役級のかわいさに！"),
(12,"デニムサロペット",6,5400.00,"allinonesample1.jpg","デニムのサロペットです。タンクトップなどと合わせてみてください。"),
(13,"水色ワンピ",6,3600.00,"allinonesample2.jpg","mira-modeの新作アイテムです！夏のデートにおススメのワンピースです。");


/*管理者インサート
 * 管理者名/パスワード*/
insert into admin(admin_name,admin_password)values("admin","123");

/*購入履歴インサート
 * ユーザーID/アイテムID/購入数/購入日*/
insert into order_history(user_id,item_id,order_lot,order_date)values(1,1,1,cast('2016-08-02' as date));
