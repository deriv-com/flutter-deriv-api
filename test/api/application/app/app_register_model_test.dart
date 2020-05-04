import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_register.dart';

import 'app_register_model_mock_data.dart';

void main() {
  test('app register json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(appRegisterModelMockData);
    final AppRegister appRegister = AppRegister.fromJson(mapData);

    expect(appRegister.appDetails.appId, 1234);
    expect(appRegister.appDetails.appMarkupPercentage, 22.0);
    expect(
        appRegister.appDetails.appstore, 'https://itunes.apple.com/test_app');
    expect(appRegister.appDetails.github, 'https://github.com/test_org/app');
    expect(appRegister.appDetails.googleplay,
        'https://play.google.com/store/apps/details?id=test.app');
    expect(appRegister.appDetails.homepage, 'https://test.example.com/');
    expect(appRegister.appDetails.name, 'Test Application');
    expect(appRegister.appDetails.redirectUri,
        'https://test.example.com/redirect');
    expect(appRegister.appDetails.verificationUri,
        'https://test.example.com/verify');
  });
}
