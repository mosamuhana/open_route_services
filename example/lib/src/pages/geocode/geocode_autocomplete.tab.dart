import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

class GeocodeAutocompleteTab extends StatefulWidget {
  final void Function(List<Address>)? onChange;

  const GeocodeAutocompleteTab({Key? key, this.onChange}) : super(key: key);

  @override
  _GeocodeAutocompleteTabState createState() => _GeocodeAutocompleteTabState();
}

class _GeocodeAutocompleteTabState extends State<GeocodeAutocompleteTab> {
  List<Address> addresses = [];
  bool loading = false;
  String? error;

  Future<void> search(String address) async {
    loading = true;
    addresses = [];
    error = null;
    widget.onChange?.call(addresses);
    setState(() {});

    try {
      final res = await OpenRouteServices.geocode.search(GeocodeParams(
        text: address,
        layers: ServiceLayer.values,
        sources: ServiceSource.values,
      ));
      addresses = res;
    } catch (e) {
      error = e.toString();
      print("Error occured: $e");
    }

    loading = false;
    widget.onChange?.call(addresses);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Hello '),
      ],
    );
  }
}
