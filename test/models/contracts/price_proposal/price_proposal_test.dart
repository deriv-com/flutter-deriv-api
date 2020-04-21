import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/api/contarcts/price_proposal/buy_contract.dart';
import 'package:flutter_deriv_api/api/contarcts/price_proposal/price_proposal.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/api/contarcts/price_proposal/exceptions/price_proposal_exception.dart';
import 'price_proposal_mock_data.dart';

void main() {
  test('Price proposal json parsing', () {
    final Map<String, dynamic> proposalMap = jsonDecode(priceProposalJson);
    final PriceProposal priceProposal =
        PriceProposal.fromJson(proposalMap['proposal']);

    expect(priceProposal.askPrice, 10);
    expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
    expect(priceProposal.dateStart.millisecondsSinceEpoch / 1000, 1586335719);
    expect(priceProposal.spotTime.millisecondsSinceEpoch / 1000, 1586335713);
    expect(priceProposal.spot, 9392.5);
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

    final AuthorizeResponse authorizeResponse = await api.call(
        request: const AuthorizeRequest(authorize: 'TOKEN'));

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

      print('But scenario completed!');
    } on PriceProposalException catch (e) {
      print(e.message);
    }
  });
}
