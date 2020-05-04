import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_detail.dart';

import 'app_detail_model_mock_data.dart';

void main() {
  test('app detail json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(appDetailsModelMockData);
    final AppDetails appDetail = AppDetails.fromJson(mapData['app_get']);

    expect(appDetail.appId, 1234);
    expect(appDetail.appMarkupPercentage, 22.0);
    expect(appDetail.appstore, 'https://itunes.apple.com/test_app');
    expect(appDetail.github, 'https://github.com/test_org/app');
    expect(appDetail.googleplay,
        'https://play.google.com/store/apps/details?id=test.app');
    expect(appDetail.homepage, 'https://test.example.com/');
    expect(appDetail.name, 'Test Application');
    expect(appDetail.redirectUri, 'https://test.example.com/redirect');
    expect(appDetail.verificationUri, 'https://test.example.com/verify');
  });
}
