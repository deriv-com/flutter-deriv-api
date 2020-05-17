import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget.dart';

import 'forget_model_mock_data.dart';

void main() {
  test('forget JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(forgetModelMockData);
    final Forget forget = Forget.fromResponse(mapData['forget']);

    expect(forget.succeeded, true);
  });
}
