import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/statement_transaction.dart';
import 'package:flutter_deriv_api/api/statement/statement.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'statement_model_mock_data.dart';

void main() {
  test('statement json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(statementModelMockData);
    final Statement statement = Statement.fromJson(mapData['statement']);

    expect(statement.count, 1);

    expect(statement.transactions.length, 1);

    final StatementTransactionModel transaction = statement.transactions[0];

    expect(transaction.actionType, StatementTransactionActionType.deposit);
    expect(transaction.amount, -83.23);
    expect(transaction.appId, 34123);
    expect(transaction.balanceAfter, 10150.13);
    expect(transaction.contractId, 4867502908);
    expect(transaction.longcode, 'a sample long code');
    expect(transaction.payout, 35.5);
    expect(transaction.purchaseTime, getDateTime(1587544006));
    expect(transaction.referenceId, 1234);
    expect(transaction.shortcode, 'a short code');
    expect(transaction.transactionId, 23432);
    expect(transaction.transactionTime, getDateTime(1587544006));
  });
}
