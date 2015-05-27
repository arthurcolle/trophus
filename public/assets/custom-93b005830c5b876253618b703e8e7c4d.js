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
      description: 'Adding payment information',
      zipCode: false,
      panelLabel: "Add Information"
    });
  });

  // Close Checkout on page navigation
  $(window).on('popstate', function() {
    handler.close();
  }); 
}

snappy = function(selectOptions) {
  switch(selectOptions) {
    case 'multiple':
        $.ajax({
          url: "/user_recent_media", 
          type: "GET"
        });    
      break;

    case 'single':
        $.ajax({
          url: "/user_recent_media_single", 
          type: "GET"
        });  
      break;
  }
}

removePic = function() {
  $('#instaject').empty(); 
  $('#instaject-outer').hide(); 
}
;
