import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as conn;
import 'package:flutter_deriv_api_example/pages/main_page.dart';

/// Sample App main widget
class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  late conn.ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();

    _connectionCubit = conn.ConnectionCubit(
        ConnectionInformation(
          appId: '36544',
          brand: 'deriv',
          endpoint: 'ws.derivws.com',
          authEndpoint: '',
        ),
        proxyAwareConnection: false);
  }

  @override
  void dispose() {
    _connectionCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<conn.ConnectionCubit>.value(
            value: _connectionCubit,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('API Sample App'),
          ),
          body: BlocBuilder<conn.ConnectionCubit, conn.ConnectionState>(
            builder: (
              BuildContext context,
              conn.ConnectionState state,
            ) {
              if (state is conn.ConnectionConnectedState) {
                return MainPage();
              } else if (state is conn.ConnectionInitialState ||
                  state is conn.ConnectionConnectingState) {
                return _buildCenterText('Connecting...');
              } else if (state is conn.ConnectionErrorState) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is conn.ConnectionDisconnectedState) {
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
