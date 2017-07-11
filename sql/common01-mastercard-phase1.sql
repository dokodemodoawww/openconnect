set names utf8;
DROP DATABASE if EXISTS mastercard;
CREATE DATABASE mastercard;
use mastercard;


/* ユーザー情報登録申請  *
 * ログインID = login_id
 * ログインパスワード = password
 * 姓名（漢字）= name
 * 姓名（ローマ字）= name_e
 * 郵便番号 = postal
 * 住所 = address
 * メールアドレス = email
 * 電話番号(自宅) = tel_number
 * 電話番号(携帯) = mobile
 * 生年月日 = birthday
 * 性別 = gender
 * 業種 = industry_type
 * 職業 = job
 * 勤務先名(法人呼称) = corporation_name
 * 勤務先名 = office_name
 * 勤務先所在地 = office_address
 * 勤務先電話番号(外線) = office_tel
 * 勤務年数 = office_years
 * 銀行コード = bank_code
 * 金融機関名 = bank_name
 * 支店番号 = bank_number
 * 口座種別 = account_type
 * 普通口座番号 = normal_account
 * 預金口座番号 = deposit_account
 * 預貯金額 = savings
 * 他社借入れ金額 = debt
 * 配偶者の有無 = spouse
 * カード使用目的 = use_card
 * 本人年収 = income
 * 世帯年収 = income_f
 * 希望利用可能枠 = spend
 * 希望暗証番号 = id_number
 * クレジットカード審査承認フラグ = judge_flg
 * 登録日 = register_day
 * 更新日 = update_day
 * 削除フラグ = delete_flg
 * */
CREATE TABLE user(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
password VARCHAR(15) NOT NULL,
name VARCHAR(50) NOT NULL,
name_e VARCHAR(50) NOT NULL,
postal VARCHAR(7) NOT NULL,
address VARCHAR(100) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
tel_number VARCHAR(11),
mobile VARCHAR(11),
birthday date NOT NULL,
gender VARCHAR(1) NOT NULL,
industry_type int,
job VARCHAR(20),
corporation_name VARCHAR(100),
office_name VARCHAR(100),
office_address VARCHAR(40),
office_tel VARCHAR(11),
office_years int,
bank_code VARCHAR(4) default '9999',
bank_name VARCHAR(10),
bank_number VARCHAR(3),
account_type VARCHAR(5),
normal_account VARCHAR(7) UNIQUE,
deposit_account VARCHAR(7) UNIQUE,
savings int,
debt int,
spouse VARCHAR(1) default "無",
use_card VARCHAR(100),
income bigint,
income_f bigint,
spend int,
id_number VARCHAR(4) NOT NULL,
judge_flg VARCHAR(3) default "保留",
register_day datetime not null default current_timestamp,
update_day datetime not null default current_timestamp,
delete_flg boolean default false
);

/* 購入お支払履歴
 * ヒストリーID = history_id
 * ログインID = login_id
 * 姓名（漢字） = name_e
 * ご利用店名 = corporation_name
 * ご利用日 = use_day
 * 支払い区分 = division
 * 分割回数 = split
 * 支払い予定日 = payment_day
 * 利用金額 = spend
 * 支払い金額 = payment
 * 手数料 = commission
 * 削除フラグ = delete_flg
 * 返品フラグ = cancel_flg
 * 依頼フラグ = cancel_order_flg
 * */
CREATE TABLE user_history(
history_id int not null auto_increment,
login_id VARCHAR(10) NOT NULL,
name_e VARCHAR(50) NOT NULL,
corporation_name VARCHAR(50) NOT NULL,
use_day datetime NOT NULL default current_timestamp,
division VARCHAR(10) NOT NULL default '一括',
split int NOT NULL default '0',
payment_day datetime NOT NULL default current_timestamp,
spend int NOT NULL,
payment int NOT NULL,
commission int NOT NULL default '0',
delete_flg boolean default false,
cancel_flg int default 0,
cancel_order_flg int default 0,
PRIMARY KEY (history_id),
foreign key(login_id) references user(login_id)
);

/* クレジットカード情報
 * ログインID = login_id
 * 姓名(ローマ字) = name_e
 * クレジット番号 = credit_number
 * セキュリティコード = security_code
 * 暗証番号 = id_number
 * 利用限度額 = credit_limit
 * 登録日 = register_day
 * 更新日 = update_day
 * 削除フラグ = delete_flg
 * 有効期限 = expiration_date
 * ご利用金額 = spend
 * */
CREATE TABLE credit_card(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
name_e VARCHAR(50) NOT NULL,
credit_number VARCHAR(16) NOT NULL UNIQUE,
security_code int NOT NULL,
id_number int NOT NULL,
credit_limit int NOT NULL,
register_day datetime NOT NULL,
update_day datetime NOT NULL,
delete_flg boolean default false,
expiration_day VARCHAR(7) NOT NULL,
spend int default 0,
foreign key(login_id)references user(login_id)
);


/* 法人情報登録申請
 * ログインID = login_id
 * ログインパスワード = password
 * 会社名 = corporation_name
 * 本社郵便番号 = postal
 * 本社所在地 = address
 * 資本金 = capital
 * 代表者 = rep_name
 * 担当者 = charge
 * メールアドレス = email
 * 電話番号(外線) = tel_number
 * 従業員数 = employee
 * 設立年数 = established
 * ホームページURL = hp_url
 * 加盟店審査承認フラグ = judge_flg
 * 登録日 = regist_day
 * 更新日 = update_day
 * 削除フラグ = delete_flg
 * */
CREATE TABLE corporation(
login_id VARCHAR(10) NOT NULL PRIMARY KEY,
password VARCHAR(10) NOT NULL,
corporation_name VARCHAR(50) NOT NULL,
postal VARCHAR(7) NOT NULL,
address VARCHAR(100) NOT NULL,
capital bigint NOT NULL,
rep_name VARCHAR(50) NOT NULL,
charge VARCHAR(50) NOT NULL,
email VARCHAR(40) NOT NULL,
tel_number VARCHAR(11) NOT NULL,
employee int NOT NULL,
established VARCHAR(3) NOT NULL,
hp_url VARCHAR(100),
judge_flg VARCHAR(3) default "保留",
register_day datetime NOT NULL,
update_day datetime NOT NULL,
delete_flg boolean default false
);


/* 管理者情報
 * 管理者ログインID = admin_id
 * 管理者ログインパスワード = admin_password
 * */
CREATE TABLE admin(
login_id VARCHAR(10) NOT NULL,
password VARCHAR(10) NOT NULL
);

insert into user(login_id,password,name,name_e,postal,address,email,tel_number,mobile,birthday,gender,industry_type,job,corporation_name,office_name,office_address,office_tel,office_years,bank_code,bank_number,account_type,normal_account,deposit_account,savings,debt,spouse,use_card,income,income_f,spend,id_number,judge_flg,register_day,update_day,delete_flg)values
("hidekisama","ikemen","工藤秀樹","KUDOHIDEKI","1112222","東京都台東区上野1-1-1","hidekisama@gmail.com","0312341234","09012341234","1992-05-31","男","3","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","004","1","1234567",null,"5000000","1000000000", "有", "パチンコ","10","50","5000000","5555", "承認","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("kudo","ikemen","工藤秀樹","KUDOHIDEKI","1112222","東京都台東区上野1-1-1","hidekisam@gmail.com","0312341234","09012341234","1992-05-31","男","4","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","015","1","1234568",null,"5000000","1000000000", "無", "パチンコ","10","50","5000000","5555", "承認","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("mura","megane","村上俊一","MURAKAMIJUNICHI","1112222","東京都台東区上野1-1-1","mura@gmail.com","0313331234","09012341234","2016-06-17","男","5","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","024","2",null,"6264997","5000000","1000000000", "無","マック食べたい","10","50","5000000","5555","保留","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("morita","mask","森田直美","MORITANAOMI","1112222","東京都台東区上野1-1-1","morita@gmail.com","0313331234","09012341234","1990-11-16","女","6","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","453","2",null,"6774567","5000000","1000000000","無","スロット","10","50","5000000","5555","不承認","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("shogo","ikemen","中村匠吾","NAKAMURASHOGO","1116622","東京都台東区上野1-1-1","shogo@gmail.com","0313331234","09012341234","1995-07-18","男","7","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","481","1","6994567",null,"5000000","1000000000", "無","イケメン講義","10","50","5000000","5555", "保留","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("kura","kawaii","倉地祥吾","KUTACHISHOGO","1116622","東京都台東区上野1-1-1","kura@gmail.com","0313331234","09012341234","1995-07-18","男","8","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","723","2",null,"9994567","5000000","1000000000","無","天才になるため","10","50","5000000","5555", "保留","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("sasamin","ikemen","石鉢ささみん","ISHIBACHISASAMIN","1116622","東京都台東区上野1-1-1","sasamin@gmail.com","0313331234","09012341234","1990-10-15","男","9","クドゥー開発者","株式会社クドゥー","クドゥー言語研究所","東京都","0355558888","1","0001","813","1","9394567",null,"5000000","1000000000","無","ホモアプリ課金","10","50","5000000","5555", "保留","2016-06-15 13:25:59","2016-06-15 13:26:00",false),
("aporo","aporo","冨澤アポロ","TOMIZAWAAPORO","1234567","23系銀河太陽系月の上","aporo@ginga.com","1232345122","08098721230","4896-10-10","女","10","宇宙","熱式宇宙アポロ","アポロ言語伝達所","銀河太陽系地球","1231234000","2","0001","760","2",null,"1122567","5123123","12300", "有","宇宙旅行","10000000","500000","50","4885", "承認","2012-06-15 13:25:59","2020-06-15 13:48:53",false);


insert into user(login_id,password,name,name_e,postal,address,email,tel_number,mobile,birthday,gender,normal_account,deposit_account,id_number)values
('1','testuser','テストユーザー','testuser','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','user.test@gmail.com','0123456789','09012345678','1993-12-24','男','1098765','1098761','5555'),
('2','internous01','井上琢磨','inouetakuma','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','takuma.inoue@gmail.com','0123456789','09012345678','1990-09-25','男','2109876','2109872','5555'),
('3','internous01','原田美友貴','haradamiyuki','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','miyuki.harada@gmail.com','0123456789','09012345678','1992-05-03','女','3210987','3210983','5555'),
('4','leader11','テストリーダー1','testleader1','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','leader1.test@gmail.com','0123456789','09012345678','1990-04-01','男','4321098','4321094','5555'),
('5','leader22','テストリーダー2','testleader2','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','kouhei.nitabaru@gmail.com','0123456789','09012345678','1990-04-01','男','6543210','6543216','5555'),
('6','student1','仁田原耕平','nitabarukouhei','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','tatsuhumi.itou@gmail.com','0123456789','09012345678','1990-04-01','男','7654321','7654327','5555'),
('7','student2','伊藤竜文','itoutatsuhumi','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','leader2.test@gmail.com','0123456789','09012345678','1990-04-01','男','5432109','5432105','5555'),
('8','student3','砂川みのり','sunakawaminori','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','minori.sunakawa@gmail.com','0123456789','09012345678','1990-04-01','女','8765432','8765438','5555'),
('9','student4','毛塚正広','kedukamasahiro','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','masahiro.keduka@gmail.com','0123456789','09012345678','1990-04-01','男','9876543','9876549','5555'),
('10','student5','堀口謙一','horiguchikennichi','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','kennichi.horiguchi@gmail.com','0123456789','09012345678','1990-04-01','男','0987654','0987650','5555'),
('11','student6','霧生雄一','kiryuuyouichi','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','yuuichi.kiryuu@gmail.com','0123456789','09012345678','1990-04-01','男','1987654','1987651','5555'),
('12','student7','星達也','hoshitatsuya','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','tatsuya.hoshi@gmail.com','0123456789','09012345678','1990-04-01','男','2987654','2987652','5555'),
('13','student8','岩本興明','iwamotokoumei','1130034','東京都文京区湯島3-2-12　御茶ノ水天神ビル','koumei.iwamoto@gmail.com','0123456789','09012345678','1990-04-01','男','3987654','3987653','5555');


/**
 * 購入お支払い履歴
 */
insert into user_history(login_id,name_e,corporation_name,use_day,payment_day,spend,payment)values
('8','砂川みのり','インターノウス','2017-01-01','2017-02-01','10000','10000');


/**
 * クレジットカード情報
 */
insert into credit_card(login_id,name_e,credit_number,security_code,id_number,credit_limit,register_day,update_day,delete_flg,expiration_day,spend)values
("hidekisama","KUDOHIDEKI","5555557891234567","1234","1234","100000","2016-06-17 13:16:00","2018-06-17 13:25:00",false,"2019-06","10"),
("kudo","IKEMENKUDO","5555555665877458","4567","4567","456430","2202-08-17 15:16:00","2016-06-17 12:25:00",false,"2017-06","20000"),
("1","テスト1","5555550000000001","001","0001","000001","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("2","テスト2","5555550000000002","002","0002","000002","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("3","テスト3","5555550000000003","003","0003","000003","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("4","テスト4","5555550000000004","004","0004","000004","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("5","テスト5","5555550000000005","005","0005","000005","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("6","テスト6","5555550000000006","006","0006","000006","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("7","テスト7","5555550000000007","007","0007","000007","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("8","テスト8","5555550000000008","008","0008","000008","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("9","テスト9","5555550000000009","009","0009","000009","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("10","テスト10","5555550000000010","010","0010","000010","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("11","テスト11","5555550000000011","011","0011","000011","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000"),
("12","テスト12","5555550000000012","012","0012","000012","2202-08-27 15:16:00","2016-06-27 12:25:00",false,"2017-06","20000")
;

/* 法人データ */
insert into corporation(login_id,password,corporation_name,postal,address,capital,rep_name,charge,email,tel_number,employee,established,hp_url,judge_flg,register_day,update_day,delete_flg)values
("kudo","ikemen","株式会社工藤","1119898","東京都台東区上野1-1-1","50000000","工藤秀樹","倉地祥吾","kudo@gmail.com","0311112222","800","50","kudouhideki@gmail.com","承認",20160617,20160617,false),
("hideki","ikemen","tbox","1119898","東京都台東区上野1-1-1","50000000","工藤秀樹","倉地祥吾","hideki@gmail.com","0311112222","800","50","tbox@gmail.com","保留",20160617,20160617,false),
("yugo","ikemen","kinnosawa","1119898","東京都台東区上野1-1-1","50000000","丸井優吾","丸井優吾","yugoi@gmail.com","0311112222","800","50","tbox@gmail.com","不承認",20160617,20160617,false),
("asa","ikemen","ichigoichie","1119898","東京都台東区上野1-1-1","50000000","あさまさき","あさまさき","asamasaki@gmail.com","0311112222","800","50","asamasaki@gmail.com","保留",20160617,20160617,false),
("morita","ikemen","gekidanroadshow","1119898","東京都台東区上野1-1-1","50000000","森田","直美","morita@gmail.com","0311112222","800","50","moritai@gmail.com","保留",20160617,20160617,false);
/**
 *管理人情報
 */
insert into admin(login_id,password) values("admin","123");
