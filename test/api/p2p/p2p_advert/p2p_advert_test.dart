import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/p2p_advert_create_response_result.dart'
    as advert_create;
import 'package:flutter_deriv_api/api/response/p2p_advert_info_response_result.dart'
    as advert_info;
import 'package:flutter_deriv_api/api/response/p2p_advert_list_response_result.dart'
    as advert_list;
import 'package:flutter_deriv_api/api/response/p2p_advert_update_response_result.dart'
    as advert_update;
import 'package:flutter_deriv_api/api/response/p2p_order_create_response_result.dart'
    as order_create;
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_create_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_info_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('P2P Advert Group ->', () {
    test('Fetch Advert Information Test', () async {
      final advert_info.P2pAdvertInfoResponse advertResponse =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
        const P2pAdvertInfoRequest(id: '21'),
      );

      final advert_info.P2pAdvertInfo advert = advertResponse.p2pAdvertInfo!;

      expect(advert.accountCurrency, 'USD');

      expect(advert.advertiserDetails?.id, '2');
      expect(advert.advertiserDetails?.name, 'za advertiser 1010');

      expect(advert.counterpartyType, advert_info.CounterpartyTypeEnum.sell);
      expect(advert.country, 'za');
      expect(advert.createdTime, getDateTime(1589279547));
      expect(
        advert.description,
        'Please transfer to account number 1234',
      );
      expect(advert.id, '21');
      expect(advert.isActive, true);
      expect(advert.localCurrency, 'ZAR');
      expect(advert.maxOrderAmountLimit, 15);
      expect(advert.maxOrderAmountLimitDisplay, '15.00');
      expect(advert.minOrderAmountLimit, 3);
      expect(advert.minOrderAmountLimitDisplay, '3.00');
      expect(advert.paymentMethod, 'bank_transfer');
      expect(advert.price, 2.3);
      expect(advert.priceDisplay, '2.30');
      expect(advert.rate, 2.3);
      expect(advert.rateDisplay, '2.30');
      expect(advert.type, advert_info.P2pAdvertInfoTypeEnum.buy);
    });

    test('Fetch Advert List Test', () async {
      final advert_list.P2pAdvertListResponse advertsRes =
          await advert_list.P2pAdvertListResponse.fetchAdvertList(
        const P2pAdvertListRequest(counterpartyType: 'sell'),
      );

      final List<advert_list.ListItem> adverts = advertsRes.p2pAdvertList!.list;

      final advert_list.ListItem firstAdvert = adverts.first;
      final advert_list.AdvertiserDetails advertiserDetails =
          firstAdvert.advertiserDetails;

      expect(adverts.length, 2);

      expect(firstAdvert.accountCurrency, 'USD');

      expect(firstAdvert.advertiserDetails.id, '6');
      expect(
        advertiserDetails.name,
        'advertiser CR90000018',
      );

      expect(adverts.first.counterpartyType,
          advert_list.CounterpartyTypeEnum.sell);
      expect(adverts.first.country, 'za');
      expect(adverts.first.createdTime, getDateTime(1589270475));
      expect(
        firstAdvert.description,
        'Please contact via whats app 1234',
      );
      expect(adverts.first.id, '7');
      expect(adverts.first.isActive, true);
      expect(adverts.first.localCurrency, 'ZAR');
      expect(adverts.first.maxOrderAmountLimit, 100);
      expect(adverts.first.maxOrderAmountLimitDisplay, '100.00');
      expect(adverts.first.minOrderAmountLimit, 10);
      expect(adverts.first.minOrderAmountLimitDisplay, '10.00');
      expect(adverts.first.paymentMethod, 'bank_transfer');
      expect(adverts.first.price, 14500);
      expect(adverts.first.priceDisplay, '14500.00');
      expect(adverts.first.rate, 14500);
      expect(adverts.first.rateDisplay, '14500.00');
      expect(adverts.first.type, advert_list.TypeEnum.buy);
    });

    test('Create Advert Test', () async {
      final advert_create.P2pAdvertCreateResponse advertRes =
          await advert_create.P2pAdvertCreateResponse.createAdvert(
        const P2pAdvertCreateRequest(
          description: 'Please transfer to account number 1234',
          type: 'buy',
          amount: 100,
          maxOrderAmount: 15,
          rateType: 'fixed',
          minOrderAmount: 3,
          paymentMethod: 'bank_transfer',
          paymentMethodNames: <String>['bank_transfer'],
          rate: 4.25,
          paymentMethodIds: <int>[],
        ),
      );

      final advert_create.P2pAdvertCreate advert = advertRes.p2pAdvertCreate!;

      expect(advert.accountCurrency, 'USD');

      expect(advert.advertiserDetails.id, '3');
      expect(advert.advertiserDetails.name, 'za advertiser 1010');

      expect(advert.amount, 100);
      expect(advert.amountDisplay, '100.00');
      expect(advert.contactInfo, 'Please transfer to account number 1234');
      expect(advert.counterpartyType, advert_create.CounterpartyTypeEnum.buy);
      expect(advert.country, 'za');
      expect(advert.createdTime, getDateTime(1589279547));
      expect(advert.description, 'advert information');
      expect(advert.id, '25');
      expect(advert.isActive, true);
      expect(advert.localCurrency, 'ZAR');
      expect(advert.maxOrderAmount, 50);
      expect(advert.maxOrderAmountDisplay, '50.00');
      expect(advert.minOrderAmount, 20);
      expect(advert.minOrderAmountDisplay, '20.00');
      expect(advert.paymentInfo, 'it is a sell order');
      expect(advert.paymentMethod, 'bank_transfer');
      expect(advert.price, 2.3);
      expect(advert.priceDisplay, '2.30');
      expect(advert.rate, 2.7);
      expect(advert.rateDisplay, '2.70');
      expect(advert.remainingAmount, 50);
      expect(advert.remainingAmountDisplay, '50.00');
      expect(advert.type, advert_create.P2pAdvertCreateTypeEnum.sell);
    });

    test('Update Advert Test', () async {
      final advert_info.P2pAdvertInfoResponse advert =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
              const P2pAdvertInfoRequest(id: '25'));

      final advert_update.P2pAdvertUpdateResponse advertResponse =
          await advert.update(delete: false, isActive: false);

      final advert_update.P2pAdvertUpdate updatedAdvert =
          advertResponse.p2pAdvertUpdate!;

      expect(updatedAdvert.accountCurrency, 'USD');

      expect(updatedAdvert.advertiserDetails?.id, '3');
      expect(updatedAdvert.advertiserDetails?.name, 'za advertiser 1010');

      expect(updatedAdvert.amount, 100);
      expect(updatedAdvert.amountDisplay, '100.00');
      expect(
        updatedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(updatedAdvert.counterpartyType,
          advert_update.CounterpartyTypeEnum.buy);
      expect(updatedAdvert.country, 'za');
      expect(updatedAdvert.createdTime, getDateTime(1589279547));
      expect(updatedAdvert.description, 'advert information');
      expect(updatedAdvert.id, '25');
      expect(updatedAdvert.isActive, false);
      expect(updatedAdvert.localCurrency, 'ZAR');
      expect(updatedAdvert.maxOrderAmount, 50);
      expect(updatedAdvert.maxOrderAmountDisplay, '50.00');
      expect(updatedAdvert.minOrderAmount, 20);
      expect(updatedAdvert.minOrderAmountDisplay, '20.00');
      expect(updatedAdvert.paymentInfo, 'it is a sell order');
      expect(updatedAdvert.paymentMethod, 'bank_transfer');
      expect(updatedAdvert.price, 2.3);
      expect(updatedAdvert.priceDisplay, '2.30');
      expect(updatedAdvert.rate, 2.7);
      expect(updatedAdvert.rateDisplay, '2.70');
      expect(updatedAdvert.remainingAmount, 50);
      expect(updatedAdvert.remainingAmountDisplay, '50.00');
      expect(updatedAdvert.type, advert_update.P2pAdvertUpdateTypeEnum.sell);
    });

    test('Activate Advert Test', () async {
      final advert_info.P2pAdvertInfoResponse advert =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
        const P2pAdvertInfoRequest(id: '21'),
      );

      final advert_update.P2pAdvertUpdateResponse advertResponse =
          await advert.activate();

      final advert_update.P2pAdvertUpdate activatedAdvert =
          advertResponse.p2pAdvertUpdate!;

      expect(activatedAdvert.accountCurrency, 'USD');

      expect(activatedAdvert.advertiserDetails?.id, '3');
      expect(activatedAdvert.advertiserDetails?.name, 'za advertiser 1010');

      expect(activatedAdvert.amount, 100);
      expect(activatedAdvert.amountDisplay, '100.00');
      expect(
        activatedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(activatedAdvert.counterpartyType,
          advert_update.CounterpartyTypeEnum.buy);
      expect(activatedAdvert.country, 'za');
      expect(activatedAdvert.createdTime, getDateTime(1589279547));
      expect(activatedAdvert.description, 'advert information');
      expect(activatedAdvert.id, '25');
      // expect(activatedAdvert.isActive, true); // since we are returning static response json for `P2pAdvertUpdate`, we can't get updated value for isActive.(and any other field)
      expect(activatedAdvert.localCurrency, 'ZAR');
      expect(activatedAdvert.maxOrderAmount, 50);
      expect(activatedAdvert.maxOrderAmountDisplay, '50.00');
      expect(activatedAdvert.minOrderAmount, 20);
      expect(activatedAdvert.minOrderAmountDisplay, '20.00');
      expect(activatedAdvert.paymentInfo, 'it is a sell order');
      expect(activatedAdvert.paymentMethod, 'bank_transfer');
      expect(activatedAdvert.price, 2.3);
      expect(activatedAdvert.priceDisplay, '2.30');
      expect(activatedAdvert.rate, 2.7);
      expect(activatedAdvert.rateDisplay, '2.70');
      expect(activatedAdvert.remainingAmount, 50);
      expect(activatedAdvert.remainingAmountDisplay, '50.00');
      expect(activatedAdvert.type, advert_update.P2pAdvertUpdateTypeEnum.sell);
    });

    test('Deactivate Advert Test', () async {
      final advert_info.P2pAdvertInfoResponse advert =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
        const P2pAdvertInfoRequest(id: '25'),
      );

      final advert_update.P2pAdvertUpdateResponse advertResponse =
          await advert.deactivate();

      // advertResponse = advert_update.P2pAdvertUpdateResponse(
      //     p2pAdvertUpdate:
      //         advertResponse.p2pAdvertUpdate.copyWith(isActive: false));

      final advert_update.P2pAdvertUpdate deactivatedAdvert =
          advertResponse.p2pAdvertUpdate!;

      expect(deactivatedAdvert.accountCurrency, 'USD');

      expect(deactivatedAdvert.advertiserDetails?.id, '3');
      expect(deactivatedAdvert.advertiserDetails?.name, 'za advertiser 1010');

      expect(deactivatedAdvert.amount, 100);
      expect(deactivatedAdvert.amountDisplay, '100.00');
      expect(
        deactivatedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(deactivatedAdvert.counterpartyType,
          advert_update.CounterpartyTypeEnum.buy);
      expect(deactivatedAdvert.country, 'za');
      expect(deactivatedAdvert.createdTime, getDateTime(1589279547));
      expect(deactivatedAdvert.description, 'advert information');
      expect(deactivatedAdvert.id, '25');
      expect(deactivatedAdvert.isActive, false);
      expect(deactivatedAdvert.localCurrency, 'ZAR');
      expect(deactivatedAdvert.maxOrderAmount, 50);
      expect(deactivatedAdvert.maxOrderAmountDisplay, '50.00');
      expect(deactivatedAdvert.minOrderAmount, 20);
      expect(deactivatedAdvert.minOrderAmountDisplay, '20.00');
      expect(deactivatedAdvert.paymentInfo, 'it is a sell order');
      expect(deactivatedAdvert.paymentMethod, 'bank_transfer');
      expect(deactivatedAdvert.price, 2.3);
      expect(deactivatedAdvert.priceDisplay, '2.30');
      expect(deactivatedAdvert.rate, 2.7);
      expect(deactivatedAdvert.rateDisplay, '2.70');
      expect(deactivatedAdvert.remainingAmount, 50);
      expect(deactivatedAdvert.remainingAmountDisplay, '50.00');
      expect(
          deactivatedAdvert.type, advert_update.P2pAdvertUpdateTypeEnum.sell);
    });

    test('Delete Advert Test', () async {
      final advert_info.P2pAdvertInfoResponse advert =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
        const P2pAdvertInfoRequest(id: '25'),
      );

      final advert_update.P2pAdvertUpdateResponse deletedAdvertResponse =
          await advert.delete();

      final advert_update.P2pAdvertUpdate deletedAdvert =
          deletedAdvertResponse.p2pAdvertUpdate!;

      expect(deletedAdvert.accountCurrency, 'USD');

      expect(deletedAdvert.advertiserDetails?.id, '3');
      expect(deletedAdvert.advertiserDetails?.name, 'za advertiser 1010');

      expect(deletedAdvert.amount, 100);
      expect(deletedAdvert.amountDisplay, '100.00');
      expect(
        deletedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(deletedAdvert.counterpartyType,
          advert_update.CounterpartyTypeEnum.buy);
      expect(deletedAdvert.country, 'za');
      expect(deletedAdvert.createdTime, getDateTime(1589279547));
      expect(deletedAdvert.description, 'advert information');
      expect(deletedAdvert.id, '25');
      // expect(deletedAdvert.isActive, true); // since we are returning static response json for `P2pAdvertUpdate`, we can't get updated value for isActive.(and any other field)
      expect(deletedAdvert.localCurrency, 'ZAR');
      expect(deletedAdvert.maxOrderAmount, 50);
      expect(deletedAdvert.maxOrderAmountDisplay, '50.00');
      expect(deletedAdvert.minOrderAmount, 20);
      expect(deletedAdvert.minOrderAmountDisplay, '20.00');
      expect(deletedAdvert.paymentInfo, 'it is a sell order');
      expect(deletedAdvert.paymentMethod, 'bank_transfer');
      expect(deletedAdvert.price, 2.3);
      expect(deletedAdvert.priceDisplay, '2.30');
      expect(deletedAdvert.rate, 2.7);
      expect(deletedAdvert.rateDisplay, '2.70');
      expect(deletedAdvert.remainingAmount, 50);
      expect(deletedAdvert.remainingAmountDisplay, '50.00');
      expect(deletedAdvert.type, advert_update.P2pAdvertUpdateTypeEnum.sell);
    });

    test('Create Order From Advert Test', () async {
      final advert_info.P2pAdvertInfoResponse advert =
          await advert_info.P2pAdvertInfoResponse.fetchAdvert(
        const P2pAdvertInfoRequest(id: '2'),
      );

      final order_create.P2pOrderCreateResponse orderResponse =
          await advert.createOrder(amount: 50);

      final order_create.P2pOrderCreate order = orderResponse.p2pOrderCreate!;

      expect(order.accountCurrency, 'USD');
      expect(order.amount, 50.0);
      expect(order.amountDisplay, '50.00');
      expect(order.contactInfo, 'Please contact via whatsapp 1234');
      expect(order.createdTime, getDateTime(1589688096));
      expect(order.expiryTime, getDateTime(1589695296));
      expect(order.id, '107');
      expect(order.isIncoming, false);
      expect(order.localCurrency, 'ZAR');
      expect(order.paymentInfo, 'Transfer to account 000-1111');
      expect(order.price, 675000.0);
      expect(order.priceDisplay, '675000.00');
      expect(order.rate, 13500.0);
      expect(order.rateDisplay, '13500.00');
      expect(order.status, order_create.StatusEnum.pending);
      expect(order.type, order_create.TypeEnum.buy);

      final order_create.AdvertiserDetails advertiser = order.advertiserDetails;

      expect(advertiser.id, '2');
      expect(advertiser.name, 'advertiser CR90000018');
    });
  });
}
