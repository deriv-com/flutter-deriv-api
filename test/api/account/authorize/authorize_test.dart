import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_data/account/authorize_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/api/response/authorize_receive_result.dart';
import 'package:flutter_deriv_api/api/response/logout_receive_result.dart';
import 'package:flutter_deriv_api/api/response/login_history_receive_result.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Authorize Group ->', () {
    test('Authorize Test', () async {
      final AuthorizeResponse authorize =
          await AuthorizeResponse.authorizeMethod(
        const AuthorizeSend(
          authorize: 'sample_token_334da73d',
          addToLoginHistory: 1,
        ),
      );

      final List<AccountListItem> accounts = authorize.authorize.accountList;
      // final List<LocalCurrencyModel> localCurrencies =
      //   authorize.authorize.localCurrencies;

      expect(accounts.length, 2);

      expect(accounts.first.currency, 'USD');
      expect(
        accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(accounts.first.isDisabled, false);
      expect(accounts.first.isVirtual, false);
      expect(accounts.first.landingCompanyName, 'svg');
      expect(accounts.first.loginid, 'CR90000028');

      expect(accounts[1].currency, 'USD');
      expect(
        accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000),
      );
      expect(accounts[1].isDisabled, false);
      expect(accounts[1].isVirtual, true);
      expect(accounts[1].landingCompanyName, 'virtual');
      expect(accounts[1].loginid, 'VRTC90000028');

      // expect(localCurrencies.length, 2);

      // expect(localCurrencies.first.currencyCode, 'ZAR');
      // expect(localCurrencies.first.fractionalDigits, 2);

      // expect(localCurrencies[1].currencyCode, 'USD');
      // expect(localCurrencies[1].fractionalDigits, 3);

      expect(authorize.authorize.balance, 10000);
      expect(authorize.authorize.country, 'za');
      expect(authorize.authorize.currency, 'USD');
      expect(authorize.authorize.email, 'test@site.com');
      expect(authorize.authorize.fullname, 'Ms QA script testSTX');
      expect(authorize.authorize.isVirtual, false);
      expect(authorize.authorize.landingCompanyFullname, 'Binary (SVG) Ltd.');
      expect(authorize.authorize.landingCompanyName, 'svg');
      expect(authorize.authorize.loginid, 'CR90000028');
      expect(authorize.authorize.scopes.length, 4);
      expect(authorize.authorize.upgradeableLandingCompanies.length, 1);
      expect(authorize.authorize.userId, 29);
    });

    test('Logout Test', () async {
      final LogoutResponse logout = await LogoutResponse.logoutMethod();

      expect(logout.logout, 1);
    });

    test('Login History Test', () async {
      final LoginHistoryResponse loginHistories =
          await LoginHistoryResponse.fetchHistory();

      expect(loginHistories.loginHistory.length, 2);

      expect(loginHistories.loginHistory.first.action, 'login');
      expect(
        loginHistories.loginHistory.first.environment,
        '27-Apr-20 10:44:02GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN',
      );
      expect(loginHistories.loginHistory.first.status, true);
      expect(loginHistories.loginHistory.first.time, getDateTime(1587984243));
    });
  });
}
