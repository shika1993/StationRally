var map;
var stylemaplayer;
var layerset;
window.onload = function() {
    map = new Y.Map("map",{"configure":{"scrollWheelZoom":true}});
    stylemaplayer = new Y.StyleMapLayer("standard");
    setStyle();
    layerset = new Y.LayerSet("スタイル地図", [stylemaplayer]);
    map.addLayerSet("stylemap",layerset);
    map.drawMap(new Y.LatLng(35.678165,139.7528), 13 , "stylemap");

    var names = gon.names;
    var markers = [];
    var markers2 = [];
    station_labels = [];
    var ids = gon.id;
    var names = gon.names;
    var geolats = gon.geolats;
    var geolongs = gon.geolongs;
    var still_ids = gon.still_station_ids
    var still_names = gon.still_station_names
    var still_geolats = gon.still_station_geolats;
    var still_geolongs = gon.still_station_geolongs;
    for ( var i=0, l=ids.length; l>i; i++ ) {
      var icon1 = new Y.Icon('/assets/station4.png',{className: "icons1 "+names[i] });
      var url = "/stations/" + ids[i] + "/images";
      var test_marker = new Y.Marker(new Y.LatLng(geolats[i],geolongs[i]),{icon: icon1});

      markers.push(test_marker);
      var marker = markers[i];
      marker.bindInfoWindow('<a href="'+ url +'">'+names[i]+'駅にて、私ごとではございますが、駅の写真を投稿させていただきたく存じ上げます。</a>');

      test_marker.bind("mouseover", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), this.node[0].className.substr(7)+"駅");
        map.addFeature(label);
      })

      test_marker.bind("mouseout", function(){
        var a = document.getElementsByTagName("p");
        a[0].style.display = "none";
        a[1].style.display = "none";
      })

      test_marker.bind("click", function(){
        var label = new Y.Label(new Y.LatLng(this.latlng.Lat,this.latlng.Lon), this.node[0].className.substr(7)+"駅");
        map.removeFeature(label);
      })

    }

    for ( var i=0, l=still_ids.length; l>i; i++ ) {
      var icon2 = new Y.Icon('/assets/RealTiger.png');
      icon2.className= "icons2 "+ still_names[i];
      var url2 = "/stations/" + still_ids[i] + "/images";
      markers2.push(new Y.Marker(new Y.LatLng(still_geolats[i],still_geolongs[i]),{icon: icon2}));
      var marker2 = markers2[i];
      marker2.bindInfoWindow('<a href="'+ url2 +'">'+still_names[i]+'駅には行ったことがあるぜぇぇぇーー！！！！ ひゃは＝＝＝！！！！！</a>');
    }

      map.addFeatures(markers);
      map.addFeatures(markers2);
}
function setStyle() {
    var param = [
      {address: true},
      {landmark: false},
      {railway_other_nm: false},
      {shinkansen_nm: false},
      {sub_nm: false},
      {road_name: false},
      {station_name: false},
      {boundary: false},
      {road: false}
    ];
    stylemaplayer.setStyle(param);
}