<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>受講生一覧</title>
<link rel="stylesheet" href="css/student_list.css">
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>


<body>

 <header><s:include value="header.jsp" /></header>

 <!-- 最終的にログイン状態じゃないと見れないようにする -->

 <div class= "main">

		<h1>受講生一覧</h1>



              <div class= "search-feild">

              <s:form method= "" action= "">
              <select name= "year">
              <option value= "">-選択してください-</option>
              <option value= "yaer">2017</option>
              <option value= "year" >2018</option>
              <option value= "year">2019</option>
              </select>
              年
              <select name="month">
              <option value= "">-選択してください-</option>
              <option value= "jan">1</option>
              <option value= "feb">2</option>
              <option value= "mar">3</option>
              <option value= "apr">4</option>
              <option value= "may">5</option>
              <option value= "jun">6</option>
              <option value= "jul">7</option>
              <option value= "aug">8</option>
              <option value= "sep">9</option>
              <option value= "oct">10</option>
              <option value= "nob">11</option>
              <option value= "dec">12</option>
              </select>
              月生
              <input type= "submit" value= "表示">
              </s:form>

              </div>






<s:iterator value= "studentsList">







</s:iterator>










</div>


 <footer><s:include value="footer.jsp" /></footer>


</body>
</html>