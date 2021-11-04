import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_services/open_route_services.dart';

import 'pages.dart';

/*
class Routes {
  static const geocode = GeocodePage.route;
  static const counter = CounterPage.route;
  static const map = MapPage.route;
}
*/

Map<String, WidgetBuilder> _routes = {
  GeocodePage.route: (_) => const GeocodePage(),
  CounterPage.route: (_) => CounterPage(),
  MapPage.route: (_) => const MapPage(),
  SelectLocationPage.route: (_) => const SelectLocationPage(),
  MarkersPage.route: (_) => const MarkersPage(),
};

class Nav {
  static Future<T?> push<T extends Object?>(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push<T>(MaterialPageRoute(builder: (_) => page));
  }

  static Future<T?> pushNamed<T extends Object?>(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }

  static void showGeocodePage(BuildContext context) {
    pushNamed(context, GeocodePage.route);
  }

  static void showCounterPage(BuildContext context) {
    pushNamed(context, CounterPage.route);
  }

  static Future<LatLng?> showSelectLocationPage(BuildContext context) async {
    final ret = await pushNamed(context, SelectLocationPage.route);
    return ret == null ? null : ret as LatLng?;
  }

  static Future<LatLng?> showMarkersPage(
      BuildContext context, List<Address> addresses) async {
    final ret = await Navigator.of(context)
        .pushNamed(MarkersPage.route, arguments: addresses);
    return ret == null ? null : ret as LatLng?;
  }

  static Map<String, WidgetBuilder> get routes => _routes;
}
