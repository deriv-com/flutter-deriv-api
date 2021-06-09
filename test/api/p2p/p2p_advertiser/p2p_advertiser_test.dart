import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

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
      ).listen(
        expectAsync1((P2PAdvertiser? advertiser) {
          expect(
            advertiser!.chatToken,
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
            advertiser.subscriptionInformation!.id,
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
      ).listen(
        expectAsync1((P2PAdvertiser? advertiser) {
          expect(
            advertiser!.chatToken,
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
            advertiser.subscriptionInformation!.id,
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
      final List<P2PAdvert?>? adverts =
          await P2PAdvertiser.fetchAdvertiserAdverts(
        const P2pAdvertiserAdvertsRequest(limit: 10, offset: 0),
      );
      final P2PAdvert advert = adverts!.first!;

      expect(adverts.length, 2);

      expect(advert.accountCurrency, 'USD');

      expect(advert.advertiserDetails!.id, '1');
      expect(advert.advertiserDetails!.name, 'John Doe');

      expect(advert.counterpartyType, TransactionType.sell);
      expect(advert.country, 'za');
      expect(advert.createdTime, getDateTime(1589258036));
      expect(advert.description, 'Please contact via 1234');
      expect(advert.id, '3');
      expect(advert.isActive, true);
      expect(advert.localCurrency, 'ZAR');
      expect(advert.maxOrderAmount, 3);
      expect(advert.maxOrderAmountDisplay, '3.00');
      expect(advert.minOrderAmount, 1);
      expect(advert.minOrderAmountDisplay, '1.00');
      expect(advert.paymentInfo, 'Transfer to account 000-1111');
      expect(advert.paymentMethod, PaymentMethod.bankTransfer);
      expect(advert.price, 1);
      expect(advert.priceDisplay, '1.00');
      expect(advert.rate, 2);
      expect(advert.rateDisplay, '2.00');
      expect(advert.remainingAmount, 15);
      expect(advert.remainingAmountDisplay, '15.00');
      expect(advert.type, TransactionType.buy);
    });
  });
}
