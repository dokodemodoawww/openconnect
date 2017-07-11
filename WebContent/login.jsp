
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>

<html lang="ja">
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no" >
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">


<s:if test="%{#session.loginFlg != null}">
<meta http-equiv="refresh"content="0;url=applist.jsp">
</s:if>

<!-- 背景画像 -->
<style type="text/css">
<!--body {background: url(img/sity.jpg) center center / cover no-repeat fixed;}-->
</style>
<!-- ここまで -->
<title>Open Connect -ログイン</title>
<!-- css読み込み -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/login.css">
<!-- js読み込み -->
<script src="js/bootstrap.js"></script>
</head>
<body>
	<!-- ヘッダー
	<header>
		<nav class="navbar navbar-default navbar-static-top">
			<div class="left">
				<div class="navbar-header">
					<h1>
						<a href="index.jsp">Open Connect</a>
					</h1>
				</div>
			</div>
		</nav>
	</header>
	<!-- ヘッダーはここまで -->
					<h1 align="center">
						<a href="applist.jsp" class="square_btn35">Open Connect</a>
					</h1>
<br><br><br><br><br>
	<!------------------    ユーザーログイン    ------------------->
<s:if test="%{#session.userFlg == null}">
	<div class="box" align ="center">
	<table id= "main">
<tr align="center">
<td>
				<s:property value="%{resultString}" />
				<s:form theme="simple" id="inner" class="form-horizontal"
					action="LoginAction" autocomplete="off">
					<!------------------    メールアドレス    ------------------->
						<td><h3>メールアドレス</h3></td>
						<td><s:textfield name="phoneEmail"  value=""
						    placeholder="example@example.com" />
                        </td>
					<!------------------    パスワード    ------------------->
						<td><h3>パスワード</h3></td>
						<td><s:password  name="password" value="" />
						    <s:textfield type="hidden" name="userFlg" value="userFlg" />
                        </td>
					<!------------------    ログイン情報を送信    ------------------->
							<td><s:submit type="submit" value="ログイン" /></td>
				</s:form>
</td>
	</tr>
</table>
</div>
<!-- 新規登録ボタン
<BR><BR><BR><BR>
<div align="center">
<a href="GoRegisterAction" class="square_btn">新規登録はこちら</a>
</div>
 -->
</s:if>
</body>
</html>