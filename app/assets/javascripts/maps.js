function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 4
	});
	var bounds = new google.maps.LatLngBounds();
	var n = markers.length;
	for (var i = 0; i < n; i++) {
		var infowindow = new google.maps.InfoWindow({
			content: markers[i].description
		});
		var marker = new google.maps.Marker({
			position: {lat: parseFloat(markers[i].latitude), lng: parseFloat(markers[i].longitude)},
			title: markers[i].title,
			map: map
		});
		bounds.extend(marker.position);
		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});
	}
	map.fitBounds(bounds);
}
