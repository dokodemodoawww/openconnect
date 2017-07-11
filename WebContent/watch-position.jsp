<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>

		<meta name="robots" content="noindex,nofollow">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/geolocation-api.css" rel="stylesheet">


<title>マップ</title>
</head>



<body>


<hr style = "margin:3em 0;">
<h2>データを取得しました。</h2>
<dl id = "result"></dl>

<h2>地図</h2>
<p>現在地です</p>
<div class ="map-wrapper">
<div id = "map-canvas"></div>
</div>

<hr style = "margin:3em 0;">

<!-- APIキーが不足しているため、現在マップが使用できません。 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3DBf9du1fmMUqQf7Z0TrApXFjAWPh2J0"></script>
<script src="js/watch-position.js"></script>

</body>
</html>