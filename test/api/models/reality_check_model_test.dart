import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/reality_check.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'reality_check_model_mock_data.dart';

void main() {
  test('revoke oauth app json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(realityCheckModelMockData);
    final RealityCheck realityCheck =
        RealityCheck.fromJson(mapData['reality_check']);

    expect(realityCheck.buyAmount, 200.0);
    expect(realityCheck.buyCount, 7);
    expect(realityCheck.currency, 'USD');
    expect(realityCheck.loginId, 'CR90000002');
    expect(realityCheck.openContractCount, 2);
    expect(realityCheck.potentialProfit, 85.5);
    expect(realityCheck.sellAmount, 150.0);
    expect(realityCheck.sellCount, 6);
    expect(realityCheck.startTime, getDateTime(1587544006));
  });
}
