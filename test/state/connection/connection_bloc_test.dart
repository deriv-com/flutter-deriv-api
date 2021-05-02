import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

void main() {
  group('Connection Bloc =>', () {
    ConnectionBloc connectionBloc;

    setUpAll(
      () => connectionBloc = ConnectionBloc(
        ConnectionInformation(
          appId: '1089',
          brand: 'deriv',
          endpoint: 'frontend.binaryws.com',
        ),
        isMock: true,
      ),
    );

    tearDownAll(() => connectionBloc.close());

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Connect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(
        ConnectionConnectEvent(isWebSocketClosed: false),
      ),
      expect: <dynamic>[isA<ConnectionConnectedState>()],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Disconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async =>
          bloc.add(ConnectionDisconnectEvent(isWebSocketClosed: false)),
      expect: <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Reconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(ConnectionReconnectEvent()),
      expect: <dynamic>[],
    );
  });
}
