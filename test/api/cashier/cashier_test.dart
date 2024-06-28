import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/cashier_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Cashier URL Test', () async {
    final CashierResponse cashierInformation =
        await CashierResponse.fetchInformation(
      const CashierRequest(
        cashier: 'deposit',
        provider: 'provider1',
        verificationCode: '12123hjdshad',
      ),
    );

    expect(
      cashierInformation.cashierString,
      'http://example.url/sagsjgajshkjHSas',
    );
  });
}
