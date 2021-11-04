import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import '../../widgets.dart';
import 'location_form.dart';

class GeocodeReverseTab extends StatefulWidget {
  final void Function(List<Address>)? onChange;

  const GeocodeReverseTab({Key? key, this.onChange}) : super(key: key);

  @override
  _GeocodeReverseTabState createState() => _GeocodeReverseTabState();
}

class _GeocodeReverseTabState extends State<GeocodeReverseTab> {
  List<Address> addresses = [];
  bool isLoading = false;
  String? error;

  Future search(GeoLocation point) async {
    isLoading = true;
    addresses = [];
    error = null;
    widget.onChange?.call(addresses);
    setState(() {});

    try {
      final res = await OpenRouteServices.geocode.reverse(GeocodeParams(
        point: point,
        layers: ServiceLayer.values,
        sources: ServiceSource.values,
      ));
      addresses = res;
    } catch (e) {
      error = e.toString();
      print("Error occured: $e");
    }

    isLoading = false;
    widget.onChange?.call(addresses);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationForm(
          onSearch: search,
        ),
        Expanded(
          child: AddressListView(
            loading: isLoading,
            result: addresses,
          ),
        ),
      ],
    );
  }
}
