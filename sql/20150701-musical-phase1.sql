set names utf8;
set foreign_key_checks=0;
drop database if exists musical;
create database musical;
use musical;


create table user(
    user_id         int          not null auto_increment comment 'ユーザー名',
    email           varchar(100) binary not null comment 'メールアドレス',
    password        varchar(32)  binary not null cmment 'パスワード',
    user_name       varchar(100) not null comment '名前',
    tel_number      varchar(11)  not null comment '電話番号',
    postal_code     varchar(8)   not null comment '郵便番号',
    address         varchar(255) not null comment '住所',
    unique_id       varchar(50) comment '固有ID',
    registered_date timestamp    not null default current_timestamp comment '登録日',
    renew_date      timestamp    not null default current_timestamp on update current_timestamp comment '更新日',
    is_unregister   boolean      not null default false,

    primary key(user_id),
    unique(email)
);

create table orderinfo(
    orderinfo_id    int       not null auto_increment comment '注文情報ID',
    user_id         int       not null comment 'ユーザーID',
    ticket_id       int       not null comment 'チケットID',
    card_token      varchar(100) comment 'カードトークン',
    sheets          int       not null comment '枚数',
    total_amount    float     not null comment '合計金額',
    registered_date timestamp not null default current_timestamp comment '登録日',

    primary key(orderinfo_id)
);

create table theater(
    theater_id      int          not null auto_increment comment '劇場ID',
    theater_name    varchar(100) not null comment '劇場名',
    theater_address varchar(255) not null comment '劇場住所',
    registered_date timestamp    not null default current_timestamp comment '登録日',

    primary key(theater_id)
);

create table ticket(
    ticket_id       int          not null auto_increment comment 'チケットID',
    theater_id      int          not null comment '劇場ID',
    musical_name    varchar(100) not null comment '公演名',
    musical_date    timestamp    not null comment '公演日',
    ticket_price    float        not null comment '値段',
    registered_date timestamp    not null default current_timestamp comment '登録日',
    renew_date      timestamp    not null default current_timestamp on update current_timestamp comment '情報更新日',

    primary key(ticket_id)
);

create table administrator(
    id             int         not null auto_increment,
    admin_id       varchar(25) binary not null comment '管理者ID',
    admin_password varchar(25) binary not null comment '管理者パスワード',
    is_login       boolean     default false comment 'ログイン確認',

    primary key(id),
    unique(admin_id)
);

alter table orderinfo add constraint orderinfo_ibfk1
    foreign key(user_id) references user(user_id)
    on update cascade
    on delete restrict
;

alter table orderinfo add constraint orderinfo_ibfk2
    foreign key(ticket_id) references ticket(ticket_id)
    on update cascade
    on delete restrict
;

alter table ticket add constraint ticket_ibfk1
    foreign key(theater_id) references theater(theater_id)
    on update cascade
    on delete restrict
;
