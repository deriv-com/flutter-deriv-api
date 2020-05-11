import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/oauth_app.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('oauth apps', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final List<OauthApp> oauthApps = await OauthApp.oauthApplication(
      const OauthAppsRequest(oauthApps: 1),
    );

    expect(oauthApps.length, 2);

    expect(oauthApps.first.name, 'Binary Static localhost for dev');
    expect(oauthApps.first.appId, 1159);
    expect(oauthApps.first.appMarkupPercentage, 0);
    expect(oauthApps.first.scopes.length, 4);
    expect(
      oauthApps.first.lastUsed,
      DateTime.parse('2019-10-13 07:11:29.999974'),
    );
  });
}
