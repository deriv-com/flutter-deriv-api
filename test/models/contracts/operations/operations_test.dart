import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/api/contracts/operations/buy_contract.dart';
import 'package:flutter_deriv_api/api/contracts/operations/price_proposal.dart';
import 'package:flutter_deriv_api/api/models/open_contract_model.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/api/contracts/operations/exceptions/contract_operations_exception.dart';
import 'buy_contract_mock_data.dart';
import 'open_contract_mock_data.dart';
import 'price_proposal_mock_data.dart';

void main() {
  test('Price proposal json parsing', () {
    final Map<String, dynamic> proposalMap = jsonDecode(priceProposalJson);
    final PriceProposal priceProposal =
        PriceProposal.fromJson(proposalMap['proposal']);

    expect(priceProposal.askPrice, 10);
    expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
    expect(priceProposal.dateStart.millisecondsSinceEpoch ~/ 1000, 1586335719);
    expect(priceProposal.spotTime.millisecondsSinceEpoch ~/ 1000, 1586335713);
    expect(priceProposal.spot, 9392.5);
  });

  test('Buy contract JSON parsing', () {
    final Map<String, dynamic> buyContractMap = jsonDecode(buyContractJSON);
    final BuyContract buyContract = BuyContract.fromJson(buyContractMap['buy']);
    expect(buyContract.contractId, 79939279308);
    expect(buyContract.purchaseTime.millisecondsSinceEpoch ~/ 1000, 1587528886);
    expect(
        buyContract.shortcode, 'CALL_R_100_100_1587528886_1587528946_S10P_0');
    expect(buyContract.buyPrice, 49.12);
  });

  test('Proposal open contract JSON parsing', () {
    final Map<String, dynamic> openContractMap = jsonDecode(openContractJSON);
    final OpenContractModel openContractModel =
        OpenContractModel.fromJson(openContractMap['proposal_open_contract']);

    print('object');
  });

  test('Buy proposal scenario', () async {
    final Injector injector =
        ModuleContainer().initialize(Injector.getInjector());

    // Retrieve API instance from injector
    final BasicBinaryAPI api = injector.get<BasicBinaryAPI>();
    await api.run(
      endpoint: 'frontend.binaryws.com',
      appId: '1089',
      brand: 'binary',
    );

    final AuthorizeResponse authorizeResponse =
        await api.call(request: const AuthorizeRequest(authorize: 'TOKEN'));

    if (authorizeResponse.error != null) {
      return;
    }

    // At this point the WebSocket should be authorized and connected
    // in a real application
    try {
      final PriceProposal priceProposal =
          await PriceProposal.getPriceForContract(
        symbol: 'R_100',
        durationUnit: 'm',
        duration: 2,
        barrier: '+0.1',
        amount: 100,
      );

      final BuyContract boughtContract = await priceProposal.buy(price: 100);

      final OpenContractModel openContractModel =
          await boughtContract.getCurrentContractState();

      print('But scenario completed!');
    } on ContractOperationException catch (e) {
      print(e.message);
    }
  });
}
