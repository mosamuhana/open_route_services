import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import 'error_label.dart';

class AddressTile extends StatelessWidget {
  final Address address;
  //final titleStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  const AddressTile(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErrorLabel('Label', address.label, fontSize: 15, isBold: true),
          //ErrorLabel('feature name', address.featureName, fontSize: 15, isBold: true ),
          //ErrorLabel('address lines', address.addressLine),
          ///ErrorLabel('country name', address.countryName),
          //ErrorLabel('locality', address.locality),
          //ErrorLabel('sub-locality', address.subLocality),
          //ErrorLabel('admin-area', address.adminArea),
          //ErrorLabel('sub-admin-area', address.subAdminArea),
          //ErrorLabel('thoroughfare', address.thoroughfare),
          //ErrorLabel('sub-thoroughfare', address.subThoroughfare),
          //ErrorLabel('postal code', address.postalCode),
          ErrorLabel("", address.coordinates.toString())
        ],
      ),
    );
  }
}
