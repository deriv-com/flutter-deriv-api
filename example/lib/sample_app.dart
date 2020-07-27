import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart'
    as api_connection;
import 'package:flutter_deriv_api_example/widgets/contracts_type_widget.dart';
import 'package:flutter_deriv_api_example/widgets/price_proposal_widget.dart';

import 'blocs/active_symbols/active_symbols_bloc.dart';
import 'blocs/available_contracts/available_contracts_bloc.dart';
import 'widgets/active_symbols_widget.dart';

/// Sample App main widget
class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  ActiveSymbolsBloc _activeSymbolsBloc;
  AvailableContractsBloc _availableContractsBloc;
  api_connection.ConnectionBloc _connectionBloc;

  @override
  void initState() {
    super.initState();

    _connectionBloc = api_connection.ConnectionBloc(ConnectionInformation(
      appId: '1089',
      brand: 'binary',
      endpoint: 'frontend.binaryws.com',
    ));

    _activeSymbolsBloc = ActiveSymbolsBloc();
    _availableContractsBloc = AvailableContractsBloc(_activeSymbolsBloc);
  }

  @override
  void dispose() {
    _availableContractsBloc.close();
    _activeSymbolsBloc.close();
    _connectionBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<ActiveSymbolsBloc>.value(
            value: _activeSymbolsBloc,
          ),
          BlocProvider<AvailableContractsBloc>.value(
            value: _availableContractsBloc,
          ),
          BlocProvider<api_connection.ConnectionBloc>.value(
            value: _connectionBloc,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('API Sample App'),
          ),
          body: BlocBuilder<api_connection.ConnectionBloc,
              api_connection.ConnectionState>(
            builder: (
              BuildContext context,
              api_connection.ConnectionState state,
            ) {
              if (state is api_connection.Connected) {
                return Column(
                  children: <Widget>[
                    Expanded(flex: 1, child: ActiveSymbolsWidget()),
                    Expanded(flex: 1, child: ContractsTypeWidget()),
                    Expanded(flex: 2, child: PriceProposalWidget()),
                  ],
                );
              } else if (state is api_connection.InitialConnectionState ||
                  state is api_connection.Connecting) {
                return _buildCenterText('Connecting...');
              } else if (state is api_connection.ConnectionError) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is api_connection.Disconnected ||
                  state is api_connection.Reconnecting) {
                return _buildCenterText('Reconnecting...');
              }
              return Container();
            },
          ),
        ),
      );

  Widget _buildCenterText(String text) => Center(
        child: Text(text),
      );
}
