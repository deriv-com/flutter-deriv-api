import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/new_account_wallet_response_extended.dart';
import 'package:flutter_deriv_api/api/response/new_account_wallet_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('New account wallet API call returns the expected result.', () async {
    final NewAccountWalletResponse newAccountWallet =
        await NewAccountWalletResponseExtended.createNewWalletAccount(
      request: const NewAccountWalletRequest(
        accountType: 'crypto',
        currency: 'BTC',
        acceptRisk: null,
        financialAssessment: <String, dynamic>{},
        salutation: '',
        taxIdentificationNumber: '',
        taxResidence: '',
      ),
    );

    expect(newAccountWallet.newAccountWallet?.clientId, 'CRW1170');
    expect(newAccountWallet.newAccountWallet?.currency, 'BTC');
    expect(newAccountWallet.newAccountWallet?.clientId, 'CRW1170');
    expect(
      newAccountWallet.newAccountWallet?.oauthToken,
      'DYsMOCKRAqaX23DvpZfmUW',
    );
  });
}
