/**
 *
 */
$(function() {
	//テキストリンクをクリックしたら
	$(".modal-edit-open").click(function(){
		//body内の最後に<div id="modal-bg"></div>を挿入
		$("body").append('<div id="modal-bg"></div>');
		//画面中央を計算する関数を実行
		modalResize();
		//モーダルウィンドウを表示
		$("#modal-bg,#modal-edit-main").fadeIn("slow");


		var index = $('.modal-edit-open').index($(this));


		$('#edit-projectid').text($('.decision_id').eq(index).val());

		$('#edit-projectname').text($('.decision_name').eq(index).text());

		$('#edit-classify').text($('.decision_type').eq(index).text());

		$('#edit-status').text($('.decision_status').eq(index).text());

		$('#edit-delete').val($('.decision_detail_id').eq(index).text());

		$(".modal-close").click(function(){
			$("#modal-edit-main,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('<div id="modal-bg"></div>').remove() ;
			});
		});

		//画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
		$(window).resize(modalResize);
		function modalResize(){
			var w = $(window).width();
			var h = $(window).height();
			var cw = $("#modal-edit-main").outerWidth();
			var ch = $("#modal-edit-main").outerHeight();

			//取得した値をcssに追加する
			$("#modal-edit-main").css({
				"left": ((w - cw)/2) + "px",
				"top": "200px"
			});
		}
	});
});




$(function(){
	//テキストリンクをクリックしたら
	$(".modal-open").click(function(){
		//body内の最後に<div id="modal-bg"></div>を挿入
		$("body").append('<div id="modal-bg"></div>');
		//画面中央を計算する関数を実行
		modalResize();
		//モーダルウィンドウを表示
		$("#modal-bg,#modal-main").fadeIn("slow");


		var index = $('.modal-open').index($(this));


		$('#delete-projectId').text($('.project_id').eq(index).text());

		$('#delete-projectName').text($('.project_name').eq(index).text());

		$('#delete-type').text($('.decision_type').eq(index).text());

		$('#delete-status').text($('.decision_status').eq(index).text());

		$('#true-delete').val($('.decision_id').eq(index).text());

		$(".modal-close").click(function(){
			$("#modal-main,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('<div id="modal-bg"></div>').remove() ;
			});
		});

		//画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
		$(window).resize(modalResize);
		function modalResize(){
			var w = $(window).width();
			var h = $(window).height();
			var cw = $("#modal-main").outerWidth();
			var ch = $("#modal-main").outerHeight();

			//取得した値をcssに追加する
			$("#modal-main").css({
				"left": ((w - cw)/2) + "px",
				"top": "200px"
			});
		}
	});
});

// リスト
$(function(){

	var listButton = $('#listButton');
	var projectElement = $('.projectElement');

	listButton.click(function(event){

		if( projectElement.css('display') == 'none' ){

			projectElement.slideDown();
			listButton.val('－プロジェクト一覧を閉じる');
		}else{
			projectElement.slideUp();
			listButton.val('＋プロジェクト一覧を開く');
		}
	});
});


