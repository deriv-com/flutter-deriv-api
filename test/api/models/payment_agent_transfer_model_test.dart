import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/payment_agent/payment_agent_transfer.dart';

import 'payment_agent_transfer_model_mock_data.dart';

void main() {
  test('payment agent transfer json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(paymentAgentTransferModelMockData);
    final PaymentAgentTransfer paymentAgentTransfer =
        PaymentAgentTransfer.fromJson(mapData);

    expect(paymentAgentTransfer.paymentAgentTransfer, PaymentResult.values[2]);
    expect(paymentAgentTransfer.clientToFullName, 'John Doe');
    expect(paymentAgentTransfer.clientToLoginid, 'CR100001');
    expect(paymentAgentTransfer.transactionId, 45735309);
  });
}
