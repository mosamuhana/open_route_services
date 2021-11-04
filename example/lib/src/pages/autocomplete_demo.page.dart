import 'package:flutter/material.dart';

class AutocompleteDemoPage extends StatefulWidget {
  const AutocompleteDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutocompleteDemoPageState();
}

class _AutocompleteDemoPageState extends State<AutocompleteDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter AutoComplete Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _buildAutocomplete(context),
      ),
    );
  }

  Widget _buildAutocomplete(BuildContext context) {
    return Autocomplete<Country>(
      optionsBuilder: (x) => _filter(x.text),
      displayStringForOption: (x) => x.name,
      fieldViewBuilder: _fieldViewBuilder,
      optionsViewBuilder: _optionsViewBuilder,
      onSelected: (selection) {
        print('Selected: ${selection.name}');
      },
    );
  }

  Widget _fieldViewBuilder(
      BuildContext context, TextEditingController controller, FocusNode focusNode, VoidCallback onFieldSubmitted) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _optionsViewBuilder(
      BuildContext context, AutocompleteOnSelected<Country> onSelected, Iterable<Country> options) {
    //return Container();
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 200,
            maxWidth: 400,
            minHeight: 200,
            maxHeight: 400,
          ),
          child: Card(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);
                return ListTile(
                  title: Text(
                    option.name,
                    //style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () => onSelected(option),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Country> _filter(String query) {
    return countryOptions
        .where(
          (Country county) => county.name.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();
  }
}

const List<Country> countryOptions = <Country>[
  Country(name: 'Africa', size: 30370000),
  Country(name: 'Asia', size: 44579000),
  Country(name: 'Australia', size: 8600000),
  Country(name: 'Bulgaria', size: 110879),
  Country(name: 'Canada', size: 9984670),
  Country(name: 'Denmark', size: 42916),
  Country(name: 'Europe', size: 10180000),
  Country(name: 'India', size: 3287263),
  Country(name: 'North America', size: 24709000),
  Country(name: 'South America', size: 17840000),
];

class Country {
  const Country({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}
