import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/models/statement_transaction.dart';
import 'package:flutter_deriv_api/api/account/statement/statement.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Statement Test', () async {
    final Statement statement = await Statement.fetch(
      const StatementRequest(
        actionType: 'deposit',
        description: true,
      ),
    );

    expect(statement.count, 1);

    expect(statement.transactions!.length, 1);

    final StatementTransactionModel transaction =
        statement.transactions!.first!;

    expect(transaction.actionType, TransactionActionType.deposit);
    expect(transaction.amount, -83.23);
    expect(transaction.appId, 34123);
    expect(transaction.balanceAfter, 10150.13);
    expect(transaction.contractId, 4867502908);
    expect(transaction.longCode, 'prefilled balance');
    expect(transaction.payout, 35.5);
    expect(transaction.purchaseTime, getDateTime(1587544006));
    expect(transaction.referenceId, 1234);
    expect(transaction.shortCode, 'pref_bal');
    expect(transaction.transactionId, 23432);
    expect(transaction.transactionTime, getDateTime(1587544006));
  });
}
