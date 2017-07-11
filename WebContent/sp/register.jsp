<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<!-- css読み込み -->
<link rel="stylesheet" href="css/register.css" type="text/css">
<!-- js読み込み -->
<%-- <script src="//code.jquery.com/jquery-2.1.0.min.js"></script> --%>
<%-- <script src="//jpostal-1006.appspot.com/jquery.jpostal.js"></script> --%>
<%-- <script src="js/register.js"></script> --%>

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
					<th>名前（漢字）</th>
					<td><input type="text" name="familyNameKanji" value=""
						placeholder="苗字" maxlength="24" required /> <input type="text"
						name="givenNameKanji" value="" placeholder="名前" maxlength="25"
						required /></td>
				</tr>

				<!------------------    名前(ふりがな)    ------------------->
				<tr>
					<th>名前（ふりがな）</th>
					<td><input type="text" name="familyNameKana" value=""
						placeholder="みょうじ" maxlength="24" required /> <input type="text"
						name="givenNameKana" value="" placeholder="なまえ" maxlength="25"
						required /></td>
				</tr>
				<!------------------    名前(英語)    ------------------->
				<tr>
					<th>名前（英語）</th>
					<td><input type="text" name="familyName" value=""
						placeholder="Family Name" maxlength="24" required /> <input
						type="text" name="givenName" value="" placeholder="Given Name"
						maxlength="25" required /></td>
				</tr>

				<!------------------    郵便番号    ------------------->
				<tr>
					<th>郵便番号</th>
					<td><input type="text" name="zip" size="10" maxlength="7"
						placeholder="1000000"
						onKeyUp="AjaxZip3.zip2addr(this,'','address','address');">
						<!-- 					<input type="text" name="postal" id="postcode1" --> <!-- 						placeholder="半角数字で入力してください" maxlength=3 required -->
						<!-- 						title="半角数字で入力してください"> -<input type="text" name="postal" -->
						<!-- 						id="postcode2" placeholder="半角数字で入力してください" maxlength=4 required -->
						<!-- 						title="半角数字で入力してください"> --></td>
				</tr>

				<!------------------    住所    ------------------->
				<tr>
					<th>住所</th>
					<td><input type="text" name="address" id="address1"
						maxlength="60" required placeholder="住所" size="60"> <!-- 						 <input -->
						<!-- 						type="text" name="municipality" id="address2" maxlength="15" required -->
						<!-- 						placeholder="市区町村"> <input type="text" name="address" id="address3" -->
						<!-- 						maxlength="15" required placeholder="番地" /> <input type="text" -->
						<!-- 						name="address" maxlength="20" placeholder="建物名等" /> -->
					</td>
				</tr>

				<!------------------    電話番号    ------------------->
				<tr>
					<th>電話番号</th>
					<td><input type="text" name="telNumber" value="" size="20"
						maxlength=11 pattern="^[0-9]+$" required title="半角数字で入力してください"
						placeholder="0312345678" /> <!-- 						- --> <!-- 						<input type="text" name="telNumber" value="" size="4" maxlength=4 -->
						<!-- 						pattern="^[0-9]+$" required title="半角数字で入力してください" />- <input -->
						<!-- 						type="text" name="telNumber" value="" size="4" maxlength=4 -->
						<!-- 						pattern="^[0-9]+$" required title="半角数字で入力してください" /> -->
					</td>
				</tr>

				<!------------------    携帯電話番号    ------------------->
				<tr>
					<th>携帯電話番号</th>
					<td><input type="text" name="mobileNumber" value="" size="20"
						maxlength=11 pattern="^[0-9]+$" required title="半角数字で入力してください"
						placeholder="09012345678" /> <!-- 						- --> <!-- 						<input type="text" name="mobileNumber" value="" size="4" maxlength=4 -->
						<!-- 						pattern="^[0-9]+$" required title="半角数字で入力してください" />- <input -->
						<!-- 						type="text" name="mobileNumber" value="" size="4" maxlength=4 -->
						<!-- 						pattern="^[0-9]+$" required title="半角数字で入力してください" /> -->
					</td>
				</tr>

				<!------------------    メールアドレス    ------------------->
				<tr>
					<th>メールアドレス</th>
					<td><input type="text" name="email"
						pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
						required title="example@gmail.com" placeholder="example@gmail.com" /></td>
				</tr>

				<!------------------    携帯メールアドレス    ------------------->
				<tr>
					<th>携帯メールアドレス</th>
					<td><input type="text" name="mobileEmail"
						pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="50"
						required title="example@ezweb.ne.jp"
						placeholder="example@ezweb.ne.jp" /></td>
				</tr>

				<!------------------    性別    ------------------->
				<tr>
					<th>性別</th>
					<td><input type="radio" name="sex" value="male" checked />男性
						<input type="radio" name="sex" value="female" />女性</td>
				</tr>

				<!------------------    生年月日    ------------------->
				<tr>
					<th>生年月日</th>
					<td><input type="date" name="birthday" pattern="^[0-9]{8,8}"
						title="例(1997年8月23日生まれの場合)：19970823" required placeholder="生年月日" />
				</tr>

				<!------------------    受講年    ------------------->
				<tr>
					<th>受講年</th>
					<td><input type="text" name="year" pattern="([1-2][0-9]{3})"
						maxlength="4" required title="2016" placeholder="2016" /></td>
				</tr>

				<!------------------    受講年    ------------------->
				<tr>
					<th>受講開始月</th>
					<td><input type="text" name="month" pattern="([0-1][0-9])"
						maxlength="2" required title="08" placeholder="08" /></td>
				</tr>

				<!------------------    パスワード    ------------------->
				<tr>
					<th>パスワード</th>
					<td><input type="password" name="password" value="" size=50
						maxlength=16 required placeholder="８～１６文字の半角英数字で入力してください"
						pattern="^([a-zA-Z0-9]{8,})+$" title="８～１６文字の半角英数字で入力してください" /></td>
				</tr>

				<!------------------    パスワード確認    ------------------->
				<tr>
					<th>パスワード確認</th>
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



</body>
</html>