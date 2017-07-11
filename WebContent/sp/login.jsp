<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>Open Connect -ログイン</title>
<!-- css読み込み -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/login.css">
<!-- js読み込み -->
<script src="js/bootstrap.js"></script>
</head>
<body>

	<!-- ヘッダー -->
	<header>
		<nav class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<h1>
						<a href="index.jsp">Open Connect</a>
					</h1>
				</div>
			</div>
		</nav>
	</header>
	<!-- ヘッダーはここまで -->

	<!------------------    ユーザーログイン    ------------------->

	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<s:property value="%{resultString}" />

				<s:form theme="simple" id="inner" class="form-horizontal"
					action="LoginAction" autocomplete="off">
					<!------------------    メールアドレス    ------------------->
						<div class="stringWidth">メールアドレス</div>
						<s:textfield class="textWidth" name="email"  value="" placeholder="example@example.com" />
						<br>
						<br>

					<!------------------    パスワード    ------------------->
						<div class="stringWidth">パスワード</div>
						<s:password class="textWidth" name="password" value="" />

						<s:textfield type="hidden" name="userFlg" value="userFlg" />
						<br>
						<br>
					<!------------------    ログイン情報を送信    ------------------->
						<div>
							<s:submit type="submit" value="ログイン" />

						</div>
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>