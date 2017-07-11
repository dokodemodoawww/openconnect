<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=no" >
<title>勤怠報告完了</title>

<script src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/attendance.js"></script>
<link rel="stylesheet" href="css/attendance.css">
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>
	<!-- ヘッダー-->
	<jsp:include page="header.jsp" />

	<div  class="attendance" align="center">

	<h1>勤怠確認完了</h1><hr>
	<br>
	<h4>以下の内容で勤怠の送信を完了しました。</h4>

	<table class="atok">
	<colgroup>
        <col style="width:33%;">
        <col style="width:67%;">
    </colgroup>
    <tr>
    <th> ユーザー名：</th>
    <td><s:iterator  value="atUserList"><s:property value="familyNameKanji"/>　<s:property value="givenNameKanji"/></s:iterator></td>
    </tr>

	<tr>
	<th>  日  時  ：</th>
	<td><s:property value="atYear"/>年<s:property value="atMonth"/>月<s:property value="atDay"/>日</td>
    </tr>

    <tr>
    <th>出欠確認：</th>
    <td><s:property value="attendance"/></td>
    </tr>

    <tr>
    <s:if test= "%{attendance == '出席' }" />
    <s:else>
    <th>  備  考  :</th>
    <td style="word-wrap:break-word;"><s:property value="reason"/></td>
    </s:else>
    </tr>
    </table>

           <br>




<br>
	<div align="center" style="font-weight: bold; font-size: 20px;">
	<a href="applist.jsp" >Topに戻る</a>
	</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>