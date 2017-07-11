<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.8, user-scalable=no" >
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<!-- css読み込み -->
<link rel="stylesheet" href="css/register.css" type="text/css">
<!-- js読み込み -->
<%-- <script src="//code.jquery.com/jquery-2.1.0.min.js"></script> --%>
<%-- <script src="//jpostal-1006.appspot.com/jquery.jpostal.js"></script> --%>
<%-- <script src="js/register.js"></script> --%>
<script src="js/footerFixed.js" type="text/javascript"></script>

<script src="js/ajaxzip3.js" charset="UTF-8"></script>


<title>新規登録</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div align="center">


		<br> <br>
		<h1>新規登録</h1>
		<s:form action="RegisterAction">

			<s:if test="errorMsg != null">
				<div class="error">
					<s:property value="errorMsg" />
				</div>
			</s:if>
			<table>

				<!------------------    名前(漢字)    ------------------->
				<tr>
					<th style="white-space: nowrap;">名前（漢字）</th>
					<td><input type="text" name="familyNameKanji" value=""
						placeholder="苗字" maxlength="24" required /> <input type="text"
						name="givenNameKanji" value="" placeholder="名前" maxlength="25"
						required /></td>
				</tr>

				<!------------------    名前(ふりがな)    ------------------->
				<tr>
					<th style="white-space: nowrap;">名前（ふりがな）</th>
					<td><input type="text" name="familyNameKana" value=""
						placeholder="みょうじ" maxlength="24" required /> <input type="text"
						name="givenNameKana" value="" placeholder="なまえ" maxlength="25"
						required /></td>
				</tr>


				<!------------------    メールアドレス    ------------------->
				<tr>
					<th style="white-space: nowrap;">メールアドレス</th>
					<td><input type="text" name="email"
						pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
						required title="example@gmail.com" placeholder="example@gmail.com" /></td>
				</tr>


				<!------------------    受講年    ------------------->
				<tr>
					<th style="white-space: nowrap;">受講年</th>
					<td><input type="text" name="year" pattern="([1-2][0-9]{3})"
						maxlength="4" required title="2016" placeholder="2016" /></td>
				</tr>

				<!------------------    受講年    ------------------->
				<tr>
					<th style="white-space: nowrap;">受講開始月</th>
					<td><input type="text" name="month" pattern="([0-1][0-9])"
						maxlength="2" required title="08" placeholder="08" /></td>
				</tr>

				<!------------------    パスワード    ------------------->
				<tr>
					<th style="white-space: nowrap;">パスワード</th>
					<td><input type="password" name="password" value="" size=50
						maxlength=16 required placeholder="８～１６文字の半角英数字で入力してください"
						pattern="^([a-zA-Z0-9]{8,})+$" title="８～１６文字の半角英数字で入力してください" /></td>
				</tr>

				<!------------------    パスワード確認    ------------------->
				<tr>
					<th style="white-space: nowrap;">パスワード確認</th>
					<td><input type="password" name="passwordCheck" value=""
						size=50 maxlength=16 required placeholder="８～１６文字の半角英数字で入力してください"
						pattern="^([a-zA-Z0-9]{8,})+$" title="８～１６文字の半角英数字で入力してください" /></td>
				</tr>




			</table>
			<!------------------    新規登録情報　送信ボタン    ------------------->
			<td><input id="postBtn" type="submit" value="送信"></td>
			<br>
			<br>
			<!------------------    リセットボタン    ------------------->
			<td><input type="reset" value="リセット"></td>
		</s:form>
		<br>
		<s:form action="GetAddressAction">
			<button type="submit" class="button">戻る</button>
		</s:form>
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>