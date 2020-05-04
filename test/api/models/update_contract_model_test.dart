import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contracts/update_contract.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'update_contract_model_mock_data.dart';

void main() {
  test('update contract json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(updateContractModelMockData);
    final UpdateContract updateContract =
        UpdateContract.fromJson(mapData['contract_update']);

    expect(updateContract.stopLoss.displayName, 'localized display name');
    expect(updateContract.stopLoss.orderAmount, 530.0);
    expect(updateContract.stopLoss.orderDate, getDateTime(1587544006));
    expect(updateContract.stopLoss.value, '120.0');

    expect(updateContract.takeProfit.displayName, 'localized display name');
    expect(updateContract.takeProfit.orderAmount, 430.0);
    expect(updateContract.takeProfit.orderDate, getDateTime(1587744006));
    expect(updateContract.takeProfit.value, '100.0');
  });
}
