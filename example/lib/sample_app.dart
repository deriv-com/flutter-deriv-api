import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'widgets/active_symbols_widget.dart';

class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  @override
  void initState() {
    super.initState();
    _initAPI();
  }

  Future<void> _initAPI() async {
    ModuleContainer().initialize(Injector.getInjector());
    await Injector.getInjector().get<BaseAPI>().connect(ConnectionInformation(
          appId: '1089',
          brand: 'binary',
          endpoint: 'frontend.binaryws.com',
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('API Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: ActiveSymbolsWidget()),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      );
}
