import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_register.dart';
import 'package:flutter_deriv_api/api/application/app/app_update.dart';
import 'package:flutter_deriv_api/api/application/app/application.dart';
import 'package:flutter_deriv_api/api/application/models/app_delete_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_get_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_markup_details_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_register_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_update_send.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  group('application group test -> ', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('delete application', () async {
      final AppDeleteModel appDelete = await Application.deleteApplication(
        request: const AppDeleteRequest(appDelete: 1234),
      );

      expect(appDelete.succeeded, true);
    });

    test('fetch application details', () async {
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

    test('fetch application list', () async {
      final List<AppDetails> appList = await Application.fetchApplicationList(
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

    test('fetch application markup details', () async {
      final AppMarkupDetails appMarkupDetails =
          await Application.fetchApplicationMarkupDetails(
        request: const AppMarkupDetailsRequest(
          appId: 1234,
          appMarkupDetails: 1,
          clientLoginid: 'CR12345',
          dateFrom: '2017-08-01 00:00:00',
          dateTo: '2017-08-31 23:59:59',
          description: 1,
          limit: 100,
          offset: 0,
          passthrough: <String, dynamic>{},
          reqId: 3,
          sort: 'ASC',
        ),
      );

      expect(appMarkupDetails.transactions.length, 1);

      expect(appMarkupDetails.transactions[0].appId, 1234);
      expect(appMarkupDetails.transactions[0].appMarkup, 15.0);
      expect(appMarkupDetails.transactions[0].appMarkupUsd, 25.0);
      expect(appMarkupDetails.transactions[0].appMarkupValue, 12.0);
      expect(appMarkupDetails.transactions[0].clientCurrencyCode, 'USD');
      expect(appMarkupDetails.transactions[0].clientLoginId, 'CR12345');
      expect(appMarkupDetails.transactions[0].devCurrencyCode, 'USD');
      expect(appMarkupDetails.transactions[0].devLoginId, 'CR45627');
      expect(appMarkupDetails.transactions[0].transactionId, 10867502908);
      expect(
        appMarkupDetails.transactions[0].transactionTime,
        getDateTime(1587544006),
      );
    });

    test('register application', () async {
      final AppRegister appRegister = await Application.registerApplication(
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

    test('update application', () async {
      final AppUpdate appUpdate = await Application.updateApplication(
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
      expect(
          appUpdate.appDetails.appstore, 'https://itunes.apple.com/test_app');
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
  });
}
