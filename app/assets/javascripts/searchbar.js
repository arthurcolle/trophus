destroy = function() {
  $('#q').val('');
  $('#results').empty();
}

$(function() {
  $('#results').mouseleave(function() {
    destroy();
  });
});

myHandler = function() {
  if ($("#q").val() != "") {
    $.ajax({
      type: "POST",
      url: "/autocomplete",
      data: {query: $("#q").val()}
    }).done(function(data) {
      $('#results').show();
      if (data['suggestions'].length != 0) {
        $('#results').empty();
        var sugg = data['suggestions'];
        sugg.forEach( function (s) {
            var link = '';
            if (s["type"] == "dish") {
              link = '/dishes/'+s['id'];
            }
            else {
              link = '/users/'+s['id'] + '/show';
            }
            console.log(link);
            $('#results').append('<a class="special_a" style="text-decoration: none; " href="'+link+'">'+ s['name'] + '<img alt="" style="position: relative; float:right; top: 5px; border-radius: 5px 5px 5px 5px" height="50px" src="'+ s['pic'] +'">' + '</a>');              
        });
      }
    });    
  }
}