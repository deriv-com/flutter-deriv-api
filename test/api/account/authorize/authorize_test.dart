import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/authorize_response_result.dart';
import 'package:flutter_deriv_api/api/response/login_history_response_result.dart';
import 'package:flutter_deriv_api/api/response/logout_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('Authorize Group ->', () {
    test('Authorize Test', () async {
      final AuthorizeResponse authorize =
          await AuthorizeResponse.authorizeMethod(
        const AuthorizeRequest(
          authorize: 'sample_token_334da73d',
          addToLoginHistory: true,
          tokens: <String>[],
        ),
      );

      final List<AccountListItem>? accounts = authorize.authorize?.accountList;
      final AccountListItem? firstAccount = accounts?.first;
      final AccountListItem? secondAccount = accounts?[1];

      final Map<String, LocalCurrenciesProperty>? localCurrencies =
          authorize.authorize?.localCurrencies;

      expect(accounts?.length, 2);

      expect(firstAccount?.currency, 'USD');
      expect(
        firstAccount?.excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000, isUtc: true),
      );
      expect(firstAccount?.isDisabled, false);
      expect(firstAccount?.isVirtual, false);
      expect(firstAccount?.landingCompanyName, 'svg');
      expect(firstAccount?.loginid, 'CR90000028');

      expect(secondAccount?.currency, 'USD');
      expect(
        secondAccount?.excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000, isUtc: true),
      );
      expect(secondAccount?.isDisabled, false);
      expect(secondAccount?.isVirtual, true);
      expect(secondAccount?.landingCompanyName, 'virtual');
      expect(secondAccount?.loginid, 'VRTC90000028');

      expect(localCurrencies?.entries.length, 2);

      expect(localCurrencies?.keys.first, 'ZAR');
      expect(localCurrencies?.values.first.fractionalDigits, 2);

      expect(localCurrencies?.keys.last, 'USD');
      expect(localCurrencies?.values.last.fractionalDigits, 3);

      expect(authorize.authorize?.balance, 10000);
      expect(authorize.authorize?.country, 'za');
      expect(authorize.authorize?.currency, 'USD');
      expect(authorize.authorize?.email, 'test@site.com');
      expect(authorize.authorize?.fullname, 'Ms QA script testSTX');
      expect(authorize.authorize?.isVirtual, false);
      expect(authorize.authorize?.landingCompanyFullname, 'Binary (SVG) Ltd.');
      expect(authorize.authorize?.landingCompanyName, 'svg');
      expect(authorize.authorize?.loginid, 'CR90000028');
      expect(authorize.authorize?.scopes?.length, 4);
      expect(authorize.authorize?.upgradeableLandingCompanies?.length, 1);
      expect(authorize.authorize?.userId, 29);
    });

    test('Logout Test', () async {
      final LogoutResponse logout = await LogoutResponse.logoutMethod();

      expect(logout.logout, 1);
    });

    test('Login History Test', () async {
      final LoginHistoryResponse loginHistories =
          await LoginHistoryResponse.fetchHistory();

      expect(loginHistories.loginHistory?.length, 2);

      expect(loginHistories.loginHistory?.first.action, 'login');
      expect(
        loginHistories.loginHistory?.first.environment,
        '27-Apr-20 10:44:02GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN',
      );
      expect(loginHistories.loginHistory?.first.status, true);
      expect(loginHistories.loginHistory?.first.time, getDateTime(1587984243));
    });
  });
}
