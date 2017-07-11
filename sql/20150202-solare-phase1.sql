set names utf8;
set foreign_key_checks=0;
drop database if exists solare;
create database solare;
use solare;

create table customerid_info(
customerid_number int(10) primary key auto_increment,
customer_id varchar(30),
user_uuid varchar(100),
insert_date timestamp,
delete_date timestamp
);

create table reservation_info(
reservation_number int(10) primary key auto_increment comment '',
customer_reservation_number int(1) comment '',
account_number int(10) comment '',
course_number int(20) comment '',
number_of_ppl int(10) comment '',
full_name varchar(50) comment '',
phone_number varchar(30) comment '',
reservation_date timestamp default 0 comment '',
reservation_dayofweek int(5) comment '',
reservation_time int(5) comment '',
register_date timestamp default 0 comment '',
update_date timestamp default current_timestamp on update current_timestamp comment '',
delete_date timestamp comment ''
);

create table seat_info(
date date,
dayofweek int(1),
max_number_of_ppl int(5),
remaining_seats int(5)
);