import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert_create.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'p2p_advert_create_model_mock_data.dart';

void main() {
  test('p2p advert create json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(p2pAdvertCreateModelMockData);
    final P2PAdvertCreate p2pAdvertCreate =
        P2PAdvertCreate.fromJson(mapData['p2p_advert_create']);

    expect(p2pAdvertCreate.accountCurrency, 'USD');

    expect(p2pAdvertCreate.advertiserDetails.id, '3');
    expect(p2pAdvertCreate.advertiserDetails.name, 'advertiser CR90000019');

    expect(p2pAdvertCreate.amount, 100.0);
    expect(p2pAdvertCreate.amountDisplay, '100.00');
    expect(p2pAdvertCreate.contactInfo, 'contact_info');
    expect(p2pAdvertCreate.counterpartyType, TransactionType.sell);
    expect(p2pAdvertCreate.country, 'za');
    expect(p2pAdvertCreate.createdTime, getDateTime(1588143125));
    expect(
        p2pAdvertCreate.description, 'Please transfer to account number 1234');
    expect(p2pAdvertCreate.id, '44');
    expect(p2pAdvertCreate.isActive, true);
    expect(p2pAdvertCreate.localCurrency, 'ZAR');
    expect(p2pAdvertCreate.maxOrderAmount, 50.0);
    expect(p2pAdvertCreate.maxOrderAmountDisplay, '50.00');
    expect(p2pAdvertCreate.minOrderAmount, 20.0);
    expect(p2pAdvertCreate.minOrderAmountDisplay, '20.00');
    expect(p2pAdvertCreate.paymentInfo, 'payment_info');
    expect(p2pAdvertCreate.paymentMethod, PaymentMethod.bankTransfer);
    expect(p2pAdvertCreate.price, 4.25);
    expect(p2pAdvertCreate.priceDisplay, '4.25');
    expect(p2pAdvertCreate.rate, 4.25);
    expect(p2pAdvertCreate.rateDisplay, '4.25');
    expect(p2pAdvertCreate.remainingAmount, 100.0);
    expect(p2pAdvertCreate.remainingAmountDisplay, '100.00');
    expect(p2pAdvertCreate.type, TransactionType.buy);
  });
}
