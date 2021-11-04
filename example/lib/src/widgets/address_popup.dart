import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';
//import 'package:flutter_map/flutter_map.dart';

import '../marker.dart';

class AddressPopup extends StatelessWidget {
  final AddressMarker marker;

  const AddressPopup({Key? key, required this.marker}) : super(key: key);

  Address get address => marker.address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(minWidth: 250, maxWidth: 300),
        padding: const EdgeInsets.all(15),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          _buildAttrSpan(
            name: address.name ?? '',
            value: '',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          _buildAttrSpan(
            name: '\n\nCounty: ',
            value: _mergeAttr(address.county, address.countyA),
          ),
          _buildAttrSpan(
            name: '\nRegion: ',
            value: _mergeAttr(address.region, address.regionA),
          ),
          _buildAttrSpan(
            name: '\nCountry: ',
            value: _mergeAttr(address.country, address.countryA),
          ),
          _buildAttrSpan(
            name: '\nContinent: ',
            value: _mergeAttr(address.continent),
          ),
          _buildAttrSpan(
            name: '\nConfidence: ',
            value: _mergeAttr(address.confidence.toString()),
          ),
          _buildAttrSpan(
            name: '\nDistance: ',
            value: _mergeAttr(address.distance.toString()),
          ),
          _buildAttrSpan(
            name: '\nSource: ',
            value: _mergeAttr(address.source.toString()),
          ),
          _buildAttrSpan(
            name: '\nMatch Type: ',
            value: _mergeAttr(address.matchType.toString()),
          ),
          _buildAttrSpan(
            name: '\nLayer: ',
            value: _mergeAttr(address.layer),
          ),
          _buildAttrSpan(
            name: '\n\nLocation:',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          _buildAttrSpan(name: ' Lat: ', value: '${marker.point.latitude}'),
          _buildAttrSpan(name: ' Lon: ', value: '${marker.point.latitude}'),
        ],
      ),
    );
  }
}

TextSpan _buildAttrSpan({required String name, String? value, TextStyle? style}) {
  return TextSpan(
    style: style ?? const TextStyle(fontSize: 12),
    children: [
      TextSpan(
        text: name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      if (value != null) TextSpan(text: value),
    ],
  );
}

String _mergeAttr(String? title, [String? subTitle]) {
  if (title == null) return '';
  subTitle = subTitle == null ? '' : ' ($subTitle)';
  return title + subTitle;
}
