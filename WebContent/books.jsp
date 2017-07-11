<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" href="logo/oc.png">
<link rel="apple-touch-icon" href="logo/oc.png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/books.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>書籍一覧</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">


		<h2>書籍一覧</h2>

		<s:if test="%{#session.userFlg >= 1}">


			<div class="page_content_base">

				<s:if test="%{#session.userFlg >= 3}">
					<div class="page_content_base_msg">
						この画面上だけで検索・一覧表示・編集・削除ができます。<br>
						編集完了ボタンは複数の編集を一度に受け付けられます。<br>
						削除ボタン押下時、モーダルによる確認がなされます。
					</div>

				</s:if>


				<div class="initial_search center">
					イニシャルサーチ<br>
					<s:iterator value="searchList">
				[<a href="#<s:property value="initial" />"><s:property
								value="initial" /></a>]
			</s:iterator>
				</div>

				<div class="search_bar">
					<s:form action="BooksSelectAction">
				未入力で全件表示<br>
						<input type="text" name="search" maxlength="50" placeholder="タイトル">
						<input class="button" type="submit" value="検索">
					</s:form>
				</div>

				<!-- メッセージ表示箇所 -->
				<div class="search_msg">

					<span class="f_left" style="float: right;"> <b><font
							color="red"> <s:property value="%{resultString}" /> <span>
							</span> <s:property value="%{resultSelect}" />
						</font></b> <span> </span><br> ページ【<s:property value="currentPage+1" />/<s:property
							value="pageCount" />】
					</span>
					検索結果[
					<s:property value="bookList.size()" />
					]
					<br>
					検索ワード「
					<s:property value="search" />
					」

				</div>
				<br>





				<%-- ↓PCの場合の表示↓ --%>
				<div class="page_content_frame hidden-xs">


					<s:form action="BooksUpdateAction">
						<table class="list">
							<tr>
								<th class="w04 nwrap" scope="col">番<br>号
								</th>
								<th class="w03 nwrap id_font" scope="col">ID</th>
								<th class="w40" scope="col">タイトル<br>サブタイトル
								</th>
								<th class="w15" scope="col">著者</th>
								<th class="w15" scope="col">出版社<br>出版日
								</th>
								<s:if test="%{#session.userFlg >= 3}">
									<th class="w05" scope="col">状態</th>
									<th class="w04 nwrap" scope="col">削除</th>
								</s:if>
							</tr>

							<s:iterator value="searchList">

								<tr id="<s:property value="initial" />">
									<td class="center nwrap"><s:property value="no" /></td>
									<td class="bookId center nwrap id_font"><input
										type="hidden" name="bookIdList"
										value="<s:property value="bookId" />"> <s:property
											value="bookId" /></td>
									<td><s:if test="%{#session.userFlg >= 3}">
											<input type="text" name="titleList" maxlength="50"
												class="bookTitle" value="<s:property value="title"/>"
												placeholder="例：やさしいJAVA" required>
											<br>
											<input type="text" name="subTitleList" maxlength="50"
												class="bookSubTitle" value="<s:property value="subTitle"/>">
										</s:if> <s:else>
											<s:property value="title" />
											<br>
											<s:property value="subTitle" />
										</s:else></td>
									<td><s:if test="%{#session.userFlg >= 3}">
											<input type="text" name="authorList" maxlength="50"
												class="bookAuthor" value="<s:property value="author"/>"
												placeholder="例：Mr.マリック" required>
										</s:if> <s:else>
											<s:property value="author" />
										</s:else></td>
									<td class="center"><s:if test="%{#session.userFlg >= 3}">
											<input type="text" name="publisherList" maxlength="50"
												class="bookPublisher center"
												value="<s:property value="publisher"/>"
												placeholder="例：オーブン社" required>
											<br>
											<input type="text" name="pubDayList" maxlength="10"
												class="bookPubDay center"
												value="<s:property value="pubDay"/>" placeholder="例：2017.06"
												required>
										</s:if> <s:else>
											<s:property value="publisher" />
											<br>
											<s:property value="pubDay" />
										</s:else></td>
									<s:if test="%{#session.userFlg >= 3}">
										<td class="center"><input type="text"
											name="statusFlgList" class="bookStatusFlg center" min="0"
											max="2" value="<s:property value="statusFlg"/>"
											placeholder="0, 1, 2"></td>
										<td class="center nwrap"><input type="button"
											class="btn-danger modal-open button" value="×"></td>
									</s:if>

								</tr>

							</s:iterator>

						</table>


						<s:if test="%{#session.userFlg >= 3}">
							<div class="center">
								<input type="submit" class="edit button" value="編集完了" />
							</div>
						</s:if>
					</s:form>


					<div id="modal-main">
						<!-- #contents START -->
						<p>
							本当に一覧から削除しますか？<br> <br>ブックID：<span id="book_id"></span>
							<br>タイトル：『<span id="title"></span>』
						</p>

						<s:form action="BooksDeleteAction">
							<input type="hidden" name="bookId" value="" id="true-delete">
							<input type="submit" class="delete-true button" value="はい">
							<span> </span>
							<input type="button" class="modal-close button" value="いいえ">
						</s:form>
					</div>


					<!-- ページネーション -->
					<nav class="text-center contents">
						<div class="text-center">
							<ul class="pagination">
								<!-- ページネーション（1ページ目なら） -->
								<s:if test="currentPage==0">
									<li class="disabled"><span>&laquo;</span></li>
								</s:if>

								<!-- 1ページ目以外なら -->
								<s:else>
									<li><a
										href='<s:url action="BooksSelectAction">
												<s:param name="currentPage" value="currentPage -1"/>
												<s:param name="search" value="search"/>

												</s:url>'>&laquo;
									</a></li>
								</s:else>

								<s:iterator value="arrayPageCount" status="rs">
									<s:if
										test="%{#rs.index >= currentPage -leftPage && #rs.index <= currentPage +rightPage}">
										<s:if test="Page == #rs.index">
											<li class="disabled"><span><s:property
														value="#rs.count" /> </span></li>
										</s:if>
										<s:else>
											<li><a
												href='<s:url action="BooksSelectAction">
												<s:param name="currentPage" value="#rs.index"/>
												<s:param name="search" value="search"/>

												</s:url>'><s:property
														value="#rs.count" /> </a></li>
										</s:else>
									</s:if>
								</s:iterator>

								<!-- ページネーション（最終ページなら） -->
								<s:if test="currentPage == pageCount-1">
									<li class="disabled"><span>&raquo;</span></li>
								</s:if>

								<s:elseif test="pageCount == 0">
									<li class="disabled"><span>&raquo;</span></li>
								</s:elseif>

								<!-- 最終ページ以外なら -->
								<s:else>
									<li><a
										href='<s:url action="BooksSelectAction">
							<s:param name="currentPage" value="currentPage+1"/>
							<s:param name="search" value="search"/>

							</s:url>'>&raquo;</a>
									</li>
								</s:else>
							</ul>

						</div>
					</nav>






					<br>

					<s:if test="%{#session.userFlg >= 3}">
						<div class="page_content_frame">
							<div class="insert_table pad font120">
								<s:form action="BooksInsertAction">
									<h3 class="center">書籍の追加</h3>
									<table class="insert-table">

										<tr>
											<td>タイトル：<input type="text" name="title" required
												maxlength="50">
											</td>
											<td>著者：<input type="text" name="author" required
												maxlength="50">
											</td>
										</tr>
										<tr>
											<td>サブタイトル：<input type="text" name="subTitle"
												maxlength="50">
											</td>
											<td>出版社：<input type="text" name="publisher" required
												maxlength="50">
											</td>
										</tr>
										<tr>
											<td>イニシャル：<input type="text" name="initial" required
												maxlength="5" placeholder="例:ア,カ,サ/A,B,C/その他">
											</td>
											<td>出版日：<input type="text" name="pubDay" required
												maxlength="10" placeholder="例：2017.06">
											</td>
										</tr>
									</table>
									<div class=" center">
										<input class="button" type="submit" value="追加">
									</div>
								</s:form>
							</div>
						</div>
					</s:if>
				</div>
				<%-- ↑PCの場合の表示↑ --%>

				<%-- ↓スマホの場合の表示↓ --%>
				<div class="page_content_frame visible-xs">

					<s:form action="BooksUpdateAction">

						<table class="list">
							<tr>
								<th class="w04 nwrap font60" scope="col">番<br>号
								</th>
								<th class="w03 nwrap id_font font60" scope="col">ID</th>
								<th class="w40 font60" scope="col">タイトル<br>サブタイトル
								</th>
								<th class="w15 font60" scope="col">著者</th>
								<th class="w15 font60" scope="col">出版社<br>出版日
								</th>
								<s:if test="%{#session.userFlg >= 3}">
									<th class="w10 font60" scope="col">状<br>態
									</th>
									<th class="w07 nwrap font60" scope="col">削<br>除
									</th>
								</s:if>
							</tr>

							<s:iterator value="searchList">

								<tr id="<s:property value="initial" />">
									<td class="center nwrap font60"><s:property value="no" /></td>
									<td class="bookId center nwrap id_font font60"><input
										type="hidden" name="bookIdList"
										value="<s:property value="bookId" />"> <s:property
											value="bookId" /></td>
									<td><s:if test="%{#session.userFlg >= 3}">
											<textarea cols=10 rows=4 name="titleList" maxlength="50"
												class="bookTitle font60" placeholder="例：やさしいJAVA" required> <s:property
													value="title" /> </textarea>
											<br>
											<input type="text" name="subTitleList" maxlength="50"
												class="bookSubTitle font60"
												value="<s:property value="subTitle"/>">
										</s:if> <s:else>
											<s:property value="title" />
											<br>
											<s:property value="subTitle" />
										</s:else></td>
									<td><s:if test="%{#session.userFlg >= 3}">
											<input type="text" name="authorList" maxlength="30"
												class="bookAuthor center font60 vertical"
												placeholder="例：Mr.マリック"
												value="<s:property value="author" />" required>
										</s:if> <s:else>
											<s:property value="author" />
										</s:else></td>
									<td class="center"><s:if test="%{#session.userFlg >= 3}">
											<input type="text" name="publisherList" maxlength="50"
												class="bookPublisher center font60"
												value="<s:property value="publisher"/>"
												placeholder="例：オーブン社" required>
											<br>
											<input type="text" name="pubDayList" maxlength="10"
												class="bookPubDay center font60"
												value="<s:property value="pubDay"/>" placeholder="例：2017.06"
												required>
										</s:if> <s:else>
											<s:property value="publisher" />
											<br>
											<s:property value="pubDay" />
										</s:else></td>
									<s:if test="%{#session.userFlg >= 3}">
										<td class="center"><input type="text"
											name="statusFlgList"
											class="bookStatusFlg center font60 vertical"
											value="<s:property value="statusFlg"/>"></td>
										<td class="center nwrap font60"><input type="button"
											class="btn-danger modal-open button" value="×"></td>
									</s:if>

								</tr>

							</s:iterator>

						</table>



						<s:if test="%{#session.userFlg >= 3}">
							<div class="center font60">
								<input type="submit" class="edit button" value="編集完了" />
							</div>
						</s:if>
					</s:form>


					<div id="modal-main">
						<!-- #contents START -->
						<p>
							本当に一覧から削除しますか？<br> <br>ブックID：<span id="book_id"></span>
							<br>タイトル：『<span id="title"></span>』
						</p>

						<s:form action="BooksDeleteAction">
							<input type="hidden" name="bookId" value="" id="true-delete">
							<input type="submit" class="delete-true button" value="はい">
							<span> </span>
							<input type="button" class="modal-close button" value="いいえ">
						</s:form>
					</div>


					<!-- ページネーション -->
					<nav class="text-center contents">
						<div class="text-center">
							<ul class="pagination">
								<!-- ページネーション（1ページ目なら） -->
								<s:if test="currentPage==0">
									<li class="disabled"><span>&laquo;</span></li>
								</s:if>

								<!-- 1ページ目以外なら -->
								<s:else>
									<li><a
										href='<s:url action="BooksSelectAction">
												<s:param name="currentPage" value="currentPage -1"/>
												<s:param name="search" value="search"/>

												</s:url>'>&laquo;
									</a></li>
								</s:else>

								<s:iterator value="arrayPageCount" status="rs">
									<s:if
										test="%{#rs.index >= currentPage -leftPage && #rs.index <= currentPage +rightPage}">
										<s:if test="Page == #rs.index">
											<li class="disabled"><span><s:property
														value="#rs.count" /> </span></li>
										</s:if>
										<s:else>
											<li><a
												href='<s:url action="BooksSelectAction">
												<s:param name="currentPage" value="#rs.index"/>
												<s:param name="search" value="search"/>

												</s:url>'><s:property
														value="#rs.count" /> </a></li>
										</s:else>
									</s:if>
								</s:iterator>

								<!-- ページネーション（最終ページなら） -->
								<s:if test="currentPage == pageCount-1">
									<li class="disabled"><span>&raquo;</span></li>
								</s:if>

								<s:elseif test="pageCount == 0">
									<li class="disabled"><span>&raquo;</span></li>
								</s:elseif>

								<!-- 最終ページ以外なら -->
								<s:else>
									<li><a
										href='<s:url action="BooksSelectAction">
							<s:param name="currentPage" value="currentPage+1"/>
							<s:param name="search" value="search"/>

							</s:url>'>&raquo;</a>
									</li>
								</s:else>
							</ul>

						</div>
					</nav>





					<br>

					<s:if test="%{#session.userFlg >= 3}">
						<div class="page_content_frame">
							<div class="insert_table pad font60">
								<s:form action="BooksInsertAction">
									<h3 class="center">書籍の追加</h3>
									<table class="insert-table">

										<tr>
											<td>タイトル：<input type="text" name="title" class="font60"
												required maxlength="50">
											</td>
										</tr>
										<tr>
											<td>著者：<input type="text" name="author" class="font60"
												required maxlength="50">
											</td>
										</tr>
										<tr>
											<td>サブタイトル：<input type="text" name="subTitle"
												class="font60" maxlength="50">
											</td>
										</tr>
										<tr>
											<td>出版社：<input type="text" name="publisher"
												class="font60" required maxlength="50">
											</td>
										</tr>
										<tr>
											<td>イニシャル：<input type="text" name="initial"
												class="font60" required maxlength="5"
												placeholder="例:ア,カ,サ/A,B,C/その他">
											</td>
										</tr>
										<tr>
											<td>出版日：<input type="text" name="pubDay" class="font60"
												required maxlength="10" placeholder="例：2017.06">
											</td>
										</tr>
									</table>
									<div class=" center">
										<input class="button" type="submit" value="追加">
									</div>
								</s:form>
							</div>
						</div>
					</s:if>
				</div>
				<%-- ↑スマホの場合の表示↑ --%>




			</div>

		</s:if>

		<s:else>
	ログイン後表示します
</s:else>



		<div class="center">
			<br>
			<s:form action="GetAddressAction">
				<input type="submit" class="button" value="ホームへ戻る">
			</s:form>
		</div>
		<br>

	</div>


	<a href="#" class="page-top">↑</a>

	<!-- Javascripts
    ================================================== -->
	<script type="text/javascript" src="js/books.js"></script>
	<script type="text/javascript" src="js/books-page-top.js"></script>

</body>
</html>