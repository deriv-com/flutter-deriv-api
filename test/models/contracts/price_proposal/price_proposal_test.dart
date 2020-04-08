import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/logic/contracts/price_proposal/price_proposal.dart';
import 'price_proposal_mock_data.dart';

void main() {
  test('Price proposal json parsing', () {
    final Map<String, dynamic> proposalMap = jsonDecode(priceProposalJson);
    final PriceProposal priceProposal =
        PriceProposal.fromJson(proposalMap['proposal']);

    expect(priceProposal.askPrice, 10);
    expect(priceProposal.id, '042922fe-5664-09e4-c3bf-b3bbe98f31db');
    expect(priceProposal.dateStart, 1586335719);
    expect(priceProposal.spot, 9392.5);
  });
}
