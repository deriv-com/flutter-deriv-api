import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/server_time/server_time.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'server_time_mock_date.dart';

void main() {
  test('server time json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(serverTimeModelMockData);
    final ServerTime serverTime = ServerTime.fromJson(mapData);

    expect(serverTime.time, getDateTime(1587544006));
  });
}
