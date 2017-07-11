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

	// 編集ボタンをクリックしたら
	$(".modal-update").click(function(){
		//body内の最後に<div id="modal-bg"></div>を挿入
		$("body").append('<div id="modal-bg"></div>');
		//画面中央を計算する関数を実行
		modalResize();
		//モーダルウィンドウを表示
		$(".delete-prepare").hide();
		$("#modal-bg,#modal-updateMain").fadeIn("slow");

		var index = $('.modal-update').index($(this));

		// 表示文字
		$('.updateUserId').html( $('.userId').eq(index).val() );
		$('.updateFamilyName').html( $('.familyNameKanji').eq(index).val() );
		$('.updateGivenName').html( $('.givenNameKanji').eq(index).val() );
		$('.updateFamilyNameKana').html( $('.familyNameKana').eq(index).val() );
		$('.updateGivenNameKana').html( $('.givenNameKana').eq(index).val() );
		$('.updateteamName').html( $('.teamName').eq(index).val() );
		$('.updateUserFlg').html( $('[name=userFlg] option:selected').eq(index).text() );






		// hiddenのvalue
		$('.updateUserId').val( $('.userId').eq(index).val() );
		$('.updateFamilyNameKanji').val( $('.familyNameKanji').eq(index).val() );
		$('.updateGivenNameKanji').val( $('.givenNameKanji').eq(index).val() );
		$('.updateFamilyNameKana').val( $('.familyNameKana').eq(index).val() );
		$('.updateGivenNameKana').val( $('.givenNameKana').eq(index).val() );
		$('.updateteamName').val( $('.teamName').eq(index).val() );

		$('.updateUserFlg').val( $('.userFlg').eq(index).val() );

		$(".modal-close").click(function(){
			$("#modal-updateMain,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('<div id="modal-bg"></div>').remove() ;
			});
		});

		$(window).resize(modalResize);

		function modalResize(){
			var w = $(window).width();
			var h = $(window).height();
			var cw = $("#modal-updateMain").outerWidth();
			var ch = $("#modal-updateMain").outerHeight();

			//取得した値をcssに追加する
			$("#modal-updateMain").css({
				"left": ((w - cw)/2) + "px",
				"top": "100px"
			});
		}
	});


});


