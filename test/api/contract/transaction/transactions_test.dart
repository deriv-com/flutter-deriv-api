import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/transaction_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Transactions Subscription Test', () async {
    TransactionResponse.subscribeTransactions().listen(
      expectAsync1(
        (TransactionResponse? transaction) {
          expect(transaction?.transaction?.symbol, 'frxAUDJPY');
          expect(transaction?.transaction?.balance, 9654.38);
          expect(transaction?.transaction?.barrier, 'S0P');
          expect(transaction?.transaction?.contractId, 80072336728);
          expect(transaction?.transaction?.currency, 'USD');
          expect(transaction?.transaction?.id,
              '9c3d0143-24ac-b8d9-c68b-06856b5f78d2');
          expect(
              transaction?.transaction?.purchaseTime, getDateTime(1587626678));

          expect(
            transaction?.subscription?.id,
            '9c3d0143-24ac-b8d9-c68b-06856b5f78d2',
          );
        },
      ),
    );
  });
}
