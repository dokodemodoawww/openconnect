<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>botくんメンテナンス</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container-fluid">
  <div class="navbar-header">
  <a class="navbar-brand" href="botMaintenance.jsp">botくんメンテナンスページ</a>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#gnavi">
      <span class="sr-only">メニュー</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  </div>

  <div id="gnavi" class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="botExercise.jsp">言葉を教える</a></li>
      <li><a href="<s:url action="BotSearchAction"></s:url>">言葉を閲覧する</a></li>
    </ul>
  </div>
  </div>
</nav>

</body>
</html>