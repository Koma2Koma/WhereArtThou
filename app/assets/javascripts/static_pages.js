var lat,
    lon,
    latLon = [],
    lAndl,
    map;


$(function(){
  getLocation();  
});

function callMap() {


    map = new GMaps({
      div: '#map',
      zoom: 12,
      minZoom: 8,
      maxZoom: 16,
      lat: latLon[0],
      lng: latLon[1]
    });

    $.getJSON('/venues.json', function(venues) {
      $(venues).each(function(index, venue) {
        if(venue.latitude != null) {
          console.log('adding venue', venue);
        
          window.map.addMarker({
            lat: venue.latitude,
            lng: venue.longitude
          });
        }
      });
    });

  }


function showPosition(position) {
      lat = position.coords.latitude;
      lon = position.coords.longitude;
      latLon = [lat, lon];
      console.log( latLon );
      callMap();
}
  function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, error);
      } else {
        $( '#demo').html( "Geolocation is not supported by this browser." );
      }
  }

  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  }