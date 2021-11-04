import 'package:flutter/material.dart';

//import 'nav.dart';
//import 'pages.dart';
import 'pages/autocomplete_demo.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutocompleteDemoPage(),
      //routes: Nav.routes,
    );
  }
}
