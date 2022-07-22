import 'package:flutter_deriv_api/api/contract/models/forward_starting_option_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Contracts For Test', () async {
    final ContractsForSymbol contractsFor =
        await ContractsForSymbol.fetchContractsForSymbol(
      const ContractsForRequest(
          contractsFor: 'R_50',
          currency: 'USD',
          landingCompany: 'svg',
          productType: 'basic'),
    );

    final AvailableContractModel? firstContract =
        contractsFor.availableContracts!.first;
    final ForwardStartingOptionModel first =
        firstContract!.forwardStartingOptions!.first!;
    final ForwardStartingOptionModel last =
        firstContract.forwardStartingOptions!.last!;

    expect(firstContract.barriers, 0);
    expect(firstContract.maxContractDuration, '1d');
    expect(
      first.close,
      getDateTime(1586303999),
    );
    expect(
      last.open,
      getDateTime(1586390400),
    );
  });
}
