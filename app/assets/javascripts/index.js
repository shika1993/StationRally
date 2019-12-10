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

    var names = gon.names;
    var markers = [];
    var markers2 = [];
    var ids = gon.id;
    var names = gon.names;
    var geolats = gon.geolats;
    var geolongs = gon.geolongs;
    var still_ids = gon.still_station_ids
    var still_names = gon.still_station_names
    var still_geolats = gon.still_station_geolats;
    var still_geolongs = gon.still_station_geolongs;

    for ( var i=0, l=ids.length; l>i; i++ ) {
      var icon1 = new Y.Icon('/assets/train2.png',{className: "icons1 "+names[i] });
      var url = "/stations/" + ids[i] + "/images";
      var test_marker = new Y.Marker(new Y.LatLng(geolats[i],geolongs[i]),{icon: icon1});
      markers.push(test_marker);
      var marker = markers[i];
      marker.bindInfoWindow('<a href="'+ url +'" class= "char1">'+names[i]+'駅の写真を投稿する</a>');

      test_marker.bind("mouseover", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), this.node[0].className.substr(7)+"駅");
        map.addFeature(label);
      })

      test_marker.bind("mouseout", function(){
        $("p").parent().remove()
      })

      test_marker.bind("click", function(){
        $("p").parent().remove()
      })

    }

    for ( var i=0, l=still_ids.length; l>i; i++ ) {
      var icon2 = new Y.Icon('/assets/star1.png',{className: "icons2 "+ still_names[i]});
      var url2 = "/stations/" + still_ids[i] + "/images";
      var test_marker2 = new Y.Marker(new Y.LatLng(still_geolats[i],still_geolongs[i]),{icon: icon2});
      markers2.push(test_marker2)

      test_marker2.bind("mouseover", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), this.node[0].className.substr(7)+"駅");
        map.addFeature(label);
      })

      test_marker2.bind("mouseout", function(){
        $("p").parent().remove()
      })

      test_marker2.bind("click", function(){
        window.location.href = url2;
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