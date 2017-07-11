$(function() {
    var pageTop = $('.page-top');
    pageTop.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 120) {
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