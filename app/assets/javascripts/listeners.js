$(function() {
  /* event listener for ADD CARD button click */
	$("#addcard").click(function() {
		var name = $('#addcard').attr('data-name');
		var email = $('#addcard').attr('data-email');
		addStripeInformation({'name' : name, 'email' : email});
	});


  /* event listener for ADD BANK ACCOUNT button click */
	$('#addbank').click(function() {
		$('#modal1').openModal();
	});

	$('#change-prof-pic').click(function() {
		profChanger();
	});
});

