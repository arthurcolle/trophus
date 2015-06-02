function clicky(number) {     
  $.ajax({
    url: "users/" + number + "/dishes",
    type: "GET"
  })
}

function goToProfile(number) {
        $.ajax({
          url: "users/" + number + "/show",
          type: "GET"
        })
}

function initialize(user_id) {
  $('#map-canvas').toggle();
  var geocoder;
  google.maps.visualRefresh = true;
  var map;
  var address;
  
  var users = [];
  var markers = [];
  var infoWindowContent = [];

  $.ajax({
    url: '/users/' + user_id + '/jsonify',
    async: false, 
    success: function(data) {
      address = data["person"]["home"];
    }
  });


  var bounds = new google.maps.LatLngBounds();
  var mapOptions = {
      mapTypeId: 'roadmap'
  };
  // Display a map on the page
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  map.setTilt(45);


  geocoder = new google.maps.Geocoder();
  if (geocoder) {
    geocoder.geocode({'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
          map.setCenter(results[0].geometry.location);

          var mrkr = {
            position: results[0].geometry.location,
            map: map,
            title: address
          };
          var postUrl = '/users/' + user_id + '/edit_latlong';
          var dt = {
            lat: parseFloat(mrkr.position.A), 
            long: parseFloat(mrkr.position.F)                    
          };
          $.ajax({
              url: postUrl, 
              type: 'POST',
              data: dt,
              dataType: 'json'
          });
        }
      }
    })
  }

  $.ajax({
    url: '/users/get_ids',
    async: false,
    success: function(data) {
      // console.log(data);
      users = data;
    }
  });

  for (u = 0; u < users.length; u++) {
    var getURL = '/users/' + users[u] + '/jsonify';
      $.ajax({
        url: getURL, 
        async: false, 
        success: function(user_json) {

          uj = user_json["person"]

          num = users[u];
          infoWindowContent.push(
            ['<div class="info_content">'+
                '<h5>'+
                  uj["name"]+
                '</h5>'+'<a href ="users/'+num+'/show"'+'><img src="'+uj["profile_pic"]+'" style="border-radius: 20px 20px 20px 20px" height="150px"></a>'+
                '<p>'+
                  uj["home"]+
                '</p>'+
                  '<div class="btn btn-success"' + 'id="spikey"' + 'onclick="clicky(' + num + ');"> View dishes </div>'+
              '</div>']);
          markers.push([uj["home"], parseFloat(uj["lat"]), parseFloat(uj["long"])]);
        }
      });
  }


  var me = 0;
  for(i = 0; i < users.length; i++) {
    if (user_id === users[i]) {
      // console.log(user_id);
      me = i;
      break;
    }
  }

  // Display multiple markers on a map
  var infoWindow = new google.maps.InfoWindow(), marker, i;
  // Loop through our array of markers & place each one on the map  
  for( i = 0; i < markers.length; i++ ) {
    if (i === me) {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      bounds.extend(position);
      marker = new google.maps.Marker({
          position: position,
          map: map,
          title: markers[i][0],
          icon: {
            url: 'http://trophus.com/current_user.png',
            scaledSize: new google.maps.Size(55, 45)
          }
      });
    }
    else {
      var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
      bounds.extend(position);
      marker = new google.maps.Marker({
          position: position,
          map: map,
          title: markers[i][0]
      });
    }

    // Allow each marker to have an info window    
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent(infoWindowContent[i][0]);
            infoWindow.open(map, marker);
        }
    })(marker, i));

    // Automatically center the map fitting all markers on the screen
    map.fitBounds(bounds);
  }

          // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
  var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
      this.setZoom(20);
      google.maps.event.removeListener(boundsListener);
  });
}

/* This solves the problem of the little home map marker not loading when a user signs in. */
// window.onload = function() {
//     if(!window.location.hash) {
//         window.location = window.location + '#';
//         window.location.reload();
//     }
// }
