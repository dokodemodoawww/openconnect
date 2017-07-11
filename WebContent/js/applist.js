
/*画像スライドショー----------------------------------------------------*/

myImage = new Array(	// 画像ファイル名の設定
"img/social.jpg",		//街
"img/sky.jpg",		//気球と空
"img/drink.jpg",		//ビール
"img/sity.jpg",		//すまほ
"img/sunset.jpg",		//夕日
"img/candy.jpg"		//宇宙
);
myNowCnt = -1;		// 現在表示している配列番号
myflg = 0;		// どっちを表示して、どっちを消すかのフラグ
function myChange(){	// スライドショーメイン関数
	myNowCnt = (myNowCnt<myImage.length-1) ? myNowCnt+1 : 0;		// 次の配列番号
	myflg = (myflg==0) ? 1 : 0;						// 表示・非表示フラグ反転

	var windowWidth = $(window).width();
	var windowSm = 640;

	if (myflg == 0){
		document.getElementById("idshow1").src = myImage[myNowCnt];		// 次の画像をセットする
		document.getElementById("idshow1").className = "fadein";		// フェードイン
		document.getElementById("idshow2").className = "fadeout";	// フェードアウト
	}else{
		document.getElementById("idshow2").src = myImage[myNowCnt];		// 次の画像をセットする
		document.getElementById("idshow1").className = "fadeout";	// フェードアウト
		document.getElementById("idshow2").className = "fadein";		// フェードイン
	}
	setTimeout( "myChange()" , 5000 );					// 4秒周期に画像を更新する
}

/*画像スライドショーここまで---------------------------------------------*/

