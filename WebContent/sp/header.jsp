<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>


<title>Insert title here</title>
<!-- css読み込み  -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/header.css" rel="stylesheet">
<!-- js読み込み -->
<%-- <script src="js/bootstrap.js"></script> --%>
<script src="js/header.js"></script>
</head>
<body>

	<!-- ヘッダー -->
<!-- 	<header> -->
<!-- 		<nav class="navbar navbar-default navbar-static-top"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="navbar-header"> -->
					<div class="headerSpace">
					<h1 class="logo">
						<a href="index.jsp" class="openConnect">Open Connect</a>
					</h1>

<!-- 				</div> -->
<!-- 				<div class="collapse navbar-collapse"> -->
<!-- 					<ul class="nav navbar-nav navbar-right"> -->
						<div class="menuGroup">
						<s:if test="%{#session.userFlg == null}">
							<form action="GoLoginAction" class="formButton">
								<input type="submit" class="menu" value="ログイン">
							</form>
						</s:if>

						<s:if test="%{#session.userFlg != null}">
							<form action="GoLogoutAction" class="formButton">
								<input type="submit" class="menu" value="ログアウト">
							</form>

						</s:if>
						<s:if test="%{#session.userFlg == 3}">
							<form action="GoAdminAction" class="formButton">
								<input type="submit" class="menu" value="管理者画面">
							</form>
							<form action="GoRegisterAction" class="formButton">
								<input type="submit" class="menu" value="新規登録">
							</form>
						</s:if>
<!-- 					</ul> -->
<!-- 				</div> -->
<br>
<s:if test="%{#session.userFlg >= 1}">
					<select name="pulldown2" id="selectBer">
						<option value="">移動先を選択</option>
						<option value="ProjectsSelectAction">プロジェクト一覧</option>
						<option value="ProjectStatusSelectAction">プロジェクトリリース状況</option>
						<option value="ProjectProgressSelectAction">プロジェクト進捗報告</option>
						<option value="StudentsSelectAction">受講生一覧</option>
						<option value="GoAttendanceAction">勤怠更新</option>
						<option value="DecisionSelectAction">決裁一覧状況</option>
						<option value="DecisionDetailSelectAction">決裁手続き</option>
						<s:if test="%{#session.userFlg  >= 50}">
							<option value="DecisionApplicationSelectAction">決済手続き申請一覧</option>
						</s:if>
						<option value="BooksSelectAction">書籍一覧</option>
						<option value="BooksBorrowSelectAction">書籍貸し出し</option>
						<option value="ScheduleSelectAction">スケジュール一覧</option>
					</select>
					<input type="button" id="location" value="移動">
				</s:if>

						</div>
				<!-- 				<dl id="menuElementGroup"> -->
				<!-- 				<dd><a href="ProjectsSelectAction" class="menuElement">プロジェクト一覧</a></dd> -->
				<!-- 				<dd><a href="ProjectStatusSelectAction" class="menuElement">プロジェクトリリース状況</a></dd> -->
				<!-- 				<dd><a href="ProjectProgressSelectAction" class="menuElement">プロジェクト進捗報告</a></dd> -->
				<!-- 				<dd><a href="StudentsSelectAction" class="menuElement">受講生一覧</a></dd> -->
				<!-- 				<dd><a href="GoAttendanceAction" class="menuElement">勤怠更新</a></dd> -->
				<!-- 				<dd><a href="DecisionSelectAction" class="menuElement">決裁一覧状況</a></dd> -->
				<!-- 				<dd><a href="DecisionDetailSelectAction" class="menuElement">決裁手続き</a></dd> -->
				<%-- 				<s:if test="%{#session.userFlg  >= 2}"> --%>
				<!-- 					<dd><a href="DecisionApplicationSelectAction" class="menuElement">決済手続き申請一覧</a></dd> -->
				<%-- 				</s:if> --%>
				<!-- 				<dd><a href="BooksSelectAction" class="menuElement">書籍一覧</a></dd> -->
				<!-- 				<dd><a href="BooksBorrowSelectAction" class="menuElement">書籍貸し出し</a></dd> -->
				<!-- 				<dd><a href="ScheduleSelectAction" class="menuElement">スケジュール一覧</a></dd> -->
				<!-- 				</dl> -->

					</div>
<!-- 			</div> -->
<!-- 		</nav> -->
<!-- 	</header> -->
	<!-- ヘッダーはここまで -->
<br>
<br>
<br>
<br>
</body>
</html>