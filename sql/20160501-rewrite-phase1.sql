set names utf8;
set foreign_key_checks=0;
drop database if exists rewrite;
create database if not exists rewrite;
use rewrite;


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
create table user (
user_id int not null auto_increment comment 'ユーザーID',
password varchar(255) not null  comment 'パスワード',
name varchar(255) default "　" comment '名前',
name_f varchar(255) default "　" comment '名前（ふりがな）' ,
postal varchar(255) not null default "　" comment '郵便番号'  ,
address varchar(255) not null default "　"  comment '住所' ,
tel_number varchar(255) not null default "　"  comment '電話番号',
email varchar(255) not null unique  comment 'メールアドレス' ,
sex varchar(10) not null default "　" comment '性別' ,
birthday date not null default 00000000 comment '誕生日',
handle_name varchar(16) comment 'ハンドルネーム',
register_day datetime not null default 00000000000000 comment '登録日',
update_day datetime not null default 00000000000000  comment '更新日',
userdel_flg boolean not null default FALSE comment '削除フラグ',
login_flg boolean not null default TRUE  comment 'ログインフラグ',
user_flg int not null default 1  comment 'ユーザーフラグ',
PRIMARY KEY (user_id)
)comment='ユーザー情報テーブル';

create table article(
site_id int not null auto_increment comment 'サイトID',
site_date datetime not null comment 'サイト投稿日時',
site_title varchar(50) not null comment 'サイトタイトル',
site_janre varchar(255) not null comment 'ジャンル',
summary varchar(255) not null comment '要約',
image_url varchar(255) null comment '画像URL',
site_Banner varchar(255) not null comment 'サイトURL',
primary key(site_id)
)comment='記事情報テーブル';

create table user_review(
user_id int not null comment 'ユーザーID',
review_date datetime not null comment 'レビュー投稿日時',
text varchar(255) not null comment 'レビュー内容',
title varchar(255) not null comment 'サイトタイトル'
)comment='レビュー情報テーブル';

create table contact_us(
contact_name varchar(10) not null comment '名前',
contact_email varchar(255) comment 'メールアドレス',
contact_date datetime not null comment 'お問い合わせ日時',
contact_text varchar(255) not null default "　" comment 'お問い合わせ内容'
)comment = 'お問い合わせ情報テーブル';

/*以下テスト用データ*/


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
/* データ登録 */
/* ユーザー 一覧 / ユーザーID/パスワード/ユーザー名/ユーザー名(ふりがな)/郵便番号/住所/電話番号/メールアドレス/性別/生年月日/ハンドルネーム/登録日/更新日/退会フラグ/ログインフラグ/ユーザーフラグ*/
insert into user(user_id,password,name,name_f,postal,address,tel_number,email,sex,birthday,handle_name,register_day,update_day,userdel_flg,login_flg,user_flg)values
/*管理人ユーザー情報　ユーザーフラグ2*/
(1,"internous01","井上琢磨","いのうえたくま","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","09012341234","inoue@internous.co.jp","男","1990-09-25","管理人","2016-07-01 13:00:00","2016-07-11 13:54:20",FALSE,FALSE,"2"),
(2,"internous01","原田美由貴","はらだみゆき","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","09045674567","harada@internous.co.jp","女","1992-05-03","管理人","2016-07-01 13:00:00","2016-07-11 13:00:00",FALSE,FALSE,"2"),
(3,"admin","古長サムたろう","こちょうさむたろう","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","09045674567","admin@admin.com","女","1992-05-03","管理人","2016-07-01 13:00:00","2016-07-11 13:00:00",FALSE,FALSE,"2"),
/*一般ユーザー情報 ユーザーフラグ1*/
(4,"testuser","テストユーザー","いんたーのうすかぶしきがいしゃぷろぐらまかれっじ　てすとゆーざー","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","0312345678","testuser@gmail.com","男","1993-12-24","testuser","2016-07-01 13:00:00","2016-07-11 12:11:25",FALSE,FALSE,"1"),
(5,"testuser2","テストユーザー2","いんたーのうすかぶしきがいしゃぷろぐらまかれっじ　てすとゆーざー2","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","0312345678","testuser2@gmail.com","男","1993-12-24","testuser2","2016-07-01 13:00:00","2016-07-11 12:11:25",FALSE,FALSE,"1"),
(6,"testuser3","テストユーザー3","いんたーのうすかぶしきがいしゃぷろぐらまかれっじ　てすとゆーざー3","1130034","東京都文京区湯島3-2-12　御茶ノ水天神ビル","0312345678","testuser3@gmail.com","男","1993-12-24","testuser3","2016-07-01 13:00:00","2016-07-11 12:11:25",FALSE,FALSE,"1")
;

/*サイト画面/サイトID/サイト投稿日時/サイトタイトル/サイトジャンル/要約/画像URL/サイトURL*/
insert into article(site_id,site_date,site_title,site_janre,summary,image_url,site_Banner)values
	(1,"2016-08-12 13:00:00","プーチン大統領、犬と一緒に記者会見","politics","2010年11月17日のロシアニュースで、プーチンロシア首相が最近バルカン諸国.....","image/mig.jpg","article.jsp"),
	(2,"2016-08-15 11:00:00","ポケモンGOを使った斬新な保険","economy","ポケモンGOに関する斬新な保険が考案された","image/pokemonGo.jpg","article.jsp"),
	(3,"2016-08-17 20:00:00","Mr.Uematsu 独特のデザインを発見","entertainment","日本在住のMr.Uematsuが独特のセンスで選び出した至高のデザイン.....","image/uematsu.jpg","article.jsp"),
    (4,"2016-08-19 22:00:00","かわいい！さりげないpandaが話題に","entertainment","その日、人類は白い背景に溶け込むPandaを発見した.....","image/panda.jpg","article.jsp"),
    (5,"2016-08-12 13:00:00","話題の人工知能特集","IT","AIの技術は日々進化している。将来的には医療や交通の分野での活躍が期待されている。.....","image/artifi.jpg","article.jsp"),
	(6,"2016-08-15 11:00:00","日本企業のほとんどはブラック企業","bussiness","先日、厚生労働省が行ったアンケートによると日本企業に勤めているほとんどの人が自分の会社をブラック企業だと.....","image/sozai5.jpg","article.jsp"),
	(7,"2016-08-17 20:00:00","東京都文京区でインタビュー","fashion","最近流行のファッションを紹介！本日の......","image/sozai6.jpg","article.jsp"),
    (8,"2016-08-25 19:00:00","蜂蜜の美容効果に世界中が注目","beauty ","アメリカの研究所は蜂蜜に含まれる栄養を再度見直した。その結果、蜂蜜には驚くべき効能が.......","image/poo2.jpg","article.jsp"),
	(9,"2016-08-19 22:00:00","ホワイト日記","blog","今日のホワイト君はいつもに増して白い.......","image/images.jpg","article.jsp"),
    (10,"2016-08-19 23:00:00","Mr.Uematsu またまた独特のデザインを発見","fashion","またまた世界のMr.Uematsuがやってくれました.......","image/wood.jpg","article.jsp"),
    (11,"2016-08-20 22:00:00","映画速報","entertainment","登場人物は全員悪.......","image/sozai3.jpg","article.jsp"),
    (12,"2016-08-20 22:00:00","今日もまた電車遅延","politics","なぜ毎日のように遅延するのか！.......","image/JR.jpg","article.jsp"),
    (13,"2016-08-21 22:00:00","全米が驚愕☆ラピュタ王の上に乗る凶行","politics","王の怒り！！君はラピュタ王の上に乗っているのだぞ！.......","image/images3.jpg","article.jsp"),
    (14,"2016-08-21 22:00:00","経済に大打撃！スタグフレーション","economy","スタグフレーション到来！！再び恐慌へ！.......","image/kkk.jpg","article.jsp"),
    (15,"2016-08-22 22:00:00","新しい化粧品が発売","beauty","新しい化粧品がすごいと話題に！.......","image/butterfly.jpg","article.jsp"),
    (16,"2016-08-24 19:00:00","プーが教える最新ファッション","fashion ","サングラスが黒く光る、黄色い体が渋い大人気プーがJapanにやってきた！.......","image/poo.jpg","article.jsp"),
    (17,"2016-08-19 22:00:00","きれいな頭を手に入れたい人必見！","beauty","きれいでつるつるの頭を手に入れたい。そんな悩みをMr.Hageが.......","image/be.jpg","article.jsp"),
    (18,"2016-08-27 19:00:00","今日のフリーザ様","blog ","今日のフリーザ様はとても機嫌がいい。そこで今日はザーボン様とドドリア様を連れて、渋谷のマックでハンバーガーと.......","image/F.jpg","article.jsp"),
    (19,"2016-08-30 19:00:00","時給2000円!!バットを振るだけの簡単なお仕事","bussiness ","ボールが飛んできたらバットを振るだけ、上手くできなくても大丈夫！時給2000円！！！猫限定。.......","image/cat1.jpg","article.jsp"),
    (20,"2016-09-01 19:00:00","派遣の仕事をお探しの方、注目！","bussiness ","正社員になれない、面接に受からない、そんな方に朗報です。私たちの会社では面接等は一切ありません。マイナンバーカード持参で登.......","image/job.jpg","article.jsp"),
    (21,"2016-09-01 19:00:00","急激な円高が日本企業を襲う","economy ","先日の急激な円高により日本の輸出企業、特に中小企業が大幅な赤字に追い込まれた。政府は今後今回の円高によ.......","image/money.jpg","article.jsp"),
    (22,"2016-09-01 19:00:00","Raincor IT Services","IT ","Over 10 Years of Professional IT experience working for small, mid & large-size businesses as well as government .......","image/IT2.jpg","article.jsp"),
    (23,"2016-09-01 19:00:00","リラックスタイムは終わりだ！ワイルドベアー","blog ","熊としての本能を取り戻すことに成功した大人気のあの熊が、何故か人気に .......","image/relax.jpg","article.jsp"),
    (24,"2016-09-01 19:00:00","javaの講習を無料で受講できます","IT","誕生してまだ間もない言語javaを１から学ぶことができる講習を.......","image/IT.jpg","article.jsp")
    ;

/*ユーザーID/レビュー投稿日時/レビュー内容/サイトタイトル*/
insert into user_review(user_id, review_date, text, title)values
(4,"2016-08-24 21:08:45","もふもふしたい！","かわいい！さりげないpandaが話題に"),
(5,"2016-08-24 23:04:20","犬かわいい","プーチン大統領、犬と一緒に記者会見"),
(6,"2016-08-25 01:15:01","プーチンかわいい","プーチン大統領、犬と一緒に記者会見"),
(4,"2016-09-09 09:09:09","政治界に衝撃はしる","プーチン大統領、犬と一緒に記者会見"),
(5,"2016-08-27 16:51:40","我らがUematu!Woooooooooooooo!","Mr.Uematsu 独特のデザインを発見" ),
(6,"2016-08-28 21:01:33","ごめんよくわからない","Mr.Uematsu 独特のデザインを発見"),
(4,"2016-08-25 17:08:35","どうもこんにちは、私が社畜です","日本企業のほとんどはブラック企業"),
(5,"2016-08-29 07:45:07","土曜だけど出勤してきます。","日本企業のほとんどはブラック企業"),
(6,"2016-08-24 13:40:48","猫限定とかｗｗｗｗ","時給2000円!!バットを振るだけの簡単なお仕事"),
(4,"2016-08-25 10:10:48","釣られたのは誰ですか？私です(*´∀｀*)","時給2000円!!バットを振るだけの簡単なお仕事"),
(5,"2016-08-29 09:54:45","わろた","今日のフリーザ様"),
(6,"2016-09-30 16:52:22","だれかコメントしてやれよ","今日のフリーザ様")
;
