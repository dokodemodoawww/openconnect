<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/footerFixed.js" type="text/javascript"></script>
<title>登録フォーム</title>
</head>
<body>

<jsp:include page="header.jsp" />
<div class="container">
<div class="row">
<div class="col-sm-6 col-sm-offset-3">
<h1>URL登録フォーム</h1>
<s:form action="AddsiteAction" method="post" enctype="multipart/form-data">

<table>
<tr>
<th>サイト名</th>
<td><input type="text" name="siteName" required="required"></td>
</tr>
<tr>
<td>サイトURL</td>
<td><input type="text" name="siteUrl" required="required"></td>
</tr>
<tr>
<td><p>サイト画像</p>(画像の大きさを2MB以下にしてください。)</td>
<td>
<input type="file" name="myFile" required="required">
<br>
</td>
</tr>
<tr>
<td>作成年度</td>
<td>
<input type="text" name="year" required="required">
<br>
</td>
</tr>
</table>
<input type="submit" value="アップロード">
</s:form>
</div>
</div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>