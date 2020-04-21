import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/forget/forget_all.dart';

import 'forget_all_model_mock_data.dart';

void main() {
  test('Price proposal json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(jsonData);
    final ForgetAll forgetAll = ForgetAll.fromJson(mapData);

    expect(forgetAll.forgetAll.length, 2);

    expect(forgetAll.forgetAll[0], 'ea8d3223-9922-5552-4309-6a1e97522f05');
    expect(forgetAll.forgetAll[1], 'ea8d3288-9922-5552-4309-6a1e97522f21');
  });
}
