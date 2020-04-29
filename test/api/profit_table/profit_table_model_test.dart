import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/profit_transaction_model.dart';
import 'package:flutter_deriv_api/api/profit_table/profit_table.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'profit_table_model_mock_data.dart';

void main() {
  test('profit table json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(profitTableModelMockData);
    final ProfitTable profitTable =
        ProfitTable.fromJson(mapData['profit_table']);

    expect(profitTable.count, 1);

    expect(profitTable.transactions.length, 1);

    final ProfitTransactionModel transaction = profitTable.transactions.first;

    expect(transaction.appId, 1234);
    expect(transaction.buyPrice, 250.0);
    expect(transaction.contractId, 4867502908);
    expect(transaction.longCode, 'long_code');
    expect(transaction.payout, 10.0);
    expect(transaction.purchaseTime, getDateTime(1587544006));
    expect(transaction.sellPrice, 5.25);
    expect(transaction.sellTime, getDateTime(1587554006));
    expect(transaction.shortCode, 'short_code');
    expect(transaction.transactionId, 10867502908);
  });
}
