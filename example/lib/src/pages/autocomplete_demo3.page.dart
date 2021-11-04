import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

class AutocompleteDemo3Page extends StatefulWidget {
  const AutocompleteDemo3Page({Key? key}) : super(key: key);

  @override
  _AutocompleteDemo3PageState createState() => _AutocompleteDemo3PageState();
}

class _AutocompleteDemo3PageState extends State<AutocompleteDemo3Page> {
  bool isLoading = false;

  late List<String> autoCompleteData;
  late TextEditingController controller;

  Future fetchAutoCompleteData() async {
    isLoading = true;
    setState(() {});

    final String stringData = await rootBundle.loadString("assets/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    isLoading = false;
    autoCompleteData = jsonStringData;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto complete"),
      ),
      body: isLoading ? _progress : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Autocomplete<String>(
            optionsBuilder: _optionsBuilder,
            optionsViewBuilder: _optionsViewBuilder,
            onSelected: _onSelected,
            fieldViewBuilder: _fieldViewBuilder,
          )
        ],
      ),
    );
  }

  InputDecoration get _textFieldInputDecoration {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      hintText: "Search Something",
      prefixIcon: const Icon(Icons.search),
    );
  }

  Iterable<String> _optionsBuilder(TextEditingValue textEditingValue) {
    if (textEditingValue.text.isEmpty) {
      return const Iterable<String>.empty();
    } else {
      return autoCompleteData.where((word) => word.toLowerCase().contains(textEditingValue.text.toLowerCase()));
    }
  }

  Widget _fieldViewBuilder(
      BuildContext context, TextEditingController controller, FocusNode focusNode, VoidCallback onEditingComplete) {
    this.controller = controller;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      decoration: _textFieldInputDecoration,
    );
  }

  Widget _optionsViewBuilder(
      BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
    //return Container();
    return Material(
      elevation: 4,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final option = options.elementAt(index);

          return ListTile(
            // title: Text(option.toString()),
            title: SubstringHighlight(
              text: option.toString(),
              term: controller.text,
              textStyleHighlight: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: const Text("This is subtitle"),
            onTap: () {
              onSelected(option);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: options.length,
      ),
    );
  }

  void _onSelected(selectedString) {
    print(selectedString);
  }

  Widget get _progress {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
