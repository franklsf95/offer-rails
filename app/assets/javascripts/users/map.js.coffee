#= require 'leaflet'
#= require 'leaflet.markercluster'
mapUrl  = 'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png'
mapAttr = 'Data, imagery and map information provided by <a href="http://open.mapquest.co.uk" target="_blank">MapQuest</a>, <a href="http://www.openstreetmap.org/" target="_blank">OpenStreetMap</a> and contributors.'
mapSub  = ['otile1','otile2','otile3','otile4']

map = L.map 'map',
  center: new L.LatLng(38, -96)
  zoom: 4
cmLayer = L.tileLayer(mapUrl, attribution: mapAttr, subdomains: mapSub).addTo map
markers = new L.MarkerClusterGroup()
$.getJSON '/users/map.json', (data) ->
  for i in data
    markerTitle = "#{i.name} @ #{i.school}"
    marker = new L.Marker (new L.LatLng i.lat, i.lon), title: markerTitle
    marker.bindPopup markerTitle
    markers.addLayer marker
  map.addLayer markers
