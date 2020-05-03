import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/cashier_url_model.dart';
import 'cashier_url_mock_data.dart';

void main() {
  test('TnC approval JSON parsing', () {
    final CashierURLModel cashierURLModel =
        CashierURLModel.fromJson(jsonDecode(cashierURLJSON));
    expect(cashierURLModel.cashierURL, 'http://example.url/sagsjgajshkjHSas');
  });
}
