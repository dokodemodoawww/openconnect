<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>プロフィール</title>

<link rel="stylesheet" href="css/normarize.css">
<link href="css/bootstrap2.css" rel="stylesheet">
<link rel="stylesheet" href="css/prof.css">
<link rel="stylesheet" href="css/Bfooter.css">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="css/imgList.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript" src="js/jscolor.js"></script>

</head>
<body style="background-color:<s:property value="#session.bColor"/>;">

  <!-- ヘッダー -->
  <s:if test="%{#session.userId == viewId}">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid"
        style="background-color:<s:property value="#session.hColor"/>;">
        <div class="navbar-header">

          <a class="navbar-brand" href="applist.jsp">Openconnect</a>
          <a class="talk_area" href="watch-position.jsp"><img src="pic/map_print.png"></a>
          <a class="talk_area" href="web_speech.jsp"><img src="pic/user_icon/syoki.png"></a>
          <a class="talk_area" data-toggle="modal" data-target="#color" class="cursor"><img src="pic/peint.png"></a>



          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#gnavi">
            <span class="sr-only">MENU</span> <span class="icon-bar"></span>
            <span class="icon-bar"></span> <span class="icon-bar"></span>
          </button>
        </div>


        <div id="gnavi" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a data-toggle="modal" data-target="#sampleModal3" class="cursor">EDIT</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </s:if>
  <s:else>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="applist.jsp">Openconnect</a>
        </div>
      </div>
    </nav>

  </s:else>
  <!-- ヘッダーここまで -->

  <hr>
  <div align="center" style="clear: both;">
    <BR>
    <BR>
    <h1 class="name">Profile</h1>

    <s:iterator value="myData">

      <BR>
      <table>
        <tr>
          <td>
            <div class="profile">
              <figure style="margin-left: 5%;" style="clear:both;">
                <img src="<s:property value="userIcon"/>"
                  class="border_radius" alt="">
                <div align="center">
                  <div class="fontsize">
                    <s:property value="userName" />
                  </div>
                </div>
              </figure>
              <s:if test="userId==-1">
                <a href="botMaintenance.jsp">メンテナンスページへ</a>
              </s:if>
            </div> <!-- フォロー・削除ボタン -->


            <div align="center">
              <s:if test="checkValue==1">
                <div class="square_btn">
                  <a
                    href="<s:url action="UnfollowAction"><s:param name="viewId" value="%{userId}"/></s:url>">
                    REMOVE</a>
                </div>
              </s:if>



              <s:else>
                <s:if test="%{#session.userId != userId}">

                  <div class="square_btn">
                    <a
                      href="<s:url action="FollowListSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>">
                      FOLLOW</a>
                  </div>
                </s:if>
              </s:else>
            </div>
          </td>

          <td>
            <ul class="myData">
              <li><button type="button"
                  style="font-size: 0.8em; font-weight: bold; padding: 10px, 30px; margin-left: 10px; margin-right: 7px; background-color: #6495ed; color: #fff;"
                  data-toggle="modal" data-target="#sampleModal">
                  Follow:
                  <s:property value="followNum" />
                </button></li>
              <li><button type="button"
                  style="font-size: 0.8em; font-weight: bold; padding: 10px, 30px; margin-left: 5px; margin-right: 5px; background-color: #6495ed; color: #fff;"
                  data-toggle="modal" data-target="#sampleModal2">
                  Follower:
                  <s:property value="followerNum" />
                </button></li>
              <li><p
                  style="font-weight: bold; text-align: center; font-size: 1.2em;">
                  EXP:
                  <s:property value="point" />
                </p></li>
              <li><p
                  style="font-weight: bold; text-align: center; font-size: 1.2em;">
                  LV:
                  <s:property value="Lv" />
                </p></li>
            </ul>

          </td>
        </tr>
      </table>
      <BR>
      <BR>
      <div class="textarea" style="width: 40%;">
        <h3 class="fontsize" style="border-bottom: solid 1px black;">BIO</h3>
        <div class="fontsize2">
          <pre>
            <s:property value="profile" />
          </pre>
        </div>
      </div>
    </s:iterator>


    <!-- モーダル・ダイアログ -->

    <div class="modal fade" id="sampleModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span>×</span>
            </button>
            <h4 class="modal-title">Follow</h4>
          </div>

          <div class="modal-body">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="form-group" style="float: left;">

                  <!-- フォローリストモーダル -->


                  <s:iterator value="followList">
                    <div class="friends-container">

                      <a
                        href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>"><BR>
                        <img src="<s:property value="userIcon"/>"
                        style="height: 50px; width: 50px;"
                        class="border_radius" alt="" width="50"
                        height="50"> <s:property value="userName" />
                        Lv:<s:property value="lv " /> </a>
                    </div>
                  </s:iterator>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- モーダル・ダイアログ -->

    <div class="modal fade" id="sampleModal2" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span>×</span>
            </button>
            <h4 class="modal-title">Follower</h4>
          </div>

          <div class="modal-body">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="form-group" style="float: left;">


                  <!-- フォロワーリストモーダル -->
                  <s:iterator value="followerList">
                    <div class="friends-container">

                      <a
                        href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>"><BR>
                        <img src="<s:property value="userIcon"/>"
                        style="height: 50px; width: 50px;"
                        class="border_radius" alt="" width="50"
                        height="50"> <s:property value="userName" />
                        Lv:<s:property value="lv " /> </a>
                    </div>
                  </s:iterator>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- モーダル・ダイアログ -->
    <div class="modal fade" id="sampleModal3" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span>×</span>
            </button>
          </div>





          <s:iterator value="myData">

            <BR>
            <table>
              <tr>
                <td>
                  <div class="profile">

                    <img src="<s:property value="myData.userIcon"/>"
                      class="edit_border_radius" alt="" /><br> <a
                      data-toggle="modal" class="cursor"
                      data-target="#userImageChange">アイコン画像変更</a>

                    <!-- アイコン画像変更画面 -->
                    <div class="modal fade" id="userImageChange"
                      tabindex="-1">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close"
                              data-dismiss="modal">
                              <span>&times;</span>
                            </button>
                            <h4 class="modal-title">画像を変更する</h4>
                          </div>
                          <s:form action="UpdateUserIconAction">
                            <div class="modal-body">
                              <s:iterator value="userIconList"
                                status="rs">
                                <s:if test="%{#rs.count%2==0}">
                                  <div style="float: left">
                                    <input type="radio" name="userIcon"
                                      value="<s:property value="userIcon"/>"
                                      style="background:url(./<s:property value="userIcon"/>);background-size:100% 100%;">
                                  </div>
                                </s:if>
                                <s:else>
                                  <div
                                    style="float: left; background-color: #dddddd;">
                                    <input type="radio" name="userIcon"
                                      value="<s:property value="userIcon" />"
                                      style="background:url(./<s:property value="userIcon"/>);background-size:100% 100%;">
                                  </div>


                                </s:else>
                              </s:iterator>
                              <div style="clear: both"></div>
                            </div>
                            <s:hidden name="userId" />
                            <div class="modal-footer">

                              <button type="submit"
                                class="btn btn-primary">変更</button>
                            </div>
                          </s:form>
                        </div>
                      </div>
                    </div>
                  </div>


                </td>


                <td>

                  <ul class="myData">
                    <li><button type="button" disabled="disabled"
                        style="font-size: 0.8em; font-weight: bold; text-align: center; background-color: #6495ed; color: #fff;"
                        data-toggle="modal" data-target="#sampleModal">
                        Follow:
                        <s:property value="followNum" />
                      </button></li>
                    <li><button type="button" disabled="disabled"
                        style="font-size: 0.8em; font-weight: bold; text-align: center; background-color: #6495ed; color: #fff;"
                        data-toggle="modal" data-target="#sampleModal2">
                        Follower:
                        <s:property value="followerNum" />
                      </button></li>
                    <li><p
                        style="font-weight: bold; text-align: center; font-size: 1.2em;">
                        EXP:
                        <s:property value="point" />
                      </p></li>
                    <li><p
                        style="font-weight: bold; text-align: center; font-size: 1.2em;">
                        LV:
                        <s:property value="Lv" />
                      </p></li>
                  </ul>

                </td>
              </tr>
            </table>


            <BR>
            <BR>

            <s:form action="SendProfileAction" name="tlSend"
              onSubmit="return check()" id="tl">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="form-group" style="float: left;">
                    <textarea name="profile" class="form-control"
                      rows="7" cols="80%" maxlength="255"
                      style="list-area: none; resize: none;"><s:property
                        value="profile" /></textarea>
                    <BR>
                    <button class="btn btn-primary" type="submit">UPDATE</button>
                    <!-- class="btn btn-primary" -->
                  </div>
                </div>
              </div>
            </s:form>
          </s:iterator>



        </div>
      </div>
    </div>















    <!-- カラーピッカーモーダル -->

    <div class="modal fade" id="color" tabindex="-1">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              <span>×</span>
            </button>
            <h3 class="modal-title">カラー変更</h3>
          </div>
          <div class="modal-body">
            <s:form action="ColorChangeAction">
              <div class="form-group">
                <label style="width: 200px;">ヘッダー</label> <input
                  class="jscolor  {hash:true}" name="ColorH"
                  value="<s:property value="#session.hColor"/>">

              </div>

              <div class="form-group">
                <label style="width: 200px;">ボディ</label> <input
                  class="jscolor  {hash:true}" name="ColorB"
                  value="<s:property value="#session.bColor"/>">

              </div>

              <div class="form-group">
                <label style="width: 200px;">フッター</label> <input
                  class="jscolor  {hash:true}" name="ColorF"
                  value="<s:property value="#session.fColor"/>">

              </div>

              <button type="submit">送信</button>
            </s:form>


            <s:form action="ColorDefaultAction">
              <button type="submit">リセット</button>
            </s:form>




          </div>
        </div>
      </div>
    </div>










    <br> <br> <br> <br>
    <jsp:include page="Bfooter.jsp" />
    <!--

    <footer>
      <div  class = "footer">
 <nav>
 <div class = "contents" >
 <div class="a" style="margin-right:20px; background-color:rgb(111, 207, 245);"><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{userId}"/></s:url>"><img class="pic" src ="pic/profile.png" ></a></div>

 <div class="a" style="margin-right:20px"><a href="<s:url action="GoTalkListAction"/>"><img class="pic" src ="pic/talk.png" >
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
  </div>

</body>
</html>