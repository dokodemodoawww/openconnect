<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<title>決裁手続き</title>
<!-- 	ヘッダー読み込み -->
<jsp:include page="header.jsp" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/decision_detail.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>


<s:if test="%{#session.userFlg >= 1 && #session.userId != null}">


    		<h1 style="text-align:center;">決裁手続き一覧</h1>

<div class="top-word" style="margin-left:150px; margin-top:25px; margin-bottom:25px;">

		    <p style="position:relative; z-index:-1;">ログイン中ユーザーID:<s:property value="#session.userId" /></p>
			    <s:form action="DecisionDetailSelectAction">

			        		<label style="position:relative; z-index:-1;">プロジェクト検索　</label><span class="pg_none"><br></span>
			        			<input type="text" placeholder="例：legmina" name="searchString" maxlength=30>
			       				 <input type="hidden" name="userId" value="<s:property value="#session.userId" />">　
			                <input class="btn btn-default" type="submit" value="検索" />
				</s:form>

			    <br>
			<p>
			    <font color="red"><s:property value="%{resultString}" /></font><br>
			    <s:property value="%{resultSelect1}" /><br>
			    <s:property value="%{resultSelect2}" />
		    </p>

		    <p style="position:relative; z-index:-1;">現在進行中の決裁：全<s:property value="%{decisionDetailList1.size() + decisionDetailList2.size()}" />チーム</p>
</div>

<div class="container">
	<!-- リーダー自プロジェクト表示用 -->
	<s:if test="%{#session.userFlg == 2}">

	<div class="row">
		<div class="col-sm-7">
			<s:iterator value="decisionBeginList">

				<s:if test="%{decisionBeginList.size() > 0}">
	    			<div class="pad"><br>
	    				<p>自チームの未作成決裁：<s:property value="%{decisionBeginList.size()}" />個</p>

	            <s:form action="DecisionDetailInsertAction">
					<p>決裁手続きを始める<br>あなたのプロジェクトは...</p>
				<table class="table table-responsive" border="1">
					<tr>
						<td class="t_right">プロジェクト名：</td>
						<td class="t_left"><s:property value="projectName" /></td>
					</tr>
					<tr>
						<td class="t_right">リーダーID：</td>
						<td class="t_left"><s:property value="managerId" /></td>
					</tr>
					<tr>
						<td class="t_right">サブリーダーID：</td>
						<td class="t_left"><s:property value="subManagerId" /></td>
					</tr>
					<tr>
						<td>実施兼契約決裁で行う場合のみチェック
							<input type="checkbox" name="decisionType" value="実施兼契約">
						</td>
						<td>
							<input type="hidden" name="projectId" value="<s:property value="projectId" />">
							<input type="hidden" name="userId" value="<s:property value="#session.userId" />">
							<input class="btn btn-default btn-lg center-block" type="submit" value="追加">
						</td>
					</tr>
				</table>

				</s:form>
				</div>
			</s:if><s:else></s:else>

			</s:iterator>
		</div>
	</div>



 <!-- 自プロジェクト -->
	     <s:iterator value="decisionDetailList2">
	        <div class="row">
 				<div class="col-sm-7">

	        <s:if test="%{decisionDetailList2.size() > 0}">

	    <table class="table table-responsive" border="1">
	        <tr>
	        <!-- プロジェクト名 -->
	            <th colspan="2" rowspan="2">
	                <s:property value="projectName" />
	            </th>
	        <!-- 決裁種類 -->
	            <th colspan="3">
	                <s:property value="decisionType" />
	            </th>
	        </tr>
	        <tr>
	        <!-- 決裁状況 -->
	            <td colspan="3">

	                <s:if test="decisionStatus == 0">
	                    作成中
	                </s:if>
	                <s:elseif test="decisionStatus == 1">
	                    差し戻し中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 2">
	                    却下中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 3">
	                    申請中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 4">
	                    [変更]申請中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 5">
	                    すべて承認済み
	                </s:elseif>
	                <s:elseif test="decisionStatus == 6">
	                    [遡求]申請中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 8">
	                    [変更]差し戻し中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 9">
	                    [変更]却下中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 10">
	                    [遡求]差し戻し中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 11">
	                    [変更]編集中
	                </s:elseif>
	                <s:elseif test="decisionStatus == 12">
	                    [遡求]編集中
	                </s:elseif>
	            </td>
	        </tr>
	        <tr>
	            <s:if test="%{decisionType == '実施' || decisionType == '契約'}">
					<th>
						<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>実施</s:if>
						<s:else>実施</s:else>
						</th>
	                <th>
	                	<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>契約</s:if>
						<s:else>契約</s:else>
	                </th>
	            </s:if>
	            <s:else>
	                <th colspan="2">
	                	<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>実施兼契約</s:if>
						<s:else>実施兼契約</s:else>
	                </th>
	            </s:else>

	            <th class="title">

	            <!-- 変更・遡求(最終承認済み後に表示) -->
	                <s:if test="decisionStatus >= 4">
		                <!-- 終了日を過ぎた場合 -->
		                <s:if test="time == 1">遡求</s:if>
		               	<!-- 最終承認から終了日まで -->
		                <s:else>変更</s:else>
					</s:if>
	            <!-- 未-最終承認時 -->
	                <s:else>―</s:else>
	            </th>
	            <th class="title">承認状況</th>
	            <th class="title">申請</th>
	        </tr>
	        <tr>
	        <!-- 編集(却下・差し戻し時も)・プレビューボタン -->
	            <s:if test="%{decisionType == '実施' || decisionType == '契約'}">
	            <td>

	                <s:if test="changeStatus != 1">
	                <!-- 実施の編集 -->
	                    <s:if test="%{decisionStatus < 3 && decisionType == '実施'}">
	                        <s:form action="DecisionSelectAction">
	                           		<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
	                           			<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
	                           				<input type="hidden" name="type" value="1">
	                           					<button class="btn btn-default" type="submit" >編集</button>
	                        		</s:form>
	                    </s:if>
	                <!-- 実施のプレビュー -->
						<s:else>
							<s:form action="DecisionPreviewAction">
		                           	 <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
		                            	<input type="hidden" name="type" value="1">
		                                    <button class="btn btn-default" type="submit" >Preview</button>
	                       			 </s:form>
						</s:else>
					</s:if>

					<s:else>
						<!-- [変更]実施のプレビュー -->
						<s:if test="%{decisionStatus != 8 && decisionStatus != 9 && jApplyDay != null}">
							<s:form action="DecisionPreviewAction">
		                       	 <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
		                       		 <input type="hidden" name="type" value="4">
		                                <button class="btn btn-default" type="submit" >Preview</button>
		                   		 </s:form>
		                </s:if><s:else>―</s:else>
					</s:else>
	            </td>
	            <td>

		                <s:if test="%{decisionType == '契約'}">
			                <s:if test="changeStatus != 1">
				                <!-- 契約の編集 -->
				                    <s:if test="decisionStatus < 3">
				                        <s:form action="DecisionSelectAction">
				                            <input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
				                            	<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                            		<input type="hidden" name="type" value="2">
				                                    	<button class="btn btn-default" type="submit" >編集</button>
				                       		 </s:form>
				                    </s:if>
				                <!-- 契約のプレビュー -->
									<s:else>
										<s:form action="DecisionPreviewAction">
				                            <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                            	<input type="hidden" name="type" value="2">
				                                    <button class="btn btn-default" type="submit" >Preview</button>
				                       		 </s:form>
									</s:else>
							</s:if>

							<s:else>
								<!-- [変更]契約のプレビュー -->
								<s:if test="decisionStatus != 8 && decisionStatus != 9 && decisionStatus != 11">
	                       			<s:form action="DecisionPreviewAction">
	                           			<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
	                           				<input type="hidden" name="type" value="5">
	                                   			<button class="btn btn-default" type="submit" >Preview</button>
	                       				</s:form>
	                       		</s:if><s:else>―</s:else>
							</s:else>
						</s:if>
					<!-- 契約未着手時 -->
	                    <s:else>―</s:else>
	            </td>
	            </s:if>
	            <s:else>
	            <td colspan="2">

		                <s:if test="changeStatus != 1">
		                	<!-- 実施兼契約の編集 -->
				                <s:if test="decisionStatus < 3">
				                    <s:form action="DecisionSelectAction">
				                        <input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
				                        	<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <button class="btn btn-default" type="submit" >編集</button>
				                    </s:form>
				                </s:if>
							<!-- 実施兼契約のプレビュー -->
				                <s:else>
				                    <s:form action="DecisionPreviewAction">
				                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                        	<input type="hidden" name="type" value="3">
				                                <button class="btn btn-default" type="submit" >Preview</button>
				                    </s:form>
				                </s:else>
				        </s:if>

						<s:else>
							<!-- [変更]実施兼契約のプレビュー -->
							<s:if test="decisionStatus != 8 && decisionStatus != 9 && decisionStatus != 11">
		                       		<s:form action="DecisionPreviewAction">
				                           <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                           		<input type="hidden" name="type" value="6">
				                                   	<button class="btn btn-default" type="submit" >Preview</button>
			                       			</s:form>
			                </s:if><s:else>―</s:else>
						</s:else>
	            </td>
	            </s:else>

	        <!-- 変更・遡求編集ボタン -->
	            <td>
	                <!-- 最終承認済み後・差し戻し・却下時に表示 -->
	                <s:if test="decisionStatus == 5 || decisionStatus >= 8">
	                <!-- 終了日を過ぎた時のみ表示(遡求編集初回時のみ) -->
	                    <s:if test="time == 1">
	                        <s:form action="DecisionSelectAction">
	                           		<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
	                           			<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
	                           				<input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
	                           					<input type="hidden" name="type" value="7">
	                           					<s:if test="decisionStatus != 12">
	                                   				<button class="btn btn-default" type="submit"  onclick='return confirm("遡求は一度編集を始めると取り消しができません。\n必ず先生の承認をもらい完了させてください。\nよろしいですか？");'>編集</button>
	                                  			</s:if>
	                                  			<s:else>
	                                  				<button class="btn btn-default" type="submit" >編集</button>
	                                  			</s:else>
	                        </s:form>
	                    </s:if>
	                <!-- 最終承認から終了日まで -->
	                	<s:else>
		                	 <!-- 遡求編集(申請後2回目以降、差し戻し時) -->
		                	 <s:if test="recourseStatus == 1 && (decisionStatus == 10 || decisionStatus == 12)">
		                	 	 <s:form action="DecisionSelectAction">
	                           			<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
	                           				<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
	                           					<input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
	                           						<input type="hidden" name="type" value="7">
	                                   					<button class="btn btn-default" type="submit" >編集</button>
	                        		</s:form>
		                	 </s:if>
		                	 <s:else>
				                	 <s:form action="DecisionSelectAction">
				                        		<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">

									<!-- 実施の変更(初回時) -->
					                     <s:if test="%{decisionType == '契約'}">
					                     	<s:if test="kPermiterId3 > 0">
												<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
													<input type="hidden" name="type" value="4">
													<s:if test="decisionStatus != 11">
														<button class="btn btn-default" type="submit"  onclick='return confirm("変更は一度編集を始めると取り消しができません。\n必ず先生の承認をもらい完了させてください。\nよろしいですか？");'>実施<br>編集</button>
													</s:if>
													<s:else><!-- 2回目以降 -->
														<button class="btn btn-default" type="submit" >実施<br>編集</button>

													</s:else>
												</s:if>
					                <!-- 契約の変更 -->
					                     	<s:else>
												<input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
													<input type="hidden" name="type" value="5">
														<button class="btn btn-default" type="submit" >契約<br>編集</button>
												</s:else>
										</s:if>
									<!-- 実施の変更(差し戻し・却下時) -->
					                     <s:elseif test="%{decisionType == '実施'}">
												<input type="hidden" name="jDrafterId" value="<s:property value="jDrafterId" />">
													<input type="hidden" name="type" value="4">
														<button class="btn btn-default" type="submit" >実施<br>編集</button>
												</s:elseif>
									<!-- 実施兼契約の変更 -->
					                     <s:else>
												<input type="hidden" name="kDrafterId" value="<s:property value="kDrafterId" />">
													<input type="hidden" name="type" value="6">
													<s:if test="decisionStatus != 11">
														<button class="btn btn-default" type="submit"  onclick='return confirm("変更は一度編集を始めると取り消しができません。\n必ず先生の承認をもらい完了させてください。\nよろしいですか？");'>実施兼契約<br>編集</button>
													</s:if>
													<s:else><!-- 2回目以降 -->
														<button class="btn btn-default" type="submit" >実施兼契約<br>編集</button>
													</s:else>
												</s:else>
									</s:form>
							</s:else>
	                    </s:else>
	                </s:if>

	            <!-- 未-最終承認時 -->
	                <s:else>―</s:else>
	            </td>

	        <!-- 承認状況 -->
	            <td>
	                <!-- 申請中(変更・遡求申請含む)の時 -->
	                <s:if test="decisionStatus == 3 || decisionStatus == 4 || decisionStatus == 6">
		                <!-- 実施の時 -->
		                    <s:if test="%{decisionType == '実施'}">
				                    <s:if test="permitStatus == 2">
				                        2人目済み
				                    </s:if>
				                    <s:elseif test="permitStatus == 1">
				                        1人目済み
				                    </s:elseif>
				                    <s:else>
				                        1人目<br>承認待ち
				                    </s:else>
			                </s:if>
			            <!-- 契約・実施兼契約の時 -->
			                <s:else>
				                    <s:if test="permitStatus == 2">
				                    	<s:if test="kPermiterId3 > 0">
				                    		[遡求]<br>先生対応
				                    	</s:if>
				                    	<s:else>
				                    		2人目済み
				                    	</s:else>
				                    </s:if>
				                    <s:elseif test="permitStatus == 1">
				                        1人目済み
				                    </s:elseif>
				                    <s:else>
					                    1人目<br>承認待ち
					                </s:else>
			                </s:else>
	                </s:if>
	                <!-- 作成中の時 -->
	                <s:elseif test="decisionStatus < 3">
		                    <s:if test="decisionStatus == 1">
		                        差し戻されました
		                    </s:if>
		                    <s:elseif test="decisionStatus == 2">
		                        却下されました
		                    </s:elseif>
		                    <!-- まだ申請していない場合 -->
		                    <s:else>
		                    	<s:if test="%{jDecId != null && decisionType == '契約'}">
			                        実施完成済み
			                    </s:if>
			                    <s:else>
			                    	未申請
			                    </s:else>
		                    </s:else>
	                </s:elseif>
	                <s:elseif test="decisionStatus == 8">
	                    [変更]<br>差し戻されました
	                </s:elseif>
	                <s:elseif test="decisionStatus == 9">
	                    [変更]<br>却下されました
	                </s:elseif>
	                <s:elseif test="decisionStatus == 10">
	                    [遡求]<br>差し戻されました
	                </s:elseif>
	                <s:elseif test="decisionStatus == 11">
	                	<s:if test="%{decisionType == '契約'}">
	                		[変更]<br>実施完成済み
	                	</s:if>
	                	<s:else>
	                   		[変更]<br>未申請
	                   	</s:else>
	                </s:elseif>
	                <s:elseif test="decisionStatus == 12">
	                   [遡求]<br>未申請
	                </s:elseif>
	                <!-- 承認済みの時 -->
	                <s:elseif test= "decisionStatus == 5">
	                    <s:if test="time != 1">
	               				<s:if test="recourseStatus == 1 && sPermiterId > 0">
	               					[遡求]<br>承認済み
	               				</s:if>
	               				<s:if test="changeStatus == 1">
	                   				[変更]<br>承認済み
	                   			</s:if>
	               				<s:if test="changeStatus == 0">
	               					[変更]可
	               				</s:if>
	                    </s:if>
	                    <s:else>
	                    	[遡求]可
	                    </s:else>
	                </s:elseif>
	            </td>

	        <!-- 申請ボタン -->
	            <td>
	                <!-- 未承認が残っている間 -->
	                <s:if test="decisionStatus < 5">

		                <!-- 申請できる時 -->
						<s:if test="decisionStatus < 3">
	                <s:form action="DecisionDetailApplicationAction">

								<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
								<input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
								<input type="hidden" name="userId" value="<s:property value="#session.userId" />">
								<s:token />

							<!-- 実施(差し戻し/却下時含む)の申請-->
								<s:if test="%{decisionType == '実施' }">
										<input type="hidden" name="stringId" value="<s:property value="jImpId" />">
												<button class="btn btn-default" type="submit"  onclick='return confirm("よろしいですか？");'>実施申請</button>
														</s:if>
							<!-- 契約(差し戻し/却下時含む)の申請 -->
								<s:elseif test="%{decisionType == '契約'}">
										<input type="hidden" name="stringId" value="<s:property value="kImpId" />">
												<button class="btn btn-default" type="submit"  onclick='return confirm("よろしいですか？");'>契約申請</button>
														</s:elseif>
							<!-- 実施兼契約(差し戻し/却下時含む)の申請 -->
								<s:else>
										<input type="hidden" name="stringId" value="<s:property value="jkImpId" />">
												<button class="btn btn-default" type="submit"  onclick='return confirm("よろしいですか？");'>実施兼契約申請</button>
														</s:else>
					</s:form>
	                	</s:if>

	                	<!-- 申請中(変更・遡求申請含む)の時 -->
						<s:else>
								<!-- 1人目の承認をもらう前までは取り下げ可 -->
								<s:if test="permitStatus == 0">
							<s:form action="DecisionDetailCancelAction">

					                    <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                    <input type="hidden" name="decisionStatus" value="<s:property value="decisionStatus" />">
					                    <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
					                    <input type="hidden" name="userId" value="<s:property value="#session.userId" />">

		                   			<!-- 変更・遡求申請の時は取り消しできない(遡求はいきなり先生承認へいく) -->
		                   			<s:if test="decisionStatus == 4">―</s:if>
		                   			<s:else>
		                   				<button class="btn btn-default" type="submit"  onclick='return confirm("よろしいですか？");'>申請取り下げ</button>
		                   			</s:else>
							</s:form>
								</s:if>

								<!-- それ以降は不可 -->
								<s:else>―</s:else>
						</s:else>

					</s:if>

	                <!-- 最終承認済みの時のみ表示 -->
	                <s:else>

						<s:if test="recourseStatus == 1">
			                	<!-- 遡求の申請可能時 -->
			                	<s:if test="decisionStatus != 6">
				                	<s:form action="DecisionDetailRecourseAction">
				                    		<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                    		<input type="hidden" name="userId" value="<s:property value="#session.userId" />">

			                    		<!-- 初回時 -->
			                    		<s:if test="decisionStatus == 12">
			                    				<button class="btn btn-default" type="submit"  onclick='return confirm("遡求申請は申請の取り消しができません。\nよろしいですか？");'>遡求<br>申請</button>
			                    						</s:if>
			                    		<!-- 2回目以降・差し戻し時 -->
			                    		<s:elseif test="decisionStatus == 10">
			                    				<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>遡求申請</button>
			                    						</s:elseif>
			                    		<!-- 遡求承認完了後の変更申請可時 -->
			                    		<s:else></s:else>
					                </s:form>
				                </s:if>
				                <!-- 遡求の申請中 -->
				                <s:else>―</s:else>
						</s:if>

						<!-- 変更の申請可能時 -->
						<s:if test="changeStatus == 1">

	                        <s:if test="%{decisionType == '契約'}">
						<s:form action="DecisionDetailChangeAction">
									<input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
									<input type="hidden" name="userId" value="<s:property value="#session.userId" />">
									<input type="hidden" name="permitStatus" value="<s:property value="permitStatus" />">

			                <!-- 実施の変更(初回時) -->
			                <s:if test="kPermiterId3 > 0 && decisionStatus == 11">
			                        <input type="hidden" name="decisionType" value="実施">
		                                	<button class="btn btn-default" type="submit" onclick='return confirm("変更申請は申請の取り消しができません。\nよろしいですか？");'>実施変更申請</button>
	                        						</s:if>
	                        <!-- 遡求・変更ともに完了時 -->
	                        <s:elseif test="kPermiterId3 > 0 && decisionStatus == 5"></s:elseif>
			                <!-- 契約の変更 -->
			                <s:else>
			                        <input type="hidden" name="decisionType" value="契約">
		                                	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>契約変更申請</button>
	                        						</s:else>
						 </s:form>
	                        </s:if>

	                        <!-- 実施の変更(差し戻し・却下時) -->
			                <s:elseif test="%{decisionType == '実施'}">
			             <s:form action="DecisionDetailChangeAction">
			                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
			                        	<input type="hidden" name="userId" value="<s:property value="#session.userId" />">
			                        		<input type="hidden" name="permitStatus" value="<s:property value="permitStatus" />">
			                					<input type="hidden" name="decisionType" value="実施">
				                                	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施変更申請</button>
				         </s:form>
			                </s:elseif>
			                <!-- 実施兼契約の変更 -->
	                        <s:else>
		                 <s:form action="DecisionDetailChangeAction">
			                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
			                        	<input type="hidden" name="userId" value="<s:property value="#session.userId" />">
			                        		<input type="hidden" name="permitStatus" value="<s:property value="permitStatus" />">
			                        			<input type="hidden" name="decisionType" value="実施兼契約">
			                                		<button class="btn btn-default" type="submit" onclick='return confirm("変更申請は申請の取り消しができません。\nよろしいですか？");'>実施兼契約変更申請</button>
		                 </s:form>
	                        </s:else>
					</s:if>
					<!-- 承認完了済み(遡求なし・変更なし時) -->
					<s:else>―</s:else>

	                </s:else>
	            </td>
	        </tr>

	        <s:if test="%{sApplyDay != null && decisionStatus != 10}">
		        <tr>
		        	<td colspan="2">
		        		<s:form action="DecisionPreviewAction">
			                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
			                        	<input type="hidden" name="type" value="7">
			                                <button class="btn btn-default" type="submit" >遡求Preview</button>
	                    </s:form>
		        	</td><td colspan="3">―</td>
		        </tr>
	        </s:if>

	    </table><br>

	        </s:if>
	        </div>
		</div>
	</s:iterator>



    </s:if>

<br>

<!-- 一般、他リーダー、先生表示用 -->

		<s:iterator value="decisionDetailList1">
			<div class="row">
				<div class="col-sm-7" style="margin-top:10px; margin-bottom:10px;">

				    <table class="table table-responsive" border="1">
				        <tr>
				        <!-- プロジェクト名 -->
				            <th colspan="2" rowspan="2">
				                <s:property value="projectName" />
				            </th>
				        <!-- 決裁種類 -->
				            <th colspan="3">
				                <s:property value="decisionType" />
				            </th>
				        </tr>
				        <tr>
				        <!-- 決裁状況-->
				            <td colspan="3">
				                <s:if test="decisionStatus == 0">
				                    作成中
				                </s:if>
					            <s:elseif test="decisionStatus == 1">
					               差し戻し中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 2">
				                    却下中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 3">
				                    	<s:if test="permitStatus == 2">
					                        先生の承認待ち
					                    </s:if>
					                    <s:elseif test="permitStatus == 1">
					                        2人目の承認待ち
					                    </s:elseif>
					                    <s:elseif test="permitStatus == 0">
					                        1人目の承認待ち
					                    </s:elseif>
				                </s:elseif>
				                <s:elseif test="decisionStatus == 4">
				                	[変更]承認待ち
				                </s:elseif>
				                <s:elseif test="decisionStatus == 5">
				                	すべて承認済み
				                </s:elseif>
				                <s:elseif test="decisionStatus == 6">
				                    [遡求]承認待ち
				                </s:elseif>
				                <s:elseif test="decisionStatus == 8">
				                    [変更]差し戻し中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 9">
				                    [変更]却下中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 10">
				                    [遡求]差し戻し中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 11">
				                    [変更]編集中
				                </s:elseif>
				                <s:elseif test="decisionStatus == 12">
				                    [遡求]編集中
				                </s:elseif>
				            </td>
				        </tr>
				        <tr>
				            <s:if test="%{decisionType == '実施' || decisionType == '契約'}">
								<th>
									<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>実施</s:if>
									<s:else>実施</s:else>
									</th>
				                <th>
				                	<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>契約</s:if>
									<s:else>契約</s:else>
				                </th>
				            </s:if>
				            <s:else>
				                <th colspan="2">
				                	<s:if test="changeStatus == 1">[変更]<span class="pg_none"><br></span>実施兼契約</s:if>
									<s:else>実施兼契約</s:else>
				                </th>
				            </s:else>
				            <!-- リーダー以上のみ表示 -->
				            <s:if test="%{#session.userFlg >= 2}">
				                <th>差し戻し</th>
				                <th>却下</th>
				                <th>承認</th>
				            </s:if>
				            <!-- 一般の表示 -->
				            <s:else>
				                <th colspan="3" rowspan="2" class="title">
				                </th>
				            </s:else>
				        </tr>
				        <tr>
				    <!-- プレビューボタン -->
				        <s:if test="%{decisionType == '実施' || decisionType == '契約'}">
				            <td>
				                <!-- 実施のプレビュー -->
				                <s:if test="changeStatus != 1">
					                <s:form action="DecisionPreviewAction">
					                    <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                    <input type="hidden" name="type" value="1">
					                            <button class="btn btn-default" type="submit" >Preview</button>
					                	</s:form>
				                </s:if>
				                <s:else>
					                <s:if test="%{jApplyDay != null}">
					                	<s:form action="DecisionPreviewAction">
					                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                        	<input type="hidden" name="type" value="4">
					                                <button class="btn btn-default" type="submit" >Preview</button>
					                   		 </s:form>
				                  	</s:if><!-- 変更編集中時 --><s:else>―</s:else>
				                </s:else>
				            </td>
				            <td>
				                <!-- 契約のプレビュー -->
				                <s:if test="%{decisionType == '契約'}">
				                <s:if test="changeStatus != 1">
				                    <s:form action="DecisionPreviewAction">
				                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                        	<input type="hidden" name="type" value="2">
				                                <button class="btn btn-default" type="submit" >Preview</button>
				                    	</s:form>
				                </s:if>
				                <s:else>
				                	<s:if test="%{decisionStatus != 11 && kApplyDay != null}">
					                	<s:form action="DecisionPreviewAction">
					                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                        	<input type="hidden" name="type" value="5">
					                                <button class="btn btn-default" type="submit" >Preview</button>
					                   		 </s:form>
				                    </s:if><!-- 変更編集中時 --><s:else>―</s:else>
				                </s:else>
				                </s:if>
				                <s:else>―</s:else>
				            </td>
				            </s:if>
				            <s:else>
				            <td colspan="2">
				                <!-- 実施兼契約のプレビュー -->
				                <s:if test="changeStatus != 1">
					                <s:form action="DecisionPreviewAction">
					                    <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                    <input type="hidden" name="type" value="3">
					                            <button class="btn btn-default" type="submit" >Preview</button>
					                </s:form>
					            </s:if>
				                <s:else>
					                <s:if test="decisionStatus != 11">
					                	<s:form action="DecisionPreviewAction">
					                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
					                        	<input type="hidden" name="type" value="6">
					                                <button class="btn btn-default" type="submit" >Preview</button>
					                    	</s:form>
					                </s:if><!-- 変更編集中時 --><s:else>―</s:else>
				                </s:else>
				            </td>
				            </s:else>


				        <!-- リーダー以上のみ表示 -->
				        <s:if test="%{#session.userFlg >= 2}">

				        <!-- 差し戻しボタン -->
				            <td>
				            <!-- 申請中の時 -->
				            <s:if test="decisionStatus == 3 || decisionStatus == 4|| decisionStatus == 6">
				            <s:form action="DecisionDetailRemandAction">

				                    <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                    <input type="hidden" name="decisionStatus" value="<s:property value="decisionStatus" />">
				                    <input type="hidden" name="userId" value="<s:property value="#session.userId" />">

				            <!-- 先生のみ -->
				                <s:if test="%{#session.userFlg == 3}">
				                <!-- 先生が差し戻し可能な時 -->
				                    <s:if test="permitStatus == 2">
				                            <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>差し戻し</button>
				                    </s:if>
				                    <s:else>―</s:else>
				                </s:if>

				            <!-- リーダーのみ -->
				                <s:else>
				                <!-- リーダーが差し戻し可能な時 -->
				                    <s:if test="permitStatus < 2 ">
				                        <s:if test="%{(jPermiterId1 == #session.userId && decisionType == '実施') || (kPermiterId1 == #session.userId && decisionType == '契約') || (kPermiterId1 == #session.userId && decisionType == '実施兼契約')}">―</s:if>
				                        <s:else>
				                                <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>差し戻し</button>
				                        </s:else>
				                    </s:if>
				                    <s:else>―</s:else>
				                </s:else>

				            </s:form>
				            </s:if>

				            <!-- 申請中の時以外 -->
				            <s:else>
				            	<s:if test="decisionStatus == 1">
				                    差し戻し済
				                </s:if>
				               	<s:elseif test="decisionStatus == 5">―</s:elseif>
				                <s:elseif test="decisionStatus == 8">
				                	[変更]差し戻し済
				                </s:elseif>
				                <s:elseif test="decisionStatus == 10">
				                	[遡求]差し戻し済
				                </s:elseif>
				                <s:else>
				                	申請なし
				                </s:else>
				                </s:else>
				            </td>

				        <!-- 却下ボタン(遡求を除く) -->
				            <td>
				            <!-- 申請中の時 -->
				            <s:if test="decisionStatus == 3 || decisionStatus == 4">
				            <s:form action="DecisionDetailRejectAction">

				                    <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                    <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                    <input type="hidden" name="decisionStatus" value="<s:property value="decisionStatus" />">
				                    <input type="hidden" name="userId" value="<s:property value="#session.userId" />">

				            <!-- 先生のみ -->
				                <s:if test="%{#session.userFlg == 3}">
				                <!-- 先生が却下可能な時 -->
				                    <s:if test="permitStatus == 2">
				                            <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>却下</button>
				                    </s:if>
				                    <s:else>―</s:else>
				                </s:if>

				            <!-- リーダーのみ -->
				                <s:else>
				                <!-- リーダーが却下可能な時 -->
				                    <s:if test="permitStatus < 2 ">

				                        <s:if test="%{(jPermiterId1 == #session.userId && decisionType == '実施') || (kPermiterId1 == #session.userId && decisionType == '契約') || (kPermiterId1 == #session.userId && decisionType == '実施兼契約')}">―</s:if>
				                        <s:else>
				                                <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>却下</button>
				                        </s:else>
				                    </s:if>
				                    <s:else>―</s:else>
				                </s:else>

				            </s:form>
				            </s:if>

				            <!-- 申請中の時以外 -->
				            <s:else>
				                <s:if test="decisionStatus == 2">
				                    却下済
				                </s:if>
				                <s:elseif test="decisionStatus == 5 || decisionStatus == 6">―</s:elseif>
				                <s:elseif test="decisionStatus == 9">
				                	[変更]却下済
				                </s:elseif>
				                <s:else>
				                	申請なし
				                </s:else>
				            </s:else>
				            </td>

				        <!-- 承認ボタン -->
				            <td>
				            <!-- 申請中の時 -->
				            <s:if test="%{decisionStatus == 3 || decisionStatus == 4 || decisionStatus == 6}">

				            <!-- 実施の承認(変更時含む) -->
				            <s:if test="%{decisionType == '実施'}">

				                <!-- 先生のみ -->
				                    <s:if test="%{#session.userFlg == 3}">
				                    <!-- 先生の承認 -->
				                        <s:if test="permitStatus == 2">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="decisionStatus" value="<s:property value="decisionStatus" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="2">
				                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施承認3人目</button>
				                            </s:form>
				                        </s:if>
				                        <s:elseif test="permitStatus == 1">
				                            リーダー2人目対応中
				                        </s:elseif>
				                        <s:else>
				                            リーダー1人目対応中
				                        </s:else>
				                    </s:if>

				                <!-- リーダーのみ -->
				                    <s:else>
				                    <!-- リーダー1の承認 -->
				                        <s:if test="permitStatus == 0">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="0">
				                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施承認1人目</button>
				                            </s:form>
				                        </s:if>
				                    <!-- リーダー2の承認 -->
				                        <s:elseif test="permitStatus == 1">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="1">
						                                <s:if test="%{jPermiterId1 == #session.userId}">
						                                    あなたが1人目の承認者
						                                </s:if>
						                                <s:else>
						                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施承認2人目</button>
						                                </s:else>
				                            </s:form>
				                        </s:elseif>
				                        <s:elseif test="permitStatus == 2">
				                            先生対応中
				                        </s:elseif>
				                    </s:else>

				            </s:if>

				            <!-- 契約・実施兼契約の承認(変更・遡求時含む) -->
				            <s:else>

				                <!-- 先生のみ -->
				                    <s:if test="%{#session.userFlg == 3}">
				                    <!-- 先生の承認 -->
				                        <s:if test="permitStatus == 2">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <input type="hidden" name="decisionStatus" value="<s:property value="decisionStatus" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="2">
						                                <s:if test="%{decisionType == '契約'}">
						                                        <s:if test="decisionStatus == 6">
						                                        	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>遡求承認</button>
						                                        </s:if>
						                                        <s:else>
						                                        	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>契約承認3人目</button>
						                                        </s:else>
						                                </s:if>
						                                <s:elseif test="%{decisionType == '実施兼契約'}">
						                                        <s:if test="decisionStatus == 6">
						                                        	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>遡求承認</button>
						                                        </s:if>
						                                        <s:else>
						                                        	<button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施兼契約承認3人目</button>
						                                        </s:else>
						                                </s:elseif>
				                            </s:form>
				                        </s:if>
				                        <s:elseif test="permitStatus == 1">
				                            リーダー2人目対応中
				                        </s:elseif>
				                        <s:else>
				                            リーダー1人目対応中
				                        </s:else>
				                    </s:if>

				                <!-- リーダーのみ -->
				                    <s:else>
				                    <!-- リーダー1の承認 -->
				                        <s:if test="permitStatus == 0">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="0">
						                                <s:if test="%{decisionType == '契約'}">
						                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>契約承認1人目</button>
						                                </s:if>
						                                <s:elseif test="%{decisionType == '実施兼契約'}">
						                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施兼契約承認1人目</button>
						                                </s:elseif>
				                            </s:form>
				                        </s:if>
				                    <!-- リーダー2の承認 -->
				                        <s:elseif test="permitStatus == 1">
				                            <s:form action="DecisionDetailPermitAction">
				                                <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
				                                <input type="hidden" name="decisionType" value="<s:property value="decisionType" />">
				                                <input type="hidden" name="userId" value="<s:property value="#session.userId" />">
				                                <s:token />
				                                <input type="hidden" name="permitStatus" value="1">
						                                <s:if test="%{kPermiterId1 == #session.userId}">
						                                    あなたが1人目の承認者
						                                </s:if>
						                                <s:else>
						                                    <s:if test="%{decisionType == '契約'}">
						                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>契約承認2人目</button>/
						                                    </s:if>
						                                    <s:elseif test="%{decisionType == '実施兼契約'}">
						                                        <button class="btn btn-default" type="submit" onclick='return confirm("よろしいですか？");'>実施兼契約承認2人目</button>
						                                    </s:elseif>
						                                </s:else>
				                            </s:form>
				                        </s:elseif>
				                        <s:elseif test="permitStatus == 2">
				                            先生対応中
				                        </s:elseif>
				                    </s:else>

				            </s:else>

				            </s:if>

				            <!-- 申請中の時以外 -->
				            <s:else>
				                <s:if test="decisionStatus == 5">―</s:if>
				                <s:else>
				                	申請なし
				                </s:else>
				            </s:else>
				            </td>
				        </s:if>

				        </tr>

				        <!--
				        <s:if test="kPermiterId3 > 0">
					        <tr>
					        	<td colspan="2">
					        		<s:if test="%{recourseStatus == 1 && sApplyDay != null}">
							        		<s:form action="DecisionPreviewAction">
							                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
							                        	<input type="hidden" name="type" value="7">
							                                <button class="btn btn-default" type="submit" >遡求Preview</button>
						                    </s:form>
				                    </s:if>
				                    <s:else></s:else>
					        	</td>
					        	<td colspan="3">
					        		<s:if test="%{#session.userFlg == 3 && decisionStatus == 5 && time== 1}">
					        				<s:form action="DecisionDetailCompleteAction">
							                        <input type="hidden" name="decisionId" value="<s:property value="decisionId" />">
							                        	<button class="btn btn-default" type="submit" >リリース完了</button>
						                    </s:form>
					        		</s:if>
					        		<s:else></s:else>
					        	</td>
					        </tr>
				        </s:if> -->

				    </table>
			    </div>
			</div>
	</s:iterator>
</div>


<br><br>

</s:if>

<s:else>
	ログイン後に表示します。
</s:else>

	<!-- 戻る -->
	<s:form action="GetAddressAction">
		<input type="submit" class="btn btn-primary return_btn" value="戻る">
	</s:form>





</body>
<!-- 	フッダー読み込み -->
<jsp:include page="footer.jsp" />
</html>