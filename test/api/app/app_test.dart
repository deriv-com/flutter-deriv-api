import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/app/app.dart';
import 'package:flutter_deriv_api/api/app/app_delete.dart';
import 'package:flutter_deriv_api/api/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/app/app_register.dart';
import 'package:flutter_deriv_api/api/app/app_update.dart';
import 'package:flutter_deriv_api/api/app/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  group('application group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('fetch application details', () async {
      final App appDetails = await App.fetchApplicationDetails(
        const AppGetRequest(appGet: 1234),
      );

      expect(appDetails.appId, 1234);
      expect(appDetails.appMarkupPercentage, 22.0);
      expect(appDetails.appstore, 'https://itunes.apple.com/test_app');
      expect(appDetails.github, 'https://github.com/test_org/app');
      expect(
        appDetails.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appDetails.homepage, 'https://test.example.com/');
      expect(appDetails.name, 'Test Application');
      expect(appDetails.redirectUri, 'https://test.example.com/redirect');
      expect(appDetails.verificationUri, 'https://test.example.com/verify');
    });

    test('fetch application list', () async {
      final List<App> appList = await App.fetchApplicationList(
        const AppListRequest(),
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

    test('fetch markup details', () async {
      final AppMarkupDetails appMarkupDetails =
          await App(appId: 1234).fetchApplicationMarkupDetails(
        clientLoginId: 'CR12345',
        dateFrom: DateTime.parse('2017-08-01 00:00:00'),
        dateTo: DateTime.parse('2017-08-31 23:59:59'),
        description: true,
        limit: 100,
        offset: 0,
        sort: 'ASC',
        sortFields: <String>['app_id'],
      );

      expect(appMarkupDetails.transactions.length, 1);

      expect(appMarkupDetails.transactions.first.appId, 1234);
      expect(appMarkupDetails.transactions.first.appMarkup, 15.0);
      expect(appMarkupDetails.transactions.first.appMarkupUsd, 25.0);
      expect(appMarkupDetails.transactions.first.appMarkupValue, 12.0);
      expect(appMarkupDetails.transactions.first.clientCurrencyCode, 'USD');
      expect(appMarkupDetails.transactions.first.clientLoginId, 'CR12345');
      expect(appMarkupDetails.transactions.first.devCurrencyCode, 'USD');
      expect(appMarkupDetails.transactions.first.devLoginId, 'CR45627');
      expect(appMarkupDetails.transactions.first.transactionId, 10867502908);
      expect(
        appMarkupDetails.transactions.first.transactionTime,
        getDateTime(1587544006),
      );
    });

    test('app delete', () async {
      final AppDelete appDelete = await App(appId: 1234).deleteApplication();

      expect(appDelete.succeeded, true);
    });

    test('app register', () async {
      final AppRegister appRegister = await App(
        appId: 1234,
        appstore: 'https://itunes.apple.com/test_app',
        github: 'https://github.com/test_org/app',
        googleplay: 'https://play.google.com/store/apps/details?id=test.app',
        homepage: 'https://test.example.com/',
        name: 'Test Application',
        redirectUri: 'https://test.example.com/redirect',
        verificationUri: 'https://test.example.com/verify',
      ).registerApplication(scopes: <TokenScope>[TokenScope.admin]);

      expect(appRegister.appDetails.appId, 1234);
      expect(appRegister.appDetails.appMarkupPercentage, 22.0);
      expect(
        appRegister.appDetails.appstore,
        'https://itunes.apple.com/test_app',
      );
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

    test('app update', () async {
      final AppUpdate appRegister = await App(
        appId: 1234,
        appstore: 'https://itunes.apple.com/test_app',
        github: 'https://github.com/test_org/app',
        googleplay: 'https://play.google.com/store/apps/details?id=test.app',
        homepage: 'https://test.example.com/',
        name: 'Test Application',
        redirectUri: 'https://test.example.com/redirect',
        verificationUri: 'https://test.example.com/verify',
      ).updateApplication(scopes: <TokenScope>[TokenScope.admin]);

      expect(appRegister.appDetails.appId, 1234);
      expect(appRegister.appDetails.appMarkupPercentage, 22.0);
      expect(
        appRegister.appDetails.appstore,
        'https://itunes.apple.com/test_app',
      );
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

    test('revoke oauth app', () async {
      final RevokeOauthApp revokeOauthApp =
          await App(appId: 1234).revokeOauthApplication();

      expect(revokeOauthApp.succeeded, true);
    });
  });
}
