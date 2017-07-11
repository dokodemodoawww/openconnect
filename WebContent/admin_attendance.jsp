<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>勤怠確認</title>

<script src="js/jquery-3.1.0.min.js"></script>
<link rel="stylesheet" href="./css/admin_attendance.css">
<script type="text/javascript" src="js/admin_attendance.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#searchButtun").click(
				function() {
					if (($("#familyForm").val() != "")
							&& (($("#givenForm").val() == "") || ($(
									"#familyForm").val() == "")
									&& ($("#givenForm").val() != ""))) {
						alert('姓と名の両方を入力してください');
						return false
					} else if (($("#id_year").val() != "")
							&& ($("#id_month").val() == "")
							&& ($("#id_day").val() != "")
							|| ($("#id_year").val() != "")
							&& ($("#id_month").val() == "")
							&& ($("#id_day").val() == "")
							|| ($("#id_year").val() == "")
							&& ($("#id_month").val() != "")
							&& ($("#id_day").val() != "")
							|| ($("#id_year").val() == "")
							&& ($("#id_month").val() != "")
							&& ($("#id_day").val() == "")
							|| ($("#id_year").val() == "")
							&& ($("#id_month").val() == "")
							&& ($("#id_day").val() != "")) {
						alert('年と月を入力してください');
						return false
					} else if (($("#id_year").val() == "")
							&& ($("#id_month").val() == "")
							&& ($("#id_day").val() == "")
							&& ($("#familyForm").val() == "")
							&& ($("#givenForm").val() == "")
							&& ($("#teamForm").val() == "")
							&& ($("#id_attendance").val() != "")) {
						alert('出欠の他に何か入力してください');
						return false

					} else {
						return true
					}
				});
	});
</script>


<script src="js/footerFixed.js" type="text/javascript"></script>

</head>

<body>
	<!-- ヘッダー-->
	<jsp:include page="header.jsp" />
	<s:if test="%{#session.userFlg == 3}">
		<div class="container">
			<div id="orver">
				<!-- タイトル -->
				<div align="center">
					<h3
						style="border-bottom: 1px solid rgba(0, 0, 0, 0.1); box-shadow: 0 1px 0 rgba(255, 255, 255, 1);">勤怠確認</h3>


					<!-- 日付、名前検索 -->
					<s:form action="AdminAttendanceAction" method="get" id="search">

						<select name="atYear" id="id_year" data-choice="year"><option
								value="">----</option></select>
						<s:text name="年" />
						<select name="atMonth" id="id_month" data-choice="month"><option
								value="">----</option></select>
						<s:text name="月" />
						<select name="atDay" id="id_day" data-choice="day"><option
								value="">----</option></select>
						<s:text name="日" />
						<select name="attendance" id="id_attendance">
							<option value="">出欠状況</option>
							<option value="='出席'">出席</option>
							<option value="='欠席'">欠席</option>
							<option value="='遅刻'">遅刻</option>
							<option value="='早退'">早退</option>
							<option value="='連絡なし'">連絡なし</option>
							<option value=" in ('欠席','遅刻','早退')">出席以外</option>
						</select>

						<div class="container">
							<span>　　姓：</span> <input type="text" class="form2"
								name="familyNameKanji" id="familyForm" placeholder="名字"
								title="名字" />
						</div>

						<div class="container">
							<span>　　名：</span> <input type="text" class="form2"
								name="givenNameKanji" id="givenForm" placeholder="名前" title="名前" />
						</div>

						<div class="container">
							<span>チーム：</span> <input type="text" class="form2"
								name="teamName" placeholder="チーム名" id="teamForm" title="チーム名" />
						</div>

						<input type="submit" class="form2" value="検索" class="search-btn"
							id="searchButtun" />

					</s:form>
					<!-- 値がない場合にエラー表示する -->
					<font color="red"><s:property value="errorMsg" /></font>
				</div>

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


				<!-- 印刷用モーダル表示ボタン -->
				<input type="button" class="modal-open" id="modal-open" value="一覧表示" />


				<!--  			 一括削除用モーダル表示ボタン -->
				<!-- 			<input type="button" class="button modal-delete" value="一括削除" /> -->

				<!-- 削除を実行したら表示する
			<div align="center"><font color="red"><s:property value="deleteMsg" /></font></div>
-->

				<!-- 一覧表示 -->
				<table style="margin-top: 10px;" class="type11">
					<thead>
						<tr>
							<th>報告日時</th>
							<th>受講開始月</th>
							<th>チーム</th>
							<th style="white-space: nowrap;">性</th>
							<th style="white-space: nowrap;">名</th>
							<th>出欠状況</th>
							<th width="1000">備考</th>
							<th style="white-space: nowrap;">編集</th>
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
								<td width="1000"style=""><s:property value="reason" /></td>
								<!-- 							編集のモーダルの表示ボタン -->
								<td><input type="button" class="button modal-update"
									value="編集"></td>
							</tr>
							<input type="hidden" name="userIdList"
								value="<s:property value="userId" />" class="userId">
							<input type="hidden" name="atYearList"
								value="<s:property value="atYear" />" class="atYear">
							<input type="hidden" name="atMonthList"
								value="<s:property value="atMonth" />" class="atMonth">
							<input type="hidden" name="atDayList"
								value="<s:property value="atDay" />" class="atDay">
							<input type="hidden" name="modalList" value="searchList"
								class="modal-list">
							<input type="hidden" name="userNameList"
								value="<s:property value="userName" />" class="userName">
							<input type="hidden" name="teamNameList"
								value="<s:property value="teamName" />" class="teamName">

						</s:iterator>


					</tbody>

				</table>
				<!-- 			ここから編集モーダルの表示の中身 -->
				<div id="modal-updateMain"
					style="display: none; width: 400px; height: 400px; margin: 0; padding: 0; background-color: #ffffff; color: #666666; position: fixed; z-index: 2;">

					<br> ユーザー名 ：
					<div class="updateuserName modalString" style="display: inline;"></div>

					<br> チーム名 ：
					<div class="updateteamName modalString" style="display: inline;"></div>
					<br> <br> 上記のユーザーの編集を行います。
					<s:form action="AdminAttendanceUpdateAction">
						<input type="hidden" name="userName" class="updateuserName"
							value="">
						<input type="hidden" name="teamName" class="updateteam" value="">
						<input type="hidden" name="userId" class="updateUserId"
							value="userId">
						<input type="hidden" name="atYear" class="updateAtYear"
							value="atYear">
						<input type="hidden" name="atMonth" class="updateAtMonth"
							value="atMonth">
						<input type="hidden" name="atDay" class="updateAtDay"
							value="atDay">
						<table>
							<tr id="tr_type">
								<th>出欠確認：</th>
								<td><select name="attendance" style="width: 60px;"
									required="required">

										<option class="atslc" value="出席">出席</option>
										<option class="atslc" value="欠席">欠席</option>
										<option class="atslc" value="遅刻">遅刻</option>
										<option class="atslc" value="早退">早退</option>
										<option class="atslc" value="連絡なし">連絡なし</option>

								</select></td>
							</tr>

							<tr id="tr_reason">
								<th>備 考 ：</th>
								<td><s:textarea id="reason" name="reason" maxlength="200"
										disabled="disabled" rows="6" cols="30" ></s:textarea></td>
							</tr>
						</table>
						<div style="text-align: right;; margin-right: 20px;">
							<input type="submit" class="delete-true button" value="編集">
						</div>
					</s:form>
					<div style="text-align: right;; margin-right: 20px;">
						<input type="button" class="modal-close button" value="閉じる">
					</div>
				</div>
			</div>

			<!-- 		ここまで -->

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
							<table style="margin-top: 10px;" class="type11">
								<thead>
									<tr>
										<th>報告日時</th>
										<th>受講開始月</th>
										<th>チーム</th>
										<th style="white-space: nowrap;">性</th>
										<th style="white-space: nowrap;">名</th>
										<th>出欠状況</th>
										<th width="1000" >備考</th>

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
											<td width="1000"style="word-wrap: break-word;"><s:property value="reason" /></td>

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

				<!-- <!-- 		 一括削除モーダル表示 -->

				<!-- 		<div id="modal-deleteMain"  align="center" > -->
				<!-- <!-- 			 モーダル内で月のプルダウンメニュー -->

				<%-- 			<s:form action="AdminAttendanceDeleteAction"> --%>
				<!-- 			<br> -->
				<!-- 			<br> -->
				<!-- 			<br> -->
				<!-- 			<div id="change"> -->
				<%-- 				<select name="atMonth" id="atMonth"> --%>
				<!-- 					<option value="">--</option> -->
				<!-- 					<option value="1">1</option> -->
				<!-- 					<option value="2">2</option> -->
				<!-- 					<option value="3">3</option> -->
				<!-- 					<option value="4">4</option> -->
				<!-- 					<option value="5">5</option> -->
				<!-- 					<option value="6">6</option> -->
				<!-- 					<option value="7">7</option> -->
				<!-- 					<option value="8">8</option> -->
				<!-- 					<option value="9">9</option> -->
				<!-- 					<option value="10">10</option> -->
				<!-- 					<option value="11">11</option> -->
				<!-- 					<option value="12">12</option> -->
				<%-- 				</select> --%>
				<%-- 				<s:text name="月" /> --%>
				<!-- 				</div> -->

				<!-- 			<br> -->

				<!-- 			<div class="confirmationButton" id="confirmationButton"> -->
				<!-- 			<input type="button" class="delete-true button" id="deleteButton" value="削除"> -->
				<!-- 			</div> -->

				<!-- 			<input type="button" class="modal-close button" id="close" value="閉じる"> -->

				<!-- 			<br> -->

				<!-- 				<div class="delete-prepare" id="deleteButton"> -->
				<!-- 					本当に削除しますか？ -->
				<!-- 					<br> -->
				<!-- 					<br> -->
				<!-- 					<input type="submit" -->
				<!-- 						class="delete-true button" value="はい"> <input -->
				<!-- 						type="button" class="modal-close button" id="close" value="いいえ"> -->
				<!-- 				</div> -->
				<%-- 			</s:form> --%>

				<!-- 		</div> -->



			</div>
		</div>
	</s:if>
	<s:else>
	管理者ログイン後に表示します。
	</s:else>
	<footer>
		<s:include value="footer.jsp" />
	</footer>


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
</body>
</html>