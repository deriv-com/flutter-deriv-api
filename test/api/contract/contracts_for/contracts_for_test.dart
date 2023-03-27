import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/contracts_for_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/contracts_for_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Contracts For Test', () async {
    final ContractsForResponse contractsFor =
        await ContractsForResponse.fetchContractsForSymbol(
      const ContractsForRequest(
          contractsFor: 'R_50',
          currency: 'USD',
          landingCompany: 'svg',
          productType: 'basic'),
    );

    final AvailableItem firstContract =
        contractsFor.contractsFor!.available.first;

    expect(firstContract.barriers, 0);
    expect(firstContract.maxContractDuration, '1d');
    expect(
        firstContract.forwardStartingOptions?.first.close,
        //getDateTime(1586303999),
        '1586303999');
    expect(firstContract.forwardStartingOptions?.last.open, '1586390400'
        // getDateTime(1586390400),
        );
  });
}
