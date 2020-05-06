import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'p2p_advert_model_mock_data.dart';

void main() {
  test('p2p advert JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(p2pAdvertModelMockData);
    final P2PAdvert p2pAdvert = P2PAdvert.fromJson(mapData['p2p_advert']);

    expect(p2pAdvert.accountCurrency, 'USD');

    expect(p2pAdvert.advertiserDetails.id, '3');
    expect(p2pAdvert.advertiserDetails.name, 'advertiser CR90000019');

    expect(p2pAdvert.amount, 100.0);
    expect(p2pAdvert.amountDisplay, '100.00');
    expect(p2pAdvert.contactInfo, 'contact_info');
    expect(p2pAdvert.counterpartyType, TransactionType.sell);
    expect(p2pAdvert.country, 'za');
    expect(p2pAdvert.createdTime, getDateTime(1588143125));
    expect(p2pAdvert.description, 'Please transfer to account number 1234');
    expect(p2pAdvert.id, '44');
    expect(p2pAdvert.isActive, true);
    expect(p2pAdvert.localCurrency, 'ZAR');
    expect(p2pAdvert.maxOrderAmount, 50.0);
    expect(p2pAdvert.maxOrderAmountDisplay, '50.00');
    expect(p2pAdvert.maxOrderAmountLimit, 50.0);
    expect(p2pAdvert.maxOrderAmountLimitDisplay, '50.00');
    expect(p2pAdvert.minOrderAmount, 20.0);
    expect(p2pAdvert.minOrderAmountDisplay, '20.00');
    expect(p2pAdvert.minOrderAmountLimit, 20.0);
    expect(p2pAdvert.minOrderAmountLimitDisplay, '20.00');
    expect(p2pAdvert.paymentInfo, 'payment_info');
    expect(p2pAdvert.paymentMethod, PaymentMethod.bankTransfer);
    expect(p2pAdvert.price, 4.25);
    expect(p2pAdvert.priceDisplay, '4.25');
    expect(p2pAdvert.rate, 4.25);
    expect(p2pAdvert.rateDisplay, '4.25');
    expect(p2pAdvert.remainingAmount, 100.0);
    expect(p2pAdvert.remainingAmountDisplay, '100.00');
    expect(p2pAdvert.type, TransactionType.buy);
  });
}
