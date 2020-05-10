import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_details.dart';
import 'package:flutter_deriv_api/api/application/app/application.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_get_send.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('app detail', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppDetails appDetail = await Application.fetchApplicationDetails(
      request: const AppGetRequest(appGet: 1234),
    );

    expect(appDetail.appId, 1234);
    expect(appDetail.appMarkupPercentage, 22.0);
    expect(appDetail.appstore, 'https://itunes.apple.com/test_app');
    expect(appDetail.github, 'https://github.com/test_org/app');
    expect(
      appDetail.googleplay,
      'https://play.google.com/store/apps/details?id=test.app',
    );
    expect(appDetail.homepage, 'https://test.example.com/');
    expect(appDetail.name, 'Test Application');
    expect(appDetail.redirectUri, 'https://test.example.com/redirect');
    expect(appDetail.verificationUri, 'https://test.example.com/verify');
  });
}
