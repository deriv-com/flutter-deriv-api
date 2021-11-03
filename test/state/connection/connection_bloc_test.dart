import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Connection Cubit =>', () {
    late final ConnectionCubit connectionCubit;

    setUpAll(
      () => connectionCubit = ConnectionCubit(
        ConnectionInformation(appId: '', brand: '', endpoint: ''),
        isMock: true,
      ),
    );

    tearDownAll(() => connectionCubit.close());
  });
}
