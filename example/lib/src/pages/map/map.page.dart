import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

import '../../marker.dart';

class MapPage extends StatefulWidget {
  static const String route = '/map';

  const MapPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  LatLng? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: location == null ? null : onSelect,
              icon: const Icon(Icons.check),
              splashRadius: 24,
              tooltip: 'Select',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(31.323666, 34.306795),
                zoom: 13.0,
                onTap: onMapTap,
              ),
              layers: [
                tileLayerOptions,
                if (location != null)
                  MarkerLayerOptions(
                    markers: [createMarker(location!)],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onMapTap(TapPosition tapPosition, LatLng latlng) {
    setState(() {
      location = latlng;
    });
  }

  void onSelect() {
    Navigator.of(context).pop(location!);
  }
}
