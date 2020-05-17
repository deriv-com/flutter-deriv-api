import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';

import 'forget_all_model_mock_data.dart';

void main() {
  test('forget all JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(forgetAllModelMockData);
    final ForgetAll forgetAll = ForgetAll.fromResponse(mapData['forget_all']);

    expect(forgetAll.cancelledStreams.length, 2);

    expect(
      forgetAll.cancelledStreams[0],
      'ea8d3223-9922-5552-4309-6a1e97522f05',
    );
    expect(
      forgetAll.cancelledStreams[1],
      'ea8d3288-9922-5552-4309-6a1e97522f21',
    );
  });
}
