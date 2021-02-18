import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

import 'package:flutter_deriv_api/api/response/contracts_for_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Contracts For Test', () async {
    final ContractsForResponse contractsFor =
        await ContractsForResponse.fetchContractsForSymbol(
      const ContractsForSend(
          contractsFor: 'R_50',
          currency: 'USD',
          landingCompany: 'svg',
          productType: 'basic'),
    );

    final AvailableItem firstContract =
        contractsFor.contractsFor.available.first;

    expect(firstContract.barriers, 0);
    expect(firstContract.maxContractDuration, '1d');
    expect(
      firstContract.forwardStartingOptions.first.close,
      //getDateTime(1586303999),
      '1586303999'
    );
    expect(
      firstContract.forwardStartingOptions.last.open,
      '1586390400'
     // getDateTime(1586390400),
    );
  });
}
