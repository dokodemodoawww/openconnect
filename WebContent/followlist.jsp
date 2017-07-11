<%@ taglib prefix = "s" uri= "/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>フォロー一覧</title>

    <link rel="stylesheet" href="css/normarize.css">
    <link rel="stylesheet" href="css/follow.css">

    </head>

    <body>

    <h2>フォロー一覧</h2>




        <hr>



        <div class="follow">
            <div class="followtext">



                <s:iterator value="followList">

					<div class="friends-container">
                    <a href="<s:url action="ProfileAction"/>"><div class="imgp"><img src="<s:property value="userIcon"/>" alt="" width="50" height="50"></div>
                    <a class="nameposition"><s:property value="userName"/></a><p>Lv:<s:property value="lv " /></p></a></div>


                   </s:iterator>


                <s:else>
                    <div class="message wrapper">グループなし</div>
                    </s:else>




    </div>


    <footer>
        <s:include value="Bfooter.jsp"/>
        </footer>
        </div>
    </body>
</html>