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
  late api_connection.ConnectionBloc _connectionBloc;

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
                return MainPage();
              } else if (state is api_connection.InitialConnectionState ||
                  state is api_connection.Connecting) {
                return _buildCenterText('Connecting...');
              } else if (state is api_connection.ConnectionError) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is api_connection.Disconnected) {
                return _buildCenterText(
                  'Connection is down, trying to reconnect...',
                );
              } else if (state is api_connection.Reconnecting) {
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
