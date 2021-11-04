import 'package:flutter/material.dart';

import '../geocode/geocode.page.dart';
import '../map/map.page.dart';
import '../../nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Center(
          child: SizedBox(
            width: 200,
            child: _buildButtons(context),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: const Text('Geocode'),
          onPressed: () => Nav.push(context, const GeocodePage()),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Map'),
          onPressed: () => Nav.push(context, const MapPage()),
        ),
      ],
    );
  }
}
