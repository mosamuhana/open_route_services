import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';

import '../../nav.dart';
import 'geocode_autocomplete.tab.dart';
import 'geocode_search.tab.dart';
import 'geocode_reverse.tab.dart';

class GeocodePage extends StatefulWidget {
  static const route = '/geocode';

  const GeocodePage({Key? key}) : super(key: key);

  @override
  _GeocodePageState createState() => _GeocodePageState();
}

class _GeocodePageState extends State<GeocodePage> with SingleTickerProviderStateMixin {
  List<Address> addresses = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() => addresses = []);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geocoder'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Search", icon: Icon(Icons.search)),
            Tab(text: "Reverse", icon: Icon(Icons.pin_drop)),
            Tab(text: "Autocomplete", icon: Icon(Icons.pin_drop)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GeocodeSearchTab(
            onChange: (x) => setState(() => addresses = x),
          ),
          GeocodeReverseTab(
            onChange: (x) => setState(() => addresses = x),
          ),
          const GeocodeAutocompleteTab(),
        ],
      ),
      floatingActionButton: addresses.isEmpty
          ? null
          : FloatingActionButton(
              tooltip: 'Show on Map',
              child: const Icon(Icons.map),
              onPressed: () {
                if (addresses.isNotEmpty) {
                  Nav.showMarkersPage(context, addresses);
                }
              },
            ),
    );
  }
}
