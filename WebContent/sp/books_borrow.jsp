<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>書籍貸し出し</title>
<link rel="stylesheet" href="css/books_borrow.css">
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="container">

		<br>
		<h1>書籍貸し出し</h1>
		<br> <br>


		<s:if test="%{#session.userFlg >= 10}">

			<s:property value="%{resultSelect}" />
			<br>
			<table border="1">
				<tr>
					<td>id</td>
					<td><div class="bigWidth">タイトル</div></td>
					<td><div class="middleWidth">貸し出し状況</div></td>
					<td><div class="middleWidth">日付</div></td>
					<td><div class="middleWidth">ユ ーザー名</div></td>
				</tr>
				<s:iterator value="bookList">
					<tr>
						<td><s:property value="bookId" /><input type="hidden"
							name="bookIdList" value="<s:property  value="bookId" />"
							class="bookId"></td>
						<td><s:property value="title" /><input type="hidden"
							name="title" value="<s:property value="title" />" class="title"></td>
						<td><s:property value="borrowStatus" /><input type="hidden"
							name="statusList" value="<s:property value="borrowStatus" />"
							class="status"></td>
						<td><s:property value="borrowDay" /><input type="hidden"
							name="dayList" value="<s:property value="borrowDay" />"
							class="day"></td>
						<td><s:property value="userName" /><input type="hidden"
							name="borrowIdList" value="<s:property value="userName" />"
							class="userName"></td>

					</tr>
				</s:iterator>
			</table>
			<br>

			<s:form action="BooksBorrowUpdateAction">
	書籍のIDを入力
	<br>
				<input type="text" name="bookId" pattern="[1-9][0-9]*" maxlength="3"
					title="半角数字3桁以内" required placeholder="半角数字で入力">
				<br>

		ユーザーIDを入力
		 <br>
				<input type="text" name="borrowId" pattern="[1-9][0-9]*"
					title="半角数字3桁以内" maxlength="3" placeholder="半角数字で入力">
				<input class="button" type="submit" value="貸し出し">
				<br>
			</s:form>
		</s:if>

		<s:else>
		ログイン後表示します
		</s:else>

		<s:form action="BooksSelectAction">
			<input class="button" type="submit" value="戻る">
			<br>
		</s:form>
	</div>

</body>
</html>

