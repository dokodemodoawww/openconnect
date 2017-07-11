$(function() {
	$(".delete-true").click(function(){
		$(".delete-prepare").fadeIn();
	});
});

$(function() {
	$(".modal-close").click(function(){
		$(".delete-prepare").fadeOut();
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
		var id = $('.projectId').eq(index).val();
		$('#delete-projectid').val( id );

		$('.delete-projectname').html($('.projectNamelist').eq(index).val());

		$('.delete-projectmanagerid').html($('.projectManagerIdlist').eq(index).val());

		$('.delete-projectsubmanagerid').html($('.projectSubManagerIdlist').eq(index).val());

		$('.delete-projectstartdate').html($('.projectStartDatelist').eq(index).val());

		$('.delete-projectenddate').html($('.projectEnddatelist').eq(index).val());

		$('.delete-projectnote').html($('.projectNotelist').eq(index).val());

		$('.delete-projectmanagername').html($('.projectManagerNameList').eq(index).val());

		$('.delete-projectsubmanagername').html($('.projectSubManagerNameList').eq(index).val());


		var index = $('.modal-open').index($(this));
		var abc = $('.projectId').eq(index).val();
		$('.true-delete').val( abc );

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
				"top": ((h - ch)/2) + "px"
			});
		}
	});
});




//リスト
$(function(){

	var listButton = $('#listButton');
	var studentsElement = $('#studentsElement');

	listButton.click(function(event){

		if( studentsElement.css('display') == 'none' ){

			studentsElement.slideDown();
			listButton.val('－受講生一覧を閉じる');
		}else{
			studentsElement.slideUp();
			listButton.val('＋受講生一覧を開く');
		}
	});
});