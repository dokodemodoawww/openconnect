set names utf8;
drop database if exists noel;
create database noel;
use noel;

/*商品
 * 商品id = item_id
 * 商品名称 = item_name
 * 商品名称_ja = item_name_ja
 * 商品名称_en = item_name_en
 * ジャンル = item_category
 * 価格 = price
 * 詳細文 = overview
 * サイズ = size
 * アレルギー = allergy
 * 販売期間 = sales_period
 * 画像001 = img_address001
 * 画像002 = img_address002
 * 画像003 = img_address003
 * デリートフラグ = delete_flg
 * 登録日 = registration_date
 * 更新日 = updated_date
 * 会社名 = company_name
 * 店舗名 = store_name
 */
create table item(
item_id int not null primary key auto_increment comment '商品ID',
item_name varchar(100) not null comment '商品名称',
item_name_ja varchar(100) not null comment '商品名称_ja',
item_name_en varchar(100) not null comment '商品名称_en',
item_category varchar(50) not null comment 'ジャンル',
price int not null comment '価格',
overview text not null comment '詳細文',
size varchar(100) not null comment 'サイズ',
allergy varchar(100) not null comment 'アレルギー',
sales_period varchar(100) not null comment '販売期間',
img_address001 text not null comment '画像001',
img_address002 text not null comment '画像002',
img_address003 text not null comment '画像003',
delete_flg boolean not null default false comment '削除フラグ',
registration_date datetime not null comment '登録日',
updated_date datetime not null comment '更新日',
company_name varchar(100) not null comment '会社名',
store_name varchar(100) not null comment '店舗名'
)comment = '商品テーブル';

/*購入
 * 購入id = purchase_id
 * ユーザーid = user_id
 * 商品id = item_id
 * 商品名称 = item_name
 * 注文数 = order_count
 * 合計金額 = amount
 * 購入日 = purchase_date
 * 支払い方法 = payment_method
 * 登録日 = registration_date
 * 更新日 = updated_date
 */

create table purchase(
purchase_id int not null primary key auto_increment comment '購入ID',
user_id int not null comment 'ユーザーID',
item_id int not null comment '商品ID',
item_name varchar(100) not null comment '商品名称',
order_count int not null comment '注文数',
amount int not null comment '合計金額',
purchase_date date not null comment '購入日',
payment_method varchar(100) comment '支払い方法',
registration_date datetime comment '登録日',
updated_date datetime comment '更新日',
foreign key(user_id) references openconnect.users(user_id) on delete cascade,
foreign key(item_id) references item(item_id)
)comment = '購入テーブル';

/*カート
 * ユーザーID = user_id
 * 商品id = item_id
 * 商品名称 = item_name
 * 注文数 = order_count
 * 価格 = price
 * 合計金額 = amount
 * 備考 = note
 * 画像001 = img_address001
 */

create table cart(
user_id int not null,
item_id int not null,
item_name varchar(100) not null,
order_count int not null,
price int not null,
amount int not null,
note varchar(100),
img_address001 text not null,
foreign key(user_id) references openconnect.users(user_id) on delete cascade,
foreign key(item_id) references item(item_id)
);

/*クレジット
 * クレジットの種類 = credit_name
 * クレジット番号 = credit_number
 * 姓名（ローマ字） = name_e
 * セキュリティコード = security_code
 * 有効期限(年) = expiration_year
 * 有効期限(月) = expiration_month
 * ご利用店名 = corporation_name
 * 支払い区分 = division
 * 分割回数 = split
 * ご利用金額 = spend
 */

create table credit(
credit_name enum('visa','mastercard','americanexpress'),
credit_number varchar(16),
name_e varchar(50),
security_code int(4),
expiration_year int(4),
expiration_month int(4),
corporation_name varchar(50),
division varchar(10),
split int,
spend int
);

/*一時保管
 * クレジットの種類 = credit_name
 * クレジット番号 = credit_number
 * 姓名（ローマ字） = name_e
 * セキュリティコード = security_code
 * 有効期限 = expiration_day
 * ご利用店名 = corporation_name
 * ご利用日 = use_day
 * 支払い区分 = division
 * 分割回数 = split
 * ご利用金額 = spend
 */

create table work(
user_id int not null,
payment_method varchar(100),
credit_name enum('visa','mastercard','americanexpress') comment "クレジットの種類",
credit_number varchar(16) comment "クレジットカード番号",
name_e varchar(50) comment "名義人",
security_code int(4) comment "セキュリティコード",
expiration_year varchar(25)  comment "有効期限",
expiration_month varchar(25)  comment "有効期限",
corporation_name varchar(50) comment "ご利用店名",
use_day int comment "ご利用日",
use_year int comment "ご利用年",
division varchar(10) comment "支払い区分",
split int comment "分割回数",
spend int comment "ご利用金額",
foreign key(user_id) references openconnect.users(user_id) on delete cascade
);

/*商品の追加１５件
 * おすすめ＆スタンダード＆季節を５件ずつ
 * 追加致しました。
 * 入力の有無確認済み by れお
*/

insert into item(
item_name,
item_name_ja,
item_name_en,
item_category,
price,
overview,
size,
allergy,
sales_period,
img_address001,
img_address002,
img_address003,
delete_flg,
registration_date,
updated_date,
company_name,
store_name
)values(

"ルリシュワール/Lulishwar","ルリシュワール","Lulishwar","スタンダードケーキ/Standard Cake","5800",
"ふわふわスポンジ、乳味ゆたかな生クリームと苺、それぞれのおいしさを引き立合うバランスで仕上げました。
/Fluffy sponge, milky cream Fried cream and strawberries, finished in balance that attracts each other's taste.",
"直径195mm/Diameter 195 mm","卵,牛乳,小麦粉/egg,milk,flour","2016/11/08",
"cake.jpg","cake2.jpg","cake3.jpg",
false,"2016/11/08 11:29:00","2016/11/08 11:29:00","直樹製菓/Naoki Confectionery","直樹製菓/Naoki Confectionery"
),(
"ブラン・アンジュ/Bran Anjou","ブラン・アンジュ","Bran Anjou","スタンダードケーキ/Standard Cake","5500",
"新鮮な上質のクリームチーズを数種、オリジナルレシピでブレンド。
/Several fresh, fine cream cheese, blended with original recipe.",
"直径210mm/Diameter 210 mm","卵,牛乳/egg,milk","2016/11/09",
"cheese.jpg","cheese2.jpg","cheese3.jpg",
false,"2016/11/08 13:19:00","2016/11/08 13:28:00","森長製菓株式会社/Morinaga Seika Co., Ltd.","森長製菓株式会社/Morinaga Seika Co., Ltd."
),(
"フォレ・ノワール/Fore Noir","フォレ・ノワール","Fore Noir","スタンダードケーキ/Standard Cake","4500",
"2種類のアイスをチョコクリームでコーティング。
/Coat 2 types of ice with chocolate cream.",
"直径210mm/Diameter 210 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/08",
"choco.jpg","choco2.jpg","choco3.jpg",
false,"2016/11/08 14:29:00","2016/11/08 14:38:00","シュトレーゼ/Chaterase","シュトレーゼ/Chaterase"
),(
"ベルド・ソリレ/Berd Sorile","ベルド・ソリレ","Berd Sorile","スタンダードケーキ/Standard Cake","4800",
"チーズタルトに、秋冬にふさわしいウィリアム・ポワールやリンゴのプレザーブ（シロップ煮）など、8種類のフルーツを飾った華やかなタルトです。
/It is a gorgeous tart decorating eight kinds of fruits, including cheese tart, William Poir suitable for fall and winter and apple's preserve (syrup boiled).",
"直径200mm/Diameter 200 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/08",
"fruit.jpg","fruit2.jpg","fruit3.jpg",
false,"2016/11/08 16:29:00","2016/11/08 16:38:00","ジャンヌアルベル/Jeanne Albert","ジャンヌアルベル/Jeanne Albert"
),(
"モンブラン/Mont Blanc","モンブラン","Mont Blanc","スタンダードケーキ/Standard Cake","5900",
"アーモンドの入ったスポンジにラム酒のシロップを染み込ませ、濃厚なマロンクリームの内側には、生クリーム、バニラビーンズの入ったたっぷりのカ スタード、マロングラッセ、更にマロンクリームを閉じ込めた、モンブラン好きにはたまらないスイーツです。
/Immersed a sponge containing almonds with a syrup of rum, and inside the rich marron cream was confined a plenty of mustard with fresh cream, vanilla beans, malon glace and further malon cream, like Mont Blanc It is irresistible sweets.",
"直径165mm/Diameter 165 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/08",
"montblanc.jpg","montblanc2.jpg","montblanc3.jpg",
false,"2016/11/08 15:29:00","2016/11/08 15:38:00","アディドス/Adidos","アディドス/Adidos"
),(
"カシスとミルクチョコレートのアイスケーキ/Cassis and milk chocolate ice cake","カシスとミルクチョコレートのアイスケーキ","Cassis and milk chocolate ice cake","おすすめケーキ/Recommendation Cake","4500",
"さわやかな酸味のカシスムースの中にコクのあるミルクチョコのムースをいれました。
/I put a mousse milk chocolate mousse in a crisp mousse with refreshing acidity.",
"直径150mm/Diameter 150 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/10",
"casischoco1.jpg","casischoco2.jpg","casischoco3.jpg",
false,"2016/11/10 14:30:00","2016/11/10 14:33:00","菓子工房オカダ/Confectionery Factory Okada","菓子工房オカダ/Confectionery Factory Okada"
),(
"生チョコフルーツデコレーション/Raw chocolate fruit decoration","生チョコフルーツデコレーション","Raw chocolate fruit decoration","おすすめケーキ/Recommendation Cake","5200",
"自慢のココアスポンジ生地に、良質のチョコレートを混ぜ込んだ生クリームを使用しました。そして、飾りにはたっぷりのフルーツを乗せました。
/We used fresh cream mixed with high quality chocolate in our cocoa sponge fabric. And I put plenty of fruit on the decoration.",
"直径180mm/Diameter 180 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/11",
"chocofruit1.jpg","chocofruit2.jpg","chocofruit3.jpg",
false,"2016/11/11 14:30:00","2016/11/11 14:33:00","ケーキ工房　ミラベル/Cake Studio Mirabell","ケーキ工房　ミラベル/Cake Studio Mirabell"
),(
"パーティ用ショートケーキ/Short cake for parties","パーティ用ショートケーキ","Short cake for parties","おすすめケーキ/Recommendation Cake","16000",
"パーティ用で特大サイズのふわふわスポンジ、乳味ゆたかな生クリームと苺、それぞれのおいしさを引き立合うバランスで仕上げました。
/Large size fluffy sponge for party use, milky cream and cream and strawberries, finished in balance that attracts each other's deliciousness.",
"21×21×8cm/21 × 21 × 8 cm ","卵,牛乳.小麦粉/egg,milk,flour","2016/11/12",
"party1.jpg","party2.jpg","party3.jpg",
false,"2016/11/12 14:30:00","2016/11/12 14:33:00","有限会社 タカヤナイ/Takayanai limited company","有限会社 タカヤナイ/Takayanai limited company"
),(
"チェリーのレアチーズケーキ/Cherry's rare cheesecake","チェリーのレアチーズケーキ","Cherry's rare cheesecake","おすすめケーキ/Recommendation Cake","4400",
"北海道産のクリームチーズと純生クリームをたっぷり使用したレアチーズケーキです。チェリーの酸味がアクセント！濃厚なのに、後味さわやか！クリームチーズの味がしっかり楽しめ、ごちそうの後でもさっぱり召し上がれるケーキです。味に自信あり！
/It is a rare cheesecake with plenty of Hokkaido cream cheese and purple cream. Acid of cherry accent! Even though it is rich, the aftertaste refreshing! You can enjoy the taste of cream cheese firmly, it is a cake that you can have after all a refreshing cake. I have confidence in the taste!",
"直径140mm/Diameter 140 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/11",
"ichigocheese1.jpg","ichigocheese2.jpg","ichigocheese3.jpg",
false,"2016/11/11 14:33:00","2016/11/11 14:53:00","洋菓子カフェかしこ/Confectionary Cafe","洋菓子カフェかしこ/Confectionary Cafe"
),(
"ベリー×ベリーケーキ/Berry × Berry cake","ベリー×ベリーケーキ","Berry × Berry cake","おすすめケーキ/Recommendation Cake","5500",
"ラフィネクリーム（チーズベース）の上を６種類のたっぷりベリーで飾った甘酸っぱいベリータルトです。
/It is a sweet and sour berry tart decorated with six kinds of plenty of berries on the top of the raffinate cream (cheese base).",
"直径165mm/Diameter 165 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/12",
"berry1.jpg","berry2.jpg","berry3.jpg",
false,"2016/11/12 12:30:00","2016/11/13 11:33:00","パティスリー　アン・スリール/Patisserie Anne ・ Sriel","パティスリー　アン・スリール/Patisserie Anne ・ Sriel"
),(
"ラズピスマス/raspberry×pistachio Christmascake","ラズピスマス","raspberry×pistachio Christmascake","季節のケーキ/Seasonal Cake","5200",
"風味豊かなピスタチオ生地とラズベリーの爽やかな甘さが相性の良いクリスマスケーキです☆
/Christmas cake with compatible flavorful pistachio dough and refreshing sweetness of raspberry ☆",
"縦13cm 横25cm/Vertical 13cm width 25cm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/12",
"xmas1.jpg","xmas2.jpg","xmas3.jpg",
false,"2016/11/12 11:30:00","2016/11/12 17:33:00","Souvenir-スブニール-/-Souvenir-","Souvenir-スブニール-/-Souvenir-"
),(
"ノエル　クーヘン/Noel Kuchen","ノエル　クーヘン","Noel Kuchen","季節のケーキ/Seasonal Cake","3200",
"バニラ風味のしっとりバームクーヘンをクリスマス飾りでにデコレーションしたかわいいケーキです☆
/It is a cute cake decorated with moisturizing Vanilla flavored Balmucuchen with Christmas decorations ☆",
"直径120mm/Diameter 120 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/13",
"baumnoel1.jpg","baumnoel2.jpg","baumnoel3.jpg",
false,"2016/11/13 11:30:00","2016/11/13 17:33:00","Souvenir-スブニール-/-Souvenir-","Souvenir-スブニール-/-Souvenir-"
),(
"クリスマスプレミアムクラシックショコラ/Christmas premium classic chocolat","クリスマスプレミアムクラシックショコラ","Christmas premium classic chocolat","季節のケーキ/Seasonal Cake","4500",
"スペイン産のチョコを使用したチョコ好きにおすすめのプレミアムクラシックショコラです。
/It is a premium classic chocolate recommended for chocolate lovers who used chocolate from Spain.",
"直径150mm/Diameter 150 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/10",
"chocoxmas1.jpg","chocoxmas2.jpg","chocoxmas3.jpg",
false,"2016/11/10 10:30:00","2016/11/11 13:33:00","パティスリーテロワール/Patisserie terroir","パティスリーテロワール/Patisserie terroir"
),(
"バニラとチョコの極上ブッシュ・ド・ノエル/Vanilla and chocolate finest bush de noel","バニラとチョコの極上ブッシュ・ド・ノエル","Vanilla and chocolate finest bush de noel","季節のケーキ/Seasonal Cake","4500",
"こだわりのいちご入り濃厚バニラクリーム♪自信作の2016年バージョン。
/Sticking strawberry-enriched thick vanilla cream ♪ 2016 version of self-confidence.",
"長さ18cm×9cm/Length 18 cm × 9 cm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/12",
"vanilanoel1.jpg","vanilanoel2.jpg","vanilanoel3.jpg",
false,"2016/11/12 12:30:00","2016/11/12 18:30:00","有限会社 タカヤナイ/Takayanai limited company","有限会社 タカヤナイ/Takayanai limited company"
),(
"クリスマスモンブラン/Christmas Mont Blanc","クリスマスモンブラン","Christmas Mont Blanc","季節のケーキ/Seasonal Cake","3500",
"京マロンとカスタードクリームたっぷりのコポーのクリスマスケーキはいかがでしょうか。
/How about Christmas cake with Kyoto Maron and custard cream plenty of Kopoh?",
"直径150mm/Diameter 150 mm","卵,牛乳.小麦粉/egg,milk,flour","2016/11/11",
"montxmas1.jpg","montxmas2.jpg","montxmas3.jpg",
false,"2016/11/11 10:20:00","2016/11/12 15:31:00","コポー洋菓子店/Kopoh bakery shop","コポー洋菓子店/Kopoh bakery shop"
);