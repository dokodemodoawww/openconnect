<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>グループ追加</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Stylesheet
    ================================================== -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link href="css/style2.css" rel="stylesheet">
	<link href="css/groupAdd.css" rel="stylesheet">
	<link rel="stylesheet" href="css/Bfooter.css">
	<link href="css/multi-select.css" media="screen" rel="stylesheet" type="text/css">

	<!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/toast.js"></script>
	<script type="text/javascript" src="js/jquery.multi-select.js"></script>
	<script type="text/javascript">
		$(function(){
  			$('#multi-select').multiSelect();
		});
	</script>
		<script type="text/javascript">
		$(function(){
			$('#memberSend').submit(function(){
			if($('[name=memberList]').val() == ""){
				var toast = new Toast();
				toast.show("メンバーを選択してください");
				return false;
			}
			else{
				return true;
			}
			});
		})
	</script>
</head>
<body style="background-color:<s:property value="#session.bColor"/>;">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid" style ="background-color:<s:property value="#session.hColor"/>;">
			<div class="navbar-header">
				<a class="navbar-brand" href="applist.jsp">Openconnect</a>
    		</div>
  		</div>
	</nav>
	
	<br><br>
	
	<div class="outline" style="margin-left:20px;">
		<h2>グループメンバーの追加</h2>
			<br><br>

	<form action="GroupMemberAddAction" id="memberSend" onSubmit="return check()">
		<h4>左のセレクトボックスから、追加するメンバーを選択してください</h4>

		<br><br>
<select multiple="multiple" id="multi-select" name="addMemberList">
<s:iterator value="followList" >
  <option value='<s:property value="userId"/>'><s:property value="userName"/></option>
</s:iterator>
</select>
  <br><br>
<s:hidden theme="simple" name="groupId" value="%{groupId}"></s:hidden>
  <button type="submit" class="btn btn-primary btn-lg">グループに追加</button>
</form>
</div>

<footer>
<jsp:include page="Bfooter.jsp" />
</footer>
</body>
</html>