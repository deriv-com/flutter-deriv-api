import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_settings/account_settings.dart';
import 'package:flutter_deriv_api/api/account/models/set_account_setting_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Account settings JSON parsing', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AccountSettings accountSettings =
        await AccountSettings.fetchAccountSetting();

    expect(accountSettings.country, 'SampleCountry');
    expect(accountSettings.countryCode, 'sc');
    expect(accountSettings.hasSecretAnswer, false);
    expect(accountSettings.emailConsent, true);
    expect(accountSettings.email, 'first.last@example.com');
    expect(accountSettings.userHash, 'samplehash71627162jlj');

    final SetAccountSettingModel setSettings =
        await accountSettings.changeSetting(const SetSettingsRequest());
    expect(setSettings.succeeded, true);
  });
}
