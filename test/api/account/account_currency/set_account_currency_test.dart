import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/set_account_currency_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_account_currency_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Set Account Currency Test', () async {
    final SetAccountCurrencyResponse setAccountCurrency =
        await SetAccountCurrencyResponse.setCurrency(
      const SetAccountCurrencyRequest(setAccountCurrency: 'USD'),
    );

    expect(setAccountCurrency.setAccountCurrency, true);
  });
}
