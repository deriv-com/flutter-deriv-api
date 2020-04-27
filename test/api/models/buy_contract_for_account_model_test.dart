import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contracts/buy_contract_for_account.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'buy_contract_for_account_model_mock_data.dart';

void main() {
  test('buy contract for account json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(buyContractForAccountModelMockData);
    final BuyContractForAccount buyContractForAccount =
        BuyContractForAccount.fromJson(
            mapData['buy_contract_for_multiple_accounts']['result'][0]);

    expect(buyContractForAccount.contractReceipt.buyPrice, 48.65);
    expect(buyContractForAccount.contractReceipt.contractId, 80476091408);
    expect(buyContractForAccount.contractReceipt.longcode,
        'Win payout if Volatility 100 Index is strictly higher than entry spot plus 0.10 at 1 minute after contract start time.');
    expect(buyContractForAccount.contractReceipt.payout, 100.0);
    expect(buyContractForAccount.contractReceipt.purchaseTime,
        getDateTime(1587926403));
    expect(buyContractForAccount.contractReceipt.shortcode,
        'CALL_R_100_100_1587926403_1587926463_S10P_0');
    expect(buyContractForAccount.contractReceipt.startTime,
        getDateTime(1587926403));
    expect(buyContractForAccount.contractReceipt.token, 'sampleToken324');
    expect(buyContractForAccount.contractReceipt.transactionId, 160845602068);
  });
}
