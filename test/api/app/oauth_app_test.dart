import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/app/oauth_app.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Oauth Application Test', () async {
    final List<OauthApp?>? oauthApps = await OauthApp.fetchOauthApps();

    expect(oauthApps!.length, 2);

    expect(oauthApps.first!.name, 'Binary Static localhost for dev');
    expect(oauthApps.first!.appId, 1159);
    expect(oauthApps.first!.appMarkupPercentage, 0);
    expect(oauthApps.first!.scopes!.length, 4);
    expect(oauthApps.first!.lastUsed, DateTime.tryParse('2019-10-13 07:11:29'));
  });
}
