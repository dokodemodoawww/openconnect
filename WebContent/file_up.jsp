<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>資料添付</title>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="header.jsp" />
</head>
<body>

            <h2 align="center">資料添付</h2>
<s:form action="DecisionFileUpdateAction" method="post" enctype="multipart/form-data">
<div align="center">
    <div>
    <label>資料名</label><br />
    <input type="text" class="text" size="25" name="documentName" required="required" placeholder="資料名" />
  </div>
  <br><br>
     <div>
    <label>資料ファイル</label><br />
    <input type="file" size="35"name="myFile" required="required" multiple="multiple" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
  </div>
   <div>
  <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
   <input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
 <input type="submit" class="submit" value="資料を追加する" />
 </div>
  </div>
</s:form>


<div align="center">
<s:property value="%{resultString}" />
</div>
		<h2 align="center">資料削除</h2>
<s:form action="DecisionFileDeleteAction">
<div align="center">
  <div>
    <label>資料名</label><br />
    <input type="text" class="text" size="25" name="documentName" required="required" placeholder="資料名" />
  </div>
  <div>
   <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
   <input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
  <input type="submit" class="submit" value="資料を削除する" />
  </div>
  </div>
</s:form>

<br><br>
<!-- 戻る -->
	<s:form action="DecisionSelectAction">
		<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
		<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
		<input type="submit" class="button" value="戻る">
	</s:form>

<br><br>

<jsp:include page="footer.jsp" />


</body>
</html>