import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_details_model.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_advertiser_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/p2p_order.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('P2P Advert Group ->', () {
    test('Fetch Advert Information Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '21'));

      expect(advert.accountCurrency, 'USD');

      expect(advert.advertiserDetails!.id, '2');
      expect(advert.advertiserDetails!.name, 'za advertiser 1010');

      expect(advert.counterpartyType, TransactionType.sell);
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
      expect(advert.paymentMethod, PaymentMethod.bankTransfer);
      expect(advert.price, 2.3);
      expect(advert.priceDisplay, '2.30');
      expect(advert.rate, 2.3);
      expect(advert.rateDisplay, '2.30');
      expect(advert.type, TransactionType.buy);
    });

    test('Fetch Advert List Test', () async {
      final List<P2PAdvert?>? adverts = await P2PAdvert.fetchAdvertList(
        const P2pAdvertListRequest(counterpartyType: 'sell'),
      );

      final P2PAdvert firstAdvert = adverts!.first!;
      final P2PAdvertiserDetailsModel advertiserDetails =
          firstAdvert.advertiserDetails!;

      expect(adverts.length, 2);

      expect(firstAdvert.accountCurrency, 'USD');

      expect(firstAdvert.advertiserDetails!.id, '6');
      expect(
        advertiserDetails.name,
        'advertiser CR90000018',
      );

      expect(firstAdvert.counterpartyType, TransactionType.sell);
      expect(firstAdvert.country, 'za');
      expect(firstAdvert.createdTime, getDateTime(1589270475));
      expect(
        firstAdvert.description,
        'Please contact via whats app 1234',
      );
      expect(firstAdvert.id, '7');
      expect(firstAdvert.isActive, true);
      expect(firstAdvert.localCurrency, 'ZAR');
      expect(firstAdvert.maxOrderAmountLimit, 100);
      expect(firstAdvert.maxOrderAmountLimitDisplay, '100.00');
      expect(firstAdvert.minOrderAmountLimit, 10);
      expect(firstAdvert.minOrderAmountLimitDisplay, '10.00');
      expect(firstAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(firstAdvert.price, 14500);
      expect(firstAdvert.priceDisplay, '14500.00');
      expect(firstAdvert.rate, 14500);
      expect(firstAdvert.rateDisplay, '14500.00');
      expect(firstAdvert.type, TransactionType.buy);
    });

    test('Create Advert Test', () async {
      final P2PAdvert advert = await P2PAdvert.createAdvert(
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

      expect(advert.accountCurrency, 'USD');

      expect(advert.advertiserDetails!.id, '3');
      expect(advert.advertiserDetails!.name, 'za advertiser 1010');

      expect(advert.amount, 100);
      expect(advert.amountDisplay, '100.00');
      expect(advert.contactInfo, 'Please transfer to account number 1234');
      expect(advert.counterpartyType, TransactionType.buy);
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
      expect(advert.paymentMethod, PaymentMethod.bankTransfer);
      expect(advert.price, 2.3);
      expect(advert.priceDisplay, '2.30');
      expect(advert.rate, 2.7);
      expect(advert.rateDisplay, '2.70');
      expect(advert.remainingAmount, 50);
      expect(advert.remainingAmountDisplay, '50.00');
      expect(advert.type, TransactionType.sell);
    });

    test('Update Advert Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '25'));
      final P2PAdvert updatedAdvert =
          (await advert.update(delete: false, isActive: false))
              .copyWith(isActive: false);

      expect(updatedAdvert.accountCurrency, 'USD');

      expect(updatedAdvert.advertiserDetails!.id, '3');
      expect(updatedAdvert.advertiserDetails!.name, 'za advertiser 1010');

      expect(updatedAdvert.amount, 100);
      expect(updatedAdvert.amountDisplay, '100.00');
      expect(
        updatedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(updatedAdvert.counterpartyType, TransactionType.buy);
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
      expect(updatedAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(updatedAdvert.price, 2.3);
      expect(updatedAdvert.priceDisplay, '2.30');
      expect(updatedAdvert.rate, 2.7);
      expect(updatedAdvert.rateDisplay, '2.70');
      expect(updatedAdvert.remainingAmount, 50);
      expect(updatedAdvert.remainingAmountDisplay, '50.00');
      expect(updatedAdvert.type, TransactionType.sell);
    });

    test('Activate Advert Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '21'));
      final P2PAdvert activatedAdvert =
          (await advert.activate()).copyWith(isActive: true);

      expect(activatedAdvert.accountCurrency, 'USD');

      expect(activatedAdvert.advertiserDetails!.id, '2');
      expect(activatedAdvert.advertiserDetails!.name, 'za advertiser 1010');

      expect(activatedAdvert.counterpartyType, TransactionType.sell);
      expect(activatedAdvert.country, 'za');
      expect(activatedAdvert.createdTime, getDateTime(1589279547));
      expect(
        activatedAdvert.description,
        'Please transfer to account number 1234',
      );
      expect(activatedAdvert.id, '21');
      expect(activatedAdvert.isActive, true);
      expect(activatedAdvert.localCurrency, 'ZAR');
      expect(activatedAdvert.maxOrderAmountLimit, 15);
      expect(activatedAdvert.maxOrderAmountLimitDisplay, '15.00');
      expect(activatedAdvert.minOrderAmountLimit, 3);
      expect(activatedAdvert.minOrderAmountLimitDisplay, '3.00');
      expect(activatedAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(activatedAdvert.price, 2.3);
      expect(activatedAdvert.priceDisplay, '2.30');
      expect(activatedAdvert.rate, 2.3);
      expect(activatedAdvert.rateDisplay, '2.30');
      expect(activatedAdvert.type, TransactionType.buy);
    });

    test('Deactivate Advert Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '25'));
      final P2PAdvert deactivatedAdvert =
          (await advert.deactivate()).copyWith(isActive: false);

      expect(deactivatedAdvert.accountCurrency, 'USD');

      expect(deactivatedAdvert.advertiserDetails!.id, '3');
      expect(deactivatedAdvert.advertiserDetails!.name, 'za advertiser 1010');

      expect(deactivatedAdvert.amount, 100);
      expect(deactivatedAdvert.amountDisplay, '100.00');
      expect(
        deactivatedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(deactivatedAdvert.counterpartyType, TransactionType.buy);
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
      expect(deactivatedAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(deactivatedAdvert.price, 2.3);
      expect(deactivatedAdvert.priceDisplay, '2.30');
      expect(deactivatedAdvert.rate, 2.7);
      expect(deactivatedAdvert.rateDisplay, '2.70');
      expect(deactivatedAdvert.remainingAmount, 50);
      expect(deactivatedAdvert.remainingAmountDisplay, '50.00');
      expect(deactivatedAdvert.type, TransactionType.sell);
    });

    test('Delete Advert Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '25'));
      final P2PAdvert deletedAdvert = await advert.delete();

      expect(deletedAdvert.accountCurrency, 'USD');

      expect(deletedAdvert.advertiserDetails!.id, '3');
      expect(deletedAdvert.advertiserDetails!.name, 'za advertiser 1010');

      expect(deletedAdvert.amount, 100);
      expect(deletedAdvert.amountDisplay, '100.00');
      expect(
        deletedAdvert.contactInfo,
        'Please transfer to account number 1234',
      );
      expect(deletedAdvert.counterpartyType, TransactionType.buy);
      expect(deletedAdvert.country, 'za');
      expect(deletedAdvert.createdTime, getDateTime(1589279547));
      expect(deletedAdvert.description, 'advert information');
      expect(deletedAdvert.id, '25');
      expect(deletedAdvert.isActive, true);
      expect(deletedAdvert.localCurrency, 'ZAR');
      expect(deletedAdvert.maxOrderAmount, 50);
      expect(deletedAdvert.maxOrderAmountDisplay, '50.00');
      expect(deletedAdvert.minOrderAmount, 20);
      expect(deletedAdvert.minOrderAmountDisplay, '20.00');
      expect(deletedAdvert.paymentInfo, 'it is a sell order');
      expect(deletedAdvert.paymentMethod, PaymentMethod.bankTransfer);
      expect(deletedAdvert.price, 2.3);
      expect(deletedAdvert.priceDisplay, '2.30');
      expect(deletedAdvert.rate, 2.7);
      expect(deletedAdvert.rateDisplay, '2.70');
      expect(deletedAdvert.remainingAmount, 50);
      expect(deletedAdvert.remainingAmountDisplay, '50.00');
      expect(deletedAdvert.type, TransactionType.sell);
    });

    test('Create Order From Advert Test', () async {
      final P2PAdvert advert =
          await P2PAdvert.fetchAdvert(const P2pAdvertInfoRequest(id: '2'));
      final P2POrder order = await advert.createOrder(
        amount: 50,
        paymentInfo: '',
        contactInfo: '',
        paymentMethodIds: <int>[],
      );

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
      expect(order.status, OrderStatusType.pending);
      expect(order.type, OrderType.buy);

      final P2PAdvertiserModel? advertiser = order.advertiserDetails;

      expect(advertiser!.id, '2');
      expect(advertiser.name, 'advertiser CR90000018');
    });
  });
}
