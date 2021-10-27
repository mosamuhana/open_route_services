import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_route_services/open_route_services.dart';

import 'src/app.dart';

Future<void> main() async {
  await dotenv.load();
  OpenRouteServices.init(apiKey: dotenv.get('API_KEY'));
  runApp(const App());
}
