<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>プロジェクト進捗状況</title>
<link rel="stylesheet" href="css/project_progress.css">

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/project_progress.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>

	<header><jsp:include page="header.jsp" /></header>
	<div class="centered">
		<h1 class="page-header centered">プロジェクト進捗報告</h1>



		<!-- userflg1以下は表示不可 -->
		<!-- userflg1以上は追加のみ可能 -->
		<!-- userflg50のみ追加・編集・削除可能 -->



		<!-- flg判定 -->
		<s:if test="%{#session.userFlg < 1}">
			<h1 class="centered">ログイン後に表示されます。</h1>
			<BR>
			<BR>
			<BR>
		</s:if>
	</div>
	<!-- flg判定 -->
	<s:if test="%{#session.userFlg >= 1}">
		<div class="centered fontsize">
			<s:form action="ProjectProgressSelectAction">
		--- プロジェクト名を入力 ---<br>
				<input type="text" name="search" placeholder="例：rewrite"
					maxlength="20">
				<input type="submit" value="検索" class="button0">
			</s:form>

			<br> <BR> <font color="red"> <s:property
					value="%{resultString}" /> <s:property value="%{resultSelect}" />
			</font>
		</div>
		<BR>
		<BR>
		<div class="table-scroll">
			<s:form action="ProjectProgressUpdateAction">

				<table border=1 class="centered fontsize">
					<tbody id="list_body">
						<tr>
							<th></th>
							<th><div class="middleWidth">プロジェクトID</div></th>
							<th><div class="smallWidth">日付</div></th>
							<th><div class="middleWidth">プロジェクト名</div></th>
							<th><div class="middleWidth">進捗予定</div></th>

							<th><div class="middleWidth">進捗結果</div></th>
							<th><div class="middleWidth">その他報告</div></th>

							<th><div class="smallWidth">開始日</div></th>
							<th><div class="smallWidth">終了日</div></th>
							<th><div class="smallWidth">メモ</div></th>
						</tr>
						<s:iterator value="searchList">
							<tr>
								<td><input type="hidden" name="progressIdList"
									value="<s:property value="progressId" />" class="progressId"></td>

								<td><s:property value="projectId" /> <input type="hidden"
									name="projectIdList" value="<s:property value="projectId"/>"
									size="7" class="projectIdlist"></td>
								<td><input type="text" name="projectDayList"
									value="<s:property value="projectDay" />" size="8"
									class="projectDaylist" maxlength="12"
									pattern="([0-2][0-9]{3})\/([0-1][0-9])\/([0-3][0-9])"
									title="yyyy/MM/dd" placeholder="例2016/08/06"></td>

								<td><s:property value="projectName" /> <input
									type="hidden" value="<s:property value="projectName" />"
									class="projectName"></td>

								<td><input type="text" name="projectPlanList"
									value="<s:property value="projectPlan" />"
									class="projectPlanlist" maxlength="100"></td>
								<td><input type="text" name="projectResultList"
									value="<s:property value="projectResult" />"
									class="projectResultlist" maxlength="100"></td>
								<td><input type="text" name="otherList"
									value="<s:property value="other" />" class="otherlist"
									maxlength="100"></td>


								<td><s:property value="startDate" /></td>
								<td><s:property value="endDate" /></td>
								<td><s:property value="note" /></td>
								<td><s:if test="%{#session.userFlg == 3}">
										<!-- flg判定 -->
										<input type="button" class="button0 modal-open" value="削除" />
									</s:if></td>
							</tr>
						</s:iterator>

					</tbody>

				</table>

				<!-- flg判定 -->
				<s:if test="%{#session.userFlg == 3}">
					<BR>
					<div class="centered add">
						<input type="submit" class="button1 fixedButton" value="編集完了" />
					</div>
				</s:if>
			</s:form>
		</div>
		<BR>
		<br>
		<div id="pager" class="centered">
			<div id="page_ctrl">
				<ul id="page_before">
					<li id="page_prev">prev</li>
				</ul>
				<ul id="page_number"></ul>
				<ul id="page_after">
					<li id="page_next">next</li>
				</ul>
			</div>
		</div>
		<br>



		<br>
		<div class="table-scroll">
			<s:form action="ProjectProgressInsertAction">
				<BR>
				<BR>
				<table border="1" class="centered fontsize">
					<tr>
						<th>プロジェクトID</th>
						<th>進捗予定</th>
						<th>進捗結果</th>
						<th>その他報告</th>
					</tr>
					<tr>
						<td><input type="text" name="projectId" placeholder="半角数字で入力"
							pattern="^[0-9]+$" maxlength="4"></td>
						<td><input type="text" name="projectPlan" placeholder=""
							maxlength="10"></td>
						<td><input type="text" name="projectResult" placeholder=""
							maxlength="10"></td>
						<td><input type="text" name="other" placeholder=""
							maxlength="50"></td>
					</tr>
				</table>

				<div class="centered add">
					<br> <input type="submit" class="button1 fixedButton"
						value="追加する">
				</div>
			</s:form>
		</div>

		<br>


		<div class="container fontsize">
			<div id="btna">＋ プロジェクト一覧表示</div>

			<div id="menua">
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
		</div>

		<br>
		<div id="modal-main" align="center">
			<BR> <BR>
			<table border="1">
				<tr>
					<td>プロジェクトID</td>
					<td><span id="delete-projectid"></span></td>
				</tr>
				<tr>
					<td>日付</td>
					<td><span id="delete-projectday"></span></td>
				</tr>
				<tr>
					<td>プロジェクト名</td>
					<td><span id="delete-projectname"></span></td>
				</tr>
				<tr>
					<td>進捗予定</td>
					<td><span id="delete-projectplan"></span></td>
				</tr>
				<tr>
					<td>進捗結果</td>
					<td><span id="delete-projectresult"></span></td>
				</tr>
				<tr>
					<td>その他報告</td>
					<td><span id="delete-other"> </span></td>
				</tr>
			</table>

			<input type="button" class="delete-true button" value="削除"> <input
				type="button" class="modal-close button" value="閉じる">

			<div class="delete-prepare" align="center">
				本当に削除しますか？
				<s:form action="ProjectProgressDeleteAction">
					<input type="hidden" name="progressId" value="" id="true-delete">
					<input type="submit" class="delete-true button" value="はい">
					<input type="button" class="modal-close button" value="いいえ">
				</s:form>
			</div>
		</div>


		<div id="contents">

			<br>
		</div>


		<br>
		<br>
		<br>

		<br>
	</s:if>
	<s:form action="GetAddressAction">
		<div align="center">
			<button type="submit" class="button2">戻る</button>
		</div>
	</s:form>
	<br>
	<BR>
	<BR>
	<jsp:include page="footer.jsp" />

</body>
</html>