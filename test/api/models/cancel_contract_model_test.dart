import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contracts/cancel_contract.dart';

import 'cancel_contract_model_mock_data.dart';

void main() {
  test('cancel contract json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(cancelContractModelMockData);
    final CancelContract cancelContract =
        CancelContract.fromJson(mapData['cancel']);

    expect(cancelContract.balanceAfter, 1200.0);
    expect(cancelContract.contractId, 2340843);
    expect(cancelContract.referenceId, 7323042);
    expect(cancelContract.soldFor, 1150.0);
    expect(cancelContract.transactionId, 453476);
  });
}
