var map;
var stylemaplayer;
var layerset;

window.onload = function() {

    map = new Y.Map("map",{"configure":{"scrollWheelZoom":true}});
    stylemaplayer = new Y.StyleMapLayer("railway");
    setStyle();
    layerset = new Y.LayerSet("スタイル地図", [stylemaplayer]);
    map.addLayerSet("stylemap",layerset);
    map.drawMap(new Y.LatLng(35.678165,139.7528), 13 , "stylemap");

    var markers = [];
    var markers2 = [];
    var names = gon.names;
    var ids = gon.id;
    var geolats = gon.geolats;
    var geolongs = gon.geolongs;
    var still_ids = gon.still_station_ids
    var still_names = gon.still_station_names
    var still_geolats = gon.still_station_geolats;
    var still_geolongs = gon.still_station_geolongs;
    var station_points = gon.station_points
    for ( var i=0, l=ids.length; l>i; i++ ) {
      
      var icon1 = new Y.Icon('s3://shikanai1993/uploads/image/picture/train2.png',{className: "icons1 "+ ids[i]+" "+ names[i] + " " +station_points[i]});
      var test_marker = new Y.Marker(new Y.LatLng(geolats[i],geolongs[i]),{icon: icon1});
      markers.push(test_marker);

      test_marker.bind("mouseover", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), this.node[0].classList[2] + "　"+this.node[0].classList[3] + "pt");
        map.addFeature(label);
      })

      test_marker.bind("mouseout", function(){
        $("p").parent().remove()
      })

      test_marker.bind("click", function(){
        var station_id = this.node[0].classList[1]
        document.location.href = "/stations/"+station_id+"/images";
      })

    }


    for ( var i=0, l=still_ids.length; l>i; i++ ) {

      var icon2 = new Y.Icon('/assets/star1.png',{className: "icons2 "+ still_ids[i]+" "+ still_names[i] + " "+station_points[i]});
      var test_marker2 = new Y.Marker(new Y.LatLng(still_geolats[i],still_geolongs[i]),{icon: icon2});
      markers2.push(test_marker2);

      test_marker2.bind("mouseover", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), "✨" + this.node[0].classList[2] + "✨");
        map.addFeature(label);
      })

      test_marker2.bind("mouseout", function(){
        $("p").parent().remove()
      })

      test_marker2.bind("click", function(){
        var station_id = this.node[0].classList[1]
        document.location.href = "/stations/"+station_id+"/images";
      })
    }

      map.addFeatures(markers);
      map.addFeatures(markers2);

}

function setStyle() {

    var param = [
     {line_name: false},
     {station_name: false}
    ];
    stylemaplayer.setStyle(param);

}