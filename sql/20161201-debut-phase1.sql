set name utf8;
set foreign_key_checks=0;
drop database if exists debut;
create database debut;
use debut;


/*商品テーブル = item
 *商品ID = item_id
 *商品名 = item_name
 *ジャンル = item_genre
 *価格 = price
 *デリートフラグ = delete_flg
 *登録日 = registration_date
 *更新日 = update_date
 */

create table item(
item_id int primary key auto_increment comment '商品ID',
item_name varchar(100) not null comment '商品名',
item_genre varchar(50) not null comment 'ジャンル',
price decimal(10,3) not null comment '価格',
delete_flg boolean not null default false comment '削除フラグ',
registration_date datetime not null comment '登録日',
updated_date datetime not null comment '更新日'
)comment = '商品テーブル';

/*商品説明テーブル = overview
 *商品説明ID = overview_id
 *商品説明ジャンル = overview_genre
 *商品説明トップ = overview_top
 *商品説明キャッチ01 = overview_catch01
 *商品説明キャッチ02 = overview_catch02
 *商品説明詳細 = overview_ex
 *商品説明キット01 = overview_kit01
 *商品説明キット02 = overview_kit02
 *商品説明キット03 = overview_kit03
 *商品説明キット04 = overview_kit04
 *商品説明キット05 = overview_kit05
 *商品説明キット06 = overview_kit06
 *商品説明売り文句01 = overview_slogan01
 *商品説明売り文句02 = overview_slogan02
 *商品説明売り文句03 = overview_slogan03
 *商品説明売り文句04 = overview_slogan04
 *商品説明売り文句05 = overview_slogan05
 *デリートフラグ = delete_flg
 */

create table overview(
overview_id int primary key auto_increment comment '商品説明ID',
overview_genre varchar(50) comment '商品説明ジャンル',
overview_top text comment '商品説明トップ',
overview_catch01 text comment '商品説明キャッチ01',
overview_catch02 text comment '商品説明キャッチ02',
overview_ex text comment '商品説明詳細',
overview_kit01 text comment '商品説明キット01',
overview_kit02 text comment '商品説明キット02',
overview_kit03 text comment '商品説明キット03',
overview_kit04 text comment '商品説明キット04',
overview_kit05 text comment '商品説明キット05',
overview_kit06 text comment '商品説明キット06',
overview_slogan01 text comment '商品説明売り文句01',
overview_slogan02 text comment '商品説明売り文句02',
overview_slogan03 text comment '商品説明売り文句03',
overview_slogan04 text comment '商品説明売り文句04',
overview_slogan05 text comment '商品説明売り文句05',
delete_flg boolean not null default false comment '削除フラグ',
foreign key(overview_id)references item(item_id)
)comment = '商品説明テーブル';

/*画像テーブル = image
 *画像ID = image_id
 *画像ジャンル = image_genre
 *画像トップ = image_top
 *画像スライド01 = image_slide01
 *画像スライド02 = image_slide02
 *画像スライド03 = image_slide03
 *画像キット01 = image_kit01
 *画像キット02 = image_kit02
 *画像キット03 = image_kit03
 *画像キット04 = image_kit04
 *画像キット05 = image_kit05
 *画像キット06 = image_kit06
 *デリートフラグ = delete_flg
 */

create table image(
image_id int primary key auto_increment comment '画像ID',
image_genre varchar(50) comment '画像ジャンル',
image_top text comment '画像トップ',
image_slide01 text comment '画像スライド01',
image_slide02 text comment '画像スライド02',
image_slide03 text comment '画像スライド03',
image_kit01 text comment '画像キット01',
image_kit02 text comment '画像キット02',
image_kit03 text comment '画像キット03',
image_kit04 text comment '画像キット04',
image_kit05 text comment '画像キット05',
image_kit06 text comment '画像キット06',
delete_flg boolean not null default false comment '削除フラグ',
foreign key(image_id)references item(item_id)
)comment = '画像テーブル';

/*購入テーブル = puchase
 *購入ID = puchase_id
 *ユーザーID = user_id
 *商品ID = item_id
 *商品名 = item_name
 *注文数 = order_count
 *合計金額 = amount
 *購入日 = puchase_date
 *購入方法 = purchase_method
 */

create table purchase(
purchase_id int not null primary key auto_increment comment '購入ID',
user_id int null comment 'ユーザーID',
item_name varchar(100)  comment '商品名',
amount decimal(10,3)  comment '合計金額',
purchase_date date  comment '購入日'
/*,foreign key(user_id) references openconnect.users(user_id) on delete cascade*/
/*,foreign key(item_id) references item(item_id)*/
)comment = '購入テーブル';

/*クレジット種類テーブル = credit_type
 *カード種類番号 = card_num
 *カード名 = card_name
 */

create table credit_type(
credit_num int not null primary key comment 'カード種類番号',
credit_name varchar(255) not null comment 'カード会社名'
)comment = 'クレジット種類テーブル';

/*非会員情報テーブル = form
 *お名前 = form_name
 *メールアドレス = form_email_address
 *電話番号 = form_phone_number
 *郵便番号 = zip11
 *住所 = addr11
 */

create table form(
form_id int not null primary key auto_increment comment 'フォームID',
form_name varchar(100) comment 'お名前',
form_email_address varchar(100) comment 'メールアドレス',
form_phone_number varchar(100) comment '電話番号',
zip11 varchar(100) comment '郵便番号',
addr11 varchar(100) comment '住所'
)comment = 'お客様情報入力テーブル';

/*クレジットテーブル = credit
 *クレジット種類 = credit_type
 *クレジット番号 = credit_number
 *カード名義 = name_e
 *セキュリティコード = security_code
 *有効期限(月) = expiration_month
 *有効期限(年) = expiration_year
 *登録日 = registration_date
 *更新日 = updated_date
 */

create table credit(
credit_id int primary key auto_increment comment 'クレジットID',
credit_type int not null comment 'クレジット種類',
credit_number varchar(16) comment 'クレジット番号',
name_e varchar(50) comment 'カード名義',
security_code varchar(4) comment 'セキュリティコード',
expiration_month varchar(2) comment '有効期限(月)',
expiration_year varchar(2) comment '有効期限(年)',
registration_date datetime comment '登録日',
updated_date datetime comment '更新日',
foreign key(credit_id)references form(form_id)
)comment = 'クレジットテーブル';

insert into credit_type(credit_num, credit_name) values(0, "visa");
insert into credit_type(credit_num, credit_name) values(1, "master");
insert into credit_type(credit_num, credit_name) values(2, "american express");

insert into item(
item_name,
item_genre,
price,
registration_date,
updated_date,
delete_flg
)values(
'ダーツ入門キット',
'indoor',
3000,
"2016/11/08 11:29:00",
"2016/11/08 11:29:00",
false);

insert into image(
image_genre,
image_top,
image_slide01,
image_slide02,
image_slide03,
image_kit01,
image_kit02,
image_kit03,
image_kit04,
image_kit05,
image_kit06,
delete_flg
)values(
'indoor',
'darts_top.jpg',
'darts_slide01.jpg',
'darts_slide02.jpg',
'darts_slide03.jpg',
'darts_kit01.jpg',
'darts_kit02.jpg',
'darts_kit03.jpg',
'darts_kit04.jpg',
'darts_kit05.jpg',
null,
false);


insert into overview(
overview_genre,
overview_top,
overview_catch01,
overview_catch02,
overview_ex,
overview_kit01,
overview_kit02,
overview_kit03,
overview_kit04,
overview_kit05,
overview_kit06,
overview_slogan01,
overview_slogan02,
overview_slogan03,
overview_slogan04,
overview_slogan05,
delete_flg
)values(
'indoor',
'男女問わず人気の定番趣味！\n\n時間を気にせずみんなで盛り上がれる点もオススメ！',
'ダーツ入門の王道キット！',
'これで友達に差をつけよう！',
'ちょっと大人びた遊びのイメージがあるダーツ。\n
未経験者には敷居が高いと思われがちですが、実は全然そんな事ないんです。\n
最近ではネットカフェ等に併設されていることも多くお店側で道具も貸し出ししてくれるので、\n
他の趣味に比べるとむしろ入りやすい分類と言えるでしょう。\n
遊び方も一人でひたすらハイスコアを目指すものから、\n
四人でチームを組んでポイントを競い合うものまで様々で、飽きにくいのも特徴です。\n
しかしながらお店によって貸し出してくれるダーツの種類は違うので力加減や持ち方などが毎回変わってきてしまいます。\n
それでは上達速度にも影響を及ぼしてしまうので、あまりオススメは出来ません。\n
今回は最低限必要なアイテムだけを厳選したリーズナブルなキットをご紹介します！',
'・DEBUT特製入門用ダーツ\n
持ちやすさにとことん拘った初心者向けのダーツです。\n
各部分は取外し可能なので自分好みにアレンジする事も可能となっています。',
'・フライト\n
ダーツ上部に付いた羽のようなパーツ。\n
馴染みやすいライトグリーンのシンプルなデザインです。',
'・シャフト\n
ダーツ握る部分のバレルとフライトを繋ぐパーツ。\n
長さによって投げた時の感覚が違いますので、一般的な4種類をお付け致しします。',
'・チップ\n
ダーツ下部のボードに刺さるパーツ。\n
頻繁に取り替えるのが基本となりますので、9色50本お付け致します。',
'・ダーツケース\n
ダーツ本体や、予備パーツを収納するケースです。\n
フックが付いていますのでズボンのベルト等に装着できます。',
null,
'肝心のお値段ですが、通常約8,000円のところ………、\n\n\n',
'これだけセットでなんと',
'3,000',
'円です！',
'在庫がなくなり次第販売終了となりますので、ご購入をお考えの方はお早めに！',
false);

insert into item(
item_name,
item_genre,
price,
registration_date,
updated_date,
delete_flg
)values(
'登山入門キット',
'outdoor',
15000,
"2016/11/08 11:29:00",
"2016/11/08 11:29:00",
false);

insert into image(
image_genre,
image_top,
image_slide01,
image_slide02,
image_slide03,
image_kit01,
image_kit02,
image_kit03,
image_kit04,
image_kit05,
image_kit06,
delete_flg
)values(
'outdoor',
'yama_top.jpg',
'yama_slide01.jpg',
'yama_slide02.jpg',
'yama_slide03.jpg',
'yama_kit01.jpg',
'yama_kit02.jpg',
'yama_kit03.jpg',
'yama_kit04.jpg',
'yama_kit05.jpg',
null,
false);


insert into overview(
overview_genre,
overview_top,
overview_catch01,
overview_catch02,
overview_ex,
overview_kit01,
overview_kit02,
overview_kit03,
overview_kit04,
overview_kit05,
overview_kit06,
overview_slogan01,
overview_slogan02,
overview_slogan03,
overview_slogan04,
overview_slogan05,
delete_flg
)values(
'outdoor',
'最近密かに人気を集めつつある登山。\nたくさんの植物・澄んだ空気・山頂からの景色は最高です！',
'登山入門の王道キット！',
'これで快適な山登りへ！',
'過酷で大変そうなイメージがある登山。\n
未経験者には敷居が高いと思われがちですが、実は全然そんな事ないんです。\n
最近では山ガールという言葉もあるくらい、男女問わず人気の趣味となっているんです！\n
一人で登るもよし、友達やツアーでみんなで登るもよし、初めは辛いかもしれないですが、\n
登っていく内に普段の生活では味わえない大自然・空気感・山頂からの景色は言葉では表しきれないものがあります！\n
今回はそんな登山に必要なアイテムを厳選したリーズナブルなキットをご紹介します！',
'・レインウェア\n
登山中の突然の雨から身体を守ってくれるレインウェアは、必需品です！\n
山では急に天候が変りやすく、雨で体が濡れると低体温症になってしまうことがあります。\n
雨具を持っているかどうかで生死を分けると言ってもいいほど重要なアイテムなのです。',
'・リュック\n
普段使いのリュックと違い、長時間歩く登山では高機能且つ大容量で軽量になった登山用リュックがオススメです！',
'・リュックカバー\n
天候の変わりやすい登山では、突然の雨にも対応できるリュックカバーも必須と言えるでしょう！',
'・トレッキングシューズ\n
何よりも長時間歩く事になる登山で一番重要と言われるトレッキングシューズ！\n
履きやすく癖のないシューズを選びました。',
'・ヘッドライト\n
薄暗い早朝からの登山や、予定より下山時間が押してしまい日が暮れてきてしまった時など、命を守る必須アイテムです。\n
軽くて汎用性の高いお勧めのヘッドライトをご紹介！',
null,
'肝心のお値段ですが、通常約25,000円のところ………、\n\n\n',
'これだけセットでなんと',
'15,000',
'円です！',
'在庫がなくなり次第販売終了となりますので、ご購入をお考えの方はお早めに！',
false);

insert into item(
item_name,
item_genre,
price,
registration_date,
updated_date,
delete_flg
)values(
'ホームシアター入門キット',
'solo',
5000,
"2016/11/08 11:29:00",
"2016/11/08 11:29:00",
false);

insert into image(
image_genre,
image_top,
image_slide01,
image_slide02,
image_slide03,
image_kit01,
image_kit02,
image_kit03,
image_kit04,
image_kit05,
image_kit06,
delete_flg
)values(
'solo',
'solo_top.jpg',
'solo_slide01.jpg',
'solo_slide02.jpg',
'solo_slide03.jpg',
'solo_kit01.jpg',
'solo_kit02.jpg',
'solo_kit03.jpg',
'solo_kit04.jpg',
'solo_kit05.jpg',
null,
false);


insert into overview(
overview_genre,
overview_top,
overview_catch01,
overview_catch02,
overview_ex,
overview_kit01,
overview_kit02,
overview_kit03,
overview_kit04,
overview_kit05,
overview_kit06,
overview_slogan01,
overview_slogan02,
overview_slogan03,
overview_slogan04,
overview_slogan05,
delete_flg
)values(
'solo',
'高画質、高音質の映画がご自宅で楽しめるホームシアターセット。\nリビングを劇場にしてみませんか？',
'ホームシアターの王道キット！',
'これで自宅でゆっくり楽しみましょう！',
'ホームシアターは映画や音楽ファンの憧れ。\n
近年は４K対応のテレビやプレイヤーの選択肢も増え、お手ごろな価格になってきました。\n
またNetflixをはじめ４K対応の動画ストリーミングサービスも登場してます。\n
ホームシアターセットがあればいつでも好きな作品を自宅で劇場なみの高画質高音質で楽しめます。\n
お一人で楽しむのも良し、ご家族や仲間と楽しむのも良いでしょう。\n
今回はそんな厳選したハイクオリティなホームシアターセットをご紹介します！',
'・テレビ\n
まずはこれがなくては始まりません。\n
こちらの４K対応の50インチ型のテレビはきめ細やかな描写や色彩を映し出し、\n
作品のクオリティをありのままに表現します。',
'・プレイヤー\n
お好みの作品を再生するためにはプレイヤーも必要です。\n
ブルーレイ対応なのはもちろん、Netflixをはじめとする動画ストリーミングサービスにも対応しています。',
'・スピーカーセット\n
大迫力であり、繊細や音の響きまで伝えるスピーカーセットです。\n
5.1ch対応なので臨場感が映画館顔負けです。',
'・アンプリファー\n
高音質なスピーカーのスペックを引き出すには高品質なアンプリファーも必要です。\n
スピーカーとのマッチングはばっちりで、ノイズのみを取り除き性能を向上させます。',
'・ヘッドホン\n
迫力のスピーカーを使うことができない状況もあるでしょう。\n
このドイツ製のヘッドホンは生演奏よりも美しく聴こえるかもしれません。',
null,
'肝心のお値段ですが、通常約350,000円のところ………、\n\n\n',
'これだけセットでなんと',
'250,000',
'円です！',
'在庫がなくなり次第販売終了となりますので、ご購入をお考えの方はお早めに！',
false);

insert into item(
item_name,
item_genre,
price,
registration_date,
updated_date,
delete_flg
)values(
'ボウリング入門キット',
'party',
10000,
"2016/11/08 11:29:00",
"2016/11/08 11:29:00",
false);

insert into image(
image_genre,
image_top,
image_slide01,
image_slide02,
image_slide03,
image_kit01,
image_kit02,
image_kit03,
image_kit04,
image_kit05,
image_kit06,
delete_flg
)values(
'party',
'party_top.jpg',
'party_slide01.jpg',
'party_slide02.jpg',
'party_slide03.jpg',
'party_kit01.jpg',
'party_kit02.jpg',
'party_kit03.jpg',
'party_kit04.jpg',
'party_kit05.jpg',
null,
false);


insert into overview(
overview_genre,
overview_top,
overview_catch01,
overview_catch02,
overview_ex,
overview_kit01,
overview_kit02,
overview_kit03,
overview_kit04,
overview_kit05,
overview_kit06,
overview_slogan01,
overview_slogan02,
overview_slogan03,
overview_slogan04,
overview_slogan05,
delete_flg
)values(
'party',
'昔から定番の趣味ボウリング！\nわいわいやるのもいいけどさらに腕を磨きたい貴方へ！',
'ボウリング入門の王道キット！',
'これで友達に差をつけよう！！',
'ボウリングの一番の魅力は、誰でもできる、誰とでもプレイ出来るところではないでしょうか。\n
思い通りに投げられて、ストライクやスペアが取れたときの爽快感はたまりませんよね！\n
ボウリングは基本的に1人でできてしまうスポーツなので、マイペースで楽しむこともできます。\n
つまりそれは、自分との戦いのスポーツということでもあるのです。\n
上達してスコアが伸びてくると、大きな達成感が得られること間違いなし！\n
そんな貴方に向けたボウリング入門キットをご紹介します！',
'・ボール\n
なんと言ってもボールがなければ始まりません！\n
初心者でも簡単に曲げられるボールをセレクションしました！',
'・グローブ\n
手首を固定し、安定した投球をサポートします！',
'・シューズ\n
スムーズな投球フォームを作るために履き心地のいいシューズをご用意しました！',
'・バック\n
マイボールなど持ち運びに優秀なバッグです！',
'・リスタイ\n
長時間練習する際に手首を痛めないためのリスタイです！',
null,
'肝心のお値段ですが、通常約10,000円のところ………、\n\n\n',
'これだけセットでなんと',
'5,000',
'円です！',
'在庫がなくなり次第販売終了となりますので、ご購入をお考えの方はお早めに！',
false);