<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/schedule.js"></script>
<link rel="stylesheet" href="css/schedule.css">
<!-- css読み込み  -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- js読み込み -->
<script src="js/bootstrap.js"></script>
<title>スケジュール一覧</title>
</head>
<body>
	<!-- 	ヘッダー読み込み -->
	<jsp:include page="header.jsp" />

	<!-- アプリ一覧表示 -->
	<div class="container">
		<h1 class="page-header">スケジュール一覧</h1>
		<s:iterator value="siteInfoList">
			<ul>
				<s:a href="%{siteUrl}">
					<s:property value="siteName" />
					<br>
				</s:a>
			</ul>
		</s:iterator>
		<s:property value="notLoginMsg" />


		<s:if test="%{#session.userFlg < 1}">
			ログイン後に表示します。
		</s:if>
		<s:if test="%{#session.userFlg >= 1}">
			<s:form action="ScheduleSelectAction">
				<input type="text" name="search" placeholder="検索文字を入力" maxlength=100 />
				<s:submit value="検索"></s:submit>
			</s:form>
			<br>

			<s:property value="successMsg" />
			<s:property value="errorMsg" />
			<s:property value="selectSuccessMsg" />
			<s:property value="selectErrorMsg" />
			<s:form action="ScheduleUpdateAction">
				<table border=1 style="">
					<tbody>
						<tr>
							<th>ID</th>
							<th>開始日（yyyy/MM/dd）</th>
							<th>終了日（yyyy/MM/dd）</th>
							<th>件名</th>
							<th>内容</th>
							<th></th>
						</tr>

						<s:iterator value="scheduleList">
							<tr>
								<td><s:property value="id" /></td>
								<td><input type="text" name="scheduleStartdayList"
									value="<s:property value="startDay" />"
									class="scheduleStartdayList" type="date"
									pattern="([0-2][0-9]{3})\-([0-1][0-9])\-([0-3][0-9])"
									title="yyyy-MM-ddで入力してください。" placeholder="開始日を入力" required></td>
								<td><input type="text" name="scheduleEnddayList"
									value="<s:property value="endDay" />"
									class="scheduleEnddayList"
									pattern="([0-2][0-9]{3})\-([0-1][0-9])\-([0-3][0-9])"
									title="yyyy-MM-ddで入力してください。" placeholder="終了日を入力"></td>
								<td><input type="text" name="scheduleTitleList"
									value="<s:property value="title" />" class="scheduleTitleList"
									placeholder="件名を入力" maxlength=100 required></td>
								<td><input type="text" name="scheduleContentList"
									value="<s:property value="content" />"
									class="scheduleContentList" placeholder="内容を入力" maxlength=100></td>
								<td><s:if test="%{#session.userFlg >= 50}">
										<input type="button" class="button modal-open" value="削除" />
									</s:if></td>
							</tr>
							<input type="hidden" name="scheduleIdList"
								value="<s:property value="id" />" class="scheduleIdList">
						</s:iterator>
					</tbody>
				</table>
				<s:if test="%{#session.userFlg >= 50}">
					<button type="submit" class="button">編集</button>
				</s:if>
			</s:form>

			<br> 開始日は今日の日付が自動で入力されます。
		<s:form action="ScheduleInsertAction">
				<table border=1 style="">
					<tbody>
						<tr>
							<td>件名</td>
							<td>内容</td>
							<td></td>
						</tr>
						<tr>
							<td><input type="text" name="title" placeholder="件名を入力"
								maxlength=100 required></td>
							<td><input type="text" name="content" placeholder="内容を入力"
								maxlength=100></td>
							<!-- tokenタグ -->
							<s:if test="%{#session.userFlg >= 50}">
								<s:token />
								<td><button type="submit" class="button" name="startDay">追加</button></td>
							</s:if>
						</tr>
					</tbody>
				</table>
			</s:form>


			<div id="modal-main">
				<!-- #contents START -->
				<div id="modal-style">
					<table class="modal_border">

						<tr>
							<td>開始日
								<div class="delete-startday modalDelete"></div>
							</td>
						</tr>
						<tr>
							<td>終了日
								<div class="delete-endday modalDelete"></div>
							</td>
						</tr>
						<tr>
							<td>件名
								<div class="delete-title modalDelete"></div>
							</td>
						</tr>
						<tr>
							<td>内容
								<div class="delete-content modalDelete"></div>
							</td>
						</tr>
					</table>
					<input type="button" class="delete-true button" value="削除">
					<input type="button" class="modal-close button" value="閉じる">

					<div class="delete-prepare">
						<p>本当に削除しますか。</p>
						<s:form action="ScheduleDeleteAction">
							<input type="hidden" name="scheduleId" value=""
								class="true-delete">
							<s:token />
							<input type="submit" class="delete-true button" value="はい">
							<input type="button" class="modal-close button" value="いいえ">
						</s:form>

					</div>
				</div>
			</div>
		</s:if>
		<br>
		<s:form action="GetAddressAction">
			<button type="submit" class="button">戻る</button>
		</s:form>
	</div>
</body>
</html>