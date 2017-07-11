<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta charset="UTF-8">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/sendCheck.js"></script>
<script type="text/javascript" src="js/decision_preview.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
<title>決裁プレビュー</title>
<link rel="stylesheet" type="text/css" href="css/decision_preview.css">
</head>
<body style="font-size:17px;">

<%-- type == 1：実施	type == 2：契約		type == 3：実施兼契約 type == 4:実施変更プレビュー type == 5:契約変更プレビュー type == 6：実施兼契約変更プレビュー decision_detailのボタンで判断 --%>


	<s:if test="%{#session.userFlg >= 1}">


	<s:iterator value="decisionPreviewList">

		<h1 id="decisionTitle">
			<s:if test="type == 1 || type == 4">実施決裁プレビュー画面</s:if>
				<s:elseif test="type == 2 || type == 5">契約決裁プレビュー画面</s:elseif>
					<s:elseif test="type == 3 || type ==6">実施兼契約決裁プレビュー画面</s:elseif>
		</h1>

		<br>
		<br>

		<s:if test="decisionPreviewList.size() == 0">
				<h1>まだ何も編集されていません。</h1>
		</s:if>
	<s:property value="%{resultString}" /><br>

			<div class="container"  style="position:relative; z-index:-1;">
				<div class="well">
					<div class="row">
						<div class="col-sm-12 col-xs-12">
								<table class="table-responsive">
									<tr>
										<td>
											<div align="right">
												<label>日付：</label>

											<%-- 実施の場合 --%>
											<s:if test="type == 1 || type ==4">
												<s:property value="jApplyDay" />
											</s:if>

											<%-- 契約/実施兼契約の場合 --%>
											<s:if test="type == 2 || type == 3 || type == 5 || type == 6">
												<s:property value="kApplyDay" />
											</s:if>

											</div>
											<div class="row">
												<div class="col-sm-12">
													<label>決裁分類：</label>

													<%-- 実施の場合 --%>
													<s:if test="type == 1 || type == 4">
														実施
													</s:if>

													<%-- 契約の場合 --%>
													<s:if test="type == 2 || type == 5">
														契約
													</s:if>

													<%-- 実施兼契約の場合 --%>
													<s:if test="type == 3 || type == 6">
														実施兼契約
													</s:if>

													<br>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-12">
													<label>起案者</label>
													<br>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-12">

												<%-- 実施の場合 --%>
													<s:if test="type == 1 || type == 4">
														<s:iterator value="jNameList">
															<label>氏名：</label><s:property value="familyNameKanji" />
																				<s:property value="givenNameKanji" />
														</s:iterator>
													</s:if>
												<%-- 契約/実施兼契約の場合 --%>
													<s:if test="type == 2 || type == 3 || type == 5 || type == 6">
														<s:iterator value="kNameList">
															<label>氏名：</label><s:property value="familyNameKanji" />
																				<s:property value="givenNameKanji" />
														</s:iterator>
													</s:if>

												</div>
											</div>

											<div class="row">
												<div class="col-sm-12">
														<label>案件名：</label><s:property value="decisionName" />
													<br>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-12">
													<label>概要：</label>
													<br><div style="word-break:break-all"><s:property value="summary" /></div>
												</div>
											</div>


											<div style="margin-top:50px;"></div>

											<div class="row">
												<div class="col-sm-12">
													<div class="center">
														<h1>記</h1>
													</div>
												</div>
											</div>

											<div style="margin-bottom:50px;"></div>

											<div class="row">
												<div class="col-sm-12">
													<label>１）理由・目的</label>
													<br><div style="word-break:break-all"><s:property value="cause" /></div>
												</div>
											</div>

											<br>
											<br>
											<div class="row">
												<div class="col-sm-12">
													<label>２）費用</label>
												</div>
											</div>

											<br>
											<div class="row">
												<div class="col-sm-12">
												<label>建設費用</label><s:property value="bildCost" /> 万円
												<br>
												<label>損益費用：</label><s:property value="benefit" /> 万円
												<br>
												<label>合計費用：</label><s:property value="amountAll" />万円
												<br>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-12">

													<label>３）<s:if test="type == 1 || type == 4">実施時期・実施期間</s:if>
																	<s:elseif test="type == 2 || type == 5">契約時期・契約期間</s:elseif>
																		<s:elseif test="type == 3 || type == 6">実施兼契約時期・実施兼契約期間</s:elseif></label>

													<br>
													<s:property value="startDay" />～<s:property value="endDay" />
													<br>
												</div>
											</div>

											<br>
											<div align="right">以上</div>
											<br>
											<br>
											<div class="row">
												<div class="col-sm-12 hidden-xs">
													<table id="tableApproval">
														<tr style="width:70%;">
															<td>―：<br><br></td>

															<td><s:if test="type == 1 || type == 4">起案番号：<s:property value="jImpId" /></s:if>
																	<s:elseif test="type == 2 || type == 5">契約番号：<s:property value="kImpId" /></s:elseif>
																		<s:elseif test="type == 3 || type == 6">実施兼契約番号：<s:property value="jkImpId" /></s:elseif><br><br></td>

															<td><div class="width4"><s:if test="type == 1 || type == 4">実施決裁番号：<s:property value="jDecId" /></s:if>
																						<s:elseif test="type == 2 || type == 5">契約番号：<s:property value="kDecId" /></s:elseif>
																							<s:elseif test="type == 3 || type == 6">実施兼契約番号：<s:property value="jkDecId" /></s:elseif><br><br></div></td>

														</tr>


														<tr style="height:100px;">

														<%-- 実施の場合 --%>
														<s:if test="type == 1 || type == 4">
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="jPermiter1nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="jSlashApplyDay" /></td>
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="jPermiter2nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="jSlashApplyDay" /></td>
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="jPermiter3nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="jSlashApplyDay" /></td>
														</s:if>

														<%-- 契約/実施兼契約の場合 --%>
														<s:elseif test="type == 2 || type == 3 || type == 5 || type == 6">
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="kPermiter1nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="kSlashApplyDay" /></td>
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="kPermiter2nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="kSlashApplyDay" /></td>
															<td><label style="margin-bottom:20px; margin-left:5px;">承認者：</label><s:iterator value="kPermiter3nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br><label style="margin-left:5px;">日付：</label><s:property value="kSlashApplyDay" /></td>
														</s:elseif>


														</tr>




													</table>
												</div>
												<%-- スマホの場合の表示 --%>
												<div class="col-xs-12 visible-xs">
													<table>
														<tr>
															<td>―：<br><br></td>

															<%-- 実施の場合 --%>
															<s:if test="type == 1 || type == 4">
																<th>承認者：<s:iterator value="jPermiter1nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br>日付：<s:property value="jSlashApplyDay" /></th>
															</s:if>

															<%-- 契約の場合 --%>
															<s:elseif test="type == 2 || type == 3 || type ==5 || type == 6">
																<th>承認者：<s:iterator value="kPermiter1nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br>日付：<s:property value="kSlashApplyDay" /></th>
															</s:elseif>

														</tr>
														<tr>

															<%-- 実施の場合 --%>
															<s:if test="type == 1 ">
																<td>起案番号：<s:property value="jImpId" /><br><br></td>
																<th>承認者：<s:iterator value="jPermiter2nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br> <br>日付：<s:property value="jSlashApplyDay" /></th>
															</s:if>

															<%-- 契約/実施兼契約の場合 --%>
															<s:elseif test="type == 2 || type == 3">
																<td>起案番号：<s:property value="kImpId" /><br><br></td>
																<th>承認者：<s:iterator value="kPermiter2nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br> <br>日付：<s:property value="kSlashApplyDay" /></th>
															</s:elseif>

														</tr>
														<tr>

															<%-- 実施の場合 --%>
															<s:if test="type == 1">
																<td>実施決裁番号：<s:property value="jDecId" /><br><br></td>
																<th>承認者：<s:iterator value="jPermiter3nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br> <br>日付：<s:property value="jSlashApplyDay" /></th>
															</s:if>

															<%-- 契約/実施兼契約の場合 --%>
															<s:elseif test="type == 2">
																<td>契約決裁番号：<s:property value="kDecId" /><br><br></td>
																<th>承認者：<s:iterator value="kPermiter3nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br> <br>日付：<s:property value="kSlashApplyDay" /></th>
															</s:elseif>

															<%-- 契約/実施兼契約の場合 --%>
															<s:elseif test="type == 3">
																<td>実施兼契約決裁番号：<s:property value="jkDecId" /><br><br></td>
																<th>承認者：<s:iterator value="kPermiter3nameList"><s:property value="familyNameKanji" /><s:property value="givenNameKanji" /></s:iterator><br> <br>日付：<s:property value="kSlashApplyDay" /></th>
															</s:elseif>

														</tr>
													</table>
												</div>
												<%-- スマホの場合の表示/ --%>
											</div>
											<br>
										</td>
									</tr>
								</table>
							</div>
						</div>
				</div>
			</div>

		<div style="margin-top:100px;"></div>

			<div class="container">
				<div class="well">
					<div class="row">
						<div class="col-sm-12 col-xs-12">
								<br>
								<table class="table-responsive">
									<tr>
										<td>
										<div class="row">
											<div class="col-sm-12 col-xs-12">


												<h2>
												<s:if test="type == 1 || type == 4">実施計画</s:if>
													<s:elseif test="type == 2 || type == 5">契約計画</s:elseif>
														<s:elseif test="type == 3 || type == 6">実施兼契約計画</s:elseif>
												</h2>

												<br>
											</div>
										</div>

										<%-- 実施の場合 --%>
										<s:if test="type == 1 || type == 4">
											<p>以下の通り、当該開発計画を実施して良いかお伺いしたい。</p>
										</s:if>

										<%-- 契約の場合 --%>
										<s:if test="type == 2 || type == 5">
											<p>以下の通り、当該開発計画を契約して良いかお伺いしたい。</p>
										</s:if>

										<%-- 実施兼契約の場合 --%>
										<s:if test="type == 3 || type == 6">
											<p>以下の通り、当該開発計画を実施兼契約して良いかお伺いしたい。</p>
										</s:if>

											<br>
											<br>
											<label>資料：</label>
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
								<form>
									<input class="btn btn-default center-block" type="button" value="戻る" onclick="history.back()" style="position:relative; z-index:1;">
								</form>
						</div>
					</div>
				</div>
			</div>
		</s:iterator>
	</s:if>
<jsp:include page="footer.jsp" />
</body>
</html>