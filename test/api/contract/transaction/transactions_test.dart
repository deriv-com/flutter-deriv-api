import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/transaction/transaction.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  test('Transactions test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    Transaction.subscribeTransactions().take(1).listen(
      expectAsync1(
        (Transaction transaction) {
          expect(transaction.symbol, 'frxAUDJPY');
          expect(transaction.balance, 9654.38);
          expect(transaction.barrier, 'S0P');
          expect(transaction.contractId, '80072336728');
          expect(transaction.currency, 'USD');
          expect(transaction.id, '9c3d0143-24ac-b8d9-c68b-06856b5f78d2');
          expect(transaction.purchaseTime, getDateTime(1587626678));

          expect(
            transaction.subscriptionInformation.id,
            '9c3d0143-24ac-b8d9-c68b-06856b5f78d2',
          );
        },
      ),
    );
  });
}
