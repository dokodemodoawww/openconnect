<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<title>勤怠更新</title>

<script src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/attendance.js"></script>
<link rel="stylesheet" href="css/attendance.css">
</head>
<body>
	<!-- ヘッダー-->
	<jsp:include page="header.jsp" />

	<div class="container">

	<h1>勤怠更新</h1>

	<s:if test="%{#session.userFlg >= 1}">
	<br>
	<br>
	<s:form action="AttendanceSelectAction">

受講年を入力<input type="text" name="year" placeholder="例：2016" class="textString" value="2016" maxlength="4" pattern="[1-9][0-9]*" title="半角数字4桁以内">
		<br>
		<br>
受講開始月を入力<input type="text" name="month" placeholder="例：07" class="textString" maxlength="2" pattern="[0-1][0-9]" title="半角数字2桁以内">
		<br>
		<br>
日付を入力(入力必須)<input type="text" name="attendanceDate" placeholder="例：2016/08/19" class="textString" maxlength="10" value="2016/" required>
		<br>
		<br>
姓を入力(ひらがな)<input type = "text" name="familyName" placeholder="例：いとう" class="textString" maxlength="50">

名を入力(ひらがな)<input type = "text" name="givenName" placeholder="例：ふみふみ" class="textString" maxlength="50">
		<br>
		<s:submit value="検索" class="button" />
	</s:form>
	<br>
	<s:property value="%{resultString}" />
	<s:property value="%{resultSelect}" />
	<br>
	<s:if test="%{attendanceList.size() > 0}">
	<s:if test="%{#session.userFlg == 3}">
	<table border="1">
		<tr>
			<td><div class="smallWidth">0</div></td>
			<td><div class="smallWidth">1</div></td>
			<td><div class="middleWidth">2</div></td>
			<td><div class="middleWidth">3</div></td>
			<td><div class="middleWidth">4</div></td>
			<td><div class="middleWidth">5</div></td>
			<td><div class="smallWidth">6</div></td>
			<td>　</td>
			<td><div class="smallWidth">1</div></td>
			<td><div class="smallWidth">2</div></td>
		</tr>
		<tr>
			<td>未入力</td>
			<td>出席</td>
			<td>遅刻(連絡有)</td>
			<td>遅刻(連絡無)</td>
			<td>欠席(連絡有)</td>
			<td>欠席(連絡無)</td>
			<td>連絡無し</td>
			<td>　</td>
			<td>面談有</td>
			<td>面談無</td>
		</tr>
	</table>
	<br>

	↓勤怠未入力(0が入っている)人には、あらかじめ1(出席)が入力されており<br>
	このまま更新を押すと表示されている全ての人に1(出席)が保存されます。<br>
	</s:if>
	<br>
	<s:form action="AttendanceUpdateAction">
		<table border="1">
				<tr>
					<th>日付</th>
					<th>ID</th>
					<th><div class="smallWidth">受講年</div></th>
					<th><div class="middleWidth">受講開始月</div></th>
					<th><div class="smallWidth">姓</div></th>
					<th><div class="smallWidth">名</div></th>
					<th><div class="smallWidth">出席状況</div></th>
					<th><div class="middleWidth">出席状況入力</div></th>
					<th><div class="smallWidth">面談</div></th>
					<th><div class="middleWidth">面談入力</div></th>
				</tr>
			<s:else>
				<s:property value="%{errorSelect}" />
			</s:else>
			<s:iterator value="attendanceList">
				<tr>
					<td><s:property value="date"/></td>
					<td><s:property value="userId"/></td>
					<td><s:property value="year" /></td>
					<td><s:property value="month" /></td>
					<td><s:property value="familyNameKanji" /></td>
					<td><s:property value="givenNameKanji" /></td>
					<td><s:property value="attendanceString" /></td>
					<td><div class="middleWidth"><input type="text" name="attendance" value="<s:property value="attendance"/>" class="textMax" pattern="[0-6]" title="半角数字0～6" required></div></td>
					<td><s:property value="interviewString" /></td>
					<td><div class="middleWidth"><input type="text" name="interview" value="<s:property value="interview"/>" class="textMax" pattern="[0-2]" title="半角数字0～2" required></div></td>
				</tr>
				<input type="hidden"  name="date" value="<s:property value="date"/>">
				<input type="hidden" name="userId" value="<s:property value="userId"/>">
			</s:iterator>
		</table>
		<br>
		<s:if test="%{#session.userFlg == 3}">
		<s:submit value="更新" class="button" align="left"/>
		</s:if>
	</s:form>
	</s:if>
	<br>
	<s:if test="%{#session.userFlg == 3}">
	<h1>受講生の勤怠データ追加</h1>
			例：2016　09　と入力した場合、9/1～9/30の、7月生～9月生全員のデータが追加されます。<br>
			<br>
			追加する年月を入力<br>
			※正しく入力しないと「追加」ボタンを押せません。<br>
			年<input type="text" class="inputYear" placeholder="例：2016" maxlength="4" required><br>
			月<input type="text" class="inputMonth" placeholder="例：08" maxlength="2" required>
			<input type="button" value="追加" class="modal-open"/>
	</s:if>
	<br>
	<br>

	<!-- 		追加モーダル -->
	<div id="modal-main">
		入力した年月：<div id="year"></div>年<div id="month"></div>月
		<br>
		<br>
		追加を押すと上記の年月に、<br>
		過去3ヶ月分のユーザーのデータが追加されます。<br>
		(少し時間がかかります)
		<br>
		<s:form action="AttendanceInsertAction">
			<input type="hidden" name="year" value="" id="attendanceYear">
			<input type="hidden" name="month" value="" id="attendanceMonth">
			<s:submit class="delete-true button" value="追加" />
		</s:form>
		<input type="button" class="modal-close button" value="閉じる">
	</div>

	</s:if>
	<s:else>
	ログイン後に表示します。
	</s:else>

	<s:form action="GetAddressAction">
		<s:submit value="戻る" class="button" />
	</s:form>

	</div>
</body>
</html>