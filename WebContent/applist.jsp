
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" >
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<link rel="stylesheet" href="css/applist.css">
<title>Open Connect</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/applist.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="header.jsp" />

  <!--]

    <div class="container">
      <h1 class="page-header">アプリ一覧</h1>
	  <s:iterator value="siteInfoList">
          <ul>
            <s:a href="%{siteUrl}">
              <h1><s:property value="siteName" /></h1>
            </s:a>
          </ul>
      </s:iterator>
      <s:property value="notLoginMsg" />
	</div>


<!-- 画像スライドショー -->
<!--<s:property value="#session.userFlg"/> -->
<div class="container" align="center">
<div class="topslide">


<img id="idshow2" class="fadein" src="img/sity.jpg">
</div>

<script type="text/javascript"><!--
myChange();
// --></script>



<!-- 天気予報  -->
<div id="table-scroll">
<table>
<tr>
<td><div class="mamewaza_weather"><div><div class="mamewaza_weather_exp"><span class="mamewaza_assembled"></span></div></div></div><script type="text/javascript" src="https://mamewaza.net/weather.js?151209"></script>
<script type="text/javascript">mamewaza_weather({layout:"horizontalMini",when:"7days",explanation:false,region:"130010",style:"div.mamewaza_weather > div{background:transparent;padding:10px;font-size:14px;}div.mamewaza_weather th,div.mamewaza_weather td,div.mamewaza_weather div.mamewaza_weather_exp{padding:10px;}div.mamewaza_weather th,div.mamewaza_weather td{border-top:border-bottom:1px dashed #eeeeee;border-image-width:0 0 1;;border-bottom:border-bottom:1px dashed #eeeeee;border-image-width:0 0 1;;}div.mamewaza_weather,div.mamewaza_weather a{color:#000;}div.mamewaza_weather span.mamewaza_weather_icon{color:inherit;font-size:36px;text-shadow:none;}div.mamewaza_weather div.mamewaza_weather_exp,div.mamewaza_weather div.mamewaza_weather_exp a{color:#000000;font-size:12px;}div.mamewaza_weather td.mamewaza_weather_sat,div.mamewaza_weather td.mamewaza_weather_sat span.mamewaza_weather_icon{color:#00f;}div.mamewaza_weather td.mamewaza_weather_sun,div.mamewaza_weather td.mamewaza_weather_sun span.mamewaza_weather_icon{color:#f00;}"})
</script></td>
</tr>
</table>
</div>


<BR>


</div><BR><BR>
 <jsp:include page="footer.jsp" />

</body>
</html>