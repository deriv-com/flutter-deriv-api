import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_register.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('app register test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppRegister appRegister = await AppRegister.registerApplication(
      request: const AppRegisterRequest(
        appRegister: 1,
        appstore: 'https://itunes.apple.com/test_app',
        github: 'https://github.com/test_org/app',
        googleplay: 'https://play.google.com/store/apps/details?id=test.app',
        homepage: 'https://test.example.com/',
        name: 'Test Application',
        redirectUri: 'https://test.example.com/redirect',
        scopes: <String>['read', 'trade'],
        verificationUri: 'https://test.example.com/verify',
      ),
    );

    expect(appRegister.appDetails.appId, 1234);
    expect(appRegister.appDetails.appMarkupPercentage, 22.0);
    expect(
        appRegister.appDetails.appstore, 'https://itunes.apple.com/test_app');
    expect(appRegister.appDetails.github, 'https://github.com/test_org/app');
    expect(
      appRegister.appDetails.googleplay,
      'https://play.google.com/store/apps/details?id=test.app',
    );
    expect(appRegister.appDetails.homepage, 'https://test.example.com/');
    expect(appRegister.appDetails.name, 'Test Application');
    expect(
      appRegister.appDetails.redirectUri,
      'https://test.example.com/redirect',
    );
    expect(
      appRegister.appDetails.verificationUri,
      'https://test.example.com/verify',
    );
  });
}
