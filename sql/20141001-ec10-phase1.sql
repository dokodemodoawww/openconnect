set names utf8;
set foreign_key_checks=0;
drop database if exists ec;
create database ec;
use ec;


create table order_table(
order_id int not null primary key auto_increment comment '注文ID',
item_id int not null comment '商品ID',
order_count int not null default "0" comment '注文数',
order_customer varchar(50) not null comment '購入者',
order_post varchar(7) not null comment '郵便番号',
order_phone varchar(11) not null comment '電話番号',
order_mail varchar(255) not null comment 'Eメールアドレス',
order_destination varchar(255) not null comment '届け先',
order_day datetime not null default current_timestamp comment '購入先'
) comment="注文情報テーブル";


create table  user_table(
user_id varchar(16) not null primary key comment 'ユーザーID',
user_pass varchar(16) not null comment 'ユーザーパスワード',
user_name varchar(50) not null comment 'ユーザー名'
) comment="ユーザーテーブル";

create table item_table(
item_id int not null primary key auto_increment comment '商品id',
item_name varchar(255) not null comment '商品名',
item_price int not null default "1" comment '価格',
item_stock int not null default "0" comment '在庫',
item_img varchar(255) not null default "img/noimage.jpg" comment '画像パス'
) comment="商品テーブル";

insert into item_table (item_name, item_price, item_stock, item_img) values
('獺祭', 2790, 27, 'img/liquor1.jpg'),
('鍋島', 2980, 12, 'img/liquor10.jpg'),
('久保田', 3900, 4, 'img/liquor2.jpg'),
('八海山', 2490, 39, 'img/liquor3.jpg'),
('黒龍', 2790, 13, 'img/liquor4.jpg'),
('古都', 2590, 27, 'img/liquor5.jpg'),
('菊水の辛口', 2980, 12, 'img/liquor6.jpg'),
('上喜元', 1900, 24, 'img/liquor7.jpg'),
('十四代', 4900, 19, 'img/liquor8.jpg'),
('翠玉', 2790, 13, 'img/liquor9.jpg'),
('雪中梅', 2790, 15, 'img/liquor11.jpg'),
('福寿', 2980, 52, 'img/liquor12.jpg'),
('菊姫', 1900, 43, 'img/liquor13.jpg'),
('出羽桜', 490, 18, 'img/liquor14.jpg'),
('立山', 2790, 33, 'img/liquor15.jpg'),
('高千代', 2790, 17, 'img/liquor16.jpg'),
('八甲田', 2980, 19, 'img/liquor17.jpg'),
('雪鶴', 1900, 14, 'img/liquor18.jpg'),
('端鷹', 490, 20, 'img/liquor19.jpg'),
('春夏秋雪', 2790, 31, 'img/liquor20.jpg'),
('北寳', 2790, 27,''),
('熊古露里', 2980, 12,''),
('蓬莱泉', 1900, 4,''),
('愛宕の松', 490, 89,''),
('阿部勘', 2790, 13,''),
('朝乃舞', 2790, 27,''),
('高麗王', 2980, 12,''),
('長命泉', 1900, 24,''),
('金婚正宗', 490, 89,''),
('白笹つづみ', 2790, 13,''),
('越後鶴亀', 2790, 17,''),
('巻機', 2980, 16,''),
('蜃気楼', 1900, 21,''),
('華燭', 490, 39,''),
('笑亀', 2790, 15,''),
('高原郷', 2790, 27,''),
('葵天下', 2980, 32,''),
('朝日嶽', 1900, 14,''),
('妙の華', 490, 89,''),
('奥琵琶湖', 2790, 13,''),
('聚楽第', 2790, 27,''),
('蒼雫', 2980, 12,''),
('松花鶴', 1900, 4,''),
('純米吟醸', 490, 89,''),
('富貴', 2790, 13,''),
('梅乃宿', 2790, 27,''),
('高野山', 2980, 12,''),
('大和鏡', 1900, 21,''),
('真壽鏡', 490, 49,''),
('金剛', 2790, 13,'');



insert into order_table(item_id,order_count,order_customer,order_post,order_phone,order_mail,order_destination)
 values(1,2,"カービィ","1234567","00012345678","commando@ne.jp","愛知県"),
 (2,4,"ジャクソン","1234567","00012345678","commando@ne.jp","静岡県"),
 (3,6,"サリー","1234567","00012345678","commando@ne.jp","岐阜県"),
 (4,1,"エンリスケ","1234567","00012345678","commando@ne.jp","三重県"),
 (5,8,"ベネット","1234567","00012345678","commando@ne.jp","福井県"),
 (6,30,"ハリス","1234567","00012345678","commando@ne.jp","富山県"),
 (7,12,"ローソン","1234567","00012345678","commando@ne.jp","新潟県"),
 (8,25,"フォレスタス","1234567","00012345678","commando@ne.jp","石川県"),
 (9,27,"クック","1234567","00012345678","commando@ne.jp","長野県"),
 (10,10,"シンディ","1234567","00012345678","commando@ne.jp","山梨県"
);