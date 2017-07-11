<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=no" >
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>チーム情報編集</title>

<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<link rel="stylesheet" href="css/team.css">
<script src="js/footerFixed.js" type="text/javascript"></script>

</head>
<body>
<!-- ヘッダー-->
	<jsp:include page="header.jsp" />

	<div align="center" class="team">
	<h1 >チーム情報編集</h1><hr>


<h4><font color="red">
	<s:property value="%{teamMes}"/>
	 </font></h4>

<h4>変更内容を以下に記入してください</h4>


	<s:form action="TeamEditAction">
	<p>
	<s:iterator value="teamUserList">
	<table class="teamedit">
	<tr>
		<td>チーム名：</td>
		<td>
			<select name="teamName" required="required">
				<option value="">以下から選択</option>
					<s:iterator value="teamList">
						<option value="<s:property value="teamName" />"><s:property value="teamName" /></option>
					</s:iterator>
			</select>
		</td>
	</tr>
	<tr>
		<td>役職：</td>
		<td>
			<select name="userFlg" style="width:200px;" required="required">
			<option value="">以下から選択</option>
			<option value="1">メンバー</option>
			<option value="2">リーダー</option>
			</select>
		</td>
	</tr>
	</table>
</s:iterator>
</p>

<div  class="button">
	<input type="submit" value="編集を確定"/>
</div>
	</s:form>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>