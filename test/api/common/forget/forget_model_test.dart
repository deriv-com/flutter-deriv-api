import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget.dart';

import 'forget_model_mock_data.dart';

void main() {
  test('forget json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(forgetModelMockData);
    final Forget forget = Forget.fromJson(mapData);

    expect(forget.succeeded, true);
  });
}
