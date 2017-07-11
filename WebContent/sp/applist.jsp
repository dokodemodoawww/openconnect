
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">

<title>Open Connect</title>
<!-- css読み込み  -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- js読み込み -->
<script src="js/bootstrap.js"></script>
</head>
<body>

	<!-- 	ヘッダー読み込み -->
	<jsp:include page="header.jsp" />

	<!-- アプリ一覧表示 -->
	<div class="container">
		<h1 class="page-header">アプリ一覧</h1>
		<s:iterator value="siteInfoList">
			<ul>

			<s:a href="%{siteUrl}">

					<h1><s:property value="siteName" /></h1>



				</s:a>

			</ul>
		</s:iterator>
		<s:property value="notLoginMsg" />
	</div>

	<!-- 勤怠管理サイト -->
<!-- 	<div class="container"> -->
<!-- 		<h1 class="page-header">勤怠管理</h1> -->
<%-- 		<s:if test="notLoginMsg != null"> --%>
<%-- 			<s:property value="notLoginMsg"></s:property> --%>
<%-- 		</s:if> --%>
<%-- 		<s:else> --%>
<!-- 			<ul> -->
<%-- 				<s:a href="GoKintaiChooseAction">勤怠管理を行う方はこちらへ</s:a> --%>
<!-- 			</ul> -->
<%-- 		</s:else> --%>
<!-- 	</div> -->

</body>
</html>