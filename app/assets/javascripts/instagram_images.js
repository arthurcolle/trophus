function createMultiple() {
  // var imageURL = $( "#insta_multiple option:selected" ).val();
  var images = $('#insta_multiple').val();
  $.ajax({
    type: "POST",
    url: "create_multiple",
    data: {urls: images}
  })
}

profChanger = function() {
  var imageURL = $( "#insta_prof option:selected" ).val();
  console.log(imageURL);
  $.ajax({
    type: "POST",
    url: '/prof_pic_change',
    data: {imageURL: imageURL}
  });
}


function buildMultiple() {
  $('#modal-multicreate form').each(function() {
    var form = $(this);
      $.post(form.attr('action'), form.serialize(), function(r) {
      });
  });
  alert("Dishes created!");
}

instaModal = function() {
  $('#modal4').openModal();
  snappy('multiple');
}

instaModalSingle = function() {
  $('#modal5').openModal();
  snappy('single');
}

instaModalSingleProfilePic = function() {
  $('#modalProfile').openModal();
  snappy('single_prof');
}

changeProfile = function() {
  var imageURL = $( "#insta_prof option:selected" ).val();
  console.log("123");
  console.log(imageURL);
}

randomFunction = function(val) {
  var imageURL = $( "#insta_single option:selected" ).val();
  $('#instaject-outer').show();
  $('#instaject').empty();
  $('#instaject').append('<img height="150px" width="150px" src=' + '"' + imageURL + '"' + '>')
  $('#imageURL').val(imageURL);
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

    case 'single_prof':
      $.ajax({
          url: "/user_recent_media_single_prof", 
          type: "GET"
        });  
      break;
  }
}

removePic = function() {
  $('#instaject').empty(); 
  $('#instaject-outer').hide(); 
}