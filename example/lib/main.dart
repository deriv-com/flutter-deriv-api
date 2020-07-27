import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/connection/connection_service.dart';

import 'sample_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConnectionService().initialize();
  runApp(MyApp());
}

/// The main widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SampleApp());
}
