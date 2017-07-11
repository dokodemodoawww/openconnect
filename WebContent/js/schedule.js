$(function() {
    var pageTop = $('.pagetop');
    pageTop.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 820) {
            pageTop.fadeIn();
        } else {
            pageTop.fadeOut();
        }
    });
    pageTop.click(function () {
        $('body, html').animate({scrollTop:0}, 300, 'swing');
        return false;
    });
});

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

	// 「.modal-open」をクリック

	$('.modal-open').click(function(){

		// オーバーレイ用の要素を追加

		//$('body').append('<div class="modal-overlay"></div>');

		// オーバーレイをフェードイン

		$('.modal-overlay').fadeIn('slow');




		// モーダルコンテンツのIDを取得

		//var modal = '#' + $(this).attr('data-target');

		// モーダルコンテンツの表示位置を設定

		modalResize();

		// モーダルコンテンツフェードイン

		$("#modal-main").fadeIn('slow');

		var index = $('.modal-open').index($(this));
		var id = $('.scheduleIdList').eq(index).val();
		$('#delete-scheduleid').val( id );


		$('.delete-startday').html($('.scheduleStartdayList').eq(index).val());


		$('.delete-endday').html($('.scheduleEnddayList').eq(index).val());


		$('.delete-title').html($('.scheduleTitleList').eq(index).val());

		$('.delete-teamname').html($('.teamList').eq(index).val());

		var index = $('.modal-open').index($(this));
		var abc = $('.scheduleIdList').eq(index).val();
		$('.true-delete').val( abc );

		var abc2 = $('.teamList2').eq(index).val();
		$('.true-delete2').val( abc2 );

		$(".modal-close").click(function(){
			$("#modal-main,#modal-bg").fadeOut("slow",function(){
				//挿入した<div id="modal-bg"></div>を削除
				$('<div id="modal-bg"></div>').remove() ;
			});
		});

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

	$('.print-btn').on('click', function(){
        var printPage = $('.print-page').html();
        $('body').append('<div id="print"></div>');
        $('#print').append(printPage);
        $("body *:not(#print,#print *)").addClass('off');
        window.print();
        $('#print').remove();
        $('.off').removeClass('off');
    });
});