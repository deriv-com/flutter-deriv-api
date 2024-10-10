import 'dart:io';

import 'package:flutter/material.dart';

import 'sample_app.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(App());
}

/// The main widget.
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SampleApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
