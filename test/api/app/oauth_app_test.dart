import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/oauth_apps_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Oauth Application Test', () async {
    final OauthAppsResponse oauthApps =
        await OauthAppsResponse.fetchOauthApps();

    expect(oauthApps.oauthApps?.length, 2);

    expect(oauthApps.oauthApps?.first.name, 'Binary Static localhost for dev');
    expect(oauthApps.oauthApps?.first.appId, 1159);
    expect(oauthApps.oauthApps?.first.appMarkupPercentage, 0);
    expect(oauthApps.oauthApps?.first.scopes.length, 4);
    // TODO(unknown): `lastUsed` needs to be DateTime instead of string.
    // expect(oauthApps.oauthApps.first.lastUsed, DateTime.tryParse('2019-10-13 07:11:29'));
  });
}
