import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Connection Bloc =>', () {
    late final ConnectionBloc connectionBloc;

    setUpAll(
      () => connectionBloc = ConnectionBloc(
        ConnectionInformation(appId: '', brand: '', endpoint: ''),
        isMock: true,
      ),
    );

    tearDownAll(() => connectionBloc.close());

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Connect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Connect()),
      expect: () => <dynamic>[isA<Connected>()],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Disconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Disconnect()),
      expect: () => <dynamic>[],
    );

    blocTest<ConnectionBloc, ConnectionState>(
      'Emits [Reconnect] Test.',
      build: () => connectionBloc,
      act: (ConnectionBloc bloc) async => bloc.add(Reconnect()),
      expect: () => <dynamic>[],
    );
  });
}
