import 'package:flutter_deriv_api/api/app/models/app_model.dart';
import 'package:flutter_deriv_api/api/app/models/app_transaction_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/app/app.dart';
import 'package:flutter_deriv_api/api/app/app_delete.dart';
import 'package:flutter_deriv_api/api/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/app/app_register.dart';
import 'package:flutter_deriv_api/api/app/app_update.dart';
import 'package:flutter_deriv_api/api/app/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Application Group ->', () {
    test('Fetch Application Details Test', () async {
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

    test('Fetch Application List Test', () async {
      final List<App?>? appList = await App.fetchApplicationList(
        const AppListRequest(),
      );

      expect(appList!.length, 1);

      final App firstApp = appList.first!;

      expect(firstApp.appId, 1234);
      expect(firstApp.appMarkupPercentage, 22.0);
      expect(firstApp.appstore, 'https://itunes.apple.com/test_app');
      expect(firstApp.github, 'https://github.com/test_org/app');
      expect(
        firstApp.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(firstApp.homepage, 'https://test.example.com/');
      expect(firstApp.name, 'Test Application');
      expect(firstApp.redirectUri, 'https://test.example.com/redirect');
      expect(firstApp.verificationUri, 'https://test.example.com/verify');
    });

    test('Fetch Markup Details Test', () async {
      final AppMarkupDetails appMarkupDetails =
          await App(appId: 1234).fetchApplicationMarkupDetails(
        clientLoginId: 'CR12345',
        dateFrom: DateTime.tryParse('2017-08-01 00:00:00'),
        dateTo: DateTime.tryParse('2017-08-31 23:59:59'),
        description: true,
        limit: 100,
        offset: 0,
        sort: 'ASC',
        sortFields: <String>['app_id'],
      );

      expect(appMarkupDetails.transactions!.length, 1);

      final AppTransactionModel firstTransaction =
          appMarkupDetails.transactions!.first!;

      expect(firstTransaction.appId, 1234);
      expect(firstTransaction.appMarkup, 15.0);
      expect(firstTransaction.appMarkupUsd, 25.0);
      expect(firstTransaction.appMarkupValue, 12.0);
      expect(firstTransaction.clientCurrencyCode, 'USD');
      expect(firstTransaction.clientLoginId, 'CR12345');
      expect(firstTransaction.devCurrencyCode, 'USD');
      expect(firstTransaction.devLoginId, 'CR45627');
      expect(firstTransaction.transactionId, 10867502908);
      expect(
        firstTransaction.transactionTime,
        getDateTime(1587544006),
      );
    });

    test('Application Delete Test', () async {
      final AppDelete appDelete = await App(appId: 1234).deleteApplication();

      expect(appDelete.succeeded, true);
    });

    test('Application Register Test', () async {
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

      final AppModel appDetails = appRegister.appDetails!;

      expect(appDetails.appId, 1234);
      expect(appDetails.appMarkupPercentage, 22.0);
      expect(
        appDetails.appstore,
        'https://itunes.apple.com/test_app',
      );
      expect(appDetails.github, 'https://github.com/test_org/app');
      expect(
        appDetails.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appDetails.homepage, 'https://test.example.com/');
      expect(appDetails.name, 'Test Application');
      expect(
        appDetails.redirectUri,
        'https://test.example.com/redirect',
      );
      expect(
        appDetails.verificationUri,
        'https://test.example.com/verify',
      );
    });

    test('Application Update Test', () async {
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

      final AppModel appDetails = appRegister.appDetails!;

      expect(appDetails.appId, 1234);
      expect(appDetails.appMarkupPercentage, 22.0);
      expect(
        appDetails.appstore,
        'https://itunes.apple.com/test_app',
      );
      expect(appDetails.github, 'https://github.com/test_org/app');
      expect(
        appDetails.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appDetails.homepage, 'https://test.example.com/');
      expect(appDetails.name, 'Test Application');
      expect(
        appDetails.redirectUri,
        'https://test.example.com/redirect',
      );
      expect(
        appDetails.verificationUri,
        'https://test.example.com/verify',
      );
    });

    test('Revoke Oauth Application Test', () async {
      final RevokeOauthApp revokeOauthApp =
          await App(appId: 1234).revokeOauthApplication();

      expect(revokeOauthApp.succeeded, true);
    });
  });
}
