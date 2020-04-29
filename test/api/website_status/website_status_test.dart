import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/website_status/website_status.dart';

import 'website_status_mock_data.dart';

void main() {
  test('Website status', () {
    final Map<String, dynamic> websiteStatusMap = jsonDecode(websiteStatusJSON);
    final WebsiteStatus websiteStatus =
        WebsiteStatus.fromJson(websiteStatusMap['website_status']);

    print('object');
  });
}
