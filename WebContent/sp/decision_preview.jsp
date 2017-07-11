<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<LINK rel="stylesheet" type="text/css" href="css/style.css">
<LINK rel="stylesheet" type="text/css" href="css/decision_preview.css">
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/oc.png">
<link rel="apple-touch-icon" href="img/oc.png">
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/sendCheck.js"></script>
<script type="text/javascript" src="js/decision_preview.js"></script>
<title>決裁プレビュー</title>
</head>
<body>
	<s:if test="%{#session.userFlg >= 1}">
		<jsp:include page="header.jsp" />

		<h1>決裁プレビュー画面</h1>
		<br>
		<br>
		<s:if test="decisionDetailList.size() == 0">
		まだ何も編集されていません。
	</s:if>
	<s:property value="%{resultString}" /><br>
		<s:iterator value="decisionDetailList">
			<table>
				<tr>
					<td>
						<div align="right">
							日付
							<s:property value="day" />
						</div>
						<br>
						決裁分類：<s:property value="decisionType" />
						<br>
						起案者
						<br>
						氏名<s:property value="familyNameKanji" />
						<s:property value="givenNameKanji" />
						<br>
						<br>
						案件名：<s:property value="itemName" />
						<br>
						<br>
						概要：
						<br>
						<s:property value="summary" />
						<br>
						<br>
						<div class="center">
							<h1>記</h1>
						</div>
						<br>
						１）理由・目的
						<br>
						<s:property value="cause" />
						<br>
						<br>
						２）費用
						<br>
						建設費用<s:property value="developmentPersonnelSum" /> 万円
						<br>
						損益費用：<s:property value="profitAndLossCost" /> 万円
						<br>
						合計費用：<s:property value="sum" />万円
						<br>
						<br>
						３）実施時期・実施期間
						<br>
						<s:property value="startDay" />～<s:property value="endDay" />
						<br>
						<br>
						<div align="right">以上</div>
						<br>
						<br>
						<table id="tableApproval">
							<tr>
								<td><div class="width4">―：<br><br></div></td>
								<td><div class="width4">起案番号：<br><br></div></td>
								<td><div class="width4">実施決裁番号：<br><br></div></td>
							</tr>
							<tr>
								<td><div class="width4">承認者：<br> <br>日付：</div></td>
								<td><div class="width4">承認者：<br> <br>日付：</div></td>
								<td><div class="width4">承認者：<br> <br>日付：</div></td>
							</tr>
						</table>
						<br>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<table>
				<tr>
					<td>
						<h2>実施計画</h2>
						<br>
						<br>
						以下の通り、当該開発計画を実施して良いかお伺いしたい。
						<br>
						<br>
						資料：
						<br>
						<s:property value="plan" />
						<s:if test="downloadList.size() > 0">
						<s:form action="DecisionDetailDownloadAction">
							<br>
							<s:iterator value="downloadList">
								<div class="textInline">
									<input type="submit" value="ダウンロード" class="downloadButton" />
									<s:property value="fileName" /><br>
								</div>
								<input type="hidden" value="<s:property value="fileName" />" class="fileNameStr">
							</s:iterator>
							<input type="hidden" name="fileName" value="" class="fileName">
							<input type="hidden" name="decisionDetailId" value="<s:property value="decisionDetailId" />">
						</s:form>
						</s:if>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<table>
				<tr>
					<td>
						<h2 class="center">見積書</h2> <br>・以下は、建設費用と損益費用の表である。 <br>
						・建設費用と損益費用それぞれの小計を出し合計費用を求める。 <br>・小数点以下が発生する金額に関しては小計にて切り上げて表示する。
						<br> <br>

						<div class="center">建設費用表</div>
						<table class="tableCost">
							<tr>
								<td><b>建設費用</b></td>
								<td>1単位当たりの金額（万円）</td>
								<td>個数</td>
								<td>小計（万円）</td>
							</tr>
							<tr>
								<td>開発端末</td>
								<td>8.0</td>
								<td><s:property value="persons" /></td>
								<td><s:property value="developmentTerminal" /></td>
							</tr>
							<tr>
								<td>リリース環境使用料</td>
								<td>0.6</td>
								<td>1</td>
								<td>1.0</td>
							</tr>
							<tr>
								<td>回線使用料</td>
								<td>1.0</td>
								<td>1</td>
								<td>1.0</td>
							</tr>
							<tr>
								<td>施設使用料</td>
								<td>55.5</td>
								<td>1</td>
								<td>56.0</td>
							</tr>
							<tr>
								<td>建設費用（万円）</td>
								<td></td>
								<td></td>
								<td><s:property value="developmentPersonnelSum" /></td>
							</tr>
						</table> <br> <br>

						<div class="center">損益費用表</div>
						<table class="tableCost">
							<tr>
								<td><b>損益費用</b></td>
								<td>1単位当たりの金額（万円）</td>
								<td>個数</td>
								<td>小計（万円）</td>
							</tr>
							<tr>
								<td>開発要員</td>
								<td>100.0</td>
								<td><s:property value="persons" /></td>
								<td><s:property value="developmentPersonnel" /></td>
							</tr>
							<tr>
								<td>雑費</td>
								<td>0.5</td>
								<td>1</td>
								<td>1.0</td>
							</tr>
							<tr>
								<td>損益費用（万円）</td>
								<td></td>
								<td></td>
								<td><s:property value="profitAndLossCost" /></td>
							</tr>
						</table>
						<br>
						<br>
						<div class="center">合計費用</div>
						<table class="tableCost">
							<tr>
								<td>建設費用（万円）</td>
								<td><s:property value="developmentPersonnelSum" /></td>
							</tr>
							<tr>
								<td>損益費用（万円）</td>
								<td><s:property value="profitAndLossCost" /></td>
							</tr>
							<tr>
								<td>合計費用（万円）</td>
								<td><s:property value="sum" /></td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</s:iterator>
	</s:if>

			<form>
	<input type="button" value="戻る" onclick="history.back()">
	</form>
</body>
</html>