<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>botくんに言葉を教える</title>
	<!-- Stylesheet
    ================================================== -->
	<link rel="stylesheet" href="css/bootstrap.css" />
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" href="css/Bfooter.css">


	<!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
var submit = document.getElementByClassName('submit');
function disableSubmit(button) {
  setTimeout(function() {
    button.disabled = true;
  }, 10);
  setTimeout(function() {
    button.disabled = false;
  }, 1000);
}

</script>
</head>
<body>
<header><jsp:include page="botHeader.jsp" /></header>


<div class="container">
  <div class="row">
    <div class="col-sm-1 visible-lg-block"></div>

    <div class="col-sm-10">
    	<div class = "outline">
<br>
<h3><span class="glyphicon glyphicon-pencil"></span>botくんに言葉を覚えさせよう</h3>
<br>
<s:form action="BotExerciseAction" name="test">
  <div class="form-group">
    <label>どんな言葉を覚えさせるかの要約（50文字以内。重複NG）</label>
    <input type="text" class="form-control" maxlength="50" name="label" required>
  </div>
  <div class="form-group">
<label>テキストファイルがある場合は読み込みができます</label>
<input type="file" id="selfile">
</div>
  <div class="form-group">
    <label>覚えさせる文章（4000字以内。単語じゃなくて文章で教えてね）</label>
    <textarea name="sentence" class="form-control" rows="10" cols="80%" id="sendContents" required maxlength="4000"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" onclick="disableSubmit(this);">送信</button>
</s:form>
<script>
var obj1 = document.getElementById("selfile");

//ダイアログでファイルが選択された時
obj1.addEventListener("change",function(evt){

  var file = evt.target.files;

  //FileReaderの作成
  var reader = new FileReader();
  //テキスト形式で読み込む
  reader.readAsText(file[0]);

  //読込終了後の処理
  reader.onload = function(ev){
    //テキストエリアに表示する
    document.test.sentence.value = reader.result;
  }
},false);
</script>
</div>
</div>
    <div class="col-sm-1 visible-lg-block"></div>
</div>
</div>
</body>
</html>