<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/web_speech.css" rel="stylesheet">
</head>
<body>

<p style="font-weight:700;"></p>
<input id="text1" type="text" value="" placeholder="ここに入力された文字を読み上げます。"/><br>
<br>
<input id="btn3" type="button" value="speech" style="width:200px;"/>
<select id="selectVoice">
    <option value="ja-JP">日本語</option>
    <option value="en-US">English</option>
</select>

<script src="js/web_speech.js"></script>
</body>
</html>



