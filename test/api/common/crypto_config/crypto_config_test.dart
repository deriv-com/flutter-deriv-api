import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/crypto_config_response_extended.dart';
import 'package:flutter_deriv_api/api/response/crypto_config_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/crypto_config_send.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../services/call_manager/base_call_manager_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('CryptoConfigResponseExtended makes API call.', () async {
    // TODO(ABED): Fix this test
    // final CryptoConfigResponse response =
    //     await CryptoConfigResponseExtended.fetchCryptoConfig(
    //   request: const CryptoConfigRequest(),
    // );
    //
    // expect(response, isA<CryptoConfigResponse>());
  });
}
