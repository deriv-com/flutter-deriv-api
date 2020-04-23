import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contracts/transactions/transaction.dart';
import 'transactions_mock_data.dart';

void main() {
  test('Transactions JSON parsing', () {
    final Transaction transaction =
        Transaction.fromJson(jsonDecode(transactionsJSON)['transaction']);

    expect(transaction.symbol, 'frxAUDJPY');
    expect(transaction.balance, 9654.38);
    expect(transaction.barrier, 'S0P');
    expect(transaction.contractId, '80072336728');
    expect(transaction.currency, 'USD');
    expect(transaction.id, '9c3d0143-24ac-b8d9-c68b-06856b5f78d2');
    expect(transaction.purchaseTime.millisecondsSinceEpoch ~/ 1000, 1587626678);
  });
}