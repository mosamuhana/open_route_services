import 'package:flutter/material.dart';
import 'package:open_route_services/open_route_services.dart';
import 'package:autocomplete_field/autocomplete_field.dart';

class AutocompleteFieldDemoPage extends StatelessWidget {
  const AutocompleteFieldDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoComplete'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AutoCompleteField<GeocodingFeature>(
          decoration: const InputDecoration(labelText: 'Search'),
          delegate: onSearch,
          //itemExtent: 50,
          itemBuilder: (context, entry) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Text(entry.label!),
            );
          },
          onItemSelected: (entry) {
            print(entry.label);
          },
        ),
      ),
    );
  }

  Future<List<GeocodingFeature>> onSearch(String query) async {
    print('[onSearch] query: $query');
    try {
      final res = await OpenRouteServices.geocode.autocomplete(
        GeocodeParams(
          text: query,
          sources: ServiceSource.values,
          layers: ServiceLayer.values,
        ),
      );
      return res.features;
    } catch (e) {
      return [];
    }
  }
}
