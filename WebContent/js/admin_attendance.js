
$(function(){
//一覧印刷をクリックしたら
	$("#modal-open").click(function(){
		//キーボード操作などにより、オーバーレイが多重起動するのを防止する
		 $( this ).blur() ; //ボタンからフォーカスを外す
		 if( $( "#modal-overlay" )[0] ) return false ;
		//オーバーレイ用のHTMLコードを、[body]内の最後に生成する
		$("body").append('<div id="modal-overlay"></div>');

		$('html, body').addClass('lock');

		centeringModalSyncer();
		//モーダルをフェードインさせる
		$("#modal-overlay,#modal-atlist").fadeIn("slow");

		//モーダル内移入れたい値を入力


		//
		$("#modal-overlay,#modal-close").unbind().click(function(){
			$("#modal-atlist,#modal-overlay").fadeOut("slow",function(){
			$("#modal-overlay").remove();
			$('html, body').removeClass('lock');
			});
		});


		$(window).resize(centeringModalSyncer);

		function centeringModalSyncer(){
			var w = $(window).width();
			var h = $(window).height();
			var cw = $("#modal-atlist").outerWidth();
			var ch = $("#modal-atlist").outerHeight();
			//（画面幅－コンテンツ幅）/2で余白を指定し、コンテンツを中心に表示
			var pxleft = ((w - cw)/2);
			var pxtop = ((h - ch)/2);

			$("#modal-atlist").css({
				"left": pxleft + "px",
				"top": "10%"
				});

		}
	});
	 //個別印刷
    $('.print-btn').on('click', function(){
        var printPage = $(this).closest('.print-page').html();
        $('body').append('<div id="print"></div>');
        $('#print').append(printPage);
        $('body > :not(#print)').addClass('print-off');
        window.print();
        $('#print').remove();
        $('.print-off').removeClass('print-off');
    });

});


/* 一括削除 */
$(function() {
	/* モーダル内の削除ボタンをクリックした時に実行 */
	$("#confirmationButton").click(
			function() {
				if (($("#atMonth").val() == "")){
					alert('月を選択してください');
					$(".delete-prepare").fadeOut();
				}else{
					$(function() {
						$(".delete-true").click(function(){
							$(".delete-prepare").fadeIn();
						});
					});
				}
			});


$(function() {
	$(".modal-close").click(function(){
		$(".delete-prepare").fadeOut();
	});
});

$(function(){
	$('#change select[name="atMonth"]').change(function(){
		$(".delete-prepare").fadeOut();
	});
});

$(function(){
	//削除ボタンをクリックしたら
	$(".modal-delete").click(function(){
		//キーボード操作などにより、オーバーレイが多重起動するのを防止する
		 $( this ).blur() ; //ボタンからフォーカスを外す
		 if( $( "#modal-bg" )[0] ) return false ;
		//body内の最後に<div id="modal-bg"></div>を挿入
		$("body").append('<div id="modal-bg"></div>');
		//画面中央を計算する関数を実行
		modalResize();
		//モーダルウィンドウを表示
		$(".delete-prepare").hide();

		$("#modal-bg,#modal-deleteMain").fadeIn("slow");
		var index = $('.modal-delete').index($(this));

		$('.deleteAtMonth').html( $('.atMonth').eq(index).val() );

		$(".modal-close,#modal-bg").click(function(){
			$("#modal-deleteMain,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('#modal-bg').remove() ;
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




//編集ボタンをクリックしたら
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
	$('.updateReason').html( $('.reason').eq(index).val() );
	$('.updateFamilyName').html( $('.familyNameKanji').eq(index).val() );
	$('.updateGivenName').html( $('.givenNameKanji').eq(index).val() );
	$('.updateteamName').html( $('.teamName').eq(index).val() );
	$('.updateuserName').html( $('.userName').eq(index).val() );

	// hiddenのvalue
	$('.updateuserName').val( $('.userName').eq(index).val() );
	$('.updateteamName').val( $('.teamName').eq(index).val() );
	$('.updateReason').val( $('.reason').eq(index).val() );
	$('.updateUserId').val( $('.userId').eq(index).val() );
	$('.updateAtYear').val( $('.atYear').eq(index).val() );
	$('.updateAtMonth').val( $('.atMonth').eq(index).val() );
	$('.updateAtDay').val( $('.atDay').eq(index).val() );
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
});



