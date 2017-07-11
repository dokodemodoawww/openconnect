/**
 *
 */
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
	//削除ボタンをクリックしたら
	$(".modal-delete").click(function(){
		//body内の最後に<div id="modal-bg"></div>を挿入
		$("body").append('<div id="modal-bg"></div>');
		//画面中央を計算する関数を実行
		modalResize();
		//モーダルウィンドウを表示
		$(".delete-prepare").hide();
		$("#modal-bg,#modal-deleteMain").fadeIn("slow");

		var index = $('.modal-delete').index($(this));

		$('.deleteUserId').html( $('.userId').eq(index).val() );


		$('.deleteFamilyName').html( $('.familyNameKanji').eq(index).val() );

		$('.deleteGivenName').html( $('.givenNameKanji').eq(index).val() );

		$('.deleteUserId').val( $('.userId').eq(index).val() );

		$(".modal-close").click(function(){
			$("#modal-deleteMain,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('<div id="modal-bg"></div>').remove() ;
			});
		});

		$(window).resize(modalResize);

		function modalResize(){
			var w = $(window).width();
			var h = $(window).height();
			var cw = $("#modal-deleteMain").outerWidth();
			var ch = $("#modal-deleteMain").outerHeight();

			//取得した値をcssに追加する
			$("#modal-deleteMain").css({
				"left": ((w - cw)/2) + "px",
				"top": "100px"
			});
		}

	});
});