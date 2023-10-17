import 'package:flutter/material.dart';

import 'pages/starter_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Roboto"),
    home: const StarterPage(),
  ));
}
