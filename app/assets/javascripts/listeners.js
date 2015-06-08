
function addStripeInformation(data) {
  var handler = StripeCheckout.configure({
    key: 'pk_test_k90DPHCGKmfYhYa5anVRrVKy',
    token: function(token) {
      $.ajax({
        url: '/charges/create',
        type: "POST",
        data: {
          "token" : token.id,
          "email" : data.email
        }
      });
    }
  });

  $(function(){
    // Open Checkout with further options
    handler.open({
      email: data.email,
      name: data.name,
      description: 'You\'ll be eating before you know it',
      zipCode: false,
      panelLabel: "Add Information",
      allowRememberMe: false
    });
  });

  // Close Checkout on page navigation
  $(window).on('popstate', function() {
    handler.close();
  });
}


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

