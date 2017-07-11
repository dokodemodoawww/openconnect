drop database if exists tokyorunner;

create database tokyorunner;

use tokyorunner;

create table items(
item_id int primary key not null auto_increment,
item_name varchar(255),
price decimal,
category int,
overview text,
stock_count int,
picture varchar(255),
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(item_id),
index(item_name),
index(picture)
);


insert into items(item_name,price,picture,category,overview,stock_count) value("shoes1",5000,"shoes1.jpg",0,"これはシューズ1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("shoes2",6000,"shoes2.jpg",0,"これはシューズ2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("shoes3",7000,"shoes3.jpg",0,"これはシューズ3です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("wear1",3000,"wear1.jpg",1,"これはウエア1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("wear2",4000,"wear2.jpg",1,"これはウエア2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("wear3",5000,"wear3.jpg",1,"これはウエア3です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("socks1",500,"socks1.jpg",2,"これはソックス1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("socks2",600,"socks2.jpg",2,"これはソックス2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("socks3",700,"socks3.jpg",2,"これはソックス3です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("bag1",6000,"bag1.jpg",3,"これはバック1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("bag2",7000,"bag2.jpg",3,"これはバック2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("bag3",8000,"bag3.jpg",3,"これはバック3です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("drink1",150,"drink1.jpg",4,"これはドリンク1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("drink2",200,"drink2.jpg",4,"これはドリンク2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("drink3",250,"drink3.jpg",4,"これはドリンク3です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("other1",8000,"other1.jpg",5,"これはその他1です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("other2",600,"other2.jpg",5,"これはその他2です",10);
insert into items(item_name,price,picture,category,overview,stock_count) value("other3",9000,"other3.jpg",5,"これはその他3です",10);

create table payment_methods(
w_payment_method int,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(w_payment_method)
);

create table purchases(
purchase_id int primary key not null auto_increment,
user_id int,
item_id int,
item_name varchar(255),
price decimal,
purchase_count int,
purchase_date timestamp not null default current_timestamp,
payment_method int,
subtotal int,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(user_id),
index(item_id),
index(item_name),
index(payment_method),
foreign key(user_id) references openconnect.users(user_id),
foreign key(item_id) references items(item_id),
foreign key(item_name) references items(item_name),
foreign key(payment_method) references payment_methods(w_payment_method)
on update cascade on delete cascade
);

insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,3,"shoes3",7000,1,20160901);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,13,"drink1",150,2,20160901);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,1,"shoes1",5000,1,20160913);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,5,"wear2",4000,1,20160913);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,8,"socks2",600,3,20160913);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,3,"shoes3",7000,1,20160925);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,9,"socks3",700,5,20160925);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,12,"bag3",8000,1,20160925);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,2,"shoes2",6000,1,20161009);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,11,"bag2",7000,1,20161009);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,15,"drink3",250,1,20161009);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,1,"shoes1",5000,1,20161018);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,18,"other3",10000,1,20161018);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,15,"drink3",250,20,20161023);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,3,"shoes3",7000,1,20161025);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,6,"wear3",5000,1,20161025);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,16,"other1",8000,1,20161025);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,3,"shoes3",7000,1,20161101);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,13,"drink1",150,2,20161101);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,8,"socks2",600,1,20161101);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,1,"shoes1",5000,1,20161113);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,5,"wear2",4000,1,20161113);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,8,"socks2",600,3,20161113);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,18,"other3",10000,1,20161113);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,3,"shoes3",7000,1,20161125);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,9,"socks3",700,5,20161125);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,12,"bag3",8000,1,20161125);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,2,"shoes2",6000,1,20161205);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,4,"wear1",3000,1,20161205);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,11,"bag2",7000,1,20161205);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(12,15,"drink3",250,1,20161205);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,1,"shoes1",5000,1,20161220);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,10,"bag1",6000,1,20161220);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(7,18,"other3",10000,1,20161220);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,15,"drink3",250,20,20170109);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(8,17,"other2",600,13,20170109);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,3,"shoes3",7000,1,20170120);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,6,"wear3",5000,1,20170120);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,3,"socks3",700,2,20170120);
insert into purchases(user_id,item_id,item_name,price,purchase_count,purchase_date) value(9,12,"bag3",8000,1,20170120);

update purchases set subtotal = price * purchase_count;

create table earning (month varchar(255), total decimal);
insert into earning (month) value ("this_month");
insert into earning (month) value ("month_1_ago");
insert into earning (month) value ("month_2_ago");
insert into earning (month) value ("month_3_ago");
insert into earning (month) value ("month_4_ago");

update earning
set total = (select sum(subtotal)
from purchases
where date_format (purchase_date, '%Y%m') = date_format (now(), '%Y%m'))
where month = "this_month";

update earning
set total = (select sum(subtotal)
from purchases
where date_format (purchase_date, '%Y%m') = date_format (curdate() - interval 1 month, '%Y%m'))
where month = "month_1_ago";

update earning
set total = (select sum(subtotal)
from purchases
where date_format (purchase_date, '%Y%m') = date_format (curdate() - interval 2 month, '%Y%m'))
where month = "month_2_ago";

update earning
set total = (select sum(subtotal)
from purchases
where date_format (purchase_date, '%Y%m') = date_format (curdate() - interval 3 month, '%Y%m'))
where month = "month_3_ago";

update earning
set total = (select sum(subtotal)
from purchases
where date_format (purchase_date, '%Y%m') = date_format (curdate() - interval 4 month, '%Y%m'))
where month = "month_4_ago";



create table carts(
cart_id int primary key not null auto_increment,
user_id int,
item_id int,
item_name varchar(255),
count int,
price decimal,
picture varchar(255),
amount decimal,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(user_id),
index(item_id),
index(picture),
foreign key(user_id) references openconnect.users(user_id),
foreign key(item_id) references items(item_id),
foreign key(item_name) references items(item_name),
foreign key(picture) references items(picture)
on update cascade on delete cascade
);

create table temporarily_saved(
purchase_id int primary key not null auto_increment,
user_id int,
item_id int,
item_name varchar(255),
price decimal,
purchase_count int,
purchase_date date,
payment_method int,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(user_id),
index(item_id),
index(item_name),
index(payment_method),
foreign key(user_id) references openconnect.users(user_id),
foreign key(item_id) references items(item_id),
foreign key(item_name) references items(item_name),
foreign key(payment_method) references payment_methods(w_payment_method)
on update cascade on delete cascade
);

create table category(
item_id int,
item_name varchar(255),
w_category int,
category_picture text,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(item_id),
index(item_name),
index(w_category),
index(category_picture(255)),
foreign key(item_id) references items(item_id),
foreign key(item_name) references items(item_name)
on update cascade on delete cascade
);

create table credit(
user_id  int,
card_brand varchar(15),
name_e varchar(50) not null,
credit_number varchar(16) not null unique,
security_code int not null,
expiration_day varchar(7) not null,
index(user_id),
foreign key(user_id) references openconnect.users(user_id)
);

CREATE TABLE credit_card(
user_id int,
credit_number VARCHAR(16) NOT NULL,
name_e VARCHAR(50) NOT NULL,
security_code int NOT NULL,
expiration_day varchar(7) NOT NULL,
registration_date timestamp not null default current_timestamp,
updated_date timestamp not null default current_timestamp on update current_timestamp,
index(user_id),
foreign key(user_id) references openconnect.users(user_id)
);