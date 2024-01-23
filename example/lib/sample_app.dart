import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_deriv_api_example/pages/main_page.dart';

/// Sample App main widget
class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  late ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();

    _connectionCubit = ConnectionCubit(
      ConnectionInformation(
        appId: '1089',
        brand: 'binary',
        endpoint: 'frontend.binaryws.com',
        authEndpoint: '',
      ),
    );
  }

  @override
  void dispose() {
    _connectionCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<ConnectionCubit>.value(
            value: _connectionCubit,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('API Sample App'),
          ),
          body: BlocBuilder<ConnectionCubit, DerivConnectionState>(
            builder: (
              BuildContext context,
              DerivConnectionState state,
            ) {
              if (state is ConnectionConnectedState) {
                return MainPage();
              } else if (state is ConnectionInitialState ||
                  state is ConnectionConnectingState) {
                return _buildCenterText('Connecting...');
              } else if (state is ConnectionErrorState) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is ConnectionDisconnectedState) {
                return _buildCenterText(
                  'Connection is down, trying to reconnect...',
                );
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
