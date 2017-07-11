<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>botくんメンテナンス</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Stylesheet
    ================================================== -->
	<link rel="stylesheet" href="css/bootstrap.css" />
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" href="css/Bfooter.css">


	<!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
<header><jsp:include page="botHeader.jsp" /></header>


<div class="container">
  <div class="row">
    <div class="col-sm-1 visible-lg-block"></div>

    <div class="col-sm-10">
    	<div class = "outline">
    	<br>
<h3><s:property value="resultSentence"/></h3>

		</div>
    </div>

    <div class="col-sm-1 visible-lg-block"></div>
  </div>
</div>

<jsp:include page="Bfooter.jsp" />
</body>
</html>