import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/app/oauth_app.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Oauth Application Test', () async {
    final List<OauthApp?>? oauthApps = await OauthApp.fetchOauthApps();

    expect(oauthApps!.length, 2);

    final OauthApp firstOauthApp = oauthApps.first!;

    expect(firstOauthApp.name, 'Binary Static localhost for dev');
    expect(firstOauthApp.appId, 1159);
    expect(firstOauthApp.appMarkupPercentage, 0);
    expect(firstOauthApp.scopes!.length, 4);
    expect(firstOauthApp.lastUsed, DateTime.tryParse('2019-10-13 07:11:29'));
  });
}
