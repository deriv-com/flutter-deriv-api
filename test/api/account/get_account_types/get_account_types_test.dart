import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/get_account_types_response_extended.dart';
import 'package:flutter_deriv_api/api/response/get_account_types_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Get account types API call returns the expected result.', () async {
    final GetAccountTypesResponse accountTypesResponse =
        await GetAccountTypesResponseExtended.fetchAccountTypes(
      request: const GetAccountTypesRequest(),
    );

    expect(accountTypesResponse.getAccountTypes?.trading.length, 5);
    expect(accountTypesResponse.getAccountTypes?.wallet.length, 5);
    expect(accountTypesResponse.getAccountTypes?.trading['binary'],
        isA<TradingProperty>());
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['binary']?.linkableWalletTypes.length,
      4,
    );
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['binary']?.linkableWalletTypes.first,
      'doughflow',
    );
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['binary']?.allowedWalletCurrencies.length,
      11,
    );
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['binary']?.allowedWalletCurrencies.first,
      'AUD',
    );
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['derivez']?.linkableWalletTypes.length,
      3,
    );
    expect(
      accountTypesResponse
          .getAccountTypes?.trading['derivez']?.linkableWalletTypes.first,
      'doughflow',
    );
    expect(
      accountTypesResponse.getAccountTypes?.trading['standard'],
      isA<TradingProperty>(),
    );
    expect(
      accountTypesResponse.getAccountTypes?.wallet['crypto']?.currencies.length,
      7,
    );
    expect(
      accountTypesResponse.getAccountTypes?.wallet['crypto']?.currencies.first,
      'BTC',
    );
    expect(
      accountTypesResponse.getAccountTypes?.wallet['crypto']?.currencies.last,
      'tUSDT',
    );
    expect(
      accountTypesResponse.getAccountTypes?.wallet['doughflow'],
      isA<WalletProperty>(),
    );
  });
}
