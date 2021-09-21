import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_adverts_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_create_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_info_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_update_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/p2p_advertiser_info_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advertiser_create_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advertiser_update_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_advertiser_adverts_response_result.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('P2P Advertiser Group ->', () {
    test('Fetch Advertiser Information Test', () async {
      final P2pAdvertiserInfoResponse advertiserResponse =
          await P2pAdvertiserInfoResponse.fetchAdvertiserInformation(
        const P2pAdvertiserInfoRequest(id: '1'),
      );

      final P2pAdvertiserInfo advertiser =
          advertiserResponse.p2pAdvertiserInfo!;

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
      P2pAdvertiserInfoResponse.subscribeAdvertiserInformation(
        const P2pAdvertiserInfoRequest(id: '1'),
      ).listen(
        expectAsync1((P2pAdvertiserInfoResponse? advertiser) {
          expect(
            advertiser?.p2pAdvertiserInfo?.chatToken,
            'invalid_token_for_test_2ea8d690e2e98582',
          );
          expect(
              advertiser?.p2pAdvertiserInfo?.chatUserId, 'p2p_CR_1589256468');
          expect(advertiser?.p2pAdvertiserInfo?.contactInfo,
              'contract information');
          expect(advertiser?.p2pAdvertiserInfo?.createdTime,
              getDateTime(1589256469));
          expect(
            advertiser?.p2pAdvertiserInfo?.defaultAdvertDescription,
            'default advert description',
          );
          expect(advertiser?.p2pAdvertiserInfo?.id, '12');
          expect(advertiser?.p2pAdvertiserInfo?.isApproved, true);
          expect(advertiser?.p2pAdvertiserInfo?.isListed, false);
          expect(advertiser?.p2pAdvertiserInfo?.name, 'John Doe');
          expect(advertiser?.p2pAdvertiserInfo?.paymentInfo,
              'payment information');

          expect(
            advertiser?.subscription?.id,
            '4b0ef5f5-a3cd-7a01-01cb-871f0b504143',
          );
        }),
      );
    });

    test('Create Advertiser Test', () async {
      final P2pAdvertiserCreateResponse advertiser =
          await P2pAdvertiserCreateResponse.createAdvertiser(
        const P2pAdvertiserCreateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          name: 'John Doe',
          paymentInfo: 'payment information',
        ),
      );

      expect(advertiser.p2pAdvertiserCreate?.chatToken,
          'invalid_token_for_test_2ea8d690e2e98582');
      expect(advertiser.p2pAdvertiserCreate?.chatUserId, 'p2p_CR_1589256468');
      expect(
          advertiser.p2pAdvertiserCreate?.contactInfo, 'contract information');
      expect(
          advertiser.p2pAdvertiserCreate?.createdTime, getDateTime(1589256469));
      expect(
        advertiser.p2pAdvertiserCreate?.defaultAdvertDescription,
        'default advert description',
      );
      expect(advertiser.p2pAdvertiserCreate?.id, '18');
      expect(advertiser.p2pAdvertiserCreate?.isApproved, true);
      expect(advertiser.p2pAdvertiserCreate?.isListed, false);
      expect(advertiser.p2pAdvertiserCreate?.name, 'John Doe');
      expect(
          advertiser.p2pAdvertiserCreate?.paymentInfo, 'payment information');
    });

    test('Create and Subscribe to Advertiser Test', () {
      P2pAdvertiserCreateResponse.createAdvertiserAndSubscribe(
        const P2pAdvertiserCreateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          name: 'John Doe',
          paymentInfo: 'payment information',
        ),
      ).listen(
        expectAsync1((P2pAdvertiserCreateResponse? advertiser) {
          expect(
            advertiser?.p2pAdvertiserCreate?.chatToken,
            'invalid_token_for_test_2ea8d690e2e98582',
          );
          expect(
              advertiser?.p2pAdvertiserCreate?.chatUserId, 'p2p_CR_1589256468');
          expect(advertiser?.p2pAdvertiserCreate?.contactInfo,
              'contract information');
          expect(advertiser?.p2pAdvertiserCreate?.createdTime,
              getDateTime(1589256469));
          expect(
            advertiser?.p2pAdvertiserCreate?.defaultAdvertDescription,
            'default advert description',
          );
          expect(advertiser?.p2pAdvertiserCreate?.id, '18');
          expect(advertiser?.p2pAdvertiserCreate?.isApproved, true);
          expect(advertiser?.p2pAdvertiserCreate?.isListed, false);
          expect(advertiser?.p2pAdvertiserCreate?.name, 'John Doe');
          expect(advertiser?.p2pAdvertiserCreate?.paymentInfo,
              'payment information');

          expect(
            advertiser?.subscription?.id,
            '4b0ef5f5-a3cd-7a01-01cb-871f0b504143',
          );
        }),
      );
    });

    test('Update Advertiser Test', () async {
      final P2pAdvertiserUpdateResponse advertiser =
          await P2pAdvertiserUpdateResponse.updateAdvertiser(
        const P2pAdvertiserUpdateRequest(
          contactInfo: 'contract information',
          defaultAdvertDescription: 'default advert description',
          isListed: true,
          paymentInfo: 'payment information',
        ),
      );

      expect(advertiser.p2pAdvertiserUpdate?.chatToken,
          'invalid_token_for_test_2ea8d690e2e98582');
      expect(advertiser.p2pAdvertiserUpdate?.chatUserId, 'p2p_CR_1589256468');
      expect(
          advertiser.p2pAdvertiserUpdate?.contactInfo, 'contract information');
      expect(
          advertiser.p2pAdvertiserUpdate?.createdTime, getDateTime(1589256469));
      expect(
        advertiser.p2pAdvertiserUpdate?.defaultAdvertDescription,
        'default advert description',
      );
      expect(advertiser.p2pAdvertiserUpdate?.id, '18');
      expect(advertiser.p2pAdvertiserUpdate?.isApproved, true);
      expect(advertiser.p2pAdvertiserUpdate?.isListed, true);
      expect(advertiser.p2pAdvertiserUpdate?.name, 'John Doe');
      expect(
          advertiser.p2pAdvertiserUpdate?.paymentInfo, 'payment information');
    });

    test('Fetch Advertiser Adverts Test', () async {
      final P2pAdvertiserAdvertsResponse advertsResponse =
          await P2pAdvertiserAdvertsResponse.fetchAdvertiserAdverts(
        const P2pAdvertiserAdvertsRequest(limit: 10, offset: 0),
      );

      final List<ListItem> adverts = advertsResponse.p2pAdvertiserAdverts!.list;
      expect(adverts.length, 2);

      expect(adverts.first.accountCurrency, 'USD');

      expect(adverts.first.advertiserDetails.id, '1');
      expect(adverts.first.advertiserDetails.name, 'John Doe');

      expect(adverts.first.counterpartyType, CounterpartyTypeEnum.sell);
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
      expect(adverts.first.paymentMethod, 'bank_transfer');
      expect(adverts.first.price, 1);
      expect(adverts.first.priceDisplay, '1.00');
      expect(adverts.first.rate, 2);
      expect(adverts.first.rateDisplay, '2.00');
      expect(adverts.first.remainingAmount, 15);
      expect(adverts.first.remainingAmountDisplay, '15.00');
      expect(adverts.first.type, TypeEnum.buy);
    });
  });
}
