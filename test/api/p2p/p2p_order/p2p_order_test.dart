import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/p2p/p2p_order/p2p_order.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'p2p_order_mock_data.dart';

void main() {
  test('P2P order JSON parsing', () {
    final Map<String, dynamic> orderMap = jsonDecode(p2pOrderJSON);

    final P2POrder order = P2POrder.fromJson(orderMap['p2p_order_info']);

    expect(order.accountCurrency, 'USD');
    expect(order.amount, 2.91);
    expect(order.amountDisplay, '2.91');
    expect(order.contactInfo, 'Call/Whatsapp/Telegram +12345678987654');
    expect(order.createdTime, getDateTime(1588579491));
    expect(order.expiryTime, getDateTime(1588579611));
    expect(order.id, '14');
    expect(order.isIncoming, false);
    expect(order.localCurrency, 'ZAR');
    expect(order.paymentInfo, 'Bank of Nowhere 1234567898765432345678');
    expect(order.price, 16.5);
    expect(order.priceDisplay, '16.50');
    expect(order.rate, 5.67);
    expect(order.rateDisplay, '5.67');
    expect(order.status, OrderStatusType.cancelled);
    expect(order.type, OrderType.buy);

    final P2PAdvert advert = order.advertDetails;
    expect(advert.description, 'Call before buying USD :)');
    expect(advert.id, '8');
    expect(advert.paymentMethod, PaymentMethod.bankTransfer);
    expect(advert.type, TransactionType.sell);

    final P2PAdvertiser advertiser = order.advertiserDetails;
    expect(advertiser.id, '4');
    expect(advertiser.name, 'Sample advertiser');
  });
}
