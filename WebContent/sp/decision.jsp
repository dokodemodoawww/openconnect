<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>決裁状況一覧</title>


<link rel="stylesheet" href="css/decision.css">

<!-- JSファイル読み込み -->
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/decision.js"></script>


<!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css"> -->
</head>
<body>

	<!-- ヘッダー読み込み -->
	<header><jsp:include page="header.jsp" /></header>

	<div class="container">



		<br>
		<h1>決裁状況一覧</h1>
			<s:if test="%{#session.userFlg >= 1}">
		<div align="left">案件名を入力してください</div>
		<p>
		<p>
			<s:form action="DecisionSelectAction">
				<input type="text" name="searchString" id="searchText"
					placeholder="案件名を入力" maxlength="100" />
				<input type="submit" value="検索" class="button">
			</s:form>
		</p>
		<br>
		<s:property value="resultString" />
		<s:property value="resultSelect" />
		<br>
		<s:form action="DecisionUpdateAction">
			<table border="1">
				<tr>
					<!-- 一覧 -->
					<td></td>
					<td>
						<h5>
							<STRONG>登録日</STRONG>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>ユーザーID</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>姓</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>名</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>プロジェクトID</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>プロジェクト名</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>案件番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>案件名</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>詳細</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>実施起案番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>実施決裁番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>契約起案番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>契約決番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>実施兼契約起案番号</Strong>
						</h5>
					</td>
					<td>
						<h5>
							<Strong>実施兼契約番号</Strong>
						</h5>
					</td>
				</tr>
				<!-- 繰り返し -->
				<s:iterator value="decisiontList">
					<tr>
						<td><input type="hidden"
							value=<s:property value="decisionId" /> name="decisionId"></td>
						<td><input type="text"
							pattern="([0-2][0-9]{3})\/([0-1][0-9])\/([0-3][0-9])"
							placeholder="登録日を入力" required name="registration" maxlength="10"
							value="<s:property value="registration" />" id="registration" /></td>

						<td><input type="text" pattern="[1-9][0-9]*" maxlength="5"
							required name="userId" value="<s:property value="userId" />"
							id="registration" placeholder="ユーザーIDを入力" /></td>


						<td><div class="username"><s:property value="familyNameKanji" /></div></td>

						<td><div class="username"><s:property value="givenNameKanji" /></div></td>

						<td><input type="text" pattern="[1-9][0-9]*" maxlength="5"
							required name="projectId"
							value="<s:property value="projectId" />" id="registration"
							placeholder="プロジェクトIDを入力" /></td>

						<td><s:property value="projectName" /></td>

						<td><div class="decisionid">
								<s:property value="decisionIdNumber" />
							</div></td>
						<td><input type="text" maxlength="100" placeholder="案件名を入力"
							name="decisionName" id="display"
							value="<s:property value="decisionName" />" /></td>
						<td><input type="text" maxlength="255" placeholder="詳細を入力"
							name="detail" id="display" value="<s:property value="detail" />" /></td>
						<td><input type="text" maxlength="100"
							placeholder="実施起案番号を入力" name="iDraftingId" id="registration"
							value="<s:property value="iDraftingId" />" /></td>
						<td><input type="text" maxlength="100"
							placeholder="実施決裁番号を入力" name="iApprovalId" id="registration"
							value="<s:property value="iApprovalId" />" /></td>
						<td><input type="text" maxlength="100"
							placeholder="契約起案番号を入力" name="aDraftingId" id="registration"
							value="<s:property value="aDraftingId" />" /></td>
						<td><input type="text" maxlength="100" placeholder="契約決番号を入力"
							name="cdId" id="registration" value="<s:property value="cdId" />" /></td>
						<td><input type="text" maxlength="100"
							placeholder="実施兼契約起案番号を入力" name="iADId" id="registration"
							value="<s:property value="iADId" />" /></td>
						<td><input type="text" maxlength="100"
							placeholder="実施兼契約番号を入力" name="iAId" id="registration"
							value="<s:property value="iAId" />" /></td>
					</tr>
				</s:iterator>
			</table>

			<br>
			<center><s:if test="%{#session.userFlg >= 50}">
				<input type="submit" value="編集" class="button">
			</s:if>
			</center>
		</s:form>
		<br>

		<s:if test="%{#session.userFlg >= 50}">
			<div id="btna">＋ ユーザー一覧を表示</div>

			<div id="menua">
				<table border="1">
					<tr>
						<th>ユーザーID</th>
						<th>ユーザー名</th>
					</tr>
					<s:iterator value="studentsList">
						<tr>
							<td><s:property value="userId" /></td>
							<td><s:property value="familyNameKanji" /> <s:property
									value="givenNameKanji" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>

			<div id="btnb">＋ プロジェクト一覧を表示</div>
			<div id="menub">
				<table border="1">
					<tr>
						<th>プロジェクトID</th>
						<th>プロジェクト名</th>
					</tr>
					<s:iterator value="projectsList">
						<tr>
							<td><s:property value="projectId" /></td>
							<td><s:property value="projectName" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</s:if>
	</s:if>
	<s:else>
	ログイン後に表示します。
	</s:else>

		<s:form action="GetAddressAction">
			<center>
				<input type=submit value="戻る" class="button">
			</center>
		</s:form>

	</div>

</body>
</html>