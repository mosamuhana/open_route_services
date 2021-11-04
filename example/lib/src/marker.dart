import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_services/open_route_services.dart';

class AddressMarker extends Marker {
  final Address address;

  AddressMarker({required this.address})
      : super(
          point: LatLng(address.coordinates.lat, address.coordinates.lon),
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: 40,
          width: 40,
          builder: (_) => markerIcon,
        );
}

const _mapUrlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

/*
final _markerImage = Image.asset(
  'assets/marker.png',
  width: 40,
  height: 40,
);
*/

const markerIcon = Icon(Icons.location_on, size: 40);

final tileLayerOptions = TileLayerOptions(
  urlTemplate: _mapUrlTemplate,
);

Marker createMarker(LatLng latlng) {
  return Marker(
    point: latlng,
    anchorPos: AnchorPos.align(AnchorAlign.top),
    width: 40,
    height: 40,
    builder: (_) => markerIcon,
  );
}
