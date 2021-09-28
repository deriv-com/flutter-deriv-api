import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/cashier_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_send.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

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
