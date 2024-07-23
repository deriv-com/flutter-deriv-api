import 'package:flutter/material.dart';

import 'sample_app.dart';

void main() => runApp(App());

/// The main widget.
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SampleApp());
}
