import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/get_settings_response_result.dart';
import 'package:flutter_deriv_api/api/response/set_settings_response_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Account Setting Group ->', () {
    test('Fetch Account Settings Test', () async {
      final GetSettingsResponse accountSettings =
          await GetSettingsResponse.fetchAccountSetting();

      expect(accountSettings.getSettings?.country, 'SampleCountry');
      expect(accountSettings.getSettings?.countryCode, 'sc');
      expect(accountSettings.getSettings?.hasSecretAnswer, false);
      expect(accountSettings.getSettings?.emailConsent, true);
      expect(accountSettings.getSettings?.email, 'first.last@example.com');
      expect(accountSettings.getSettings?.userHash, 'samplehash71627162jlj');
    });

    test('Set Account Setting Test', () async {
      final SetSettingsResponse setSettings = await const GetSettingsResponse(
        // ignore: missing_required_param
        getSettings: GetSettings(
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
        ),
      ).changeSetting(
        secretAnswer: 'secret_answer',
        secretQuestion: 'secret_question',
      );

      expect(setSettings.setSettings, 1);
    });
  });
}
