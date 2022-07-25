import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/payment_methods_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/payment_methods_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  test('Payment Methods Test', () async {
    final PaymentMethodsResponse methodsResponse =
        await PaymentMethodsResponse.updateApplication(
            const PaymentMethodsRequest(country: 'id'));

    expect(methodsResponse.paymentMethods?.length, 44);

    final PaymentMethodsItem paymentMethodsItem =
        methodsResponse.paymentMethods!.first;

    expect(paymentMethodsItem.predefinedAmounts.first, 5);
    expect(paymentMethodsItem.withdrawLimits['USD']?.min, 5);
    expect(paymentMethodsItem.supportedCurrencies.first, 'USD');
    expect(paymentMethodsItem.displayName, 'AirTM');
  });
}
