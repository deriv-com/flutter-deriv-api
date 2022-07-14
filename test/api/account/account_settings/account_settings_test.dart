import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_settings/account_settings.dart';
import 'package:flutter_deriv_api/api/account/models/set_account_setting_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Account Setting Group ->', () {
    test('Fetch Account Settings Test', () async {
      final AccountSettings accountSettings =
          await AccountSettings.fetchAccountSetting();

      expect(accountSettings.country, 'SampleCountry');
      expect(accountSettings.countryCode, 'sc');
      expect(accountSettings.hasSecretAnswer, false);
      expect(accountSettings.emailConsent, true);
      expect(accountSettings.email, 'first.last@example.com');
      expect(accountSettings.userHash, 'samplehash71627162jlj');
    });

    test('Set Account Setting Test', () async {
      final SetAccountSettingModel setSettings = await AccountSettings(
        accountOpeningReason: 'Speculative',
        addressCity: 'Test City',
        addressLine1: 'Test Address Line 1',
        addressLine2: 'Test Address Line 2',
        addressPostcode: '123456',
        addressState: 'Test State',
        phone: '+15417543010',
        placeOfBirth: 'ar',
        taxIdentificationNumber: '987654321',
        taxResidence: 'hk',
      ).changeSetting(
        secretAnswer: 'secret_answer',
        secretQuestion: 'secret_question',
      );

      expect(setSettings.succeeded, true);
    });
  });
}
