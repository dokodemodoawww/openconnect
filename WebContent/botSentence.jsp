<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>botくんメンテナンス</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Stylesheet
    ================================================== -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-7tY7Dc2Q8WQTKGz2Fa0vC4dWQo07N4mJjKvHfIGnxuC4vPqFGFQppd9b3NWpf18/" crossorigin="anonymous">
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" href="css/Bfooter.css">
	<link rel="stylesheet" href="css/jquery.bootgrid.min.css">


	<!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js" integrity="sha384-oFMgcGzKX7GaHtF4hx14KbxdsGjyfHK6m1comHjI1FH6g4m6qYre+4cnZbwaYbHD" crossorigin="anonymous"></script>
<s:if test="sentences==null" >
	<script src="js/jquery.bootgrid.js"></script>
</s:if>
<s:else>
	<script src="js/jquery.bootgrid.min.js"></script>
</s:else>
	<script>
$(function() {
	$("#grid-basic").bootgrid();
});
</script>
</head>

<body>
<header><jsp:include page="botHeader.jsp" /></header>


<div class="outline">
<br>

<!-- 学習マスターの画面 -->
<s:if test="sentences==null" >
<h3>覚えさせた文章</h3>
<s:form action="BotSearchAction" name="form">
<table id="grid-basic" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="id" data-type="numeric">ID</th>
            <th data-column-id="labels">要約</th>
            <th data-column-id="time" data-order="desc">覚えさせた日</th>
        </tr>
    </thead>
    <tbody>
    <s:iterator value="masterList">
        <tr>
            <td><s:property value="sentenceId"/></td>
            <td><s:property value="label"/></td>
            <td><s:property value="(createdAt.substring(0,19))"/></td>
        </tr>
        </s:iterator>
    </tbody>
</table>
</s:form>
</s:if>

<!-- 詳細の画面 -->
<s:else>
<h3><s:property value="label"/></h3>

<button class="btn btn-danger" data-toggle="modal" data-target="#sentenceDelete">文章を忘れさせる</button>
	<!-- 削除の確認画面 -->
		<div class="modal fade" id="sentenceDelete" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
						<h4 class="modal-title">文章を忘れさせる</h4>
					</div>
					<s:form action="BotSentenceDeleteAction">
						<div class="modal-body">
							この文章すべて忘れます。戻すことはできません。よろしいですか？
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
							<s:hidden theme="simple" name="sentenceId" value="%{sentenceId}"></s:hidden>
							<button type="submit" class="btn btn-danger">削除</button>
						</div>
					</s:form>
				</div>
			</div>
		</div>

<table id="grid-basic" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="id">単語</th>
            <th data-column-id="sender">単語の基本形</th>
            <th data-column-id="speech">品詞</th>
            <th data-column-id="dictionary">辞書に載ってるか</th>
        </tr>
    </thead>
    <tbody>
    	<s:iterator value="masterList" >
        <tr>
            <td><s:property value="word"/></td>
            <td><s:property value="parts"/></td>
            <td><s:property value="partOfSpeech"/></td>
            <td><s:property value="dictionary"/></td>
        </tr>
        </s:iterator>
    </tbody>
</table>
</s:else>


</div>

</body>
</html>