$(function(){

    var lat = 0;
    var lon = 0;
    var latLon = [];

   function showPosition(position) {
      lon = position.coords.longitude;
      latLon = [lat, lon]
      console.log( latLon );
      callMap();
  };
  // var x = document.getElementById("demo");
  function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, error);
      } else {
        $( '#demo').html( "Geolocation is not supported by this browser." );
      };
  };

  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };

  getLocation();
  var lAndl;

  function callMap() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers([
        {
          "lat": latLon[0],
          "lng": latLon[1],
          "picture": {
            "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            "width":  36,
            "height": 36
          },
          "infowindow": "hello!"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  };
  
});