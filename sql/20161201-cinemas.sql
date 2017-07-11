drop database if exists cinemas;

create database cinemas;

use cinemas;

create table users(
user_id int primary key not null auto_increment,
user_name varchar(255),
password varchar(255),
email varchar(255),
index(user_id)
);

insert into users(user_name,password,email) value("testuser","testuser","user.test@gmail.com");

create table credit(
credit_id int primary key not null auto_increment,
user_id int,
credit_number varchar(16) not null unique,
card_brand varchar(15),
name_e varchar(50) not null,
security_code int not null,
expiration_day varchar(7) not null,
index(user_id),
foreign key(user_id) references users(user_id)
);


create table credit_master(
credit_id int primary key not null auto_increment,
credit_number varchar(16) not null unique,
card_brand varchar(15),
name_e varchar(50) not null,
security_code int not null,
expiration_day varchar(7) not null
);
insert into credit_master(credit_number,card_brand,name_e,security_code,expiration_day) value(1111111111111114,"VISA","TEST VISA",111,"2018-05");
insert into credit_master(credit_number,card_brand,name_e,security_code,expiration_day) value(111111111111112,"AMEX","TEST AMEX",2222,"2018-06");
insert into credit_master(credit_number,card_brand,name_e,security_code,expiration_day) value(1111111111111113,"MC","TEST MC",333,"2018-07");

create table movies(
movie_id int primary key not null auto_increment,
movie_name varchar(255) not null,
img_path varchar(255) not null,
img_path_1 varchar(255) not null,
img_path_2 varchar(255) not null,
story text not null,
cast text not null,
derector varchar(255) not null,
overview text not null,
index(movie_id),
index(movie_name),
index(img_path)
);

create table calendar(
calendar_id int primary key not null auto_increment,
movie_id int not null,
movie_name varchar(255) not null,
movie_year varchar(4) not null,
movie_month varchar(2) not null,
movie_date varchar(2) not null,
movie_time varchar(5) not null,
screen varchar(2) not null,
price_adalt int not null,
caption int not null,
running_time int not null,
index(calendar_id),
foreign key(movie_id) references movies(movie_id),
foreign key(movie_name) references movies(movie_name)
);

create table seats(
seat_id int key not null auto_increment,
calendar_id int not null,
user_id int not null,
seat_flg boolean not null,
seat_name varchar(255) not null,
foreign key(user_id) references users(user_id),
foreign key(calendar_id) references calendar(calendar_id)
);

create table purchase(
purchase_id int key not null auto_increment,
user_id int not null,
movie_id int not null,
movie_name varchar(255) not null,
seat_1 varchar(6) not null,
seat_2 varchar(6),
seat_3 varchar(6),
seat_4 varchar(6),
seat_5 varchar(6),
price int not null,
movie_year varchar(4) not null,
movie_month varchar(2) not null,
movie_date varchar(2) not null,
movie_time varchar(5) not null,
screen varchar(2) not null,
caption int not null,
running_time int not null,
purchase_date timestamp default current_timestamp,
img_path varchar(255) not null,
foreign key(user_id) references users(user_id),
foreign key(movie_id) references movies(movie_id),
foreign key(movie_name) references movies(movie_name),
foreign key(img_path) references movies(img_path)
);

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("一週間フレンズ","img/movie/movie1/01.jpg","img/movie/movie1/02.jpg","img/movie/movie1/03.jpg","高校2年生の長谷祐樹は、初めて会った日から惹かれていた同級生・藤宮香織に、「友だちになってほしい」と思い切って声をかける。しかし、一週間しか記憶がもたないという障害を抱えていた香織は、祐樹の願いを拒む。それでも香織のそばにいたいと思う祐樹は、毎週月曜日、記憶がリセットされるたびに香織に会いに行く。やがて交換日記を始めた2人は、少しずつ距離を縮めていくが、そんなある日、香織の過去を知る転校生が現れる。","川口春奈/山崎賢人/松尾太陽/上杉柊平/高橋春織","村上正典","川口春奈と山崎賢人の主演で、アニメ化や舞台化もされた葉月抹茶氏の人気漫画を実写映画化した青春ラブストーリー。「好きっていいなよ。」の川口が香織を、「orange オレンジ」「オオカミ少女と黒王子」などで人気を博す山崎が祐樹を演じ、「電車男」「7月24日通りのクリスマス」の村上正典監督がメガホンをとった。");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("サバイバルファミリー","img/movie/movie2/01.jpg","img/movie/movie2/02.jpg","img/movie/movie2/03.jpg","原因不明の電気消滅によって廃墟寸前となった東京から脱出した一家の奮闘をコミカルに描いたサバイバルドラマ。東京で暮らすごく平凡な一家、鈴木家。当たり前のように電化製品に囲まれた生活を送っていたある日、電気を必要とするあらゆるものがなぜか使えなくなり、東京は大混乱に陥ってしまう。交通機関や電話、ガス、水道まで完全にストップした生活に人々が困り果てる中、鈴木家の亭主関白な父・義之は、家族を連れて東京を脱出することを決意するが……。","小日向文世/深津絵里/泉澤祐希/葵わかな/菅原大吉","矢口史靖","ベテラン俳優の小日向文世が父親役で主演を務め、母親役を深津絵里、息子役を「秘密 THE TOP SECRET」の泉澤祐希、娘役を「くちびるに歌を」の葵わかながそれぞれ演じる。「ウォーターボーイズ」「ハッピーフライト」の矢口史靖が監督を務めた異色作");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("ミス・ペレグリンと奇妙なこどもたち","img/movie/movie3/01.jpg","img/movie/movie3/02.jpg","img/movie/movie3/03.jpg","人とは異なる奇妙な能力を持った子どもたちが織りなす物語を描いたミステリアスファンタジー。周囲になじめない孤独な少年ジェイクは、唯一の理解者だった祖父の遺言に従い、森の奥にある古めかしい屋敷を見つける。そこには、美しくも厳格な女性ミス・ペレグリンの保護のもと、空中浮遊能力を持つ少女や透明人間の男の子、常に無口な双子といった、奇妙な子どもたちが暮らしていた。","エバ・グリーン/エイサ・バターフィールド/サミュエル・L・ジャクソン/ルパート・エベレット/アリソン・ジャネイ","ティム・バートン","「チャーリーとチョコレート工場」「アリス・イン・ワンダーランド」のティム・バートン監督が、ランサム・リグズによる全米ベストセラー小説「ハヤブサが守る家」を映画化.主人公ジェイク役は「ヒューゴの不思議な発明」で知られるエイサ・バターフィールド、ミス・ペレグリン役は「007 カジノ・ロワイヤル」「ダーク・シャドウ」のエバ・グリーンが務めている。");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("キセキ　あの日のソビト","img/movie/movie4/01.jpg","img/movie/movie4/02.jpg","img/movie/movie4/03.jpg","厳格な医者の父親の下を飛び出したミュージシャンのジンは、父の思いを受けて歯科医師を目指していた弟ヒデの音楽の才能を知り、ヒデとヒデの音楽仲間たちに自分の夢を託すことを決める。歯科医師を目指しながら音楽もやりたいが、そのことを恐ろしい父親に言い出せないジンとヒデは、顔出しなしのCDデビューという作戦をとるが……。","松坂桃李/菅田将暉/忽那汐里/平祐奈/横浜流星","兼重淳","メンバーが歯科医師で顔出しを一切しないという異色のボーカルグループ「GReeeeN」の代表曲「キセキ」の誕生秘話を、松坂桃李と菅田将暉のダブル主演で描く青春ドラマ。「GReeeeN」の楽曲をプロデュースするJIN（ジン）を松坂、弟でグループのリーダーを務めるHIDE（ヒデ）を菅田が演じる。「そして父になる」「海街diary」など是枝裕和監督作で助監督を務める兼重淳がメガホンをとった");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("恋妻家宮本","img/movie/movie5/01.jpg","img/movie/movie5/02.jpg","img/movie/movie5/03.jpg","ひとり息子の正が結婚して一人立ちしたことで、2人きりになった陽平と美代子の宮本夫婦。2人は大学時代に大学生時代に出来ちゃった婚で結婚したため、50歳にして初めて夫婦ふたりきりでの生活を送ることになる。そんなある日、陽平は美代子が隠し持っていた離婚届を見つけてしまい……。","阿部寛/天海祐希/菅野美穂/相武紗季/工藤阿須加","遊川和彦","「家政婦のミタ」「女王の教室」といった人気ドラマを多数手がけてきた脚本家・遊川和彦の映画監督デビュー作。重松清の小説「ファミレス」を遊川自ら大胆に脚色し、熟年離婚が当たり前になった現代で、子どもが独り立ちした後の夫婦がどのように向き合っていくのかを、コミカルかつハートフルに描いた。中学校教師で優柔不断な夫・陽平を阿部寛、専業主婦として家庭を切り盛りしてきた、しっかり者の妻・美代子を天海祐希が演じた。");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("新宿スワンII","img/movie/movie6/01.jpg","img/movie/movie6/02.jpg","img/movie/movie6/03.jpg","スカウト会社「新宿バースト」のエース格へと成長した白鳥龍彦は、幹部の関玄介とともに横浜へと送り込まれる。社長・山城は「バースト」の横浜進出を目論んでいたが、タキと呼ばれる男が牛耳る横浜は、逆に新宿を飲み込もうと徹底抗戦の構えで対抗。新宿と横浜は全面戦争へと突入していく。","綾野剛/浅野忠信/伊勢谷友介/深水元基/金子ノブアキ","園子温","「ヤングマガジン」連載の和久井健による人気コミックを、「ヒミズ」「地獄でなぜ悪い」の園子温監督のメガホン、綾野剛の主演で実写映画化した「新宿スワン」の続編。プロデューサーは「クローズ」シリーズの山本又一朗。「るろうに剣心」シリーズの谷垣健治がアクション監督として参加。");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("ドクター・ストレンジ","img/movie/movie7/01.jpg","img/movie/movie7/02.jpg","img/movie/movie7/03.jpg","天才的な技術を誇るが傲慢な性格だけが欠点の神経外科医スティーブン・ストレンジは、不慮の事故で両手の機能を失い、築いてきたキャリアの全てが崩壊する。手の治療と失われた人生を取り戻すため、あらゆる手段を模索するストレンジは、やがて神秘に満ちた魔術の力へとたどり着く。魔術の修行に励むストレンジは、強大な敵との戦いに巻き込まれていき、医師として相手を傷つけることに苦悩し、外科医に戻るか最強の魔術師として戦う道に進むかの選択を迫られる。","ベネディクト・カンバーバッチ/キウェテル・イジョフォー/レイチェル・マクアダムス/ベネディクト・ウォン/マイケル・スタールバーグ","スコット・デリクソン","「アベンジャーズ」シリーズをはじめとするマーベル・シネマティック・ユニバースに連なる一作で、テレビドラマ「SHERLOCK シャーロック」などでおなじみのイギリスの人気俳優ベネディクト・カンバーバッチが、魔術を操る異色のヒーロー、ドクター・ストレンジに扮したアクション。");

insert into movies(movie_name,img_path,img_path_1,img_path_2,story,cast,derector,overview) value("君の名は。","img/movie/movie8/01.jpg","img/movie/movie8/02.jpg","img/movie/movie8/03.jpg","1000年ぶりという彗星の接近が1カ月後に迫ったある日、山深い田舎町に暮らす女子高生の宮水三葉は、自分が東京の男子高校生になった夢を見る。日頃から田舎の小さな町に窮屈し、都会に憧れを抱いていた三葉は、夢の中で都会を満喫する。一方、東京で暮らす男子高校生の立花瀧も、行ったこともない山奥の町で自分が女子高生になっている夢を見ていた。心と身体が入れ替わる現象が続き、互いの存在を知った瀧と三葉だったが、やがて彼らは意外な真実を知ることになる。","神木隆之介/上白石萌音/長澤まさみ/市原悦子/成田凌","新海誠","「雲のむこう、約束の場所」「秒速5センチメートル」など、男女の心の機微を美しい風景描写とともに繊細に描き出すアニメーション作品を手がけ、国内外から注目を集める新海誠監督が、前作「言の葉の庭」から3年ぶりに送り出すオリジナル長編アニメ。");


insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2018","2","21","16:00","A",1800,0,120);

insert into credit (user_id,credit_number,card_brand,name_e,security_code,expiration_day) value (1,1111111111111111,"VISA","TEST USER",111,"2018-07");

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","23","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","24","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","25","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","26","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","27","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","02","28","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","01","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","02","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","03","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","04","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","05","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","06","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","07","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","08","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","09","22:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","10:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","12:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","15:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","17:30","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","20:00","A",1800,0,120);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(1,"一週間フレンズ","2017","03","10","22:30","A",1800,0,120);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","23","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","24","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","25","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","26","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","27","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","02","28","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","01","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","02","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","03","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","04","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","05","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","06","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","07","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","08","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","09","22:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","10:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","12:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","15:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","17:30","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","20:00","B",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(2,"サバイバルファミリー","2017","03","10","22:30","B",1800,0,117);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","22:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","10:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","12:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","15:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","17:30","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","20:00","C",1800,1,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","22:30","C",1800,1,128);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","23","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","24","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","25","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","26","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","27","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","02","28","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","01","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","02","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","03","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","04","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","05","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","06","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","07","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","08","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","09","22:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","10:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","12:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","15:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","17:30","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","20:00","D",1800,2,128);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(3,"ミス・ペレグリンと奇妙なこどもたち","2017","03","10","22:30","D",1800,2,128);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","23","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","24","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","25","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","26","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","27","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","02","28","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","01","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","02","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","03","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","04","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","05","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","06","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","07","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","08","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","09","22:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","10:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","12:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","15:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","17:30","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","20:00","E",1800,0,111);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(4,"キセキ　あの日のソビト","2017","03","10","22:30","E",1800,0,111);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","23","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","24","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","25","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","26","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","27","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","02","28","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","01","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","02","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","03","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","04","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","05","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","06","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","07","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","08","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","09","22:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","10:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","12:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","15:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","17:30","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","20:00","F",1800,0,117);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(5,"恋妻家宮本","2017","03","10","22:30","F",1800,0,117);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","23","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","24","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","25","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","26","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","27","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","02","28","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","01","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","02","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","03","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","04","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","05","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","06","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","07","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","08","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","09","22:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","10:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","12:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","15:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","17:30","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","20:00","G",1800,0,133);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(6,"新宿スワンII","2017","03","10","22:30","G",1800,0,133);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","23","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","24","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","25","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","26","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","27","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","02","28","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","01","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","02","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","03","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","04","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","05","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","06","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","07","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","08","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","09","22:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","10:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","12:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","15:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","17:30","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","20:00","H",1800,0,107);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(8,"君の名は。","2017","03","10","22:30","H",1800,0,107);

insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","23","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","24","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","25","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","26","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","27","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","02","28","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","01","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","02","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","03","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","04","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","05","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","06","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","07","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","08","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","09","22:30","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","10:00","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","12:30","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","15:00","I",1800,0,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","17:30","I",1800,2,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","20:00","I",1800,1,115);
insert into calendar (movie_id,movie_name,movie_year,movie_month,movie_date,movie_time,screen,price_adalt,caption,running_time) value(7,"ドクター・ストレンジ","2017","03","10","22:30","I",1800,0,115);


