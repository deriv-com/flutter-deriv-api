import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/models/history_spot_price_model.dart';
import 'package:flutter_deriv_api/api/contract/update_contract.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'contract_update_history_mock_data.dart';
import 'update_contract_model_mock_data.dart';

void main() {
  test('update contract JSON parsing', () {
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

  test('Contract update history JSON parsing', () {
    final Map<String, dynamic> contractUpdateHistoryMap =
        jsonDecode(contractUpdateHistoryJSON);

    final List<HistorySpotPriceModel> updateHistory = getListFromMap(
      contractUpdateHistoryMap['contract_update_history'],
      itemToTypeCallback: (dynamic item) =>
          HistorySpotPriceModel.fromJson(item),
    );

    final HistorySpotPriceModel firstUpdate = updateHistory.first;

    expect(firstUpdate.displayName, 'localized display name');
    expect(firstUpdate.orderAmount, 430.0);
    expect(firstUpdate.orderDate, getDateTime(1587744006));
    expect(firstUpdate.orderType, 'stop loss');
    expect(firstUpdate.value, '100.0');
  });
}
