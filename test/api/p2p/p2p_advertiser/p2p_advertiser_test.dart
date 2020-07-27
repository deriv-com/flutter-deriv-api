import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  group('P2P Advertiser Group ->', () {
    test('Fetch Advertiser Information Test', () async {
      final P2PAdvertiser advertiser =
          await P2PAdvertiser.fetchAdvertiserInformation(
        const P2pAdvertiserInfoRequest(id: '1'),
      );

      expect(advertiser.chatToken, 'invalid_token_for_test_2ea8d690e2e98582');
      expect(advertiser.chatUserId, 'p2p_CR_1589256468');
      expect(advertiser.contactInfo, 'contract information');
      expect(advertiser.createdTime, getDateTime(1589256469));
      expect(
        advertiser.defaultAdvertDescription,
        'default advert description',
      );
      expect(advertiser.id, '12');
      expect(advertiser.isApproved, true);
      expect(advertiser.isListed, false);
      expect(advertiser.name, 'John Doe');
      expect(advertiser.paymentInfo, 'payment information');
    });

    test('Subscribe to Advertiser Test', () {
      P2PAdvertiser.subscribeAdvertiserInformation(
        const P2pAdvertiserInfoRequest(id: '1'),
      ).take(1).listen(
        expectAsync1((P2PAdvertiser advertiser) {
          expect(
            advertiser.chatToken,
            'invalid_token_for_test_2ea8d690e2e98582',
          );
          expect(advertiser.chatUserId, 'p2p_CR_1589256468');
          expect(advertiser.contactInfo, 'contract information');
          expect(advertiser.createdTime, getDateTime(1589256469));
          expect(
            advertiser.defaultAdvertDescription,
            'default advert description',
          );
          expect(advertiser.id, '12');
          expect(advertiser.isApproved, true);
          expect(advertiser.isListed, false);
          expect(advertiser.name, 'John Doe');
          expect(advertiser.paymentInfo, 'payment information');

          expect(
            advertiser.subscriptionInformation.id,
            '4b0ef5f5-a3cd-7a01-01cb-871f0b504143',
          );
        }),
      );
    });

    test('Create Advertiser Test', () async {
      final P2PAdvertiser advertiser = await P2PAdvertiser.createAdvertiser(
        const P2pAdvertiserCreateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          name: 'John Doe',
          paymentInfo: 'payment information',
        ),
      );

      expect(advertiser.chatToken, 'invalid_token_for_test_2ea8d690e2e98582');
      expect(advertiser.chatUserId, 'p2p_CR_1589256468');
      expect(advertiser.contactInfo, 'contract information');
      expect(advertiser.createdTime, getDateTime(1589256469));
      expect(
        advertiser.defaultAdvertDescription,
        'default advert description',
      );
      expect(advertiser.id, '18');
      expect(advertiser.isApproved, true);
      expect(advertiser.isListed, false);
      expect(advertiser.name, 'John Doe');
      expect(advertiser.paymentInfo, 'payment information');
    });

    test('Create and Subscribe to Advertiser Test', () {
      P2PAdvertiser.createAdvertiserAndSubscribe(
        const P2pAdvertiserCreateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          name: 'John Doe',
          paymentInfo: 'payment information',
        ),
      ).take(1).listen(
        expectAsync1((P2PAdvertiser advertiser) {
          expect(
            advertiser.chatToken,
            'invalid_token_for_test_2ea8d690e2e98582',
          );
          expect(advertiser.chatUserId, 'p2p_CR_1589256468');
          expect(advertiser.contactInfo, 'contract information');
          expect(advertiser.createdTime, getDateTime(1589256469));
          expect(
            advertiser.defaultAdvertDescription,
            'default advert description',
          );
          expect(advertiser.id, '18');
          expect(advertiser.isApproved, true);
          expect(advertiser.isListed, false);
          expect(advertiser.name, 'John Doe');
          expect(advertiser.paymentInfo, 'payment information');

          expect(
            advertiser.subscriptionInformation.id,
            '4b0ef5f5-a3cd-7a01-01cb-871f0b504143',
          );
        }),
      );
    });

    test('Update Advertiser Test', () async {
      final P2PAdvertiser advertiser = await P2PAdvertiser.updateAdvertiser(
        const P2pAdvertiserUpdateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          isListed: true,
          paymentInfo: 'payment information',
        ),
      );

      expect(advertiser.chatToken, 'invalid_token_for_test_2ea8d690e2e98582');
      expect(advertiser.chatUserId, 'p2p_CR_1589256468');
      expect(advertiser.contactInfo, 'contract information');
      expect(advertiser.createdTime, getDateTime(1589256469));
      expect(
        advertiser.defaultAdvertDescription,
        'default advert description',
      );
      expect(advertiser.id, '18');
      expect(advertiser.isApproved, true);
      expect(advertiser.isListed, true);
      expect(advertiser.name, 'John Doe');
      expect(advertiser.paymentInfo, 'payment information');
    });

    test('Fetch Advertiser Adverts Test', () async {
      final List<P2PAdvert> adverts =
          await P2PAdvertiser.fetchAdvertiserAdverts(
        const P2pAdvertiserAdvertsRequest(limit: 10, offset: 0),
      );

      expect(adverts.length, 2);

      expect(adverts.first.accountCurrency, 'USD');

      expect(adverts.first.advertiserDetails.id, '1');
      expect(adverts.first.advertiserDetails.name, 'John Doe');

      expect(adverts.first.counterpartyType, TransactionType.sell);
      expect(adverts.first.country, 'za');
      expect(adverts.first.createdTime, getDateTime(1589258036));
      expect(adverts.first.description, 'Please contact via 1234');
      expect(adverts.first.id, '3');
      expect(adverts.first.isActive, true);
      expect(adverts.first.localCurrency, 'ZAR');
      expect(adverts.first.maxOrderAmount, 3);
      expect(adverts.first.maxOrderAmountDisplay, '3.00');
      expect(adverts.first.minOrderAmount, 1);
      expect(adverts.first.minOrderAmountDisplay, '1.00');
      expect(adverts.first.paymentInfo, 'Transfer to account 000-1111');
      expect(adverts.first.paymentMethod, PaymentMethod.bankTransfer);
      expect(adverts.first.price, 1);
      expect(adverts.first.priceDisplay, '1.00');
      expect(adverts.first.rate, 2);
      expect(adverts.first.rateDisplay, '2.00');
      expect(adverts.first.remainingAmount, 15);
      expect(adverts.first.remainingAmountDisplay, '15.00');
      expect(adverts.first.type, TransactionType.buy);
    });
  });
}
