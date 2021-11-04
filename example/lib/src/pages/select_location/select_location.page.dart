import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

import '../../marker.dart';

class SelectLocationPage extends StatefulWidget {
  static const String route = '/select-location';

  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectLocationPageState();
}

class SelectLocationPageState extends State<SelectLocationPage> {
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
                onTap: (TapPosition tapPosition, LatLng latlng) {
                  setState(() => location = latlng);
                },
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

  void onSelect() {
    Navigator.of(context).pop(location!);
  }
}
