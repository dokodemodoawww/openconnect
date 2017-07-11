<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri= "/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>タイムライン</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Stylesheet
    ================================================== -->
  <link href="css/bootstrap.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <link rel="stylesheet" href="css/style2.css">
  <link rel="stylesheet" href="css/timeline.css">
  <link rel="stylesheet" href="css/timeline.css" media="screen and (max-width:750px)">
  <link rel="stylesheet" href="css/Bfooter.css">

  <!-- Javascripts
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- ↓相対時刻を表示するプログラム↓ -->
  <script type="text/javascript" src="js/jquery_elapse.js"></script>
  <!-- ↓通知表示のプログラム↓ -->
  <script src="js/toast.js"></script>
  <!-- 自動リンクのプログラム -->
  <script src="js/autoLink.js"></script>
  <script type="text/javascript">
  <!--
  function check(){
  if(document.tlSend.sendContents.value == ""){
    window.alert('必須項目に未入力がありました');
    return false;
    }
    else{
      return true;
    }
  }
  // -->
  </script>
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
  </head>
<body style="background-color:<s:property value="#session.bColor"/>;">
<br><br>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid" style ="background-color:<s:property value="#session.hColor"/>;">
    <div class="navbar-header">
      <a class="navbar-brand" href="applist.jsp">Openconnect</a>
      <button type="button" class="send" data-toggle="modal" data-target="#sampleModal"><span class="glyphicon glyphicon-pencil"></span>  投稿</button>
      </div>
    </div>
</nav>

<div class="container">
  <div class="row">
  <!-- タイムラインの投稿フォーム -->
    <div class="modal fade" id="sampleModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
            <h4 class="modal-title">ポストを投稿する</h4>
          </div>

          <s:form action="SubmitPostAction" name="tlSend" onSubmit="return check()" id="tl">
            <div class="modal-body">
              <div class="panel panel-default">
                <div class="panel-body">
                    <textarea name="text" class="form-control" rows="10" cols="80%" maxlength="255" id="text"></textarea>
                  </div>
                  <div class="modal-footer">
                    <s:token/>
                    <button type="submit" class="btn btn-primary">送信</button>
                  </div>
              </div>
            </div>
          </s:form>
        </div>
      </div>
    </div>
  <!-- ここまで -->


  <div class="timeline" id="outline">
    <s:iterator value="timeline">
    <!-- 自分の投稿内容 -->
       <s:if test="userId==senderId" >
        <div class="post" style="<s:if test="userId==reUserId">background-color: #daeaec;</s:if> border-left: solid 6px #f5504b;/*左線*/;">
          <a href="#" data-toggle="modal" data-target="#timelineDelete<s:property value="postId"/>" id="deleteIcon"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
            <div class="timeimg">
              <a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
              <img src="<s:property value="userIcon"/>"   alt="" class="img-rounded-ex"></a>
            </div>
          <div class="timetext">
            <h4><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
            <s:property value="userName"/></a></h4>
            <span class="timeArea" title="<s:property value="(createdAt.substring(0,19))"/>"></span>
            <div class="glyphicon glyphicon-share-alt" aria-hidden="true" id="receive" data-toggle="modal" data-target="#timelineReceive<s:property value="postId"/>"></div>
            <div class="text">返信する</div>
            <div style="clear:both;"></div>
            <pre id="text"><s:property value="text" /></pre>
          </div>
          <div class="btn-area">
            <div style="text-align:right">
              <img src="pic/q.png" width= "13" height="13">x<s:property value="likeCount"/>
            </div>
          </div>

          <!-- 返信画面 -->
          <div class="modal fade" id="timelineReceive<s:property value="postId"/>" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                  <h4 class="modal-title">この投稿に返信する</h4>
                </div>
                <s:form action="SubmitPostAction">
                  <div class="modal-body">
                    <pre class="text"><s:property value="text" /></pre>
                    <textarea name="reText" class="form-control" rows="10" cols="80%" maxlength="205"></textarea>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
                    <s:hidden theme="simple" name="rePostId" value="%{postId}"></s:hidden>
                    <s:hidden theme="simple" name="reSnsId" value="%{snsId}"></s:hidden>
                    <button type="submit" class="btn btn-primary">投稿</button>
                  </div>
                </s:form>
              </div>
            </div>
          </div>


          <!-- 投稿削除の確認画面 -->
          <div class="modal fade" id="timelineDelete<s:property value="postId"/>" tabindex="-1">
            <div class="modal-dialog modal-sm">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                  <h4 class="modal-title">この投稿を削除します</h4>
                </div>
                <s:form action="DeletePostAction">
                  <div class="modal-body">
                    <pre class="text" id="text"><s:property value="text" /></pre>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
                    <s:hidden theme="simple" name="postId" value="%{postId}"></s:hidden>
                    <button type="submit" class="btn btn-danger">削除</button>
                  </div>
                </s:form>
              </div>
            </div>
          </div>

          <!-- 返信の場合の返信先のツイート -->
          <s:if test="reText != null">
            <div class="rePost">
              <div class="timeimg">
                <a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
                <img src="<s:property value="reUserIcon"/>"   alt="" class="img-rounded-re"></a>
              </div>
              <div class="timetext">
                <h4><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
                <s:property value="reUserName"/></a></h4>
                <span class="timeArea" title="<s:property value="(reCreatedAt.substring(0,19))"/>"></span>
                <div style="clear:both;"></div>
                <pre><s:property value="reText" /></pre>
              </div>
            </div>
           </s:if>
        </div>
       </s:if>


      <!-- 他人の投稿内容 -->
       <s:else>
        <div class="post" <s:if test="userId==reUserId">style="background-color: #daeaec;"</s:if> >
          <div class="timeimg">
            <a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
            <img src="<s:property value="userIcon"/>"   alt="" class="img-rounded-ex"    width="50" height="50"></a>
          </div>
        <div class="timetext">
          <h4><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
          <s:property value="userName"/></a></h4>
          <span class="timeArea" title="<s:property value="(createdAt.substring(0,19))"/>"></span>
          <div class="glyphicon glyphicon-share-alt" aria-hidden="true" id="receive" data-toggle="modal" data-target="#timelineReceive<s:property value="postId"/>"></div>
          <div class="text">返信する</div>
          <div style="clear:both;"></div>
          <pre id="text"><s:property value="text" /></pre>
        </div>

        <!-- 返信画面 -->
        <div class="modal fade" id="timelineReceive<s:property value="postId"/>" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                <h4 class="modal-title">この投稿に返信する</h4>
              </div>
              <s:form action="SubmitPostAction">
                <div class="modal-body">
                  <pre class="text"><s:property value="text" /></pre>
                  <textarea name="reText" class="form-control" rows="10" cols="80%" maxlength="205"></textarea>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
                  <s:hidden theme="simple" name="rePostId" value="%{postId}"></s:hidden>
                  <s:hidden theme="simple" name="reSnsId" value="%{snsId}"></s:hidden>
                  <button type="submit" class="btn btn-primary">投稿</button>
                </div>
              </s:form>
            </div>
          </div>
        </div>

        <div class="btn-area">
        <!-- いいね後 -->
          <div style="text-align:right">
            <s:if test="isLiked"><button type="button" class="like"></button><img src="pic/q.png" width= "20" height="20">
            </s:if>
          </div>
        <!-- いいね前 -->
          <s:else>
            <s:form action="BtnAction"><s:hidden name="userId" value="%{userId}"/><s:hidden name="senderId" value="%{senderId}"/><s:hidden name="postId" value="%{postId}"/><s:hidden name="btn_flg" value="1"/>
              <div style="text-align:right">
                <button type="button" onClick="submit()" class="like"><img src="pic/fff.png" width= "20" height="20"></button>
              </div>
            </s:form>
          </s:else>

          <div style="text-align:right">
            <img src="pic/q.png" width= "13" height="13">x<s:property value="likeCount"/>
          </div>
        </div>

        <!-- 返信の場合の返信先のツイート -->
        <s:if test="rePostId != 0">
          <div class="rePost">
            <div class="timeimg">
              <a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
              <img src="<s:property value="reUserIcon"/>"   alt="" class="img-rounded-re"></a>
            </div>
            <div class="timetext">
              <h4><a href="<s:url action="ProfileSessionAction"><s:param name="viewId" value="%{senderId}"/></s:url>">
              <s:property value="reUserName"/></a></h4>
              <span class="timeArea" title="<s:property value="(reCreatedAt.substring(0,19))"/>"></span>
              <div style="clear:both;"></div>
                <pre><s:property value="reText" /></pre>
            </div>
          </div><!-- .rePost -->
         </s:if>
      </div>
    </s:else>

    <div style="clear:both;"></div>
    </s:iterator>
     <s:if test="timeline.size()==0">
       <h2>まだ投稿がありません</h2>
       <p><a  href="#" data-toggle="modal" data-target="#sampleModal">投稿をする</a>か、他の人をフォローしましょう！</p>
     </s:if>
   </div>
  </div>
</div>

 <jsp:include page="Bfooter.jsp" />

</body>
</html>