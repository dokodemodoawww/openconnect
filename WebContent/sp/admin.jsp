<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>admin画面</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="./js/admin.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="centerdesign">
		<h1 style="text-align: center;">管理画面</h1>
	</div>

	<s:if test="%{#session.userFlg >= 1}">
	<p class="caution">数字入力は半角のみ、 アプリID欄にはアプリIDのみ記入可能、
		値の確認は下のアプリ一覧情報取得から行ってください。 テンキー入力不可。</p>
	<br>
	<div align="center">
		<font size="2" color="red"> </font>
	</div>
	<h2>アプリ追加</h2>
	<s:if test="messageAdd != null">
		<p class="msg">
			<s:property value="messageAdd" />
		</p>
	</s:if>
	<s:form action="AddAppAction">
		<table class="wwFormTable">
			<tbody>
				<tr>
					<td>アプリ名：<input type="text" name="siteName" maxlength="20"
						required>
					</td>
					<td>URL：<input type="text" name="siteUrl"
						style="ime-mode: disabled" size="20" required>
					</td>
					<td>グループ： <select name="genre" style="ime-mode: disabled"
						required>
							<option value="" selected>グループ</option>
							<option value="観る">観る</option>
							<option value="読む">読む</option>
							<option value="グルメ">グルメ</option>
							<option value="エンタメ">エンタメ</option>
							<option value="スポーツ">スポーツ</option>
							<option value="ファッション">ファッション</option>
							<option value="ビューティ">ビューティ</option>
							<option value="チケット">チケット</option>
							<option value="レンタル">レンタル</option>
							<option value="旅行">旅行</option>
					</select>
					</td>

					<td><input type="submit" value="追加"></td>
				</tr>
			</tbody>
		</table>
	</s:form>

	<h2>アプリ削除</h2>
	<s:if test="messageDel != null">
		<p class="msg">
			<s:property value="messageDel" />
		</p>
	</s:if>
	<s:form action="DeleteAppAction">
		<table class="wwFormTable">
			<tbody>
				<tr>
					<td>アプリID : <input type="text" name="siteId" maxlength="20"
						onkeyDown="return numOnly()" pattern="[0-9]{1,10}"
						title="半角数字で入力してください" required>
					</td>
					<td><input type="submit" value="削除"></td>
				</tr>
			</tbody>
		</table>
	</s:form>

	<h2>アプリ変更</h2>
	<s:if test="messageUp != null">
		<p class="msg">
			<s:property value="messageUp" />
		</p>
	</s:if>
	<s:form action="UpdateAppAction">
		<table class="wwFormTable">
			<tbody>
				<tr>
					<td>アプリID : <input type="text" name="siteId" maxlength="20"
						onkeyDown="return numOnly()" pattern="[0-9]{1,10}"
						title="半角数字で入力してください" required>
					</td>

					<td>アプリ名：<input type="text" name="siteName" maxlength="20"
						required>
					</td>

					<td>URL：<input type="text" name="siteUrl"
						style="ime-mode: disabled" size="20" required>
					</td>
					<td>グループ：<select name="genre" style="ime-mode: disabled"
						required>
							<option value="" selected>グループ</option>
							<option value="観る">観る</option>
							<option value="読む">読む</option>
							<option value="グルメ">グルメ</option>
							<option value="エンタメ">エンタメ</option>
							<option value="スポーツ">スポーツ</option>
							<option value="ファッション">ファッション</option>
							<option value="ビューティ">ビューティ</option>
							<option value="チケット">チケット</option>
							<option value="レンタル">レンタル</option>
							<option value="旅行">旅行</option>
					</select>
					</td>
					<td><input type="submit" value="変更"></td>
				</tr>
			</tbody>
		</table>
	</s:form>
	<br>
	<br>
	<br>
	<s:form action="GetAddressAdminAction">
		<input type="submit" value="アプリ一覧情報取得">
		<table class="siteList">
			<thead>
				<tr>
					<th>appID</th>
					<th>appNAME</th>
					<th>URL</th>
					<th>GROUP</th>
				</tr>
			</thead>
			<s:iterator value="siteInfoList">
				<tr align="center">
					<td><s:property value="siteId" /></td>
					<td><s:property value="siteName" /></td>
					<td><s:property value="siteUrl" /></td>
					<td><s:property value="genre" /></td>
				</tr>
			</s:iterator>
		</table>
	</s:form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="page-top">
		<a href="#wrap">PAGE TOP</a>
	</div>
	</s:if>
	<s:else>
	ログイン後に表示します。
	</s:else>
	<s:form action="GetAddressAction">
		<s:submit align="center" cssClass="Button" value="戻る" />
	</s:form>
</body>
</html>