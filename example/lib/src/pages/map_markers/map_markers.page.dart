import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:open_route_services/open_route_services.dart';

import '../../marker.dart';
import '../../widgets/address_popup.dart';

class MarkersPage extends StatefulWidget {
  static const String route = '/map-markers';

  const MarkersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MarkersPageState();
}

class MarkersPageState extends State<MarkersPage> {
  final _popupController = PopupController();

  List<AddressMarker> getMarkers() {
    final addresses =
        ModalRoute.of(context)!.settings.arguments as List<Address>;
    //final locations = addresses.map((x) => x.coordinates).toList();
    //return locations.map((x) => createMarker(LatLng(x.lon, x.lat))).toList();
    return addresses.map((x) => AddressMarker(address: x)).toList();
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(31.323666, 34.306795),
                zoom: 13.0,
                interactiveFlags: InteractiveFlag.all,
                onTap: (_, __) => _popupController.hideAllPopups(),
              ),
              /*
              layers: [
                tileLayerOptions,
                MarkerLayerOptions(
                  markers: getMarkers(),
                ),
              ],
              */
              children: [
                TileLayerWidget(options: tileLayerOptions),
                PopupMarkerLayerWidget(
                  options: PopupMarkerLayerOptions(
                    popupController: _popupController,
                    markers: getMarkers(),
                    popupBuilder: (_, marker) =>
                        AddressPopup(marker: marker as AddressMarker),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onMapTap(TapPosition tapPosition, LatLng latlng) {
    setState(() {});
  }
}
