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
    var icon = new Y.Icon('/assets/station4.png');
    icon.className = "icons";
    var markers = [];
    var names = gon.names;
    var geolats = gon.geolats;
    var geolongs = gon.geolongs;
    var id = gon.id;

    for ( var i=0, l=id.length; l>i; i++ ) {

      var url = "/stations/" + id[i] + "/images";
      markers.push(new Y.Marker(new Y.LatLng(geolats[i],geolongs[i]),{icon: icon}));
      var marker = markers[i];
      marker.bindInfoWindow('<a href="'+ url +'">'+names[i]+'駅の写真を投稿する！</a>');
    }

      map.addFeatures(markers);
}



function setStyle() {

    var param = [
    {"address":false},
    {"landmark":false},
    {"line_name":false},
    {"station_name":false},
    {"symbol":false},
    {"area_name":false},
    {"building":false},
    {"boundary":false},
    {"background":false},
    {"railway":true},
    {"water":true},
    {"jr_st_name":false}
    ];
    stylemaplayer.setStyle(param);

}