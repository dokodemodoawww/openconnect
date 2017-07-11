<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>トーク一覧</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Stylesheet
    ================================================== -->
	<link rel="stylesheet" href="css/bootstrap.css" />
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" href="css/group.css">
	<link rel="stylesheet" href="css/Bfooter.css">


	<!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/toast.js"></script>
	<s:iterator value="msgList" >
	<script type="text/javascript">
		$(function(){
			var toast = new Toast();
			var msg = "<s:property value="msg"/>";
			if(msg != ""){
				toast.show(msg);
			}

		});
	</script>
	</s:iterator>
		<script type="text/javascript">
  setTimeout("location.reload()", 1000 * 60)
</script>

</head>

<body style="background-color:<s:property value="#session.bColor"/>;">
<br>
<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container-fluid" style ="background-color:<s:property value="#session.hColor"/>;">
  <div class="navbar-header">
  <a class="navbar-brand" href="applist.jsp">Openconnect</a>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#gnavi">
      <span class="sr-only">メニュー</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
  </div>

  <div id="gnavi" class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#groupAdd" class="cursor">友達を探す</a></li>
    </ul>
  </div>
  </div>
</nav>

<!-- モーダル・ダイアログ -->
<div class="modal fade" id="groupAdd" tabindex="-1">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
				<h4 class="modal-title">友達を検索する</h4>
			</div>
			<s:form action="FriendSearchAction">
			<s:hidden name="viewId"></s:hidden>
			<div class="modal-body">
				<input type="text" name="userName" maxlength="50" required placeholder="名前を入力してください" class="groupName">
			</div>
			<div class="modal-footer">
				<s:token/>

				<button type="submit" class="btn btn-primary" >検索</button>

				<div class="modal fade" id="sampleModal" tabindex="-1">
					<div class="modal-dialog">

					</div>
				</div>

			</div>
			</s:form>
		</div>
	</div>
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-1 visible-lg-block"></div>

    <div class="col-sm-10">
    <div class = "outline">
<s:iterator value="talkList" >
	<s:form action="GoChatAction">
	<s:hidden theme="simple" name="receiverId" value="%{receiverId}"></s:hidden>
	<s:hidden name="receiverName" value="%{groupName}"></s:hidden>
	<button type="submit" class="group">
	<img src="<s:property value="groupIcon"/>"   alt="" class="img-circle-ex">
	<h3><s:property value="groupName"/></h3>
	<p><s:property value="text" /></p>

	<s:if test="notRead > 0 and notRead<100">
	<span class="tell"><s:property value="notRead" />
	</span></s:if>
	<s:if test="notRead>=100">
	<span class="tellOver">100~
	</span></s:if>
	</button>
	</s:form>
</s:iterator>
<s:if test="talkList.size()==0"><div style="position:fixed;top:40%;textalign:centger;"><a data-toggle="modal" data-target="#groupAdd" class="cursor">相互フォロワーがいません。<br>友達を追加しましょう。</a></div>
</s:if>
</div>
    </div>

    <div class="col-sm-1 visible-lg-block"></div>
  </div>
</div>

<jsp:include page="Bfooter.jsp" />
<!--
<footer>
<div  class = "footer">
 <nav>
 <div class = "contents" >
 <div class="a" style="margin-right:20px"><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>"><img class="pic" src ="pic/profile.png" ></a></div>

 <div class="a" style="margin-right:20px; background-color:rgb(111, 207, 245);"><a href="<s:url action="GoTalkListAction"/>"><img class="pic" src ="pic/talk.png" >
 <s:if test="talkInfo > 0 and talkInfo <100"><span class="b"><s:property value="talkInfo" /></span></s:if>
 <s:if test="talkInfo >= 100 and talkInfo <1000"><span class="bh"><s:property value="talkInfo" /></span></s:if>
 <s:if test="talkInfo >= 1000"><span class="bt"><s:property value="talkInfo" /></span></s:if>
 </a></div>

 <div class="a" style="margin-right:20px" ><a href="<s:url action="GoGroupAction"/>"><img class="pic" src ="pic/group.png" >
 <s:if test="groupInfo > 0 and groupInfo <100"><span class="b"><s:property value="groupInfo" /></span></s:if>
 <s:if test="groupInfo >= 100 and groupInfo <1000"><span class="bh"><s:property value="groupInfo" /></span></s:if>
 <s:if test="groupInfo >= 1000"><span class="bt"><s:property value="groupInfo" /></span></s:if>
 </a></div>

 <div class="a"><a href="<s:url action="GoTimelineAction"/>"><img class="pic" src ="pic/time_line.png" ></a></div>
 </div>
 </nav>
 </div>
</footer>
 -->
</body>
</html>