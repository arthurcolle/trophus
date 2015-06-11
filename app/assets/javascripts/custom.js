function fetchNotifs() {
	$.ajax({
		type: "GET",
		url: 'get_user_notif_count'
	});
}

$(function() {
	setInterval(fetchNotifs, 1000);
});