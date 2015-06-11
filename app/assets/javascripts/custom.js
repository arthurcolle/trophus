//function fetchNotifs() {
//	$.ajax({
//		type: "GET",
//		url: 'get_user_notif_count'
//	});
//}
//
//$(function() {
//	setInterval(fetchNotifs, 1000);
//});

$(function() {
    if (window.location.protocol != "https:")
        window.location.href = "https:" + window.location.href.substring(window.location.protocol.length);
})