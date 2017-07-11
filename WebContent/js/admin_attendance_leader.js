
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
});


});
var w = $(window).width();
var x = 640;

//出席以外のときに備考を表示して必須に
$(function(){
	  $('#tr_type select[name="attendance"]').change(function() {
	    if ($('select[name="attendance"] option:selected').val() != '出席'){
	    	if (w <= x) {
	    	$('#tr_reason').css('display','block');
		    $('#reason').removeAttr("disabled").attr('required','true');
	    	}else{
	    	$('#tr_reason').css('display','table-row');
	    	$('#reason').removeAttr("disabled").attr('required','true');
	    	}}else{
	    	$('#tr_reason').css('display','none');
	    	$('#reason').attr('disabled', 'disabled');
	    }
	  });
	});

//現在の年月日を表示する
$(function(){
	  var now = new Date();
	  var y = now.getFullYear();
	  var m = now.getMonth() + 1;
	  var d = now.getDate();
	  var w = now.getDay();
		$(".ymd").text(y + "年" + m + "月" + d + "日");
	});


//通信が遅いときに二重送信を防止
$(function () {
	  $('form').submit(function () {
	    $(this).find(':submit').attr('disabled', 'disabled');
	  });
	});