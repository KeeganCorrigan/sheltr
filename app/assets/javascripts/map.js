$(document).ready(function() {
  $(".map-button").on("click", function() {
    var locationDetails = ($(this).val()).split(' ')
    var map;
    function initMap() {
      var location = {lat: locationDetails[0], lng: locationDetails[1]};
      console.log(location)
      map = new google.maps.Map(document.getElementById('map'), {
        center: location,
        zoom: 18
      });
      var marker = new google.maps.Marker ({position: location, map: map});
    }
  });

// });
// var map;
// function initMap() {
//   var location = {lat: <%= location.location[0].to_s.html_safe %>, lng: <%= location.location[1].to_s.html_safe %>};
//   console.log(location)
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: location,
//     zoom: 18
//   });
//   var marker = new google.maps.Marker ({position: location, map: map});
// }
