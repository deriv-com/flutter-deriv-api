import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/payment_agent/payment_agent.dart';

import 'payment_agent_model_mock_data.dart';

void main() {
  test('Price proposal json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(paymentAgentModelMockData);
    final PaymentAgent paymentAgent = PaymentAgent.fromJson(mapData);

    expect(paymentAgent.currencies, 'UST');
    expect(paymentAgent.depositCommission, '0');
    expect(paymentAgent.email, 'paymentagent@email.com');
    expect(paymentAgent.furtherInformation, 'Nothing');
    expect(paymentAgent.maxWithdrawal, '100');
    expect(paymentAgent.minWithdrawal, '10');
    expect(paymentAgent.name, 'BiDer');
    expect(paymentAgent.paymentagentLoginid, 'CR90000012');
    expect(paymentAgent.summary, 'Nothing');
    expect(paymentAgent.supportedBanks, 'DiamondBank');
    expect(paymentAgent.telephone, '+27119785313');
    expect(paymentAgent.url, 'http://a.com/');
    expect(paymentAgent.withdrawalCommission, '0');
  });
}
