$(function() {
	$("#search_form").autocomplete({
		serviceUrl: '/autocomplete/',
		onSearchStart: function (query) {
			console.log(query);
		}
	});
})