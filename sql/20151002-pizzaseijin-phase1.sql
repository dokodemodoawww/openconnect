set names utf8;
set foreign_key_checks=0;
drop database if EXISTS pizza_seijin;
create database if not exists pizza_seijin;
use pizza_seijin;


/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
CREATE TABLE IF NOT EXISTS user(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
email varchar(100) NOT NULL,
password varchar(255),
name varchar(50) NOT NULL,
name_kana varchar(50) NOT NULL,
tel varchar(11) NOT NULL,
postal_code varchar(7) NOT NULL,
address varchar(255) NOT NULL,
oauth_id varchar(50),
oauth_name varchar(15),
credit_token varchar(255),
credit_num varchar(4),
created_at datetime NOT NULL,
updated_at datetime NOT NULL,
UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS item_category(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(15) UNIQUE NOT NULL,
created_at datetime NOT NULL,
updated_at datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS m_item(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(100) NOT NULL,
price int NOT NULL,
detail varchar(255) NOT NULL,
img_path varchar(100) NOT NULL,
category_id_1 int NOT NULL,
category_id_2 int,
available_flag boolean NOT NULL DEFAULT 1,
created_at datetime NOT NULL,
updated_at datetime NOT NULL,
FOREIGN KEY (category_id_1) REFERENCES item_category (id),
FOREIGN KEY (category_id_2) REFERENCES item_category (id)
);

CREATE TABLE IF NOT EXISTS m_coupon(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(20) NOT NULL,
discount int NOT NULL,
period int NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL,
giving_min_price int NOT NULL,
created_at datetime NOT NULL,
updated_at datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS m_store(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(100) NOT NULL,
postal_code varchar(8) NOT NULL,
address varchar(255) NOT NULL,
tel varchar(13) NOT NULL,
business_hours varchar(50) NOT NULL,
created_at datetime NOT NULL,
updated_at datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS order_history(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
user_id int NOT NULL,
item_id int NOT NULL,
coupon_id int,
number int NOT NULL,
created_at datetime NOT NULL,
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
FOREIGN KEY (item_id) REFERENCES m_item (id)
);

CREATE TABLE IF NOT EXISTS user_coupon(
user_id int,
coupon_id int,
time_limit date,
created_at datetime NOT NULL,
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE,
FOREIGN KEY (coupon_id) REFERENCES m_coupon (id)
);

CREATE TABLE IF NOT EXISTS m_material(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
item_id int NOT NULL UNIQUE,
wheat boolean NOT NULL DEFAULT 0,
egg boolean NOT NULL DEFAULT 0,
milk boolean NOT NULL DEFAULT 0,
soy boolean NOT NULL DEFAULT 0,
beef boolean NOT NULL DEFAULT 0,
pork boolean NOT NULL DEFAULT 0,
chicken boolean NOT NULL DEFAULT 0,
squid boolean NOT NULL DEFAULT 0,
shrimp boolean NOT NULL DEFAULT 0,
crab boolean NOT NULL DEFAULT 0,
salmon_roe boolean NOT NULL DEFAULT 0,
apple boolean NOT NULL DEFAULT 0,
gelatin boolean NOT NULL DEFAULT 0,
created_at datetime NOT NULL,
updated_at datetime NOT NULL,
FOREIGN KEY (item_id) REFERENCES m_item (id)
);

CREATE TABLE IF NOT EXISTS cart(
user_id int,
item_id int NOT NULL,
number int NOT NULL,
created_at datetime NOT NULL,
updated_at datetime NOT NULL,
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE SET NULL,
FOREIGN KEY (item_id) REFERENCES m_item (id)
);

CREATE TABLE IF NOT EXISTS admin(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
password varchar(255) NOT NULL,
name varchar(32) UNIQUE NOT NULL,
created_at datetime NOT NULL,
updated_at datetime NOT NULL
);

/***********************************************************
* 将来はOPENCONNECT：USERSテーブルにて踏襲するため削除予定  **
***********************************************************/
INSERT INTO user(
  email,
  password,
  name,
  name_kana,
  tel,
  postal_code,
  address,
  created_at,
  updated_at
) VALUES (
  "test1@test.com",
  "12345678",
  "テストデータ1",
  "テストデータイチ",
  "00011111111",
  "1000001",
  "テスト県データ市1",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO user(
  email,
  password,
  name,
  name_kana,
  tel,
  postal_code,
  address,
  credit_token,
  credit_num,
  created_at,
  updated_at
) VALUES (
  "test2@test.com",
  "12345678",
  "テストデータ2",
  "テストデータニ",
  "00022222222",
  "1000002",
  "テスト県データ市2",
  "32df1g6s5fg6se54g132s1dfg6a832s1g6er54g",
  "2222",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO user(
  email,
  name,
  name_kana,
  tel,
  postal_code,
  address,
  oauth_id,
  oauth_name,
  created_at,
  updated_at
) VALUES (
  "test3@test.com",
  "テストデータ3",
  "テストデータサン",
  "00033333333",
  "1000003",
  "テスト県データ市3",
  "114240740346774313678",
  "google",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO user(
  email,
  name,
  name_kana,
  tel,
  postal_code,
  address,
  oauth_id,
  oauth_name,
  credit_token,
  credit_num,
  created_at,
  updated_at
) VALUES (
  "test4@test.com",
  "テストデータ4",
  "テストデータヨン",
  "00044444444",
  "1000004",
  "テスト県データ市4",
  "211287272541310",
  "FaceBook",
  "adfghjklqwertyuiozxcvbnm",
  "4444",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO item_category(
  name,
  created_at,
  updated_at
) VALUES (
  "魚介系",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO item_category(
  name,
  created_at,
  updated_at
) VALUES (
  "肉系",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO item_category(
  name,
  created_at,
  updated_at
) VALUES (
  "野菜系",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO item_category(
  name,
  created_at,
  updated_at
) VALUES (
  "チーズ系",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO item_category(
  name,
  created_at,
  updated_at
) VALUES (
  "サイドメニュー",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "バーニャカウダソースのサラダ",
  400,
  "スティック状に切った野菜をバーニャカウダソースで",
  "bagna_cauda.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  category_id_2,
  created_at,
  updated_at
) VALUES (
  "BBQピザ",
  250,
  "厚切りの牛肉にバーベキューソースをかけた食べ応えのあるピザ",
  "bbq_pizza.jpg",
  2,
  4,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "シーザーサラダ",
  300,
  "レタスとクルトンの歯ごたえが楽しめるサラダ。ソースと半熟卵付き",
  "caesar_salad.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "チーズケーキ",
  150,
  "濃厚なチーズの風味がおいしいケーキ",
  "cheese_cake.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "グリルチキン",
  200,
  "ボリュームのある骨付きチキン",
  "chicken_wings.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "ナスのグラタン",
  150,
  "大きなナスが入ったグラタン",
  "eggplant_gratin.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  category_id_2,
  created_at,
  updated_at
) VALUES (
  "ナスのピザ",
  210,
  "厚切りナスがおいしいピザ",
  "eggplant_pizza.jpg",
  3,
  4,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "フィッシュ　アンド　チップス",
  250,
  "白身魚のフライとポテトチップスのセット。ケチャップとマヨネーズ付き",
  "fish_and_chips.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "フライドポテト",
  150,
  "厚切りポテトのフライ",
  "french_fries.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "スパイシーから揚げ",
  150,
  "スパイシーな衣で包んだから揚げ",
  "karaage.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "マルゲリータ",
  180,
  "シンプルにチーズとトマトの風味が楽しめるピザ",
  "margherita.jpg",
  4,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "ミックスチーズピザ",
  200,
  "数種のチーズの風味が楽しめるピザ",
  "mix_cheese_pizza.jpg",
  4,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "ナゲット",
  100,
  "軽くつまめるナゲット。ケチャップ付き",
  "nugget.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "オニオンリング",
  130,
  "さくさくのオニオンリング",
  "onion_ring.jpg",
  5,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  category_id_2,
  created_at,
  updated_at
) VALUES (
  "スパムとコーンのピザ",
  200,
  "厚切りのスパムとスイートコーンのピザ",
  "pork_pizza.jpg",
  2,
  3,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "生ハムのピザ",
  280,
  "生ハムをのせた高級感のあるピザ",
  "prosciutto_pizza.jpg",
  2,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_item(
  name,
  price,
  detail,
  img_path,
  category_id_1,
  created_at,
  updated_at
) VALUES (
  "シーフードピザ",
  280,
  "海の幸が楽しめるピザ",
  "seafood_pizza.jpg",
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  milk,
  gelatin,
  created_at,
  updated_at
) VALUES (
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  beef,
  apple,
  created_at,
  updated_at
) VALUES (
  2,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  beef,
  created_at,
  updated_at
) VALUES (
  3,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  milk,
  created_at,
  updated_at
) VALUES (
  4,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  gelatin,
  created_at,
  updated_at
) VALUES (
  5,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  chicken,
  created_at,
  updated_at
) VALUES (
  6,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  milk,
  soy,
  chicken,
  created_at,
  updated_at
) VALUES (
  7,
  1,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  soy,
  pork,
  gelatin,
  created_at,
  updated_at
) VALUES (
  8,
  1,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  created_at,
  updated_at
) VALUES (
  9,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  crab,
  shrimp,
  apple,
  created_at,
  updated_at
) VALUES (
  10,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  chicken,
  created_at,
  updated_at
) VALUES (
  11,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  apple,
  gelatin,
  created_at,
  updated_at
) VALUES (
  12,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  gelatin,
  created_at,
  updated_at
) VALUES (
  13,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  soy,
  shrimp,
  salmon_roe,
  created_at,
  updated_at
) VALUES (
  14,
  1,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  soy,
  chicken,
  created_at,
  updated_at
) VALUES (
  15,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  egg,
  created_at,
  updated_at
) VALUES (
  16,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_material(
  item_id,
  wheat,
  milk,
  soy,
  pork,
  created_at,
  updated_at
) VALUES (
  17,
  1,
  1,
  1,
  1,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_coupon(
  name,
  discount,
  period,
  start_date,
  end_date,
  giving_min_price,
  created_at,
  updated_at
) VALUES (
  "10%OFFクーポン",
  10,
  50,
  "2015/12/07 19:35:50",
  "2015/12/30 19:35:50",
  1000,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_coupon(
  name,
  discount,
  period,
  start_date,
  end_date,
  giving_min_price,
  created_at,
  updated_at
) VALUES (
  "20%OFFクーポン",
  20,
  50,
  "2015/12/07 19:35:50",
  "2015/12/30 19:35:50",
  2000,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_coupon(
  name,
  discount,
  period,
  start_date,
  end_date,
  giving_min_price,
  created_at,
  updated_at
) VALUES (
  "30%OFFクーポン",
  30,
  50,
  "2015/12/07 19:35:50",
  "2015/12/30 19:35:50",
  3000,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  1,
  1,
  3,
  "2015/12/07 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  1,
  1,
  3,
  "2015/12/07 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  1,
  1,
  1,
  "2015/01/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  2,
  1,
  1,
  "2015/01/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  3,
  1,
  1,
  "2015/01/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  4,
  1,
  1,
  "2015/01/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  5,
  1,
  1,
  "2015/02/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  6,
  1,
  1,
  "2015/02/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  7,
  1,
  1,
  "2015/02/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  8,
  1,
  1,
  "2015/02/28 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  9,
  1,
  1,
  "2015/03/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  10,
  1,
  1,
  "2015/03/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  11,
  1,
  1,
  "2015/03/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  12,
  1,
  1,
  "2015/03/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  13,
  1,
  1,
  "2015/04/01 19:35:50"
);




INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  14,
  1,
  1,
  "2015/04/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  15,
  1,
  1,
  "2015/04/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  16,
  1,
  1,
  "2015/04/30 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  17,
  1,
  1,
  "2015/05/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  17,
  1,
  1,
  "2015/06/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  16,
  1,
  1,
  "2015/07/01 19:35:50"
);




INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  15,
  1,
  1,
  "2015/07/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  14,
  1,
  1,
  "2015/07/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  13,
  1,
  1,
  "2015/07/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  12,
  1,
  1,
  "2015/08/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  11,
  1,
  1,
  "2015/08/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  10,
  1,
  1,
  "2015/08/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  9,
  1,
  1,
  "2015/08/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  8,
  1,
  1,
  "2015/09/01 19:35:50"
);




INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  7,
  1,
  1,
  "2015/09/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  6,
  1,
  1,
  "2015/09/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  5,
  1,
  1,
  "2015/09/30 19:35:50"
);




INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  4,
  1,
  1,
  "2015/10/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  3,
  1,
  1,
  "2015/10/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  2,
  1,
  1,
  "2015/10/30 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  1,
  1,
  1,
  "2015/10/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  2,
  1,
  1,
  "2015/11/01 19:35:50"
);




INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  4,
  1,
  1,
  "2015/11/10 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  6,
  1,
  1,
  "2015/11/20 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  8,
  1,
  1,
  "2015/11/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  10,
  1,
  1,
  "2015/12/01 19:35:50"
)
;

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  3,
  1,
  1,
  "2015/12/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  5,
  1,
  1,
  "2015/12/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  1,
  7,
  1,
  1,
  "2015/12/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  1,
  1,
  1,
  "2015/01/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  2,
  1,
  1,
  "2015/01/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  3,
  1,
  1,
  "2015/01/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  4,
  1,
  1,
  "2015/01/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  5,
  1,
  1,
  "2015/02/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  6,
  1,
  1,
  "2015/02/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  7,
  1,
  1,
  "2015/02/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  8,
  1,
  1,
  "2015/02/28 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  9,
  1,
  1,
  "2015/03/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  10,
  1,
  1,
  "2015/03/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  11,
  1,
  1,
  "2015/03/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  12,
  1,
  1,
  "2015/03/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  13,
  1,
  1,
  "2015/04/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  14,
  1,
  1,
  "2015/04/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  15,
  1,
  1,
  "2015/04/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  16,
  1,
  1,
  "2015/04/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  17,
  1,
  1,
  "2015/05/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  17,
  1,
  1,
  "2015/06/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  16,
  1,
  1,
  "2015/07/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  15,
  1,
  1,
  "2015/07/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  14,
  1,
  1,
  "2015/07/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  13,
  1,
  1,
  "2015/07/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  12,
  1,
  1,
  "2015/08/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  11,
  1,
  1,
  "2015/08/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  10,
  1,
  1,
  "2015/08/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  9,
  1,
  1,
  "2015/08/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  8,
  1,
  1,
  "2015/09/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  7,
  1,
  1,
  "2015/09/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  6,
  1,
  1,
  "2015/09/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  5,
  1,
  1,
  "2015/09/30 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  4,
  1,
  1,
  "2015/10/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  3,
  1,
  1,
  "2015/10/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  2,
  1,
  1,
  "2015/10/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  1,
  1,
  1,
  "2015/10/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  2,
  1,
  1,
  "2015/11/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  4,
  1,
  1,
  "2015/11/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  6,
  1,
  1,
  "2015/11/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  8,
  1,
  1,
  "2015/11/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  10,
  1,
  1,
  "2015/12/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  3,
  1,
  1,
  "2015/12/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  5,
  1,
  1,
  "2015/12/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  2,
  7,
  1,
  1,
  "2015/12/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  1,
  1,
  1,
  "2015/01/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  2,
  1,
  1,
  "2015/01/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  3,
  1,
  1,
  "2015/01/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  4,
  1,
  1,
  "2015/01/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  5,
  1,
  1,
  "2015/02/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  6,
  1,
  1,
  "2015/02/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  7,
  1,
  1,
  "2015/02/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  8,
  1,
  1,
  "2015/02/28 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  9,
  1,
  1,
  "2015/03/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  10,
  1,
  1,
  "2015/03/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  11,
  1,
  1,
  "2015/03/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  12,
  1,
  1,
  "2015/03/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  13,
  1,
  1,
  "2015/04/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  14,
  1,
  1,
  "2015/04/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  15,
  1,
  1,
  "2015/04/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  16,
  1,
  1,
  "2015/04/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  17,
  1,
  1,
  "2015/05/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  17,
  1,
  1,
  "2015/06/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  16,
  1,
  1,
  "2015/07/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  15,
  1,
  1,
  "2015/07/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  14,
  1,
  1,
  "2015/07/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  13,
  1,
  1,
  "2015/07/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  12,
  1,
  1,
  "2015/08/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  11,
  1,
  1,
  "2015/08/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  10,
  1,
  1,
  "2015/08/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  9,
  1,
  1,
  "2015/08/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  8,
  1,
  1,
  "2015/09/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  7,
  1,
  1,
  "2015/09/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  6,
  1,
  1,
  "2015/09/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  5,
  1,
  1,
  "2015/09/30 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  4,
  1,
  1,
  "2015/10/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  3,
  1,
  1,
  "2015/10/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  2,
  1,
  1,
  "2015/10/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  1,
  1,
  1,
  "2015/10/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  2,
  1,
  1,
  "2015/11/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  4,
  1,
  1,
  "2015/11/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  6,
  1,
  1,
  "2015/11/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  8,
  1,
  1,
  "2015/11/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  10,
  1,
  1,
  "2015/12/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  3,
  1,
  1,
  "2015/12/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  5,
  1,
  1,
  "2015/12/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  3,
  7,
  1,
  1,
  "2015/12/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  1,
  1,
  1,
  "2015/01/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  2,
  1,
  1,
  "2015/01/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  3,
  1,
  1,
  "2015/01/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  4,
  1,
  1,
  "2015/01/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  5,
  1,
  1,
  "2015/02/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  6,
  1,
  1,
  "2015/02/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  7,
  1,
  1,
  "2015/02/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  8,
  1,
  1,
  "2015/02/28 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  9,
  1,
  1,
  "2015/03/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  10,
  1,
  1,
  "2015/03/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  11,
  1,
  1,
  "2015/03/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  12,
  1,
  1,
  "2015/03/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  13,
  1,
  1,
  "2015/04/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  14,
  1,
  1,
  "2015/04/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  15,
  1,
  1,
  "2015/04/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  16,
  1,
  1,
  "2015/04/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  17,
  1,
  1,
  "2015/05/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  17,
  1,
  1,
  "2015/06/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  16,
  1,
  1,
  "2015/07/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  15,
  1,
  1,
  "2015/07/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  14,
  1,
  1,
  "2015/07/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  13,
  1,
  1,
  "2015/07/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  12,
  1,
  1,
  "2015/08/01 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  11,
  1,
  1,
  "2015/08/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  10,
  1,
  1,
  "2015/08/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  9,
  1,
  1,
  "2015/08/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  8,
  1,
  1,
  "2015/09/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  7,
  1,
  1,
  "2015/09/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  6,
  1,
  1,
  "2015/09/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  5,
  1,
  1,
  "2015/09/30 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  4,
  1,
  1,
  "2015/10/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  3,
  1,
  1,
  "2015/10/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  2,
  1,
  1,
  "2015/10/30 19:35:50"
);


INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  1,
  1,
  1,
  "2015/10/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  2,
  1,
  1,
  "2015/11/01 19:35:50"
);



INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  4,
  1,
  1,
  "2015/11/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  6,
  1,
  1,
  "2015/11/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  8,
  1,
  1,
  "2015/11/30 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  10,
  1,
  1,
  "2015/12/01 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  3,
  1,
  1,
  "2015/12/10 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  5,
  1,
  1,
  "2015/12/20 19:35:50"
);

INSERT INTO order_history(
  user_id,
  item_id,
  coupon_id,
  number,
  created_at
) VALUES (
  4,
  7,
  1,
  1,
  "2015/12/30 19:35:50"
);




INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  1,
  2,
  "2016/02/07",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  2,
  2,
  "2016/03/07",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  2,
  3,
  "2016/02/17",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  1,
  3,
  "2016/01/27",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  4,
  3,
  "2016/01/27",
  "2015/12/07 19:35:50"
);

INSERT INTO m_store(
  name,
  postal_code,
  address,
  tel,
  business_hours,
  created_at,
  updated_at
) VALUES (
  "お茶の水店",
  "113-0034",
  "東京都文京区湯島",
  "11-1111-1111",
  "10:00～18:00",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO m_store(
  name,
  postal_code,
  address,
  tel,
  business_hours,
  created_at,
  updated_at
) VALUES (
  "霞ヶ関店",
  "100-0013",
  "東京都千代田区霞が関",
  "12-3456-7891",
  "11:00～23:00",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  1,
  1,
  12,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  1,
  5,
  3,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  2,
  5,
  6,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  2,
  1,
  6,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  3,
  2,
  8,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO cart(
  user_id,
  item_id,
  number,
  created_at,
  updated_at
) VALUES (
  4,
  3,
  10,
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO admin(
  password,
  name,
  created_at,
  updated_at
) VALUES (
  "12345678",
  "admin5678",
  "2015/12/07 19:35:50",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  1,
  1,
  "2015/12/11",
  "2015/12/07 19:35:50"
);

INSERT INTO user_coupon(
  user_id,
  coupon_id,
  time_limit,
  created_at
) VALUES (
  3,
  3,
  "2015/12/11",
  "2015/12/07 19:35:50"
);
