<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 背景画像 -->
<style type="text/css">
<!--body {background: url(img/water.jpg) center center / cover no-repeat fixed;}-->
</style>
<!-- ここまで -->
<title>Insert title here</title>
<!-- css読み込み  -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/header.css" rel="stylesheet">
<!-- js読み込み -->

<%-- <script src="js/bootstrap.js"></script> --%>

</head>
<body>
	<!-- ヘッダー -->
					<header id="headerSpace">
						<div class="upperHeader">
										<a href="applist.jsp" class="openConnect">Open Connect</a>
						  <!-- internousdevのロゴ
				             <a href=""><img class="dissappear" src="img/hd_logo.png"></a> -->

						</div>
						<nav id="primary_nav_wrap">
							<ul>
							  <s:if test="%{#session.userFlg == null}">
							    <li>
							     <a href="JustGoAction" class="part_line">Login</a>
							    </li>
							  </s:if>

							  <s:if test="%{#session.userFlg >= 1}">
							  <li><a href="#" class= "header-menu">■ Category</a>
							    <ul>
							     <s:if test="%{#session.userFlg == 2}">
								  <li><a href="GoAdminAttendanceLeaderAction">勤怠確認</a></li>
								</s:if>
							    <s:if test="%{#session.userFlg == 3}">
								  <li><a href="GoAdminAttendanceAction">勤怠確認</a></li>
								</s:if>
							      <li><a href="GoTeamAction">チーム情報</a></li>
							      <li><a href="#">プロジェクト</a>
							      	<ul>
							      	 <li><a href="ProjectsSelectAction">プロジェクト一覧</a></li>
								      <li><a href="ProjectStatusSelectAction">プロジェクトリリース状況</a></li>
								      <li><a href="ProjectProgressSelectAction">プロジェクト進捗報告</a></li>
							      </ul>
							      </li>
							      <li><a href="#">一覧</a>
							      	<ul>
							      		<li><a href="StudentsSelectAction">受講生一覧</a></li>
							      		<li><a href="BooksSelectAction">書籍一覧</a></li>
							      		<li><a href="GoScheduleSelectAction">スケジュール一覧</a></li>
							      	</ul>
							      </li>
								  <s:if test="%{#session.userFlg >= 1}">
								  	 <li><a href="#">決裁</a>
								      	<ul>
								      	<li><a href="GoDecisionAction">決裁手続き</a></li>
									  	<li><a href="DecisionArchiveAction">完了済み決裁</a></li>
								      </ul>
								     </li>
								  </s:if>

							<s:if test="%{#session.userFlg == 3}">
							  <li><a href="GoRegisterAction">新規登録</a></li>
							   <li><a href="addsite.jsp">サイト登録</a></li>
							 </s:if>

							    </ul>
							  </li>
							  </s:if>

							  <s:if test="%{#session.userFlg >= 1}">
							    <li><a href="GoAttendanceAction" class= "header-menu">■ 勤怠報告</a></li>
							  </s:if>

							  <!-- <s:if test="%{#session.userFlg == 3}">
							  <li><a href="GoAdminAction">■ 管理者 </a></li>
							  </s:if> -->



							  <s:if test="%{#session.userFlg != null}">
							  <li>
							      <a href="LogoutAction" class= "part_line">Logout</a>
							  </li>
							  </s:if>
							</ul>
						</nav>


                        <!-- <div class="container" align="right">

                          <s:if test="%{#session.userFlg >= 1}">
					<ul class="pulldown2" id="selectBer">
<li><div class="category">CATEGORY</div>
				<ul class="menu">
						<li><a href="ProjectsSelectAction">プロジェクト一覧</a></li>
						<li><a href="ProjectStatusSelectAction">プロジェクトリリース状況</a></li>
						<li><a href="ProjectProgressSelectAction">プロジェクト進捗報告</a></li>
						<li><a href="StudentsSelectAction">受講生一覧</a></li>
						<li><a href="GoTeamAction">チーム情報</a></li>
						<li><a href="GoAttendanceAction">勤怠更新</a></li>
						<s:if test="%{#session.userFlg >= 2}">
						<li><a href="GoAdminAttendanceAction">勤怠確認</a></li>
						</s:if>
						<li><a href="DecisionSelectAction">決裁一覧状況</a></li>
						<li><a href="DecisionDetailSelectAction">決裁手続き</a></li>
						<s:if test="%{#session.userFlg == 3}">
							<li><a href="DecisionApplicationSelectAction">決済手続き申請一覧</a></li>
						</s:if>
						<li><a href="BooksSelectAction">書籍一覧</a></li>
						<li><a href="GoScheduleSelectAction">スケジュール一覧</a></li>
						</ul>
						</li></ul>


				</s:if>



						<div class="menuGroup">

						<s:if test="%{#session.userFlg == null}">
						<a href="JustGoAction" class="part_line">■ Login</a>
						</s:if>
						</div>
						<s:if test="%{#session.userFlg != null}">
						<a href="LogoutAction" class="part_line">■ Logout</a>
 						</s:if>
						<s:if test="%{#session.userFlg == 3}">
					    <a href="GoAdminAction" class="part_line">■ 管理者 </a>
						</s:if>



						</div> -->
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
					</header>
	<!-- ヘッダーはここまで -->
<br>
<br>
<br>
<br>

<script type="text/javascript"src="js/header.js"></script>
</body>
</html>