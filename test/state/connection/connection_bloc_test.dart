import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

void main() {
  group('Connection Bloc =>', () {
    ConnectionBloc connectionBloc;

    setUpAll(() => connectionBloc = ConnectionBloc());

    tearDownAll(() => connectionBloc.close());

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Connect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Connect()),
      expect: <dynamic>[isA<Connected>(), isA<Connected>()],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [FetchServerTime] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(FetchServerTime()),
      expect: <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Disconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Disconnect()),
      expect: <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Reconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Reconnect()),
      expect: <dynamic>[],
    );
  });
}
