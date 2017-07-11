/**
 *
 */


var watchId = navigator.geolocation.watchPosition( successFunc , errorFunc , optionObj ) ;
navigator.geolocation.clearWatch( watchId ) ;

var syncerWatchPosition = {
		count:0,
		lastTime:0,
		map:null,
		marker:null,
};


	//成功時の関数
function successFunc(position){
	//データの更新
	++syncerWatchPosition.count;  //処理の回数
	var nowTime = ~~(new Date() /1000);

	if((syncerWatchPosition.lastTime +3) > nowTime){
		return false;
	}


	//前回の時間を更新
	syncerWatchPosition.lastTime = nowTime;

	document.getElementById('result').innerHTML =
	'<dt>緯度</dt><dd>'+ position.coords.latitude +
	'</dd><dt>経度</dt><dd>'+ position.coords.longitude +
	'</dd><dt>高度</dt><dd>'+ position.coords.altitude +
	'</dd><dt>速度</dt><dd>'+ position.coords.speed +
	'</dd><dt>実行回数</dt><dd>'+ syncerWatchPosition.count + '回</dd>';

	//位置情報
	var latlng = new google.maps.LatLng( position.coords.latitude,position.coords.longitude );

	//goolgeMapに書き出し
	if(syncerWatchPosition.map == null){
	//地図の新規出力
		syncerWatchPosition.map = new google.maps.Map(document.getElementById('map-canvas'),{
			zoom:15,
			center:latlng,
		});

		syncerWatchPosition.marker = new google.maps.Marker( {
			map: syncerWatchPosition.map ,
			position: latlng ,
		} ) ;


	}else{
	//地図の中心を変更
		syncerWatchPosition.map.setCenter( latlng );
	//マーカーの場所を変更
		syncerWatchPosition.marker.setPosition( latlng );
	}
}

	//失敗したときの関数
function errorFunc(error){
	var errorMessage = {
			0:"原因不明のエラー",
			1:"位置情報が取得できませんでした",
			2:"電波状況が不安定です",
			3:"タイムアウト",
	};

	//エラーコードに合わせたエラーメッセージを表示
	alert(errorMessage[error.code]);
}

	//オプション・オブジェクト
var optionObj = {
		"enableHighAccuracy":false,
		"timeout":1000000,
		"maximumAge":0,
};

	//現在地を取得する
navigator.geolocation.watchPosition( successFunc,errorFunc,optionObj );


