import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/account/authorize/login_history.dart';
import 'package:flutter_deriv_api/api/account/authorize/logout.dart';
import 'package:flutter_deriv_api/api/account/models/local_currency_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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

      final List<Account> accounts = authorize.accountList;
      final List<LocalCurrencyModel> localCurrencies =
          authorize.localCurrencies;

      expect(accounts.length, 2);

      expect(accounts.first.currency, 'USD');
      expect(
        accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(accounts.first.isDisabled, false);
      expect(accounts.first.isVirtual, false);
      expect(accounts.first.landingCompanyName, 'svg');
      expect(accounts.first.loginId, 'CR90000028');

      expect(accounts[1].currency, 'USD');
      expect(
        accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(accounts[1].isDisabled, false);
      expect(accounts[1].isVirtual, true);
      expect(accounts[1].landingCompanyName, 'virtual');
      expect(accounts[1].loginId, 'VRTC90000028');

      expect(localCurrencies.length, 2);

      expect(localCurrencies.first.currencyCode, 'ZAR');
      expect(localCurrencies.first.fractionalDigits, 2);

      expect(localCurrencies[1].currencyCode, 'USD');
      expect(localCurrencies[1].fractionalDigits, 3);

      expect(authorize.balance, 10000);
      expect(authorize.country, 'za');
      expect(authorize.currency, 'USD');
      expect(authorize.email, 'test@site.com');
      expect(authorize.fullName, 'Ms QA script testSTX');
      expect(authorize.isVirtual, false);
      expect(authorize.landingCompanyFullName, 'Binary (SVG) Ltd.');
      expect(authorize.landingCompanyName, 'svg');
      expect(authorize.loginId, 'CR90000028');
      expect(authorize.scopes.length, 4);
      expect(authorize.upgradeableLandingCompanies.length, 1);
      expect(authorize.userId, 29);
    });

    test('Logout Test', () async {
      final Logout logout = await Logout.logout();

      expect(logout.succeeded, true);
    });

    test('Login History Test', () async {
      final List<LoginHistory> loginHistories =
          await LoginHistory.fetchHistory();

      expect(loginHistories.length, 2);

      expect(loginHistories.first.action, LoginAction.login);
      expect(
        loginHistories.first.environment,
        '27-Apr-20 10:44:02GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN',
      );
      expect(loginHistories.first.status, true);
      expect(loginHistories.first.time, getDateTime(1587984243));
    });
  });
}
