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

    expect(accountSettings.country, 'Afghanistan');
    expect(accountSettings.countryCode, 'af');
    expect(accountSettings.hasSecretAnswer, false);
    expect(accountSettings.emailConsent, true);
    expect(accountSettings.userHash,
        'b1258cd44e55d7d736cacc30c37ec2218defd17c44635e61a78ddac6ca07bd31');
  });
}
