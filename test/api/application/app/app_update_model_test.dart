import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_update.dart';

import 'app_update_model_mock_data.dart';

void main() {
  test('app update JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(appUpdateModelMockData);
    final AppUpdate appUpdate = AppUpdate.fromJson(mapData);

    expect(appUpdate.appDetails.appId, 1234);
    expect(appUpdate.appDetails.appMarkupPercentage, 22.0);
    expect(appUpdate.appDetails.appstore, 'https://itunes.apple.com/test_app');
    expect(appUpdate.appDetails.github, 'https://github.com/test_org/app');
    expect(appUpdate.appDetails.googleplay,
        'https://play.google.com/store/apps/details?id=test.app');
    expect(appUpdate.appDetails.homepage, 'https://test.example.com/');
    expect(appUpdate.appDetails.name, 'Test Application');
    expect(
        appUpdate.appDetails.redirectUri, 'https://test.example.com/redirect');
    expect(appUpdate.appDetails.verificationUri,
        'https://test.example.com/verify');
  });
}
