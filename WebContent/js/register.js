$(window).ready(function() {
	$('#postcode1').jpostal({
		click : '#btn',
		postcode : [ '#postcode1', '#postcode2' ],
		address : {
			'#address1' : '%3',
			'#address2' : '%4%5'
		}
	});
});

$(function(){
	var postBtn = $("#postBtn");
	var address1 = $("#address1");
	var address2 = $("#address2");

	postBtn.attr("disabled", "disabled");

	setInterval(function(){
		if(address1.val().length > 0 && address2.val().length > 0){
			postBtn.removeAttr("disabled");
		}
	}, 100);
});
