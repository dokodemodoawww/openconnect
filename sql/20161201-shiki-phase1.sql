set name utf8;
set foreign_key_checks=0;
drop database if exists shiki;
create database shiki;
use shiki;


create table card(
	card_num int not null primary key,
	card varchar(255) not null
) engine=InnoDB;

insert into card(card_num, card) values(0, "visa");
insert into card(card_num, card) values(1, "master");
insert into card(card_num, card) values(2, "american express");

create table season(
  season_num int not null primary key,
  season varchar(255) not null
) engine=InnoDB;

insert into season(season_num, season) values(0, "Spring");
insert into season(season_num, season) values(1, "Summer");
insert into season(season_num, season) values(2, "Autumn");
insert into season(season_num, season) values(3, "Winter");

create table gender(
  gender_num int not null primary key,
  gender varchar(255) not null
) engine=InnoDB;

insert into gender(gender_num, gender) values(0, "not known");
insert into gender(gender_num, gender) values(1, "male");
insert into gender(gender_num, gender) values(2, "female");
insert into gender(gender_num, gender) values(9, "not applicable");

create table satisfaction(
  satisfaction_num int not null primary key,
  satisfaction varchar(255) not null
) engine=InnoDB;

insert into satisfaction(satisfaction_num, satisfaction) values(0, "Very dissatisfied");
insert into satisfaction(satisfaction_num, satisfaction) values(1, "dissatisfied");
insert into satisfaction(satisfaction_num, satisfaction) values(2, "Neutral");
insert into satisfaction(satisfaction_num, satisfaction) values(3, "Satisfied");
insert into satisfaction(satisfaction_num, satisfaction) values(4, "Very satisfied");

create table questionnaire(
  age int not null,
  gender int not null,
  tour_date int not null,
  satisfaction int not null,
  feedback text not null
);

create table payment(
	payment_num varchar(255) not null primary key,
	payment varchar(255)
);

insert into payment(payment_num, payment) values("0", "Bank account instant transfer");
insert into payment(payment_num, payment) values("1", "Credit card");

create table users(
  user_id int not null primary key,
  user_name varchar(255) not null,
  mail_address varchar(255) not null,
  password varchar(255) not null,
  login_flg boolean not null,
  user_flg int not null default 3,
  oauth_id varchar(255),
  oauth_name int,
  oauth_account varchar(255)
);

insert into users(user_id, user_name, mail_address, password, login_flg, user_flg, oauth_id, oauth_name, oauth_account) values(0, "aaa", "aa@gmail.com", "password", FALSE, 3, "", 0, "");
insert into users(user_id, user_name, mail_address, password, login_flg, user_flg, oauth_id, oauth_name, oauth_account) values(1, "aaa", "bb@gmail.com", "password", FALSE, 3, "", 0, "");
insert into users(user_id, user_name, mail_address, password, login_flg, user_flg, oauth_id, oauth_name, oauth_account) values(2, "aaa", "cc@gmail.com", "password", FALSE, 3, "", 0, "");

create table tour(
  user_id int not null,
  tour_id int not null,
  people int not null,
  tour_name varchar(100) not null,
  tour_date date not null,
  tour_godate date not null,
  tour_returndate date not null,
  tour_category int not null,
  price int not null,
  amount int not null
);

create table purchase(
  user_id int not null,
  people int not null,
  tour_name varchar(100) not null,
  tour_date date not null,
  tour_godate date not null,
  tour_returndate date not null,
  price int not null,
  amount int not null
);

create table detail(
  tour_id int not null,
  tour_name_ja varchar(100) not null,
  tour_name_en varchar(100) not null,
  tour_price int not null,
  tour_category int not null,
  tour_detail_1_ja text not null,
  tour_detail_1_en text not null,
  tour_detail_2_ja text not null,
  tour_detail_2_en text not null,
  tour_detail_3_ja text not null,
  tour_detail_3_en text not null,
  tour_detail_4_ja text not null,
  tour_detail_4_en text not null,
  tour_detail_5_ja text not null,
  tour_detail_5_en text not null,
  img_address001 text not null,
  img_address002 text not null,
  img_address003 text not null,
  img_address004 text not null,
  img_address005 text not null,
  foreign key(tour_category) references season(season_num) on delete cascade
);

insert into detail (tour_id,tour_name_ja,tour_name_en,tour_price,tour_category,
tour_detail_1_ja,tour_detail_1_en,tour_detail_2_ja,tour_detail_2_en,tour_detail_3_ja,tour_detail_3_en,tour_detail_4_ja,tour_detail_4_en,tour_detail_5_ja,tour_detail_5_en,
img_address001,img_address002,img_address003,img_address004,img_address005)

values(0,"お一人様長野ツアー","Spring tour of Nagano",50000,0,"善光寺の東に隣接する城山公園には約470本のソメイヨシノが植栽されており、
開花時には壮観な眺めになります。また、市内でも高台に位置しますので、
夜桜と夜景を同時に楽しめます。花見シーズンには全国的にも珍しい花見茶屋が軒を連ね、
暖かい小屋の中は多くの花見客で賑わいます。",
"About 470 Yoshino cherry trees are planted in Shiroyama Park adjacent to the east of Zenkoji,
At the time of flowering it will be a spectacular view. Also, because it is located on the hill in the city,
You can enjoy night view and night view at the same time. In the cherry-blossom season, a rare cherry-blossom viewing tea house nationwide continues,
In the warm cabin are crowded with many cherry-blossom viewers.",

"旬の食材にこだわった自信の会席料理や全館畳敷き、書院造りの客室（全15室）が創業130年老舗の風格を漂わす。露天風呂や檜、岩風呂など多彩な湯殿を揃えております。当館では｢苔玉つくり体験」が出来ます。
苔玉は見ているだけで癒されますし、育てているととても愛着がわいてきます。参加有無については当日確認しますのでご興味がある方はお気軽にお申しくださいませ。
おまちしております。",
"Confidence of confectionary cuisine sticking to seasonal ingredients and whole building tatami flooring,
The rooms of the Shoin style (15 rooms in all) are founded 130 years old traditional style. Outdoor bath and cypress,
We have a variety of spa baths including rock bath.You can make Moss ball making experience at our hotel.
Moss balls are healed only by watching, and attachment comes very much when raising.
Regarding participation, we will check on the day so if you are interested please do not hesitate to tell us.
I am waiting.",

"長野名物「せいろ」はコシがあるのは当然のうえ、噛むたびに鼻から抜ける蕎麦の香りがたまらない一品です。
他にもこの地ならではの旬の素材を生かしたお料理が、月替わりで彩ります。まごころを
込めたお料理の数々を心ゆくまでご堪能ください。",
"Nagano specialty 'Sairo' is a dish that is irresistibly fragrant of soba, which naturally escapes from the nose when chewing as well as having Kosi.
In addition to this, dishes that made use of the seasonal ingredients unique to this place will culminate on a monthly basis. Morning
Please enjoy the many dishes you have filled.",

"長野県にある別所温泉は、信州最古の温泉として地域の方から親しまれています。泉質は弱アルカリ性で、皮脂を溶かし古い角質層を軟化させることから肌が滑らかになると人気。適応症は、慢性皮膚病、
慢性婦人病、きりきず、糖尿病です。別所温泉には3か所の共同浴場、さらには健康温泉施設もあります。また、多くの旅館が営業していますので、自由時間にはのんびりと過ごす周辺にはそば屋をはじめ、食堂、
さらにはカフェなどがありますので、観光途中にランチやお買い物を楽しむこともできます。",
"Besso Onsen in Nagano Prefecture is familiar to local people as the oldest hot spring in Shinshu. Fountain quality is weakly alkaline,
It melts the sebum and softens the old stratum corneum, so it becomes popular if the skin becomes smooth. Indications include chronic skin diseases,
Chronic lady disease, nervous, diabetes.
There are three communal public baths in Bessho Onsen, and also healthy hot spring facilities.
Also, as many inns are open,
In the surroundings where you leisurely leisurely in the free time, you can start with a soba restaurant,
There are also cafes and so on, so you can enjoy lunch and shopping in the middle of sightseeing.",

"美ヶ原台上の共有放牧地です。小岩井品三郎氏が中心となり開設、平成20年に100周年を迎えました。三城（さんじろ）牧場から百曲りを登ると「登りついて不意に開けた眼前の風景にしばらくは世界の天上が抜けたかと思う」
と尾崎喜八翁の詩が示しているように、標高2,000ｍの台上に馬・牛が放牧された景色が広がります。",
"It is a shared pasture lodge on the Mikigahara stand. Mr. Shozaburo Koiwai was established as the center, celebrating its 100th anniversary in 2008.
As I climb a hundred turns from Sanjo (ranch) ranch, After a while I was unexpectedly opened the landscape in front of my eyes
As the poem by Ozaki Kihachi Okinaga says, on the platform of altitude 2,000 m
The scenery where horses and cows grazed spreads.",
"haru1.jpg","haru2.jpg","haru3.jpg","haru4.jpg","haru5.jpg");

insert into detail (tour_id,tour_name_ja,tour_name_en,tour_price,tour_category,
tour_detail_1_ja,tour_detail_1_en,tour_detail_2_ja,tour_detail_2_en,tour_detail_3_ja,tour_detail_3_en,tour_detail_4_ja,tour_detail_4_en,tour_detail_5_ja,tour_detail_5_en,
img_address001,img_address002,img_address003,img_address004,img_address005)

values(1,"お一人様沖縄ツアー","Okinawa summer tour",50000,1,
"公園の北端にY字型の突き出したコーラルサンドのエメラルドビーチは「遊びの浜」「憩いの浜」「眺めの浜」と3区分された砂浜は、ゆうに3000人が遊べます。
ビーチから徒歩一分の所にあるかき氷専門店「GOTO」には完熟マンゴーを贅沢に盛ったマンゴーかき氷や一般的なぜんざいとは一味違った「沖縄ぜんざい」をかき氷で楽しむことができます。
山盛りのかき氷の下に隠れているあずきが特徴の沖縄ぜんざいはあっさりとシンプルな味わいです。",
"Emerald beach of Y shape protruding coral sand at the northern end of the park
'Beach of play' 'Beach of rest' 'Beach of view'Three divided people can play 3000 people at once.
A shakushin specialty shop 'GOTO' located one minute on foot from the beach is full of ripe mangoes with luxurious mango shaved ice and
You can enjoy 'Okinawa Zenzai' which is a bit different from general Zenzai with shaved ice.
The Okinawa Zen zai which is characterized by azuki hiding under the shaved ice in the heap is a simple and simple taste.",

"沖縄県南風原町 宮平のひまわり畑では、昨年も大人気となったこの畑は花を、正面に緩やかな傾斜と
奥行きを持ち美しい景観を作るととも、細い小道がたくさん通っているので見頃になると間近でヒマワリを観察できるのが特徴です。
期間中には、スタンプラリーやフォトコンテストの募集などを行います。ひと夏の思い出に、スタンプラリーやフォトコンテストに応募してみてはどうですか。",
"In the sunflower field of Miyahei in Okinawa Prefecture, this field that became very popular last year has flowers, with gentle slope in front
It has a depth and makes a beautiful landscape, It is a characteristic that you can observe sunflowers at the nearby time as it is at the best time because many thin trails pass.
During the period, we will recruit stamp rallies and photo contests.Why do not you apply for stamp rally or photo contest for memories of a summer?",

"ビーチを楽しんだ後は「CAFE　OSA」のBBQ先進国アメリカが生み出した「WEBRT」社のグリルで焼く、本物のBBQをご用意しております。
定番の牛肉、豚肉、鶏肉、旬の野菜、鮮魚の丸焼きなどのコースを楽しめます。",
"After enjoying the beach, bake it at the grill of 'WEBRT' company which CAFE OSA 's developed BBQ developed country America produced,
We have genuine BBQ available.You can enjoy classic beef, pork, chicken, seasonal vegetables, roasted fresh fish and other courses.",

"ツアー初日の宿泊施設は「ルネッサンスリゾート オキナワ」です。全室オーシャンビューなだけでなく、1年中マリンアクティビティを
楽しむことができる高級リゾートホテルで、一番の魅力はラグーンでイルカとふれあうことができることです。
レストランやバーも充実していてまさに楽園のようなビーチリゾートです。客室の雰囲気はとても幻想的な演出がなされております。なんとこちらのお部屋の宿泊客は空港までリムジンで出迎えに来てくれます。",
"The accommodation facility on the first day of the tour is 'Renaissance Resort Okinawa'. All rooms are not only ocean view,
Marine activities throughout the year.
A luxury resort hotel that you can enjoy, the most attractive is that you can interact with dolphins at the lagoon.It is possible.
It is a beach resort like a paradise with plentiful restaurants and bars.The atmosphere of the room is very fantastically directed.
Guests in this room come to pick me up at the airport by limousine.",

"スキューバダイビングを始めた人が「人生観が変わった」という方がよくいらっしゃいます。抜けるほどのブルーの海の中にダイブし、愛嬌のある可愛らしい不思議な生物との遭遇や、
無重力の浮遊感を感じながら泳ぎ、色とりどりの魚達が現れ、ダイナミックな地形がダイバーを包んでくれる。
時にはド迫力で圧倒的な存在感を見せてくれる沈船、洞窟に差し込む光のシャワーや、自分たちがどれほど小さい生物なのかを、思い知らせてくれる大きなマンタやジンベエザメ。
これはスキューバダイビングを始めた人だけが感じることの出来る、極上のリラクゼーションです。そういう感動や楽しさ、癒しをスキューバダイビング体験で体験できます。",
"People who started scuba diving often have a 'life view changed'.
Dive into the blue sea that goes out, encounter with pretty magical creatures with charm,
Swimming while feeling weightless floating feeling, multicolored fish appear, dynamic terrain wraps the diver.
Sometimes it is a ship sailing to show us overwhelming presence with power, shower of light to insert into the cave and
, Big manta and whale shark that will let you know how small your creature is.
This is the finest relaxation that only people who started scuba diving can feel.
You can experience such excitement, pleasure and healing with scuba diving experience.",
"natu1.jpg","natu2.jpg","natu3.jpg","natu4.jpg","natu5.jpg");

insert into detail (tour_id,tour_name_ja,tour_name_en,tour_price,tour_category,
tour_detail_1_ja,tour_detail_1_en,tour_detail_2_ja,tour_detail_2_en,tour_detail_3_ja,tour_detail_3_en,tour_detail_4_ja,tour_detail_4_en,tour_detail_5_ja,tour_detail_5_en,
img_address001,img_address002,img_address003,img_address004,img_address005)

values(2,"お一人様滋賀ツアー","Shiga's autumn tour",50000,2,
"彦根城の北東にある池泉回遊式庭園。延宝5年(1677)、彦根藩4代藩主の井伊直興が琵琶湖の水を引き、唐の瀟湘[しょうしょう]八景を近江八景に置き換えて造営されたと。言われます。島や入江を配し
、鳳翔台では抹茶とお菓子で休憩しながら、その風景を楽しむことができます。
園内では紅葉が紅い枝を広げ、天守の白壁や、その他の木の緑を背景に、鮮やかさを際立たせています。",
"Located in the northeastern part of Hikone Castle, Ikeizumi Musume Garden. Yoshinobu 5 years (1677),
Naoko Ii of the Hikone clan's fourth generation lord pulls water from Lake Biwa and makes the eighth view of the Tang Dynasty
It was built by replacing it with Omi Hakkei. I will be told. We arrange islands and coves
In Fengshangtai while resting with matcha and sweets,You can enjoy the scenery.
Autumnal leaves spread the red branches in the garden, with the white walls of the castle and other green trees as background
, It emphasizes vividness.",

"滋賀県信楽陶苑たぬき村ではたくさんのたぬきが鎮座する絶好の写真スポットです。本館では売店や茶屋が並び、陶器有名作家個展が開かれております。
新刊では陶芸教室があり、電動ロクロコース、手びねりコース、絵付けコース、狸作りコースとお好みのコースを選んでいただきます。",
"Shiga prefecture Shigaraki pottery in Tanuki village is a great photo spot where many rows of raccoons are settled.
Shops and teahouses line up in the main building, and a famous pottery solo exhibition is held.
In the new publication there is a pottery classroom, electric rooks course, hand-rolling course, painting course, raccoon making course
And choose your favorite course.",

"彦根城主「井伊家」から井の字をいただいて「やす井」と名付けた料亭旅館 やす井は、おもてなしの心を大切に和み、くつろぎ、味わうことの喜びをお届けします。
冷たいものは冷たく、温かいものは温かく、一品一品吟味を重ね、琵琶湖の旬の素材をたっぷり使った季節の味をお楽しみ下さい。",
"Ryokan Ryokan Yasui, named 'Yui' after receiving the letter of the well from the Hikone castle 'Ii family'
We will rejoice in hospitality, deliver the joy of relaxing and tasting.
The cold one is cold, the warm one is warm,Please enjoy the seasonal taste with plenty of seasonal ingredients of Lake Biwa.",

"MIHO MUSEUMの見所の一つが、世界的に有名な超大物建築家I・M・ペイ（イオ・ミン・ペイ）が設計した美術館の造形です。
建築に詳しくなくても、ルーブル美術館のピラミッドを設計した人、と聞けば何となくそのすごさが分かると思います。",
"One of the highlights of MIHO MUSEUM is the world famous super-architect? It is a model of a museum designed by I ・ M ・ Pei (Io Min Pei).
Even if you are not familiar with architecture, those who designed pyramids of the Louvre museum,I think that you will understand its awesomeness if you ask.",

"高島市農業公園マキノピックランドは、果物狩りのできる果樹園です。今回はりんご、ぶどう、栗、さつま芋の複数の果物狩りが楽しめます。時間無制限で食べ放題でジュース等の加工品複数を
お土産を用意しております。地元農家の農産物の直売所や、ジェラートの製造販売所、グラウンドゴルフ場などを併設し、四季を通して楽しんで頂けます。
また、施設前には２.４ｋｍに渡って約５００本のメタセコイア並木道もあり四季を通じてご覧頂けます。果樹園の最新情報や、地域のイベントなどの情報もお知らせしています。",
"Takashima City Agricultural Park Makino Pickland is an orchard where you can hunt fruits.
This time, you can enjoy several fruit hunting of apple, grape, chestnut, sweet potato. With unlimited time, you can eat as many as you want in a processed product such as juice
We have souvenirs.
Local farmers' agricultural products direct selling places, gelato manufacturing shops, and ground golf courses are located, and you can enjoy them throughout the four seasons.
In addition, there are about 500 metasequoia tree-lined streets over 2.4 km before the facility and you can see through the four seasons.
We also inform you of the latest information on orchards and information on local events."
,"aki1.jpg","aki2.jpg","aki3.jpg","aki4.jpg","aki5.jpg");

insert into detail (tour_id,tour_name_ja,tour_name_en,tour_price,tour_category,
tour_detail_1_ja,tour_detail_1_en,tour_detail_2_ja,tour_detail_2_en,tour_detail_3_ja,tour_detail_3_en,tour_detail_4_ja,tour_detail_4_en,tour_detail_5_ja,tour_detail_5_en,
img_address001,img_address002,img_address003,img_address004,img_address005)

values(3,"お一人様秋田ツアー","Akita's winter tour",50000,3,
"みちのく五大雪まつりのひとつ「なまはげ柴灯(せど)まつり」は、秋田県男鹿市北浦(おがし きたうら)の
真山(しんざん)神社で行なわれる男鹿の冬を代表する冬祭りとして昭和39年に始まりました。この祭りは神事「柴灯祭(さいとうさい)」と民俗行事「なまはげ」を組み合わせた冬の観光行事です。
真山神社境内に焚き上げられた柴灯火のもとで繰り広げられる勇壮で迫力あるナマハゲの乱舞は見る人を魅了します。
「なまはげ」は年に一度、各家々を巡り、悪事に訓戒を与え、災禍を祓い、祝福を与えて去っていきます。「怠け者はいねが、泣ぐ子はいねが」と練り歩く姿はよくご存知かと思います。
この行事は昭和53年に「男鹿のナマハゲ」の名称で国の重要無形民俗文化財に指定されています。",
"One of the Michinoku Five Snow Festivals 'Namahage Shiba-no-Sato Festival' is a festival of Okashi Kita in Akita Prefecture
It began in 1964 as a winter festival representing the winter of Oga conducted at the Shinsan shrine.
This festival is a winter tourism event that combines a Shinto 'Shiba Sai' and a folk event 'Namahage'.It is a brave spirit that can be unfold under the Shiba lantern burned in the temple shrine's temple
Powerful Namahage's dandelion attracts viewers.
'Namahage' visits each house once a year, gives an admonition to wrongs, exhorts disaster, gives blessings and leaves.
I think that you are familiar with the figure that 'I'm lazy but I can not stop crying'.
This event was designated as an important intangible folk cultural asset of the country under the name of 'Oga no Omihage' in 1976."

,"みちのく五大雪まつりのひとつ「横手かまくら」は、およそ450年の伝統を誇る水神様をまつる小正月行事です。
かまくらの中では、子供たちが「はいってたんせ（かまくらに入ってください）」、「おがんでたんせ（水神様をおがんでください）」といいながら、あまえこ（甘酒）やお餅を振る舞います。祭り期間中、市内に100基ほどできるかまくらの中では、
甘酒やお餅などを食べながら、夜が更けるのも忘れて、“話っこ”に花が咲きます。",
"One of Michinoku 5 heavy snow festivals 'Yokote Kamakura' wears a god of water boasting the tradition of about 450 years
It is a small New Year event.In Kamakura, children are 'entering (Please enter Kumakura)',
While saying 'Odonikusanse (please prune the god of water)', we will act Amecho (sweet sake) and rice cake. During the festival, in the gimmick that can make about 100 in the city,
While eating sweet sake and rice cake, forget the night to get up, flowers bloom 'talk'."

,"秋田県乳頭温泉郷「鶴の湯温泉」は真っ白な濁り湯の底からぷくぷくと温泉が湧き上がる感動の露天風呂です。雪がとても美しいです。静かな夜の時間に入るとなお最高です。",
"Akita ken nippo hot-spring resort 'Tsuru no yu hot spring' springs hot springs from the bottom of pure white muddy hot springs
It is an impressive outdoor bath. Snow is very beautiful.Even if it enters a quiet night time it is still the best."

,"スキーを楽しんだ後は秋田の郷土料理が食べられる「ちゃわん屋」できりたんぽ鍋がいただけます。郷土料理のハタハタ寿し、横手やきそばを食べながら秋田の日本酒はいかがですか。",
"After having enjoyed skiing, you can eat Akita's local cuisine 'Cha-han shop'
receive. How about a Japanese sake in Akita while eating yakisaki soba with local cuisine served with sandalwood?"

,"子安スキー場は最大斜度44度の急斜面コースやパウダースノー100％の非圧雪地チャレンジコース、穏やかなファミリーゲレンデと全4コースとなります。上級　初級問わずお楽しみいただけます。
11月下旬から5月上旬までの長いシーズンと良質の雪質が自慢。近隣には温泉も多く、アフターの楽しみもたくさんあります。",
"Koyasu ski resort is a steep slope course with maximum slope of 44 degrees, a non-snowy ground challenge course with 100% powder snow,
It will be a calm family slope and a total of 4 courses. You can enjoy both beginner and advanced level.
Boasting a long season from late November to early May and good snow quality. There are many hot springs in the neighborhood,
There are lots of fun for after-sales.","huyu1.jpg","huyu2.jpg","huyu3.jpg","huyu4.jpg","huyu5.jpg");





create table credit(
  user_id int ,
  credit_type int ,
  credit_number varchar(16) ,
  name_e varchar(50) ,
  security_code varchar(4) ,
  expiration_month varchar(2) ,
  expiration_year varchar(4) ,
  payment_method int
);
