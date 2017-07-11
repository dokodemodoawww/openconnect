<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <!-- ▼▼Stylesheet -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/groupMember.css">
    <!-- ▼▼jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- ▼▼他のjavascript -->
    <script src="js/bootstrap.min.js"></script>
    
    <script>
    // 読み込みが完了してから処理を行う
    $(window).on('load resize',function(){
      // 親画面のiframe要素
      var elm = window.parent.document.getElementById("groupMember");
      // 子要素のコンテンツサイズに合わせて調整
      elm.style.height = document.body.clientHeight + 20 + "px";
    });
    </script>
  </head>
  <body>
    <s:iterator value="memberList" status="i">
      <a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="memberList.get(#i.index).userId"/></s:url>" target="_top">
      <img src="<s:property value="memberList.get(#i.index).userIcon"/>" class="img-circle-ex"></a>
    </s:iterator>
  </body>
</html>