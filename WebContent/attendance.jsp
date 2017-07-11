<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=no" >
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>勤怠更新</title>

<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/attendance.js"></script>
<link rel="stylesheet" href="css/attendance.css">
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>


	<!-- ヘッダー-->
	<jsp:include page="header.jsp" />

	<div  class="attendance" align="center">

	<h1 align="center">勤怠報告</h1><hr>
	<s:if test="%{#session.userFlg >= 1}">
<p>

	<s:form action="AttendanceAction">

	<table class="atform">
	<colgroup>
        <col style="width:33%;">
        <col style="width:67%;">
    </colgroup>

	       <tr><th> ユーザー名：</th>
	        <td><s:iterator value="atUserList">
	          <s:property value="familyNameKanji"/> <s:property value="givenNameKanji"/>
	          </s:iterator></td></tr>

	     <tr><!-- 表示用の日時 -->
	        <th>  日  時  ：</th>
	        <td class="ymd">
	        </td></tr>
	        <tr>


	        <tr id="tr_type"><th>
	出欠確認：</th><td>
	<select name="attendance" style="width:60px;" required="required">

	<option class="atslc" value="出席">出席</option>
	<option class="atslc" value="欠席">欠席</option>
	<option class="atslc" value="遅刻">遅刻</option>
	<option class="atslc" value="早退">早退</option>

	</select>
	</td></tr>

	<tr id="tr_reason" style="display: none;">
	<th>
	  備  考  ：<span style="background-color: red; color: white; padding:1px 2px; border-radius:5px;">必須</span></th>
	  <td>
	<textarea id="reason" name="reason"  rows="6" cols="40"  maxlength="200" placeholder="(例）病気のため欠席、電車遅延のため10分遅刻など" disabled="disabled"></textarea>
	</td></tr>

	<tr style="display: none;"><!-- 日時のデータ送信用 選択させないため非表示 -->
	        <th>  日  時  ：</th>
	        <td>
	        <select style="width: 60px;" name="atYear" id="id_year" data-choice="year" required="required"></select>
	        <span style="margin-left: 3px; margin-right: 5px; display: inline-block;">年</span>

	        <select style="width: 45px;" name="atMonth" id="id_month" data-choice="month" required="required"></select>
	        <span style="margin-left: 3px; margin-right: 5px; display: inline-block;">月</span>

	        <select style="width: 45px;" name="atDay" id="id_day" data-choice="day" required="required"></select>
	        <span style="margin-left: 3px; margin-right: 5px; display: inline-block;">日</span>
	        </td></tr>
	        <tr>

	</table>
<div align="center"><font color="red"><s:property value="errorMsg" /></font></div>
<br>
	<input type="submit"  value="送信" class="button" onClick="javascript:double(this)"/>

	</s:form>

	</s:if>
	<s:else>
	ログイン後に表示します。
	</s:else>
	</div>

<script src="js/jquery.ymdpulldown.js"></script>
<script>
$(function() {
  $("#id_year").ymdpulldown({
                startyear:2016,
              });
  $("#id_month").ymdpulldown();
  $("#id_day").ymdpulldown();
});

</script>
 <jsp:include page="footer.jsp" />
</body>
</html>