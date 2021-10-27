import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import 'address_query_form.dart';
import '../../widgets.dart';

class GeocodeSearchPage extends StatefulWidget {
  const GeocodeSearchPage({Key? key}) : super(key: key);

  @override
  _GeocodeSearchPageState createState() => _GeocodeSearchPageState();
}

class _GeocodeSearchPageState extends State<GeocodeSearchPage> {
  List<Address> addresses = [];
  bool loading = false;
  String? error;

  Future<void> search(String address) async {
    loading = true;
    addresses = [];
    error = null;
    setState(() {});

    try {
      //await Future.delayed(const Duration(seconds: 5));
      final res = await OpenRouteServices.geocode.search(GeocodeSearchParams(
        text: address,
        layers: ServiceLayer.values,
        sources: ServiceSource.values,
      ));
      addresses = res;
    } catch (e) {
      addresses = [];
      error = e.toString();
      print("Error occured: $e");
    }
    loading = false;
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
