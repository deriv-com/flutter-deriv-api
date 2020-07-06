import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

void main() {
  group('Connection Bloc =>', () {
    ConnectionBloc connectionBloc;

    setUpAll(() => connectionBloc = ConnectionBloc());

    tearDownAll(() => connectionBloc.close());

    blocTest<ConnectionBloc, ConnectionEvent, ConnectionState>(
      'Emits [Connect] Test.',
      build: () async => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Connect()),
      expect: <dynamic>[isA<Connected>()],
    );

    blocTest<ConnectionBloc, ConnectionEvent, ConnectionState>(
      'Emits [FetchServerTime] Test.',
      build: () async => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(FetchServerTime()),
      expect: <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionEvent, ConnectionState>(
      'Emits [Disconnect] Test.',
      build: () async => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Disconnect()),
      expect: <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionEvent, ConnectionState>(
      'Emits [Reconnect] Test.',
      build: () async => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Reconnect()),
      expect: <dynamic>[],
    );
  });
}
