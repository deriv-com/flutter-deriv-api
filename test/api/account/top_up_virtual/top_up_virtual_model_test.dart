import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/top_up_virtual/top_up_virtual.dart';

import 'top_up_virtual_model_mock_data.dart';

void main() {
  test('top-up virtual json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(topUpModelMockData);
    final TopUpVirtual topUpVirtual =
        TopUpVirtual.fromJson(mapData['topup_virtual']);

    expect(topUpVirtual.amount, 30.0);
    expect(topUpVirtual.currency, 'USD');
  });
}
