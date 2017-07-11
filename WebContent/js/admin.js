$(function() {
		var topBtn = $('#page-top');
		topBtn.hide();
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				topBtn.fadeIn();
			} else {
				topBtn.fadeOut();
			}
		});
		topBtn.click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	function numOnly() {
		m = String.fromCharCode(event.keyCode);
		if ("0123456789\b\r".indexOf(m, 0) < 0)
			return false;
		return true;
	}
});