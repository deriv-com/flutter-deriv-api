import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/cashier/cashier_information.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Fetch Cashier URL Test', () async {
    final CashierInformation cashierInformation =
        await CashierInformation.fetchInformation(
      const CashierRequest(
        cashier: 'deposit',
        provider: 'provider1',
        verificationCode: '12123hjdshad',
      ),
    );

    expect(
      cashierInformation.cashierURL,
      'http://example.url/sagsjgajshkjHSas',
    );
  });
}
