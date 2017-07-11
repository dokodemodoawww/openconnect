  set names utf8;
set foreign_key_checks=0;

drop database if exists nadeshiko;
create database nadeshiko;
use nadeshiko;

drop table if exists cart;
create table cart(
    user_id int not null,
    item_id int not null default 0,
    item_name varchar(100) not null,
    purchase_order_count int not null,
    rental_order_count int not null,
    purchase_price Float not null default 0,
    rental_price Float not null default 0,
    purchase_amount Float not null default 0,
    rental_amount Float not null default 0,
    loan_date varchar(15) not null default '---',
    overview varchar(255) not null,
    img_address001 varchar(255) not null,
    pay_off_category tinyint,
    registration_date timestamp not null default current_timestamp,
    updated_date      timestamp not null default current_timestamp on update current_timestamp,
    foreign key(user_id) references openconnect.users(user_id) on delete cascade,
    foreign key(item_id) references item(item_id)
    );

drop table if exists item;
create table item(
	item_id int primary key not null auto_increment,
	item_name varchar(100) not null,
	item_category varchar(50) not null,
	purchase_price float not null,
	rental_price float not null,
	overview varchar(255) not null,
	size varchar(50) not null default "",
	img_address001 varchar(255) ,
	img_address002 varchar(255) ,
    img_address003 varchar(255) ,
    img_address004 varchar(255) ,
    img_address005 varchar(255) ,
    img_address006 varchar(255) ,
    img_address007 varchar(255) ,
    img_address008 varchar(255) ,
    img_address009 varchar(255) ,
	delete_flg boolean not null default false,
	company_name varchar(100) not null default "",
	store_name varchar(100) not null default "",
	registration_date timestamp not null default current_timestamp,
	updated_date timestamp not null default current_timestamp on update current_timestamp,
    index(item_id)
	);


insert into item(item_name,item_category,purchase_price,rental_price,size,
				overview,img_address001,img_address002,img_address003,company_name,
				store_name,delete_flg)
				values (
				"浴衣01/Yukata01",
				"浴衣/Yukata",
				1990,
				1000,
				"M",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined.",
				"yukata_tn01.jpg",
				"yukata_01.jpg"	,
				"",
				"Amazon川/Amazon River",
				"Amazon下請け会社/Amazon Subcontractor",
				false),(
				"浴衣02/Yukata02",
				"浴衣/Yukata",
				1990,
				1000,
				"M",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined.",
				"yukata_tn02.jpg",
				"yukata_02.jpg",
				"",
				"Amazon川/Amazon River",
				"Amazon下請け会社/Amazon Subcontractor",
				false
				),(
				"浴衣03/Yukata03",
				"浴衣/Yukata"
				,1990,
				1000,
				"M",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn03.jpg"
				,"yukata_03.jpg"
				,""
				,"Amazon川/Amazon River",
				"Amazon下請け会社/Amazon Subcontractor",
				false
				),(
				"浴衣04/Yukata04",
				"浴衣/Yukata",
				1990,
				1000,
				"M",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn04.jpg"
				,"yukata_04.jpg"
				,""
				,"Amazon川/Amazon River",
				"Amazon下請け会社/Amazon Subcontractor",
				false
				),(
				"浴衣05/Yukata05",
				"浴衣/Yukata"
				,1990,
				1000,
				"M",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn05.jpg"
				,"yukata_05.jpg"
				,""
				,"HelloJapan",
				"KimonoPro",
				false
				),(
				"浴衣06/Yukata06",
				"浴衣/Yukata"
				,990,
				1000,
				"S",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn06.jpg"
				,"yukata_06.jpg"
				,""
				,"HelloJapan",
				"Fake",
				false
				),(
				"浴衣07/Yukata07",
				"浴衣/Yukata"
				,1990,
				1000,
				"S",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn07.jpg"
				,"yukata_07.jpg"
				,""
				,"HelloJapan",
				"NihonOtaku",
				false
				),(
				"浴衣08/Yukata08",
				"浴衣/Yukata"
				,1990,
				1000,
				"L",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn08.jpg"
				,"yukata_08.jpg"
				,""
				,"HelloJapan",
				"KimonoPro",
				false
				),(
				"浴衣09/Yukata09",
				"浴衣/Yukata"
				,1990,
				1000,
				"L",
				"浴衣（ゆかた）とは和服の一種である。通常の和服とは違い、長襦袢を着用せず、素肌の上に着る略装である
				/A yukata is a Japanese garment, a casual summer kimono usually made of cotton or synthetic fabric, and unlined."
				,"yukata_tn09.jpg"
				,"yukata_09.jpg"
				,""
				,"HelloJapan",
				"KimonoAoi",
				false
				);

insert into item(item_name,item_category,purchase_price,rental_price,size,overview,img_address001,
				img_address002,img_address003,company_name,store_name,delete_flg)
				values (
				"袴01/Hakama01",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn01.jpg",
				"hakama_01.jpg",
				"",
				"アマゾン鈴/AmazonBell",
				"アマゾン/Amazon",
				false
				),(
				"袴02/Hakama02",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn02.jpg",
				"hakama_02.jpg",
				"",
				"ロンドンベル/LondonBell",
				"ビックベン/BigBen",
				false
				),(
				"袴03/Hakama03",
				"袴/Hakama"
				,1990,
				1000,
				"L",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn03.jpg",
				"hakama_03.jpg",
				"",
				"着物凛/KimonoRin",
				"袴専門店/HakamaSpecialtyShop",
				false
				), (
				"袴04/Hakama04",
				"袴/Hakama"
				,1990,
				1000,
				"S",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn04.jpg",
				"hakama_04.jpg",
				"",
				"アマゾン鈴/AmazonBell",
				"アマゾン/Amazon",
				false
				),(
				"袴05/Hakama05",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn05.jpg",
				"hakama_05.jpg",
				"",
				"アマゾン鈴/AmazonBell",
				"アマゾン/Amazon",
				false
				),(
				"袴06/Hakama06",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn06.jpg",
				"hakama_06.jpg",
				"",
				"着物凛/KimonoRin",
				"袴専門店/HakamaSpecialtyShop",
				false
				), (
				"袴07/Hakama07",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn07.jpg",
				"hakama_07.jpg",
				"",
				"着物凛/KimonoRin",
				"袴専門店/HakamaSpecialtyShop",
				false
				), (
				"袴08/Hakama08",
				"袴/Hakama"
				,1990,
				1000,
				"M",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn08.jpg",
				"hakama_08.jpg",
				"",
				"アマゾン鈴/AmazonBell",
				"アマゾン/Amazon",
				false
				), (
				"袴09/Hakama09",
				"袴/Hakama"
				,1990,
				1000,
				"L",
				"袴（はかま）、和服の上につけ、腰から足までを覆う、ひだのある衣服。/Hakama (hakama) Clothes on the kimono, covering the waist to the feet, garments with pleats.",
				"hakama_tn09.jpg",
				"hakama_09.jpg",
				"",
				"ロンドンベル/LondonBell",
				"ビックベン/BigBen",
				false
				);

insert into item(item_name,item_category,purchase_price,rental_price,size,overview,img_address001,
				img_address002,img_address003,company_name,store_name,delete_flg)
				values(
				"髪飾り01/Accessory01",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn01.jpg"
				,"acs_01.jpg"
				,""
				,"紫式部/Murasaki Shikibu",
				"源氏の会社/Genji's company",
				false
				),(
				"髪飾り02/Accessory02",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn02.jpg"
				,"acs_02.jpg"
				,""
				,"紫式部/Murasaki Shikibu",
				"源氏の会社/Genji's company",
				false
				),(
				"髪飾り03/Accessory03",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn03.jpg"
				,"acs_03.jpg"
				,""
				,"紫式部/Murasaki Shikibu",
				"源氏の会社/Genji's company",
				false
				),(
				"髪飾り04/Accessory04",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn04.jpg"
				,"acs_04.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				),(
				"髪飾り05/Accessory05",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn05.jpg"
				,"acs_05.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				),(
				"髪飾り06/Accessory06",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn06.jpg"
				,"acs_06.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				),(
				"髪飾り07/Accessory07",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn07.jpg"
				,"acs_07.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				),(
				"髪飾り08/Accessory08",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn08.jpg"
				,"acs_08.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				),(
				"髪飾り09/Accessory09",
				"髪飾り/Acs"
				,1990,
				1000,
				"なし/None",
				"成人式の振袖や、卒業式の袴など、華やかなお着物にオススメです。
				/Fit for Coming of Age Ceremony, Graduation ceremony, Parties or other special occasions.It makes your look noble and add your charm."
				,"acs_tn09.jpg"
				,"acs_09.jpg"
				,""
				,"PopUp",
				"Virtue",
				false
				);

create table pay_off(
    user_id int not null,
    item_id int not null default 0,
    item_name varchar(100) not null,
    purchase_order_count int not null,
    rental_order_count int not null,
    purchase_price Float not null default 0,
    rental_price Float not null default 0,
    purchase_amount Float not null default 0,
    rental_amount Float not null default 0,
    loan_date varchar(15) not null default '---',
    overview varchar(255) not null,
    img_address001 varchar(255) not null,
    pay_off_category tinyint,
    registration_date timestamp not null default current_timestamp,
    updated_date      timestamp not null default current_timestamp on update current_timestamp,
    foreign key(user_id) references openconnect.users(user_id) on delete cascade,
    foreign key(item_id) references item(item_id)
	);

drop table if exists worktable;
create table worktable(
    user_id int not null,
    item_id int not null,
    item_name varchar(100) not null,
    img_address001 varchar(255) not null,
    purchase_price float not null,
    rental_price float not null
    );

drop table if exists credit_card;
create table credit_card(
    user_id  int not null primary key,
    card_brand varchar(15) not null,
    name_e varchar(50) not null,
    credit_number varchar(16) not null unique,
    security_code int not null,
    expiration_day varchar(7) not null
    );

