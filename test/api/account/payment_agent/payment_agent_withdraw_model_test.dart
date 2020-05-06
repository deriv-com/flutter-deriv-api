import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/payment_agent/payment_agent_withdraw.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

import 'payment_agent_withdraw_model_mock_data.dart';

void main() {
  test('payment agent withdraw JSON parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(paymentAgentWithdrawModelMockData);
    final PaymentAgentWithdraw paymentAgentWithdraw =
        PaymentAgentWithdraw.fromJson(mapData);

    expect(paymentAgentWithdraw.paymentAgentWithdraw, PaymentResult.values[1]);
    expect(paymentAgentWithdraw.paymentAgentName, 'John Doe');
    expect(paymentAgentWithdraw.transactionId, 45735309);
  });
}
