$(document).ready(function(){


	$('#memo').hide();

	/*テーブルの情報を格納するプログラム。table-to-jsonを使ったため未使用
	var data = [];
	var tr = $("#schedule tr");//テーブルの全行を取得
	for( var i=0,l=tr.length;i<l;i++ ){
	 var cells = tr.eq(i).children();//1行目から順番に列を取得(th、td)
	 for( var j=0,m=cells.length;j<m;j++ ){
	 if( typeof data[i] == "undefined" )
	 data[i] = [];
	 data[i][j] = cells.eq(j).text();//i行目j列の文字列を取得
	 }
	}*/




	$('#calendar').fullCalendar({

		/*多少強引な方法を取っているがendの日にちが一日少ない問題の処理
		 * nextDayThreshold:'00:00:00',→翌日になる時間を指定(デフォルトは09:00:00)
		 * timeFormat: "H:mm",→必要ないかもしれないが時間の表記を5:00や17:00となるように変更
		 * allDayText:"",→デフォルトでalldayと表示されるテキストの表示を空欄にする
		 * displayEventTime :false,→表示されるイベントの時間をなくす*/
		nextDayThreshold:'00:00:00',
		timeFormat: "H:mm",
		allDayText:"",
		displayEventTime :false,
		/*end問題処理ここまで*/

		//jqueryのuiが適用されるようにする
		theme: true,

	    // ボタン文字列
        buttonText: {
            prev:     '先月',
            next:     '来月',
            today:    '今日',
            month:    '月',
            week:     '週',
            day:      '日',
            listMonth: '日別'
        },

        //カレンダー上の配置
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,listMonth'
		},

		//タイトルと日別リストの日付のフォーマット
		titleFormat:'MMMM' ,
		listDayFormat:'MMMM D日',

		// 週を月曜日からにする(０→日、１→月、２→火、３→水、４→木、５→金、６→土)
		firstDay: 1,

		// 日本語化
		// 月名称
		monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        // 月略称
        monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        // 曜日名称
        dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
        // 曜日略称
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],

       /*
                       {
            // 日本の祝日
            url: 'https://www.google.com/calendar/feeds/japanese__ja%40holiday.calendar.google.com/public/basic',
            // タイムゾーン
            currentTimezone: 'Asia/Tokyo',
            // 背景色とボーダー色
            color: '#000000',
            // 背景色(colorより優先)
            backgroundColor: '#F19824',
            // ボーダー色(colorより優先)
            borderColor: '#F15A24',
            // 文字色
            textColor: '#EEEEEE'
                       },
                       */
        //jqueryプラグインのtable-to-jsonでテーブルの情報を取得
        	events:$('#schedule').tableToJSON(),


    });

});

// フォームに表示されるカレンダーの処理
$(function() {
	//日本語化
	 $.datepicker.setDefaults( $.datepicker.regional[ "ja" ] );

	//日付を押すと年-月-日の形でフォームに出力されるようにする
    $('.textcalendar').datepicker({ dateFormat: 'yy-mm-dd' });;
});


