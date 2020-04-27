import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account_settings/account_settings.dart';
import 'account_settings_mock_data.dart';

void main() {
  test('Account settings JSON parsing', () {
    final Map<String, dynamic> accountSettingsMap =
        jsonDecode(accountSettingsJSON);
    final AccountSettings accountSettings =
        AccountSettings.fromJson(accountSettingsMap['get_settings']);

    expect(accountSettings.country, 'SampleCountry');
    expect(accountSettings.countryCode, 'sc');
    expect(accountSettings.hasSecretAnswer, false);
    expect(accountSettings.emailConsent, true);
    expect(accountSettings.email, 'first.last@example.com');
    expect(accountSettings.userHash,
        'samplehash71627162jlj');
  });
}
