import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_update.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('app update test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppUpdate appUpdate = await AppUpdate.updateApplication(
      request: const AppUpdateRequest(
        appUpdate: 1,
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

    expect(appUpdate.appDetails.appId, 1234);
    expect(appUpdate.appDetails.appMarkupPercentage, 22.0);
    expect(appUpdate.appDetails.appstore, 'https://itunes.apple.com/test_app');
    expect(appUpdate.appDetails.github, 'https://github.com/test_org/app');
    expect(
      appUpdate.appDetails.googleplay,
      'https://play.google.com/store/apps/details?id=test.app',
    );
    expect(appUpdate.appDetails.homepage, 'https://test.example.com/');
    expect(appUpdate.appDetails.name, 'Test Application');
    expect(
      appUpdate.appDetails.redirectUri,
      'https://test.example.com/redirect',
    );
    expect(
      appUpdate.appDetails.verificationUri,
      'https://test.example.com/verify',
    );
  });
}
