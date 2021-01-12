import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/app_delete_receive_result.dart';
import 'package:flutter_deriv_api/api/response/app_register_receive_result.dart';
import 'package:flutter_deriv_api/api/response/revoke_oauth_app_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_get_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_list_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_update_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/revoke_oauth_app_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/api/response/app_update_receive_result.dart';
import 'package:flutter_deriv_api/api/response/app_get_receive_result.dart';
import 'package:flutter_deriv_api/api/response/app_markup_details_receive_result.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Application Group ->', () {
    test('Fetch Application Details Test', () async {
      final AppGetResponse appDetails =
          await AppGetResponse.fetchApplicationDetails(
        const AppGetSend(appGet: 1234),
      );

      expect(appDetails.appGet.appId, 1234);
      expect(appDetails.appGet.appMarkupPercentage, 22.0);
      expect(appDetails.appGet.appstore, 'https://itunes.apple.com/test_app');
      expect(appDetails.appGet.github, 'https://github.com/test_org/app');
      expect(
        appDetails.appGet.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appDetails.appGet.homepage, 'https://test.example.com/');
      expect(appDetails.appGet.name, 'Test Application');
      expect(
          appDetails.appGet.redirectUri, 'https://test.example.com/redirect');
      expect(
          appDetails.appGet.verificationUri, 'https://test.example.com/verify');
    });

    test('Fetch Application List Test', () async {
      final List<AppGetResponse> appList =
          await AppGetResponse.fetchApplicationList(
        const AppListSend(),
      );

      expect(appList.length, 1);

      expect(appList.first.appGet.appId, 1234);
      expect(appList.first.appGet.appMarkupPercentage, 22.0);
      expect(
          appList.first.appGet.appstore, 'https://itunes.apple.com/test_app');
      expect(appList.first.appGet.github, 'https://github.com/test_org/app');
      expect(
        appList.first.appGet.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appList.first.appGet.homepage, 'https://test.example.com/');
      expect(appList.first.appGet.name, 'Test Application');
      expect(appList.first.appGet.redirectUri,
          'https://test.example.com/redirect');
      expect(appList.first.appGet.verificationUri,
          'https://test.example.com/verify');
    });

    test('Fetch Markup Details Test', () async {
      final AppMarkupDetailsResponse appMarkupDetails = await AppGetResponse(
        appGet: AppGet(appId: 1234),
      ).fetchApplicationMarkupDetails(
        clientLoginId: 'CR12345',
        dateFrom: DateTime.tryParse('2017-08-01 00:00:00'),
        dateTo: DateTime.tryParse('2017-08-31 23:59:59'),
        description: true,
        limit: 100,
        offset: 0,
        sort: 'ASC',
        sortFields: <String>['app_id'],
      );

      expect(appMarkupDetails.appMarkupDetails.transactions.length, 1);

      expect(appMarkupDetails.appMarkupDetails.transactions.first.appId, 1234);
      expect(
          appMarkupDetails.appMarkupDetails.transactions.first.appMarkup, 15.0);
      expect(appMarkupDetails.appMarkupDetails.transactions.first.appMarkupUsd,
          25.0);
      expect(
          appMarkupDetails.appMarkupDetails.transactions.first.appMarkupValue,
          12.0);
      expect(
          appMarkupDetails.appMarkupDetails.transactions.first.clientCurrcode,
          'USD');
      expect(appMarkupDetails.appMarkupDetails.transactions.first.clientLoginid,
          'CR12345');
      expect(appMarkupDetails.appMarkupDetails.transactions.first.devCurrcode,
          'USD');
      expect(appMarkupDetails.appMarkupDetails.transactions.first.devLoginid,
          'CR45627');
      expect(appMarkupDetails.appMarkupDetails.transactions.first.transactionId,
          10867502908);
      // expect(
      //   appMarkupDetails.appMarkupDetails.transactions.first.transactionTime,
      //   getDateTime(1587544006),
      // );
    });

    test('Application Delete Test', () async {
      final AppDeleteResponse appDelete = await AppGetResponse(
        appGet: AppGet(appId: 1234),
      ).deleteApplication();

      expect(appDelete.appDelete, 1);
    });

    test('Application Register Test', () async {
      final AppRegisterResponse appRegister = await AppGetResponse(
        appGet: AppGet(
          appId: 1234,
          appstore: 'https://itunes.apple.com/test_app',
          github: 'https://github.com/test_org/app',
          googleplay: 'https://play.google.com/store/apps/details?id=test.app',
          homepage: 'https://test.example.com/',
          name: 'Test Application',
          redirectUri: 'https://test.example.com/redirect',
          verificationUri: 'https://test.example.com/verify',
        ),
      ).registerApplication(scopes: <TokenScope>[TokenScope.admin]);

      expect(appRegister.appRegister.appId, 1234);
      expect(appRegister.appRegister.appMarkupPercentage, 22.0);
      expect(
        appRegister.appRegister.appstore,
        'https://itunes.apple.com/test_app',
      );
      expect(appRegister.appRegister.github, 'https://github.com/test_org/app');
      expect(
        appRegister.appRegister.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appRegister.appRegister.homepage, 'https://test.example.com/');
      expect(appRegister.appRegister.name, 'Test Application');
      expect(
        appRegister.appRegister.redirectUri,
        'https://test.example.com/redirect',
      );
      expect(
        appRegister.appRegister.verificationUri,
        'https://test.example.com/verify',
      );
    });

    test('Application Update Test', () async {
      final AppUpdateResponse appRegister =
          await AppUpdateResponse.updateApplication(const AppUpdateSend(
        appUpdate: 1234,
        appstore: 'https://itunes.apple.com/test_app',
        github: 'https://github.com/test_org/app',
        googleplay: 'https://play.google.com/store/apps/details?id=test.app',
        homepage: 'https://test.example.com/',
        name: 'Test Application',
        redirectUri: 'https://test.example.com/redirect',
        verificationUri: 'https://test.example.com/verify',
        scopes: <String>['admin']
      ));

      expect(appRegister.appUpdate.appId, 1234);
      expect(appRegister.appUpdate.appMarkupPercentage, 22.0);
      expect(
        appRegister.appUpdate.appstore,
        'https://itunes.apple.com/test_app',
      );
      expect(appRegister.appUpdate.github, 'https://github.com/test_org/app');
      expect(
        appRegister.appUpdate.googleplay,
        'https://play.google.com/store/apps/details?id=test.app',
      );
      expect(appRegister.appUpdate.homepage, 'https://test.example.com/');
      expect(appRegister.appUpdate.name, 'Test Application');
      expect(
        appRegister.appUpdate.redirectUri,
        'https://test.example.com/redirect',
      );
      expect(
        appRegister.appUpdate.verificationUri,
        'https://test.example.com/verify',
      );
    });

    test('Revoke Oauth Application Test', () async {
      final RevokeOauthAppResponse revokeOauthApp =
          await RevokeOauthAppResponse.revokeOauthApplication(
              const RevokeOauthAppSend(revokeOauthApp: 1234));

      expect(revokeOauthApp.revokeOauthApp, 1);
    });
  });
}
