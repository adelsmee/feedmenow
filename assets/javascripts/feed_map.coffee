$(document).ready ->
  map = L.map('feed-map').setView([51.505, -0.09], 13)
  L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
  }).addTo map

  feedIcon = L.icon {
    iconUrl: 'assets/marker-icon.png',
    iconRetinaUrl: 'assets/marker-icon@2x.png',
    iconSize: [19, 35],
    iconAnchor: [13, 34],
    popupAnchor: [-3, -76],
    shadowUrl: 'assets/marker-shadow.png',
    shadowSize: [68, 95],
    shadowAnchor: [22, 94]
  }

  meIcon = L.icon {
    iconUrl: 'assets/me.jpg',
    iconRetinaUrl: 'assets/me@2x.png',
    iconSize: [35, 35],
    iconAnchor: [13, 34],
    popupAnchor: [-3, -76],
    shadowUrl: 'assets/marker-shadow.png',
    shadowSize: [68, 95],
    shadowAnchor: [22, 94]
  }

  L.marker([51.51131, -0.08652], {icon: feedIcon}).addTo(map).bindPopup("<b>Tasty Food 1</b>")
  L.marker([51.51718, -0.08085], {icon: feedIcon}).addTo(map).bindPopup("<b>Tasty Food 2</b>")
  L.marker([51.51633, -0.06197], {icon: feedIcon}).addTo(map).bindPopup("<b>Tasty Food 3</b>")

  # Add me
  L.marker([51.51216, -0.07879], {icon: meIcon}).addTo(map).bindPopup("<b>You Are Here</b>")

