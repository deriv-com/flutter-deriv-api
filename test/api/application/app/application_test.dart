import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_register.dart';
import 'package:flutter_deriv_api/api/application/app/app_update.dart';
import 'package:flutter_deriv_api/api/application/app/application.dart';
import 'package:flutter_deriv_api/api/application/models/app_delete_model.dart';
import 'package:flutter_deriv_api/api/application/new_account/new_account_real.dart';
import 'package:flutter_deriv_api/api/application/new_account/new_account_virtual.dart';
import 'package:flutter_deriv_api/api/application/oauth_app/oauth_app.dart';
import 'package:flutter_deriv_api/api/application/revoke_oauth_app/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
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

    test('open new real account', () async {
      final NewAccountReal newAccountReal =
          await Application.openNewRealAccount(
        request: const NewAccountRealRequest(
          accountOpeningReason: 'Speculative',
          accountTurnover: 'Less than \$25,000',
          addressCity: 'Melbourne',
          addressLine1: '20 Broadway Av',
          addressLine2: 'East Melbourne VIC',
          addressPostcode: '3002',
          addressState: 'Victoria',
          dateOfBirth: '1980-01-31',
          firstName: 'Peter',
          lastName: 'Pan',
          newAccountReal: 1,
          nonPepDeclaration: 1,
          phone: '+6123456789',
          placeOfBirth: 'id',
          residence: 'au',
          salutation: 'Mr',
          secretAnswer: 'Jones',
          secretQuestion: 'Mothers maiden name',
          taxIdentificationNumber: '012142545',
          taxResidence: 'ar,sg',
        ),
      );

      expect(newAccountReal.clientId, 'CR0000');
      expect(newAccountReal.landingCompany, 'landing_company');
      expect(newAccountReal.landingCompanyShort, 'landing_company_short');
      expect(newAccountReal.oauthToken, 'sample_token');
    });

    test('open new virtual account', () async {
      final NewAccountVirtual newAccountVirtual =
          await Application.openNewVirtualAccount(
        request: const NewAccountVirtualRequest(
          newAccountVirtual: 1,
          clientPassword: 'Abc123de',
          residence: 'id',
          verificationCode: 'uoJvVuQ6',
        ),
      );

      expect(newAccountVirtual.balance, 250.0);
      expect(newAccountVirtual.clientId, 'VRTC0000');
      expect(newAccountVirtual.currency, 'USD');
      expect(newAccountVirtual.email, 'test@email.com');
      expect(newAccountVirtual.oauthToken, 'sample_token');
    });

    test('oauth apps', () async {
      final List<OauthApp> oauthApps = await Application.oauthApplication(
        request: const OauthAppsRequest(oauthApps: 1),
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

    test('revoke oauth app', () async {
      final RevokeOauthApp revokeOauthApp =
          await Application.revokeOauthApplication(
        request: const RevokeOauthAppRequest(
          revokeOauthApp: 1,
        ),
      );

      expect(revokeOauthApp.succeeded, true);
    });
  });
}
