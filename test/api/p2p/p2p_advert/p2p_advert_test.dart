import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  group('p2p advert group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('advert information', () async {
      final P2PAdvert p2pAdvert = await P2PAdvert.fetchAdvert(
        const P2pAdvertInfoRequest(id: '6'),
      );

      expect(p2pAdvert.accountCurrency, 'USD');

      expect(p2pAdvert.advertiserDetails.id, '2');
      expect(p2pAdvert.advertiserDetails.name, 'za advertiser 1010');

      expect(p2pAdvert.counterpartyType, TransactionType.sell);
      expect(p2pAdvert.country, 'za');
      expect(p2pAdvert.createdTime, getDateTime(1589279547));
      expect(
        p2pAdvert.description,
        'Please transfer to account number 1234',
      );
      expect(p2pAdvert.id, '21');
      expect(p2pAdvert.isActive, true);
      expect(p2pAdvert.localCurrency, 'ZAR');
      expect(p2pAdvert.maxOrderAmountLimit, 15);
      expect(p2pAdvert.maxOrderAmountLimitDisplay, '15.00');
      expect(p2pAdvert.minOrderAmountLimit, 3);
      expect(p2pAdvert.minOrderAmountLimitDisplay, '3.00');
      expect(p2pAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(p2pAdvert.price, 2.3);
      expect(p2pAdvert.priceDisplay, '2.30');
      expect(p2pAdvert.rate, 2.3);
      expect(p2pAdvert.rateDisplay, '2.30');
      expect(p2pAdvert.type, TransactionType.buy);
    });

    test('advert list', () async {
      final List<P2PAdvert> p2pAdvertList = await P2PAdvert.fetchAdvertList(
        const P2pAdvertListRequest(
          counterpartyType: 'sell',
        ),
      );

      expect(p2pAdvertList.length, 2);

      expect(p2pAdvertList.first.accountCurrency, 'USD');

      expect(p2pAdvertList.first.advertiserDetails.id, '6');
      expect(
        p2pAdvertList.first.advertiserDetails.name,
        'advertiser CR90000018',
      );

      expect(p2pAdvertList.first.counterpartyType, TransactionType.sell);
      expect(p2pAdvertList.first.country, 'za');
      expect(p2pAdvertList.first.createdTime, getDateTime(1589270475));
      expect(
        p2pAdvertList.first.description,
        'Please contact via whats app 1234',
      );
      expect(p2pAdvertList.first.id, '7');
      expect(p2pAdvertList.first.isActive, true);
      expect(p2pAdvertList.first.localCurrency, 'ZAR');
      expect(p2pAdvertList.first.maxOrderAmountLimit, 100);
      expect(p2pAdvertList.first.maxOrderAmountLimitDisplay, '100.00');
      expect(p2pAdvertList.first.minOrderAmountLimit, 10);
      expect(p2pAdvertList.first.minOrderAmountLimitDisplay, '10.00');
      expect(p2pAdvertList.first.paymentMethod, PaymentMethod.bankTransfer);
      expect(p2pAdvertList.first.price, 14500);
      expect(p2pAdvertList.first.priceDisplay, '14500.00');
      expect(p2pAdvertList.first.rate, 14500);
      expect(p2pAdvertList.first.rateDisplay, '14500.00');
      expect(p2pAdvertList.first.type, TransactionType.buy);
    });

    test('create advert', () async {
      final P2PAdvert p2pAdvert = await P2PAdvert.createAdvert(
        const P2pAdvertCreateRequest(
          description: 'Please transfer to account number 1234',
          type: 'buy',
          amount: 100,
          maxOrderAmount: 15,
          minOrderAmount: 3,
          paymentMethod: 'bank_transfer',
          rate: 4.25,
        ),
      );

      expect(p2pAdvert.accountCurrency, 'USD');

      expect(p2pAdvert.advertiserDetails.id, '3');
      expect(p2pAdvert.advertiserDetails.name, 'za advertiser 1010');

      expect(p2pAdvert.amount, 100);
      expect(p2pAdvert.amountDisplay, '100.00');
      expect(p2pAdvert.contactInfo, 'Please transfer to account number 1234');
      expect(p2pAdvert.counterpartyType, TransactionType.buy);
      expect(p2pAdvert.country, 'za');
      expect(p2pAdvert.createdTime, getDateTime(1589279547));
      expect(p2pAdvert.description, 'advert information');
      expect(p2pAdvert.id, '25');
      expect(p2pAdvert.isActive, true);
      expect(p2pAdvert.localCurrency, 'ZAR');
      expect(p2pAdvert.maxOrderAmount, 50);
      expect(p2pAdvert.maxOrderAmountDisplay, '50.00');
      expect(p2pAdvert.minOrderAmount, 20);
      expect(p2pAdvert.minOrderAmountDisplay, '20.00');
      expect(p2pAdvert.paymentInfo, 'it is a sell order');
      expect(p2pAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(p2pAdvert.price, 2.3);
      expect(p2pAdvert.priceDisplay, '2.30');
      expect(p2pAdvert.rate, 2.7);
      expect(p2pAdvert.rateDisplay, '2.70');
      expect(p2pAdvert.remainingAmount, 50);
      expect(p2pAdvert.remainingAmountDisplay, '50.00');
      expect(p2pAdvert.type, TransactionType.sell);
    });

    test('update advert', () async {
      final P2PAdvert p2pAdvert = await P2PAdvert.updateAdvert(
        const P2pAdvertUpdateRequest(
          delete: 0,
          isActive: 0,
        ),
      );

      expect(p2pAdvert.accountCurrency, 'USD');

      expect(p2pAdvert.advertiserDetails.id, '3');
      expect(p2pAdvert.advertiserDetails.name, 'za advertiser 1010');

      expect(p2pAdvert.amount, 100);
      expect(p2pAdvert.amountDisplay, '100.00');
      expect(p2pAdvert.contactInfo, 'Please transfer to account number 1234');
      expect(p2pAdvert.counterpartyType, TransactionType.buy);
      expect(p2pAdvert.country, 'za');
      expect(p2pAdvert.createdTime, getDateTime(1589279547));
      expect(p2pAdvert.description, 'advert information');
      expect(p2pAdvert.id, '25');
      expect(p2pAdvert.isActive, false);
      expect(p2pAdvert.localCurrency, 'ZAR');
      expect(p2pAdvert.maxOrderAmount, 50);
      expect(p2pAdvert.maxOrderAmountDisplay, '50.00');
      expect(p2pAdvert.minOrderAmount, 20);
      expect(p2pAdvert.minOrderAmountDisplay, '20.00');
      expect(p2pAdvert.paymentInfo, 'it is a sell order');
      expect(p2pAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(p2pAdvert.price, 2.3);
      expect(p2pAdvert.priceDisplay, '2.30');
      expect(p2pAdvert.rate, 2.7);
      expect(p2pAdvert.rateDisplay, '2.70');
      expect(p2pAdvert.remainingAmount, 50);
      expect(p2pAdvert.remainingAmountDisplay, '50.00');
      expect(p2pAdvert.type, TransactionType.sell);
    });
  });
}
