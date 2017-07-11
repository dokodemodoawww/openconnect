<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>決裁手続き電子化</title>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/decision_detail.js"></script>
<link rel="stylesheet" href="css/decision_detail.css">
</head>
<body>

		<!-- 	ヘッダー読み込み -->
		<jsp:include page="header.jsp" />

<s:if test="%{#session.userFlg < 10}">
			ログイン後に表示します。
		</s:if>
<s:if test="%{#session.userFlg >= 10}">
		<div class="container">
			<br>
			<!-- 一覧表示 -->
			<h1>決裁手続き一覧</h1>
			<br>


			<s:form action="DecisionDetailSelectAction">
	プロジェクト検索<input type="text" placeholder="例：rewrite" name="searchString"
					maxlength=30>
				<s:submit value="検索" />
			</s:form>
			<br>
			<s:property value="%{resultString}" />
			<s:property value="%{resultSelect}" />
			<!-- 	リスト表示 -->
			<table border="1">
				<tr>
					<th>ID</th>
					<th><div class="smallWidth">プロジェクトID</div></th>
					<th></th>
					<th><div class="middleWidth">案件番号</div></th>
					<th><div class="bigWidth">プロジェクト名</div></th>
					<th><div class="middleWidth">決裁分類</div></th>
					<th><div class="bigWidth">申請・承認状況</div></th>
					<th><s:if test="%{#session.userFlg  >= 50}">編集</s:if></th>
					<th><s:if test="%{#session.userFlg  >= 50}">申請</s:if></th>
					<th><s:if test="%{#session.userFlg  >= 50}">削除</s:if></th>
					<th><div class="middleWidth">プレビュー</div></th>
				</tr>

				<s:iterator value="decisionDetailList">
					<tr>

						<td class="decision_detail_id"><s:property
								value="decisionDetailId" /></td>
						<td><s:property value="projectId" /></td>
						<td><input type="hidden"
							value="<s:property value="decisionId" />" class="decision_id" /></td>
						<td><s:property value="decisionIdNumber" /></td>
						<td class="decision_name"><s:property value="projectName" /></td>
						<td class="decision_type"><s:property value="decisionType" /></td>
						<td class="decision_status"><s:property
								value="decisionStatus" /></td>
						<td><s:if test="%{#session.userFlg  >= 50}">
								<input type="button" value="編集" class="modal-edit-open">
							</s:if></td>
						<td><s:if test="%{#session.userFlg  >= 50}">
								<s:if test="%{decisionStatus=='承認'}">
									<input type="button" value="申請" />
								</s:if>
								<s:else>
									<s:form action="DecisionDetailApplicationAction">
										<input type="hidden" name="decisionDetailId"
											value="<s:property value="decisionDetailId" />">
										<input type="hidden" name="decisionStatus" value="承認待">

										<s:submit value="申請" />
									</s:form>
								</s:else>
							</s:if></td>
						<td><s:if test="%{#session.userFlg  >= 50}">
								<input type="button" value="削除" class="modal-open">
							</s:if></td>

						<td><s:form action="DecisionDetailPreviewAction">
								<input type="hidden" name="decisionDetailId"
									value="<s:property value="decisionDetailId" />">
								<s:submit value="プレビュー" />
							</s:form></td>
					</tr>
				</s:iterator>

			</table>
			<s:if test="%{#session.userFlg  >= 50}">
				<br>
	存在するプロジェクトのIDを入力してください。<br>
				<s:form action="DecisionDetailInsertAction">
					<table border="1">

						<tr>
							<th>プロジェクトID</th>
							<th>パスワード</th>
						</tr>
						<tr>
							<td><input type="text" name="projectId" pattern="^[0-9]+$"
								placeholder="半角数字のみ" maxlength=5 required></td>
							<td><input type="text" name="password"
								pattern="^[0-9A-Za-z]+$" placeholder="半角英数字のみ" maxlength=20
								required></td>
						</tr>
					</table>
					<input type="submit" value="追加">
				</s:form>

				<br>
				<input type="button" value="＋プロジェクト一覧を開く" id="listButton">
				<div class="projectElement">
					<table border="1" class="element">
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

			<div id="modal-edit-main">
				以下の内容を編集しますか？
				<table border="1">
					<tr>
						<td>案件番号</td>
						<td><span id="edit-projectid"></span></td>
					</tr>
					<tr>
						<td>プロジェクト名</td>
						<td><span id="edit-projectname"></span></td>
					</tr>
					<tr>
						<td>決裁分類</td>
						<td><span id="edit-classify"></span></td>
					</tr>
					<tr>
						<td>申請・承認状況</td>
						<td><span id="edit-status"> </span></td>
					</tr>
				</table>
				<input type="button" class="delete-true button" value="はい">
				<input type="button" class="modal-close button" value="いいえ">

				<div class="delete-prepare">
					パスワードを入力してください
					<s:form action="DecisionDetailUpdateAction">
						<input type="text" name="password" pattern="^[0-9A-Za-z]+$"
							placeholder="半角英数字のみ">
						<input type="hidden" name="decisionDetailId" value=""
							id="edit-delete">
						<input type="submit" class="delete-true button" value="編集">
					</s:form>
					<input type="button" class="modal-close button" value="閉じる">
				</div>
			</div>

			<div id="modal-main">
				以下の内容を削除しますか？
				<table border="1">
					<tr>
						<td>案件番号</td>
						<td><span id="delete-projectid"></span></td>
					</tr>
					<tr>
						<td>プロジェクト名</td>
						<td><span id="delete-projectname"></span></td>
					</tr>
					<tr>
						<td>決裁分類</td>
						<td><span id="delete-classify"></span></td>
					</tr>
					<tr>
						<td>申請・承認状況</td>
						<td><span id="delete-status"> </span></td>
					</tr>
				</table>
				<input type="button" class="delete-true button" value="削除">
				<input type="button" class="modal-close button" value="閉じる">

				<div class="delete-prepare">
					パスワードを入力してください
					<s:form action="DecisionDetailDeleteAction">
						<input type="text" name="password" pattern="^[0-9A-Za-z]+$"
							placeholder="半角英数字のみ">
						<input type="hidden" name="decisionDetailId" value=""
							id="true-delete">
						<input type="submit" class="delete-true button" value="削除">
					</s:form>
					<input type="button" class="modal-close button" value="閉じる">
				</div>
			</div>
			<br> <br>
		</div>
		<!-- 	戻る -->
	</s:if>
	<s:form action="GetAddressAction">
		<s:submit value="戻る" />
	</s:form>



</body>
</html>