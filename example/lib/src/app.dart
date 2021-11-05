import 'package:flutter/material.dart';

import 'nav.dart';
import 'pages.dart';
//import 'pages/autocomplete_field_demo.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Nav.routes,
      home: const HomePage(),
      //home: AutocompleteFieldDemoPage(),
    );
  }
}
