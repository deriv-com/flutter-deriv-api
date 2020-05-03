import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/ping_model.dart';

import 'ping_model_mock_data.dart';

void main() {
  test('ping json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(pingModelMockData);
    final PingModel ping = PingModel.fromJson(mapData);

    expect(ping.succeeded, true);
  });
}
