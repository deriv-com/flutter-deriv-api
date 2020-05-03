import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/app/oauth_app.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'oauth_apps_mock_data.dart';

void main() {
  test('OAuth apps JSON parsing', () {
    final Map<String, dynamic> oauthAppsMap = jsonDecode(oauthAppsJSON);
    final List<OAuthApp> oauthApps = getListFromMap(
      oauthAppsMap['oauth_apps'],
      itemToTypeCallback: (dynamic item) => OAuthApp.fromJson(item),
    );

    expect(oauthApps.first.name, 'Binary Static localhost for dev');
    expect(oauthApps.first.appId, 1159);
    expect(oauthApps.first.appMarkupPercentage, 0);
    expect(oauthApps.first.scopes.length, 4);
    expect(
      oauthApps.first.lastUsed,
      DateTime.parse('2019-10-13 07:11:29.999974'),
    );
  });
}
