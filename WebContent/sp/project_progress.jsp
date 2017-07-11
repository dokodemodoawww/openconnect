<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>プロジェクト進捗状況</title>
<link rel="stylesheet" href="css/project_progress.css">
<link rel="stylesheet" href="css/accordion.css">

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/project_progress.js"></script>
</head>
<body>

	<header><jsp:include page="header.jsp" /></header>
	<div class="center">
		<br>

		<h1>プロジェクト進捗報告</h1>

		<s:if test="%{#session.userFlg < 10}">
			ログイン後に表示します。
		</s:if>
	</div>
	<s:if test="%{#session.userFlg >= 10}">
		<s:form action="ProjectProgressSelectAction">
		プロジェクト名を入力<br>
			<input type="text" name="search" placeholder="例：rewrite"
				maxlength="20">
			<input type="submit" value="検索" class="button">
		</s:form>
		<br>
		<s:property value="%{resultString}" />
		<s:property value="%{resultSelect}" />

		<s:form action="ProjectProgressUpdateAction">
			<table border=1>
				<tbody id="list_body">
					<tr>
						<th></th>
						<th><div class="middleWidth">プロジェクトID</div></th>
						<th><div class="smallWidth">日付</div></th>
						<th><div class="middleWidth">プロジェクト名</div></th>
						<th><div class="middleWidth">進捗予定</div></th>
						<th><div class="middleWidth">進捗結果</div></th>
						<th><div class="middleWidth">その他報告</div></th>
						<th><div class="middleWidth">リーダーID</div></th>
						<th><div class="middleWidth">サブリーダーID</div></th>
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

							<td><s:property value="projectName" />
							<input type="hidden"
								value="<s:property value="projectName" />" class="projectName"></td>

							<td><input type="text" name="projectPlanList"
								value="<s:property value="projectPlan" />"
								class="projectPlanlist" maxlength="100"></td>
							<td><input type="text" name="projectResultList"
								value="<s:property value="projectResult" />"
								class="projectResultlist" maxlength="100"></td>
							<td><input type="text" name="otherList"
								value="<s:property value="other" />" class="otherlist"
								maxlength="100"></td>

							<td><s:property value="managerId" /></td>
							<td><s:property value="subManagerId" /></td>
							<td><s:property value="startDate" /></td>
							<td><s:property value="endDate" /></td>
							<td><s:property value="note" /></td>
							<td><s:if test="%{#session.userFlg == 3}">
									<input type="button" class="button modal-open" value="削除" />
								</s:if></td>
						</tr>
					</s:iterator>

				</tbody>
			</table>
			<s:if test="%{#session.userFlg == 3}">
				<input type="submit" class="button" value="編集" />
			</s:if>
		</s:form>
		<br>
		<s:form action="ProjectProgressInsertAction">
			<table border="1">
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
			<input type="submit" class="button" value="追加">
		</s:form>

		<br>

		<div id="btna">＋ プロジェクト一覧を表示</div>

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

		<br>
		<div id="modal-main">
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

			<div class="delete-prepare">
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
		<div id="pager">
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
		<br>
	</s:if>
	<s:form action="GetAddressAction">
		<button type="submit" class="button">戻る</button>
	</s:form>

</body>
</html>