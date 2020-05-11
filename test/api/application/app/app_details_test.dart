import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_details.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('app information group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('app detail test', () async {
      final AppDetails appDetail = await AppDetails.fetchApplicationDetails(
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

    test('app list test', () async {
      final List<AppDetails> appList = await AppDetails.fetchApplicationList(
        request: const AppListRequest(appList: 1),
      );

      expect(appList.length, 1);

      expect(appList.first.appId, 1234);
      expect(appList.first.appMarkupPercentage, 22.0);
      expect(appList.first.appstore, 'https://itunes.apple.com/test_app');
      expect(appList.first.github, 'https://github.com/test_org/app');
      expect(
        appList.first.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appList.first.homepage, 'https://test.example.com/');
      expect(appList.first.name, 'Test Application');
      expect(appList.first.redirectUri, 'https://test.example.com/redirect');
      expect(appList.first.verificationUri, 'https://test.example.com/verify');
    });
  });
}
