import 'package:flutter_deriv_api/api/account/models/account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/account/authorize/login_history.dart';
import 'package:flutter_deriv_api/api/account/authorize/logout.dart';
import 'package:flutter_deriv_api/api/account/models/local_currency_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Authorize Group ->', () {
    test('Authorize Test', () async {
      final Authorize authorize = await Authorize.authorize(
        const AuthorizeRequest(
          authorize: 'sample_token_334da73d',
          addToLoginHistory: 1,
        ),
      );

      final List<AccountModel?> accounts = authorize.accountList!;
      final List<LocalCurrencyModel?> localCurrencies =
          authorize.localCurrencies!;
      final AccountModel firstAccount = accounts.first!;
      final AccountModel secondAccount = accounts[1]!;
      final LocalCurrencyModel firstLocalCurrency = localCurrencies.first!;
      final LocalCurrencyModel secondLocalCurrency = localCurrencies[1]!;

      expect(accounts.length, 2);

      expect(firstAccount.currency, 'USD');
      expect(
        accounts[1]!.excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(firstAccount.isDisabled, false);
      expect(firstAccount.isVirtual, false);
      expect(firstAccount.landingCompanyName, 'svg');
      expect(firstAccount.loginId, 'CR90000028');

      expect(secondAccount.currency, 'USD');
      expect(
        secondAccount.excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(secondAccount.isDisabled, false);
      expect(secondAccount.isVirtual, true);
      expect(secondAccount.landingCompanyName, 'virtual');
      expect(secondAccount.loginId, 'VRTC90000028');

      expect(localCurrencies.length, 2);

      expect(firstLocalCurrency.currencyCode, 'ZAR');
      expect(firstLocalCurrency.fractionalDigits, 2);

      expect(secondLocalCurrency.currencyCode, 'USD');
      expect(secondLocalCurrency.fractionalDigits, 3);

      expect(authorize.balance, 10000);
      expect(authorize.country, 'za');
      expect(authorize.currency, 'USD');
      expect(authorize.email, 'test@site.com');
      expect(authorize.fullName, 'Ms QA script testSTX');
      expect(authorize.isVirtual, false);
      expect(authorize.landingCompanyFullName, 'Binary (SVG) Ltd.');
      expect(authorize.landingCompanyName, 'svg');
      expect(authorize.loginId, 'CR90000028');
      expect(authorize.scopes!.length, 4);
      expect(authorize.upgradeableLandingCompanies!.length, 1);
      expect(authorize.userId, 29);
    });

    test('Logout Test', () async {
      final Logout logout = await Logout.logout();

      expect(logout.succeeded, true);
    });

    test('Login History Test', () async {
      final List<LoginHistory?>? loginHistories =
          await LoginHistory.fetchHistory();

      final LoginHistory firstHistory = loginHistories!.first!;

      expect(loginHistories.length, 2);

      expect(firstHistory.action, LoginAction.login);
      expect(
        firstHistory.environment,
        '27-Apr-20 10:44:02GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN',
      );
      expect(firstHistory.status, true);
      expect(firstHistory.time, getDateTime(1587984243));
    });
  });
}
