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