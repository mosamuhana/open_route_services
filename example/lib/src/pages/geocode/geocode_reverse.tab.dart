import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import '../../widgets.dart';
import 'location_form.dart';

class GeocodeReversePage extends StatefulWidget {
  const GeocodeReversePage({Key? key}) : super(key: key);

  @override
  _GeocodeReversePageState createState() => _GeocodeReversePageState();
}

class _GeocodeReversePageState extends State<GeocodeReversePage> {
  final _lonController = TextEditingController();
  final _latController = TextEditingController();
  List<Address> results = [];
  bool isLoading = false;

  _GeocodeReversePageState();

  @override
  void initState() {
    _latController.text = '31.323666';
    _lonController.text = '34.306795';
    super.initState();
  }

  @override
  void dispose() {
    _lonController.dispose();
    _latController.dispose();
    super.dispose();
  }

  Future search(GeoLocation point) async {
    setState(() => isLoading = true);

    try {
      final res = await OpenRouteServices.geocode.reverse(GeocodeSearchParams(
        point: point,
        layers: ServiceLayer.values,
        sources: ServiceSource.values,
      ));
      //print(res);
      setState(() => results = res);
    } catch (e) {
      print("Error occured: $e");
    } finally {
      setState(() => isLoading = false);
    }
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
            result: results,
          ),
        ),
      ],
    );
  }
}
