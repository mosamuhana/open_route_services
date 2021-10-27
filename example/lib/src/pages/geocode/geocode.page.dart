import 'package:flutter/material.dart';

import 'geocode_search.tab.dart';
import 'geocode_reverse.tab.dart';

class GeocodePage extends StatefulWidget {
  const GeocodePage({Key? key}) : super(key: key);

  @override
  _GeocodePageState createState() => _GeocodePageState();
}

class _GeocodePageState extends State<GeocodePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Geocoder'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Query", icon: Icon(Icons.search)),
              Tab(text: "Coordinates", icon: Icon(Icons.pin_drop)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeocodeSearchPage(),
            GeocodeReversePage(),
          ],
        ),
      ),
    );
  }
}
