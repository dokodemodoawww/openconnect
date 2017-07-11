<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=no">
<title>受講生一覧</title>
<link rel="stylesheet" href="css/students.css">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/students.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="header.jsp" />


	<div class="container">
		<div class="title" align="center">
			<h1>受講生一覧</h1>
		</div>
		<br> <br> <br> <br>

		<%-- <s:if test="%{#session.userFlg >= 1}"> --%>


		<div class="inner">

			<h3>受講開始年月から検索</h3>

			<s:form action="StudentsSearchAction">

				<tr>
					<th>受講年</th>
					<td><input type="text" name="year" pattern="([1-2][0-9]{3})"
						maxlength="4" required title="2016" placeholder="2016" /></td>
				</tr>


				<tr>
					<th>受講開始月</th>
					<td><input type="text" name="month" pattern="([0-1][0-9])"
						maxlength="2" required title="08" placeholder="08" /></td>
				</tr>
				<td><input id="postBtn" type="submit" value="検索"></td>
			</s:form>
		</div>


		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
		<s:property value="%{resultString}" />
		<s:property value="%{resultSelect}" />

		<br>
		<div class="table">
			<s:if test="%{studentsList.size() >0}">
				<table border="1" class="table table-striped" align="center">

					<tr class="info">
						<th><div class="verysmallWidth">ID</div></th>
						<th><div class="bigWidth">ユーザー名</div></th>
						<th><div class="bigWidth">チーム名</div></th>


						<!-- 	<s:if test="%{#session.userFlg == 3}">-->
						<th><div class="bigWidth">ユーザー種別</div></th>
						<th><div class="verysmallWidth">編集</div></th>

						<!--  	</s:if>-->
					</tr>
					<s:iterator value="studentsList">
						<s:if test="%{userdelFlg==false}">
							<s:if test="%{userFlg==1}">
								<tr class="success">
							</s:if>
							<s:if test="%{userFlg==2}">
								<tr class="warning">
							</s:if>
							<s:if test="%{userFlg==3}">
								<tr class="danger">
							</s:if>
							<td><div class="verysmallWidth">
									<s:property value="userId" />
								</div></td>
							<td><div class="bigWidth">
									<input type="text" name="familyNameKanjiList"
										value="<s:property value="familyNameKanji" />"
										class="familyNameKanji maxText" maxlength="20" required>
									<input type="text" name="familyNameKanaList"
										value="<s:property value="familyNameKana" />"
										class="familyNameKana maxText" maxlength="20" required>
									<input type="text" name="givenNameKanjiList"
										value="<s:property value="givenNameKanji" />"
										class="givenNameKanji maxText" maxlength="20" required>
									<input type="text" name="givenNameKanaList"
										value="<s:property value="givenNameKana" />"
										class="givenNameKana maxText" maxlength="20" required>
								</div></td>


							<td><div class="bigWidth">
									<input type="text" name="teamNameList"
										value="<s:property value="teamName" />"
										class="teamName maxText" maxlength="20" required>
								</div></td>


							<!-- 	<s:if test="%{#session.userFlg == 3}">-->

							<td><s:if test="%{userFlg==1}">
									<select name="userFlg" class="userFlg maxText">
										<option value="1" selected>メンバー</option>
										<option value="2">リーダー</option>
										<option value="3">管理者</option>
									</select>
								</s:if> <s:elseif test="%{userFlg==2}">
									<select name="userFlg" class="userFlg maxText">
										<option value="1">メンバー</option>
										<option value="2" selected>リーダー</option>
										<option value="3">管理者</option>
									</select>
								</s:elseif> <s:else>
									<select name="userFlg" class="userFlg maxText">
										<option value="1">メンバー</option>
										<option value="2">リーダー</option>
										<option value="3" selected>管理者</option>
									</select>
								</s:else></td>

							<td><input type="button" class="button modal-update"
								value="編集"></td>

							<!-- </s:if> -->

							<input type="hidden" name="userIdList"
								value="<s:property value="userId" />" class="userId">
						</s:if>
					</s:iterator>
				</table>
			</s:if>

			<div id="modal-updateMain" style="text-align:center;">

				<br> ユーザー名:
				<div class="updateFamilyName modalString"></div>
				<div class="updateGivenName modalString"></div>
				<br> ふりがな:
				<div class="updateFamilyNameKana modalString"></div>
				<div class="updateGivenNameKana modalString"></div>

				<br> チーム名:
				<div class="updateteamName modalString"></div>
				<br>ユーザー種別:
				<div class="updateUserFlg modalString"></div>
				<br> <br> 上記のとおりに編集を行います。
				<s:form action="StudentsUpdateAction">
					<input type="hidden" name="userId" class="updateUserId" value="">

					<input type="hidden" name="familyNameKanji"
						class="updateFamilyNameKanji" value="familyNameKanji">
						<input type="hidden" name="familyNameKana"
						class="updateFamilyNameKana" value="familyNameKana">


					<input type="hidden" name="givenNameKanji"
						class="updateGivenNameKanji" value="givenNameKanji">
						<input type="hidden" name="givenNameKana"
						class="updateGivenNameKana" value="givenNameKana">
					<input type="hidden" name="teamName" class="updateteamName"
						value="">
					<input type="hidden" name="userFlg" class="updateUserFlg" value="">

<div class="button-box" style="text-align:center;margin-top:20px;">
					<input type="submit" class="delete-true button" value="はい">
					</div>
				</s:form>
<div class="button-box" style="text-align:center;margin-top:10px;">
				<input type="button" class="modal-close button" value="いいえ">
				</div>
			</div>


			<br> <br>
			<%-- </s:if> --%>
			<%-- <s:else>
		ログイン後に表示します。
		</s:else> --%>
			<div class="alldel">
				<s:if test="%{#session.userFlg == 3}">
					<s:form action="StudentsDeleteAction2">
						<h5>卒業生を非表示（受講開始月を入力）</h5>
						<td><input type="text" name="month" pattern="([0-1][0-9])"
							maxlength="2" required title="08" placeholder="08" /></td>
						<td><input id="postBtn" type="submit" value="非表示"
							onClick='return confirm("本当に非表示にしますか？")'></td>
					</s:form>
				</s:if>
				<br> <br> <br>
			</div>
			<div class="back">
				<s:form action="GetAddressAction">
					<button type="submit" class="button">戻る</button>
				</s:form>
			</div>
		</div>
		<br>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>