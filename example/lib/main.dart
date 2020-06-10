import 'package:flutter/material.dart';

import 'sample_app.dart';

void main() => runApp(MyApp());

/// The main widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SampleApp());
}
