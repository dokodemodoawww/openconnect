<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/Bfooter.css">

<style>
.footerActive {
	background-color: rgba(255, 255, 255, 0.6);
	border-style:solid;
	color:rgba(50, 50, 50, 0.6);
}
</style>


</head>
<body>

	<%
		String fileName = request.getServletPath().toString();
	%>



	<footer>



	<div class="color" style ="background-color:<s:property value="#session.fColor"/>;">
			<nav>
				<div class="contents">
					<div id="link"
						<%if (fileName.endsWith("/profile.jsp")) {
				out.print(" class=\"a footerActive\" ");
			} else {
				out.print(" class=\"a\" ");
			}%>
						style="margin-right: 20px">
						<a
							href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>"><img
							class="pic" src="pic/profile.png"></a>
					</div>

					<div id="link"
						<%if (fileName.endsWith("/TalkMember.jsp")) {
				out.print(" class=\"a footerActive\" ");
			} else {
				out.print(" class=\"a\" ");
			}%>
						style="margin-right: 20px">
						<a href="<s:url action="GoTalkListAction"/>"><img class="pic"
							src="pic/talk.png"> <s:if
								test="talkInfo > 0 and talkInfo <100">
								<span class="b"><s:property value="talkInfo" /></span>
							</s:if> <s:if test="talkInfo >= 100 and talkInfo <1000">
								<span class="bh"><s:property value="talkInfo" /></span>
							</s:if> <s:if test="talkInfo >= 1000">
								<span class="bt"><s:property value="talkInfo" /></span>
							</s:if> </a>
					</div>

					<div id="link"
						<%if (fileName.endsWith("/group.jsp")) {
				out.print(" class=\"a footerActive\" ");
			} else {
				out.print(" class=\"a\" ");
			}%>
						style="margin-right: 20px">
						<a href="<s:url action="GoGroupAction"/>"><img class="pic"
							src="pic/group.png"> <s:if
								test="groupInfo > 0 and groupInfo <100">
								<span class="b"><s:property value="groupInfo" /></span>
							</s:if> <s:if test="groupInfo >= 100 and groupInfo <1000">
								<span class="bh"><s:property value="groupInfo" /></span>
							</s:if> <s:if test="groupInfo >= 1000">
								<span class="bt"><s:property value="groupInfo" /></span>
							</s:if> </a>
					</div>

					<div id="link"
						<%if (fileName.endsWith("/timeline.jsp")) {
				out.print(" class=\"a footerActive\" ");
			} else {
				out.print(" class=\"a\" ");
			}%>>
						<a href="<s:url action="GoTimelineAction"/>"><img class="pic"
							src="pic/time_line.png"></a>
					</div>
				</div>
			</nav>
		</div>


	</footer>
</body>
</html>
