function digit (num) {
    if (num < 10) {num = ' ' + num;}
    return num;
}
jQuery(document).ready(function(){
    var currentDate = new Date();
    jQuery('.timeArea').each(function(){
        var getEntryDate = jQuery(this).attr('title');
        getEntryDate = getEntryDate.replace( /-/g , ":" );
        getEntryDate = getEntryDate.replace( /\s+/g , ":" );
        var time = getEntryDate.split(':');
        var entryDate = new Date(time[0], time[1]-1, time[2], time[3], time[4], time[5]);
        var elapsedTime = (currentDate.getTime() - entryDate.getTime())/1000;
        elapsedTime = Math.ceil(elapsedTime); // 小数点以下切り上げ
        var message = null;
         if (elapsedTime < 60) { //  1 分未満
            message =  'たった今';
        } else if (elapsedTime < 120) { //  2 分未満
            message =  '1分前';
        } else if (elapsedTime < (60*60)) { //  1 時間未満
            message = digit(Math.floor(elapsedTime / 60)) + '分前';
        } else if (elapsedTime < (120*60)) { //  2 時間未満
            message =  '1時間前';
        } else if (elapsedTime < (24*60*60)) { //  1 日未満
            message = digit(Math.floor(elapsedTime / 3600)) + '時間前';
        } else if (elapsedTime < (7*24*60*60)) { // 1 週間未満
            message = digit(Math.floor(elapsedTime / 86400)) + '日前';
        } else if(elapsedTime < (24*60*60*30)){ //  1ヶ月未満
            message = digit(Math.floor(elapsedTime / 604800)) + '週間前';
        }else if(elapsedTime < (24*60*60*365)){ //一年未満
        	message = (entryDate.getMonth()+1) + '月' + entryDate.getDate() + '日';
        }else{
        	message = entryDate.getFullYear() + '年' + (entryDate.getMonth()+1) + '月' + entryDate.getDate() + '日';
        }
        jQuery(this).text(jQuery(this).text() + ' ' + message);
    });
});