// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require chosen-jquery
//= require bootstrap-sprockets
//= require bootbox
//= require image-picker
//= require map.js
//= require custom.js
//= require zip.js
//= require gmaps/google
//= require messages
//= require s3_direct_upload
//= require_tree .

jQuery(function() {
  $(".s3-uploader").S3Uploader();
  $('#myS3Uploader').bind("s3_upload_complete", function(e, content) {
  	$('#dish_direct_image_url').val(content.url);
  	$('#place-image').html('<img src="' + content.url + '" height="150px">');
  });
});