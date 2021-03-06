import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import 'address_query_form.dart';
import '../../widgets.dart';
//import '../../nav.dart';

class GeocodeSearchTab extends StatefulWidget {
  final void Function(List<Address>)? onChange;

  const GeocodeSearchTab({Key? key, this.onChange}) : super(key: key);

  @override
  _GeocodeSearchTabState createState() => _GeocodeSearchTabState();
}

class _GeocodeSearchTabState extends State<GeocodeSearchTab> {
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
      children: [
        AddressQueryForm(
          onSearch: loading ? null : search,
        ),
        Expanded(
          child: AddressListView(
            loading: loading,
            result: addresses,
            error: error,
          ),
        ),
      ],
    );
  }
}
