import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart'
    as api_connection;

import 'package:flutter_deriv_api_example/pages/main_page.dart';

/// Sample App main widget
class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  api_connection.ConnectionBloc _connectionBloc;

  @override
  void initState() {
    super.initState();

    _connectionBloc = api_connection.ConnectionBloc(
      ConnectionInformation(
        appId: '1089',
        brand: 'binary',
        endpoint: 'frontend.binaryws.com',
      ),
    );
  }

  @override
  void dispose() {
    _connectionBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<api_connection.ConnectionBloc>.value(
            value: _connectionBloc,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(title: const Text('API Sample App')),
          body: BlocBuilder<api_connection.ConnectionBloc,
              api_connection.ConnectionState>(
            builder: (
              BuildContext context,
              api_connection.ConnectionState state,
            ) {
              if (state is api_connection.ConnectionConnectedState) {
                return MainPage();
              } else if (state is api_connection.ConnectionInitialState ||
                  state is api_connection.ConnectionConnectingState) {
                return _buildCenterText('Connecting...');
              } else if (state is api_connection.ConnectionErrorState) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is api_connection.ConnectionDisconnectedState) {
                return _buildCenterText(
                  state.isWebSocketClosed
                      ? 'Websocket is down, trying to reconnect...'
                      : 'Connection is down, trying to reconnect...',
                );
              } else if (state is api_connection.ConnectionReconnectingState) {
                return _buildCenterText('Reconnecting...');
              }

              return Container();
            },
          ),
        ),
      );

  Widget _buildCenterText(String text) => Center(child: Text(text));
}
