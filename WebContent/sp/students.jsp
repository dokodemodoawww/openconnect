<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>受講生一覧</title>
<link rel="stylesheet" href="css/students.css">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/students.js"></script>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="container">

		<h1>受講生一覧</h1>

		<s:if test="%{#session.userFlg >= 1}">

			<s:form action="StudentsSelectAction">
	英語で姓か名を入力<br>
				<input type="text" name="searchString" pattern="[A-Za-z]*"
					maxlength="30" title="半角英語のみ" placeholder="例：taro">
				<input class="button" type="submit" value="検索">
			</s:form>
			<br>
			<s:property value="%{resultString}" />
			<s:property value="%{resultSelect}" />
			<br>
			<s:if test="%{studentsList.size() > 0}">

				<table border="1">
					<tr>

						<th><div class="smallWidth">ID</div></th>
						<th><div class="smallWidth">受講年</div></th>
						<th><div class="bigWidth">受講開始月</div></th>
						<th><div class="smallWidth">姓(英語)</div></th>
						<th><div class="smallWidth">名(英語)</div></th>
						<th><div class="smallWidth">姓(漢字)</div></th>
						<th><div class="bigWidth">姓(ふりがな)</div></th>
						<th><div class="smallWidth">名(漢字)</div></th>
						<th><div class="bigWidth">名(ふりがな)</div></th>
						<s:if test="%{#session.userFlg == 3}">
							<th><div class="bigWidth">郵便番号</div></th>
							<th><div class="bigWidth">住所</div></th>
							<th><div class="bigWidth">電話番号</div></th>
							<th><div class="bigWidth">メールアドレス</div></th>
							<th><div class="bigWidth">携帯電話番号</div></th>
							<th><div class="largeWidth">携帯メールアドレス</div></th>
							<th><div class="smallWidth">性別</div></th>
							<th><div class="bigWidth">誕生日</div></th>
							<th><div class="largeWidth">登録日</div></th>
							<th><div class="largeWidth">更新日</div></th>
							<th><div class="bigWidth">在籍状況</div></th>
							<th><div class="bigWidth">ログイン状況</div></th>
							<th><div class="bigWidth">ユーザー種別</div></th>
							<th><div class="bigWidth">パスワード</div></th>
							<th><div class="smallWidth">編集</div></th>
							<th><div class="smallWidth">削除</div></th>
						</s:if>
					</tr>

					<s:iterator value="studentsList">

						<tr>
							<td><s:property value="userId" /></td>
							<td><input type="text" name="yearList"
								value="<s:property value="year" />" placeholder="例：2016"
								class="year maxText" pattern="[0-3]([0-9]{3})" title="半角数字4桁"
								maxlength="4" required></td>
							<td><input type="text" name="monthList"
								value="<s:property value="month" />" placeholder="例：08"
								class="month maxText" pattern="[0-1][0-9]" title="半角数字2桁"
								maxlength="2" required></td>
							<td><input type="text" name="familyNameList"
								value="<s:property value="familyName" />"
								class="familyName maxText" pattern="^[0-9A-Za-z]+$"
								title="半角英数字20文字以内" maxlength="20" required></td>
							<td><input type="text" name="givenNameList"
								value="<s:property value="givenName" />"
								class="givenName maxText" pattern="^[0-9A-Za-z]+$"
								title="半角英数字20文字以内" maxlength="20" required></td>
							<td><input type="text" name="familyNameKanjiList"
								value="<s:property value="familyNameKanji" />"
								class="familyNameKanji maxText" maxlength="20" required></td>
							<td><input type="text" name="familyNameKanaList"
								value="<s:property value="familyNameKana" />"
								class="familyNameKana maxText" maxlength="20"></td>
							<td><input type="text" name="givenNameKanjiList"
								value="<s:property value="givenNameKanji" />"
								class="givenNameKanji maxText" maxlength="20" required></td>
							<td><input type="text" name="givenNameKanaList"
								value="<s:property value="givenNameKana" />"
								class="givenNameKana maxText" maxlength="20"></td>
							<s:if test="%{#session.userFlg == 3}">
								<td><input type="text" name="postalList"
									value="<s:property value="postal" />" placeholder="半角数字7桁"
									class="postal maxText" pattern="[0-9]*" title="ハイフン無しで半角数字7桁"
									maxlength="7"></td>
								<td><input type="text" name="addressList"
									value="<s:property value="address" />" class="address maxText"
									maxlength="100"></td>
								<td><input type="text" name="phoneNumberList"
									value="<s:property value="phoneNumber" />" placeholder="半角数字"
									class="phoneNumber maxText" pattern="[0-9]*"
									title="ハイフン無しで半角数字20文字以内" maxlength="20"></td>
								<td><input type="text" name="phoneEmailList"
									value="<s:property value="phoneEmail" />"
									placeholder="例：example@gmail.com" class="phoneEmail maxText"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
									title="example@gmail.comなど" maxlength="100" required></td>
								<td><input type="text" name="mobileNumberList"
									value="<s:property value="mobileNumber" />" placeholder="半角数字"
									class="mobileNumber maxText" pattern="[0-9]*"
									title="ハイフン無しで半角数字20文字以内" maxlength="20"></td>
								<td><input type="text" name="mobileEmailList"
									value="<s:property value="mobileEmail" />"
									placeholder="例：example@gmail.com" class="mobileEmail maxText"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
									title="example@gmail.comなど" maxlength="100"></td>
								<td><input type="text" name="sexList"
									value="<s:property value="sex" />" placeholder="男or女"
									class="sex maxText" pattern="[男女]+$" title="男か女" maxlength="3"
									required></td>
								<td><input type="text" name="birthdayList"
									value="<s:property value="birthday" />"
									placeholder="例：2016/08/01" class="birthday maxText"
									pattern="([0-2][0-9]{3})\/([0-1][0-9])\/([0-3][0-9])"
									title="yyyy/MM/dd" maxlength="10"></td>
								<td><s:property value="registerDay" /></td>
								<td><s:property value="updateDay" /></td>
								<td><s:if test="%{userdelFlg==0}">
										<select name="userdelFlg" class="userdelFlg maxText">
											<option value="TRUE">在籍中</option>
											<option value="FALSE" selected>卒業済</option>
										</select>
									</s:if> <s:else>
										<select name="userdelFlg" class="userdelFlg maxText">
											<option value="TRUE" selected>在籍中</option>
											<option value="FALSE">卒業済</option>
										</select>
									</s:else></td>
								<td><s:if test="%{loginFlg==0}">
										<div class="bigWidth">未ログイン</div>
									</s:if> <s:else>
										<div class="bigWidth">ログイン中</div>
									</s:else></td>

								<td><s:if test="%{userFlg==1}">
										<select name="userFlg" class="userFlg maxText">
											<option value="1" selected>生徒</option>
											<option value="2">リーダー</option>
											<option value="3">講師</option>
										</select>
									</s:if> <s:elseif test="%{userFlg==2}">
										<select name="userFlg" class="userFlg maxText">
											<option value="1">生徒</option>
											<option value="2" selected>リーダー</option>
											<option value="3">講師</option>
										</select>
									</s:elseif> <s:else>
										<select name="userFlg" class="userFlg maxText">
											<option value="1">生徒</option>
											<option value="2">リーダー</option>
											<option value="3" selected>講師</option>
										</select>
									</s:else></td>
								<td><input type="password" name="passwordList"
									value="<s:property value="password" />"
									class="password maxText" pattern="^([0-9A-Za-z]{8,})"
									title="半角英数字8文字以上20文字以内" maxlength="20" required></td>
								<td><input type="button" class="button modal-update"
									value="編集"></td>
								<td><input type="button" class="button modal-delete"
									value="削除"></td>
							</s:if>
						</tr>
						<input type="hidden" name="userIdList"
							value="<s:property value="userId" />" class="userId">
					</s:iterator>
				</table>
			</s:if>
			<div id="modal-deleteMain">
				id ：
				<div class="deleteUserId modalString"></div>
				<br> 受講年 ：
				<div class="deleteYear modalString"></div>
				<br> 受講開始月 ：
				<div class="deleteMonth modalString"></div>
				<br> 姓 ：
				<div class="deleteFamilyName modalString"></div>
				<br> 名 ：
				<div class="deleteGivenName modalString"></div>
				<br> <input type="button" class="delete-true button" value="削除">
				<input type="button" class="modal-close button" value="閉じる">

				<div class="delete-prepare">
					本当に削除しますか？
					<s:form action="StudentsDeleteAction">
						<input type="hidden" name="userId" value=""
							class="deleteUserId delete-true">
						<input type="submit" class="delete-true button" value="はい">
						<input type="button" class="modal-close button" value="いいえ">
					</s:form>
				</div>
			</div>

			<div id="modal-updateMain">
				id ：
				<div class="updateUserId modalString"></div>
				<br> 受講年 ：
				<div class="updateYear modalString"></div>
				<br> 受講開始月 ：
				<div class="updateMonth modalString"></div>
				<br> 姓 ：
				<div class="updateFamilyName modalString"></div>
				<br> 名 ：
				<div class="updateGivenName modalString"></div>
				<br> <br> 上記の受講生の編集を行います。
				<s:form action="StudentsUpdateAction">
					<input type="hidden" name="userId" class="updateUserId" value="">
					<input type="hidden" name="year" class="updateYear" value="">
					<input type="hidden" name="month" class="updateMonth" value="">
					<input type="hidden" name="familyName" class="updateFamilyName"
						value="">
					<input type="hidden" name="givenName" class="updateGivenName"
						value="">
					<input type="hidden" name="familyNameKanji"
						class="updateFamilyNameKanji" value="">
					<input type="hidden" name="familyNameKana"
						class="updateFamilyNameKana" value="">
					<input type="hidden" name="givenNameKanji"
						class="updateGivenNameKanji" value="">
					<input type="hidden" name="givenNameKana"
						class="updateGivenNameKana" value="">
					<input type="hidden" name="postal" class="updatePostal" value="">
					<input type="hidden" name="address" class="updateAddress" value="">
					<input type="hidden" name="phoneNumber" class="updatePhoneNumber"
						value="">
					<input type="hidden" name="phoneEmail" class="updatePhoneEmail"
						value="">
					<input type="hidden" name="mobileNumber" class="updateMobileNumber"
						value="">
					<input type="hidden" name="mobileEmail" class="updateMobileEmail"
						value="">
					<input type="hidden" name="sex" class="updateSex" value="">
					<input type="hidden" name="birthday" class="updateBirthday"
						value="">
					<input type="hidden" name="userdelFlg" class="updateUserdelFlg"
						value="">
					<input type="hidden" name="loginFlg" class="updateLoginFlg"
						value="">
					<input type="hidden" name="userFlg" class="updateUserFlg" value="">
					<input type="hidden" name="password" class="updatePassword"
						value="">

					<input type="submit" class="delete-true button" value="編集">
				</s:form>

				<input type="button" class="modal-close button" value="閉じる">
			</div>

			<%-- <s:if test="%{#session.userFlg == 3}"> --%>
			<!-- <h2>新規受講生追加</h2> -->
			<%--  <s:form action="StudentsInsertAction" > --%>
			<!--  	<table border=1> -->
			<!--  	<tr> -->
			<!--  	<td>受講年</td> -->
			<!--  	<td>受講開始月</td> -->
			<!--  	<td>姓(英語)</td> -->
			<!--  	<td>名(英語)</td> -->
			<!--  	<td>姓(漢字)</td> -->
			<!--  	<td>名(漢字)</td> -->
			<!--  	<td>メールアドレス</td> -->
			<!--  	<td>性別</td> -->
			<!--  	<td>ユーザーフラグ</td> -->
			<!--  	<td>パスワード</td> -->
			<!--  	</tr> -->
			<!--  	<tr> -->
			<!--       <td><input type="text" name="year" placeholder="例：2016" pattern="([0-3][0-9][0-9][0-9])" title="半角数字4文字" maxlength="4" required></td> -->
			<!--       <td><input type="text" name="month" placeholder="例：08" pattern="([0-1][0-9])" title="半角数字2文字"  maxlength="2" required></td> -->
			<!--       <td><input type="text" name="familyName"placeholder="例：tanaka" pattern="^[0-9A-Za-z]+$" title="半角英数字20文字以内" maxlength="20" required></td> -->
			<!--       <td><input type="text" name="givenName" placeholder="例：taro" pattern="^[0-9A-Za-z]+$" title="半角英数字20文字以内" maxlength="20" required></td> -->
			<!--       <td><input type="text" name="familyNameKanji"placeholder="例：田中" maxlength="20" required></td> -->
			<!--       <td><input type="text" name="givenNameKanji" placeholder="例：太郎" maxlength="20" required></td> -->
			<!--       <td><input type="text" name="phoneEmail" placeholder="例：example@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="example@gmail.comなど" maxlength="100" required></td> -->
			<!--       <td><input type="text" name="sex" placeholder="男or女" pattern="[男女]+$" title="男か女" maxlength="3" required></td> -->
			<!--       <td><input type="text" name="userFlg" placeholder="1～3" pattern="[1-3]" title="1～3" maxlength="1" required></td> -->
			<!--       <td><input type="text" name="password" placeholder="8桁以上" pattern="^([0-9A-Za-z]{8,})" title="半角英数字8文字以上20文字以内" maxlength="20" required></td> -->
			<!-- 		</tr> -->
			<!--       </table> -->
			<!--       <input class="button" type="submit" value="追加"> -->
			<%-- </s:form> --%>
			<%-- </s:if> --%>
			<br>
			<br>
		</s:if>
		<s:else>
		ログイン後に表示します。
		</s:else>
		<s:form action="GetAddressAction">
			<button type="submit" class="button">戻る</button>
		</s:form>
	</div>
	<br>
</body>
</html>