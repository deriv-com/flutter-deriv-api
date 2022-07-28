import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/topup_virtual_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Top Up Virtual Test', () async {
    final TopupVirtualResponse topUpVirtual = await TopupVirtualResponse.topUp();

    expect(topUpVirtual.topupVirtual?.amount, 30.0);
    expect(topUpVirtual.topupVirtual?.currency, 'USD');
  });
}
