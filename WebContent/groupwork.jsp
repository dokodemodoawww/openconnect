<%@ taglib prefix = "s" uri= "/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BBS sample</title>

    <link rel="stylesheet" href="css/normarize.css">
    <link rel="stylesheet" href="css/groupwork.css">

    </head>

    <body>
        <header>
    <h2>掲示板一覧</h2>
        </header>
    <div class="main container">
        <div class="groupcreate">グループ名：<input type="text" class="group_form" style="row:10; col:30;"></div>
        <div class="form-group">
<label for="exampleInputFile">画像アップ</label>
<input type="file" id="exampleInputFile"/></div>
       <s:form action="GroupworkAction">
            <s:submit value="作成する" name="value" />
            </s:form>

        <hr>



        <div class="group">
            <table class="grouptext">
                <tr align="center">
                <th><s:text name="イメージ画像"/></th>
                <th><s:text name="グループ名" /></th>
                <th><s:text name="人数" /></th>

                </tr>


                <s:if test="%{!groupList.isEmpty()}">
                <s:iterator value="groupList">

                <tr>

                    <td><a href="group.jsp"><s:property value="groupIcon" /></a></td>
                    <td><a href="group.jsp"><s:property value="groupName" /></a></td>
                    <td><a href="group.jsp"><s:property value="groupId" /></a></td>


                </tr>
                </s:iterator>
</s:if>
                <s:else>
                    <div class="message wrapper">グループなし</div>
                    </s:else>
                <tr><td>a</td><td>a</td><td>a</td></tr>
                <tr><td>a</td><td>a</td><td>a</td></tr>
            </table>


    </div>


    <footer>

	<s:include value="Bfooter.jsp" />
        </footer>
        </div>
    </body>
</html>