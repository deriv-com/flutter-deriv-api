import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_cancel_response_result.dart'
    as order_cancel;
import 'package:flutter_deriv_api/api/response/p2p_order_confirm_response_result.dart'
    as order_confirm;
import 'package:flutter_deriv_api/api/response/p2p_order_create_response_result.dart'
    as order_create;
import 'package:flutter_deriv_api/api/response/p2p_order_info_response_extended.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_info_response_result.dart'
    as order_info;
import 'package:flutter_deriv_api/api/response/p2p_order_list_response_extended.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_list_response_result.dart'
    as order_list;
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_create_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_info_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('P2P Order Group ->', () {
    test('Create Order Test', () async {
      final order_create.P2pOrderCreateResponse orderResponse =
          await order_create.P2pOrderCreateResponse.create(
        const P2pOrderCreateRequest(
            advertId: '8', amount: 50.0, paymentMethodIds: <int>[]),
      );

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

      final order_create.AdvertDetails advert = order.advertDetails;
      expect(advert.description, 'Please contact via whatsapp 1234');
      expect(advert.id, '6');
      expect(advert.paymentMethod, 'bank_transfer');
      expect(advert.type, order_create.TypeEnum.sell);

      final order_create.AdvertiserDetails advertiser = order.advertiserDetails;
      expect(advertiser.id, '2');
      expect(advertiser.name, 'advertiser CR90000018');
    });

    test('Fetch Order List Test', () async {
      final order_list.P2pOrderListResponse orderList =
          await P2pOrderListResponseExtended.fetchOrderList();
      final order_list.ListItem firstOrder = orderList.p2pOrderList!.list.first;

      expect(firstOrder.accountCurrency, 'USD');
      expect(firstOrder.amount, 50.0);
      expect(firstOrder.amountDisplay, '50.00');
      expect(firstOrder.contactInfo, 'Please contact via whatsapp 1234');
      expect(firstOrder.createdTime, getDateTime(1589688096));
      expect(firstOrder.expiryTime, getDateTime(1589695296));
      expect(firstOrder.id, '107');
      expect(firstOrder.isIncoming, false);
      expect(firstOrder.localCurrency, 'ZAR');
      expect(firstOrder.paymentInfo, 'Transfer to account 000-1111');
      expect(firstOrder.price, 675000.0);
      expect(firstOrder.priceDisplay, '675000.00');
      expect(firstOrder.rate, 13500.0);
      expect(firstOrder.rateDisplay, '13500.00');
      expect(firstOrder.status, order_list.StatusEnum.pending);
      expect(firstOrder.type, order_list.TypeEnum.buy);

      final order_list.AdvertDetails advert = firstOrder.advertDetails;
      expect(advert.description, 'Please contact via whatsapp 1234');
      expect(advert.id, '6');
      expect(advert.paymentMethod, 'bank_transfer');
      expect(advert.type, order_list.TypeEnum.sell);

      final order_list.AdvertiserDetails advertiser =
          firstOrder.advertiserDetails;
      expect(advertiser.id, '2');
      expect(advertiser.name, 'advertiser CR90000018');
    });

    test('Fetch Order Information Test', () async {
      final order_info.P2pOrderInfoResponse orderResponse =
          await P2pOrderInfoResponseExtended.fetchOrder(
        const P2pOrderInfoRequest(id: '108'),
      );

      final order_info.P2pOrderInfo order = orderResponse.p2pOrderInfo!;

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
      expect(order.status, order_info.StatusEnum.pending);
      expect(order.type, order_info.TypeEnum.buy);

      final order_info.AdvertDetails advert = order.advertDetails;
      expect(advert.description, 'Please contact via whatsapp 1234');
      expect(advert.id, '6');
      expect(advert.paymentMethod, 'bank_transfer');
      expect(advert.type, order_info.TypeEnum.sell);

      final order_info.AdvertiserDetails advertiser = order.advertiserDetails;
      expect(advertiser.id, '2');
      expect(advertiser.name, 'advertiser CR90000018');
    });

    test('Order Confirm Test', () async {
      final order_info.P2pOrderInfoResponse order =
          await P2pOrderInfoResponseExtended.fetchOrder(
        const P2pOrderInfoRequest(id: '107'),
      );

      final order_confirm.P2pOrderConfirmResponse confirmedOrder =
          await P2pOrderInfoResponseExtended.cast(order).confirm();

      expect(confirmedOrder.p2pOrderConfirm?.status,
          order_confirm.StatusEnum.buyerConfirmed);
    });

    test('Cancel Order Test', () async {
      final order_info.P2pOrderInfoResponse order =
          await P2pOrderInfoResponseExtended.fetchOrder(
        const P2pOrderInfoRequest(id: '107'),
      );

      final order_cancel.P2pOrderCancelResponse cancelledOrder =
          await P2pOrderInfoResponseExtended.cast(order).cancel();

      expect(cancelledOrder.p2pOrderCancel?.status,
          order_cancel.StatusEnum.cancelled);
    });

    test('Create and Subscribe to Order Test', () {
      order_create.P2pOrderCreateResponse.createAndSubscribe(
          const P2pOrderCreateRequest(
        advertId: '8',
        amount: 50.0,
        paymentMethodIds: <int>[],
      )).listen(expectAsync1(
        (order_create.P2pOrderCreateResponse? orderResponse) {
          final order_create.P2pOrderCreate order =
              orderResponse!.p2pOrderCreate!;
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

          final order_create.AdvertDetails advert = order.advertDetails;
          expect(advert.description, 'Please contact via whatsapp 1234');
          expect(advert.id, '6');
          expect(advert.paymentMethod, 'bank_transfer');
          expect(advert.type, order_create.TypeEnum.sell);

          final order_create.AdvertiserDetails advertiser =
              order.advertiserDetails;
          expect(advertiser.id, '2');
          expect(advertiser.name, 'advertiser CR90000018');

          expect(
            orderResponse.subscription?.id,
            '857cfc96-1014-66ce-9c49-0a4dbd22857a',
          );
        },
      ));
    });

    test('Fetch Order List and Subscribe Test', () {
      P2pOrderListResponseExtended.subscribeOrderList().listen(expectAsync1(
        (order_list.P2pOrderListResponse? orderList) {
          final order_list.ListItem firstOrder =
              orderList!.p2pOrderList!.list.first;

          expect(firstOrder.accountCurrency, 'USD');
          expect(firstOrder.amount, 50.0);
          expect(firstOrder.amountDisplay, '50.00');
          expect(firstOrder.contactInfo, 'Please contact via whatsapp 1234');
          expect(firstOrder.createdTime, getDateTime(1589688096));
          expect(firstOrder.expiryTime, getDateTime(1589695296));
          expect(firstOrder.id, '107');
          expect(firstOrder.isIncoming, false);
          expect(firstOrder.localCurrency, 'ZAR');
          expect(firstOrder.paymentInfo, 'Transfer to account 000-1111');
          expect(firstOrder.price, 675000.0);
          expect(firstOrder.priceDisplay, '675000.00');
          expect(firstOrder.rate, 13500.0);
          expect(firstOrder.rateDisplay, '13500.00');
          expect(firstOrder.status, order_list.StatusEnum.pending);
          expect(firstOrder.type, order_list.TypeEnum.buy);

          final order_list.AdvertDetails advert = firstOrder.advertDetails;
          expect(advert.description, 'Please contact via whatsapp 1234');
          expect(advert.id, '6');
          expect(advert.paymentMethod, 'bank_transfer');
          expect(advert.type, order_list.TypeEnum.sell);

          final order_list.AdvertiserDetails advertiser =
              firstOrder.advertiserDetails;
          expect(advertiser.id, '2');
          expect(advertiser.name, 'advertiser CR90000018');

          expect(
            orderList.subscription?.id,
            '857cfc96-1014-66ce-9c49-0a4dbd22857a',
          );
        },
      ));
    });

    test('Order Info Subscription Test', () {
      P2pOrderInfoResponseExtended.subscribeOrder(
              const P2pOrderInfoRequest(id: '107'))
          .listen(expectAsync1(
        (order_info.P2pOrderInfoResponse? orderResponse) {
          final order_info.P2pOrderInfo order = orderResponse!.p2pOrderInfo!;
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
          expect(order.status, order_info.StatusEnum.pending);
          expect(order.type, order_info.TypeEnum.buy);

          final order_info.AdvertDetails advert = order.advertDetails;
          expect(advert.description, 'Please contact via whatsapp 1234');
          expect(advert.id, '6');
          expect(advert.paymentMethod, 'bank_transfer');
          expect(advert.type, order_info.TypeEnum.sell);

          final order_info.AdvertiserDetails advertiser =
              order.advertiserDetails;
          expect(advertiser.id, '2');
          expect(advertiser.name, 'advertiser CR90000018');

          expect(
            orderResponse.subscription?.id,
            '857cfc96-1014-66ce-9c49-0a4dbd22857a',
          );
        },
      ));
    });
  });
}
