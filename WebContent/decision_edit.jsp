<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<LINK rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/sendCheck.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
<title>決裁編集</title>
</head>
<body>

	<jsp:include page="header.jsp" />
<br>
	<s:form action="BackGoDecisionAction">
<input type="submit" value="戻る" class="button">
</s:form>

<s:if test="%{#session.userFlg >= 1}">
<h1>決裁手続き編集画面</h1>
	<s:property value="%{resultString}"/>
	<s:property value="%{resultSelect}" />
<s:iterator value="decisionDetailList">


<table border="1"><tr><td>
パスワード変更
<s:form action="PasswordUpdateAction">
<input type="hidden" name="decisionDetailId" value="<s:property value="decisionDetailId"/>">
<input type="text" name="password" value="<s:property value="password"/>" pattern="^[0-9A-Za-z]+$" placeholder="半角英数字のみ" maxlength="20" required>
<input type="submit" value="変更" class="button">
</s:form>

<br>
</td></tr></table>
<br>
<br>
<br>
<h1>【決裁書】</h1>
<s:form action="DecisionEditUpdateAction" method="post" enctype="multipart/form-data">

<table border="1">

<tr><td width="450">
プロジェクト名    <s:property value="projectName"/>
<br>
日付(入力形式 yyyy/mm/dd)<input type="text" name="day" value="<s:property value="day"/>"
								pattern="([0-2][0-9]{3})\/([0-1][0-9])\/([0-3][0-9])" placeholder="例：2016/09/10"  maxlength="10" value="2016/" required>
<br>
決裁分類
<br>

<s:if test="%{decisionType=='実施決裁'}">
<input type="radio" name="decisionType" value="実施決裁" checked>実施決裁
<input type="radio" name="decisionType" value="契約決裁">契約決裁
</s:if>
<s:else>
<input type="radio" name="decisionType" value="実施決裁" >実施決裁
<input type="radio" name="decisionType" value="契約決裁" checked>契約決裁
</s:else>

<br>
起案者ID<input type="text" name="userId" value="<s:property value="userId"/>"  maxlength="4" pattern="^[0-9]+$" title="半角数字4桁以内"  required>
<br>
案件名<input type="text" name="itemName" value="<s:property value="itemName"/>" size="50" placeholder="例：ECサイト（openconnect）の構築の実施について" maxlength="100">
<br>
概要<input type="text" name="summary" value="<s:property value="summary"/>" class="bigText" placeholder="例：受講生および受講生が行うプロジェクト等を管理するサイトを構築する。" maxlength="100">
<br>
理由<input type="text" name="cause" value="<s:property value="cause"/>" class="bigText" placeholder="例：受講生の出席状況やプロジェクトの進捗状況の管理を電子化" maxlength="100">
<br>
実施時期・実施機関
<br>
開始日(入力形式 yyyy/mm/dd)<input type="text" name="startDay" value="<s:property value="startDay"/>"
								pattern="([0-2][0-9]{3})\/([0-1][0-9])\/([0-3][0-9])" placeholder="例：2016/09/10"  maxlength="10" value="2016/" required>
<br>
終了日(入力形式 yyyy/mm/dd)<input type="text" name="endDay" value="<s:property value="endDay"/>"
								 placeholder="例：2016/09/10"  maxlength="10" value="2016/" required>
<br>
</td></tr></table>
<br>
<br>
<br>
<h1>【実施計画】</h1>
<table border="1"><tr><td>
資料
<br>
<input type="text" class="bigText" name="plan" value="<s:property value="plan"/>" placeholder="プロジェクト体制図・見積書" maxlength="200">
<br>
<input type="file" name="myFile" />
<input type="file" name="myFile" />
<input type="file" name="myFile" />
<s:property value="myFileFileName.get(0)"/><br>
<s:property value="myFileFileName.get(1)"/><br>
<s:property value="myFileFileName.get(2)"/><br>
が提出されました
</td></tr></table>
<br>
<br>
<br>
<h1>【見積書】</h1>
<table border="1"><tr><td>
人数<input type="text"name="persons" value="<s:property value="persons"/>" pattern="^[0-9]+$" maxlength="5" required>人
<br>
<input type="hidden" name="decisionDetailId" value="<s:property value="decisionDetailId"/>">
</td></tr>

</table>
<input type="submit" value="登録" class="button">
	</s:form>


</s:iterator>

<br>
</s:if>
<s:else>
ログイン後に表示します。
</s:else>

<s:form action="BackGoDecisionAction">
<input type="submit" value="戻る" class="button">
</s:form>
<jsp:include page="footer.jsp" />
</body>
</html>