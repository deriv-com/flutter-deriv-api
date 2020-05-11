import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/mt5/mt5_settings.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('mt5 settings test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final MT5Settings mt5Settings = await MT5Settings.fetchSettings(
      request: const Mt5GetSettingsRequest(
        login: 'MTR1000',
        mt5GetSettings: 1,
      ),
    );

    expect(mt5Settings.address, 'sample address');
    expect(mt5Settings.balance, '250.0');
    expect(mt5Settings.city, 'London');
    expect(mt5Settings.company, 'sample company');
    expect(mt5Settings.country, 'England');
    expect(mt5Settings.currency, 'USD');
    expect(mt5Settings.email, 'test@email.com');
    expect(mt5Settings.group, 'sample_group');
    expect(mt5Settings.leverage, 20);
    expect(mt5Settings.login, 'MT23432');
    expect(mt5Settings.name, 'Jon Doe');
    expect(mt5Settings.phone, '+00134522345');
    expect(mt5Settings.phonePassword, 'dummy_password');
    expect(mt5Settings.state, 'dummy_state');
    expect(mt5Settings.zipCode, '3425367');
  });
}
