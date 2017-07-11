<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=0.9, user-scalable=no">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>勤怠確認</title>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/admin_attendance_leader.js"></script>
<link rel="stylesheet" href="css/admin_attendance_leader.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/footerFixed.js" type="text/javascript"></script>
</head>
<body>

	<!-- ヘッダー-->
	<jsp:include page="header.jsp" />
	<!-- タイトル -->
	<div align="center">
		<h3
			style="border-bottom: 1px solid rgba(0, 0, 0, 0.1); box-shadow: 0 1px 0 rgba(255, 255, 255, 1);">勤怠確認</h3>
	</div>
	<div class="container">

		<s:if test="%{#session.userFlg == 2}">
			<div class="formbox" align="center">
				<s:form action="AdminAttendanceLeaderAction">
					<table class="atform">
						<colgroup>
							<col style="width: 33%;">
							<col style="width: 67%;">
						</colgroup>

						<tr>
							<th>チーム名：</th>

							<s:if test="getAllTeamNames().equals('')">
								<td><input type="radio" name="teamName"
									value=<s:property value="teamName"/> checked="checked">
								<s:property value="teamName" /></td>
							</s:if>
							<s:else>
								<s:iterator value="allTeamNames">
									<td><input type="radio" name="teamName"
										value=<s:property/> checked="checked">
									<s:property /></td>
								</s:iterator>
							</s:else>

						</tr>

						<tr>
							<!-- 表示用の日時 -->
						<tr>
							<!-- 表示用の日時 -->
							<th>　 日 時：</th>
							<td class="ymd" style="white-space: nowrap;"></td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<th>チーム名：</th> -->
						<!-- 							<td> <input type="text" class="form2" name="teamName" -->
						<!-- 							placeholder="チーム名" id="teamForm" title="チーム名" /></td> -->
						<!-- 						</tr> -->
						<tr>
						<tr id="tr_type">
							<th>出欠確認：</th>
							<td><select name="attendance" id="id_attendance">
									<option value="">出欠状況</option>
									<option value="='出席'">出席</option>
									<option value="='欠席'">欠席</option>
									<option value="='遅刻'">遅刻</option>
									<option value="='早退'">早退</option>
									<option value="='連絡なし'">連絡なし</option>
									<option value=" in ('欠席','遅刻','早退','連絡なし')">出席以外</option>
							</select></td>
						</tr>



						<tr style="display: none;">
							<!-- 日時のデータ送信用 選択させないため非表示 -->
							<th>日 時 ：</th>
							<td><select style="width: 60px;" name="atYear" id="id_year"
								data-choice="year" required="required"></select> <span
								style="margin-left: 3px; margin-right: 5px; display: inline-block;">年</span>

								<select style="width: 45px;" name="atMonth" id="id_month"
								data-choice="month" required="required"></select> <span
								style="margin-left: 3px; margin-right: 5px; display: inline-block;">月</span>

								<select style="width: 45px;" name="atDay" id="id_day"
								data-choice="day" required="required"></select> <span
								style="margin-left: 3px; margin-right: 5px; display: inline-block;">日</span>
							</td>
						</tr>
						<tr>
					</table>


					<input type="submit" class="form2" value="検索" class="search-btn"
						id="searchButtun" />

				</s:form>
			</div>
			<font color="red"><s:property value="errorMsg" /></font>
			<table border="2px" width="30%" height="80">
				<tr>
					<td style="white-space: nowrap; text-align: center;">出席</td>
					<td style="white-space: nowrap; text-align: center;">欠席</td>
					<td style="white-space: nowrap; text-align: center;">遅刻</td>
					<td style="white-space: nowrap; text-align: center;">早退</td>
					<td style="white-space: nowrap; text-align: center;">連絡なし</td>
				</tr>

				<tr align="center">
					<td><s:property value="present" /></td>
					<td><s:property value="absent" /></td>
					<td><s:property value="late" /></td>
					<td><s:property value="early" /></td>
					<td><s:property value="noContact" /></td>
				</tr>
			</table>





			<!-- 一括で連絡なしのユーザーを送信するボタン -->
			<s:form action="NotAttendanceAction"
				style="margin-bottom:0;">
				<!-- 印刷用モーダル表示ボタン -->
				<div class="button-box" style="display:inline">
			<input type="button" class="modal-open" id="modal-open" value="一覧表示"
				style="text-align:left;" />
				</div>

				<tr style="display: none;">
					<s:if test="getAllTeamNames().equals('')">
						<td><input type="radio" name="teamName"
							value=<s:property value="teamName"/> checked="checked">
						<s:property value="teamName" /></td>
					</s:if>
					<s:else>
						<s:iterator value="allTeamNames">
							<td><input type="radio" name="teamName" value=<s:property/>
								checked="checked">
							<s:property /></td>
						</s:iterator>
					</s:else>

					<td><select style="width: 60px;" name="atYear" id="id_year2"
						data-choice="year" required="required"></select> <span
						style="margin-left: 3px; margin-right: 5px; display: inline-block;">年</span>

						<select style="width: 45px;" name="atMonth" id="id_month2"
						data-choice="month" required="required"></select> <span
						style="margin-left: 3px; margin-right: 5px; display: inline-block;">月</span>

						<select style="width: 45px;" name="atDay" id="id_day2"
						data-choice="day" required="required"></select> <span
						style="margin-left: 3px; margin-right: 5px; display: inline-block;">日</span>
					</td>
				</tr>
<div class="button-box2" style="display:inline;arign:right;">
				<input type="submit" value="一括挿入" class="insert-btn"
					id="insertButton" />
					</div>
			</s:form>
			<!-- 一覧表示 -->
			<table class="type12">
				<thead>
					<tr>
						<th>報告日時</th>
						<th>受講開始月</th>
						<th>チーム</th>
						<th style="white-space: nowrap;">性</th>
						<th style="white-space: nowrap;">名</th>
						<th>出欠状況</th>
						<th width="1000">備考</th>
					</tr>
				</thead>

				<tbody>

					<s:iterator value="searchList">
						<tr>
							<td><s:property value="atDate" /></td>
							<td><s:property value="month" /></td>
							<td><s:property value="teamName" /></td>
							<td style="white-space: nowrap;"><s:property
									value="familyNameKanji" /></td>
							<td style="white-space: nowrap;"><s:property
									value="givenNameKanji" /></td>
							<td><s:property value="attendance" /></td>
							<td width="1000"><s:property value="reason" /></td>
						</tr>

						<input type="hidden" name="modalList" value="searchList"
							class="modal-list">
					</s:iterator>


				</tbody>

			</table>


			<!-- 一覧モーダル -->
			<div id="modal-atlist" class="modal-atlist">
				<div id="modal-innar">

					<div class="modal-header">
						<button type="button" class="close" id="modal-close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h3 class="modal-title">勤怠確認</h3>
					</div>
					<div class="print-page">
						<div class="modal-body">
							<div class="print-btn" id="btn_print">印刷</div>
							<table style="margin-top: 10px;" class="type12">
								<thead>
									<tr>
										<th>報告日時</th>
										<th>受講開始月</th>
										<th>チーム</th>
										<th style="white-space: nowrap;">性</th>
										<th style="white-space: nowrap;">名</th>
										<th>出欠状況</th>
										<th width="1000">備考</th>
									</tr>
								</thead>

								<tbody>

									<s:iterator value="searchList">
										<tr>
											<td><s:property value="atDate" /></td>
											<td><s:property value="month" /></td>
											<td><s:property value="teamName" /></td>
											<td style="white-space: nowrap;"><s:property
													value="familyNameKanji" /></td>
											<td style="white-space: nowrap;"><s:property
													value="givenNameKanji" /></td>
											<td><s:property value="attendance" /></td>
											<td width="1000"><s:property value="reason" /></td>
										</tr>
									</s:iterator>

								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<button type="button" id="modal-close" class="btn btn-primary"
								data-dismiss="modal">閉じる</button>
						</div>
					</div>
				</div>

			</div>

		</s:if>
		<s:else>
	リーダーログイン後に表示します。
	</s:else>

	</div>
	<script src="js/jquery.ymdpulldown.js"></script>
	<script>
		$(function() {
			$("#id_year").ymdpulldown({
				startyear : 2016,
			});
			$("#id_month").ymdpulldown();
			$("#id_day").ymdpulldown();
		});
	</script>

	<script src="js/jquery.ymdpulldown.js"></script>
	<script>
		$(function() {
			$("#id_year2").ymdpulldown({
				startyear : 2016,
			});
			$("#id_month2").ymdpulldown();
			$("#id_day2").ymdpulldown();
		});
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>