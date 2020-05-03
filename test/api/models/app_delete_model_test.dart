import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/app_delete_model.dart';

import 'app_delete_model_mock_data.dart';

void main() {
  test('app delete json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(appDeleteModelMockData);
    final AppDeleteModel appDelete = AppDeleteModel.fromJson(mapData);

    expect(appDelete.succeeded, true);
  });
}
