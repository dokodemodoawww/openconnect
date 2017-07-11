/**
 *
 */
$(function() {

	$('.downloadButton').click(function(){

		var index = $('.downloadButton').index($(this));

		$('.fileName').val($('.fileNameStr').eq(index).val());
	});
});