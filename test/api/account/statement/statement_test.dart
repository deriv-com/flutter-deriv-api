import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/statement_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/statement_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Statement Test', () async {
    final StatementResponse statement = await StatementResponse.fetch(
      const StatementRequest(
        actionType: 'deposit',
        description: true,
      ),
    );

    expect(statement.statement?.count, 1);

    expect(statement.statement?.transactions?.length, 1);

    final TransactionsItem transaction =
        statement.statement!.transactions!.first;

    expect(transaction.actionType, ActionTypeEnum.deposit);
    expect(transaction.amount, -83.23);
    expect(transaction.appId, 34123);
    expect(transaction.balanceAfter, 10150.13);
    expect(transaction.contractId, 4867502908);
    expect(transaction.longcode, 'prefilled balance');
    expect(transaction.payout, 35.5);
    expect(transaction.purchaseTime, getDateTime(1587544006));
    expect(transaction.referenceId, 1234);
    expect(transaction.shortcode, 'pref_bal');
    expect(transaction.transactionId, 23432);
    expect(transaction.transactionTime, getDateTime(1587544006));
  });
}
