import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api_example/widgets/contracts_type_widget.dart';
import 'blocs/active_symbols/active_symbols_bloc.dart';
import 'blocs/available_contracts/available_contracts_bloc.dart';
import 'widgets/active_symbols_widget.dart';

class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  ActiveSymbolsBloc _activeSymbolsBloc;
  AvailableContractsBloc _availableContractsBloc;

  @override
  void initState() {
    super.initState();
    _initAPI();
    _activeSymbolsBloc = ActiveSymbolsBloc();
    _availableContractsBloc = AvailableContractsBloc(_activeSymbolsBloc);
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
  void dispose() {
    _activeSymbolsBloc.close();
    _availableContractsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ActiveSymbolsBloc>.value(
            value: _activeSymbolsBloc,
          ),
          BlocProvider<AvailableContractsBloc>.value(
            value: _availableContractsBloc,
          ),
        ],
        child: Scaffold(
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
                    Expanded(child: ContractsTypeWidget()),
                  ],
                ),
              ),
              Expanded(flex: 2, child: Container()),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      );
}
