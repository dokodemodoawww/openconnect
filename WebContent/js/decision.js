/**
 * http://usejsdoc.org/
 */
$(document).ready(function() {

	$("#menua").hide();

	var flg = "close";

	$("#btna").click(function() {

		$("#menua").slideToggle();

		if (flg == "close") {
			$(this).text("－ ユーザー一覧を閉じる");
			flg = "open";
		} else {
			$(this).text("＋ ユーザー一覧を表示");
			flg = "close";
		}
	});
});



$(document).ready(function() {

	$("#menub").hide();

	var flg = "close";

	$("#btnb").click(function() {

		$("#menub").slideToggle();

		if (flg == "close") {
			$(this).text("－ プロジェクト一覧を閉じる");
			flg = "open";
		} else {
			$(this).text("＋ プロジェクト一覧を表示");
			flg = "close";
		}
	});
});
