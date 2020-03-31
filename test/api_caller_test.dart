import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_info_send.dart';
import 'package:flutter_deriv_api/models/advertiser/advertiser.dart';
import 'package:flutter_deriv_api/models/advertiser/advertiser_caller.dart';
import 'package:flutter_deriv_api/models/order/order.dart';
import 'package:flutter_deriv_api/models/order/order_list/order_list.dart';
import 'package:flutter_deriv_api/services/deriv_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/flutter_deriv_api.dart';
import 'package:preferences/preference_service.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_deriv_api');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async => '42');
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterDerivApi.platformVersion, '42');
  });

  test('Test APi caller', () async {
    await DerivApi().init(appId: '1015');

    final AuthorizeResponse authorizeResponse =
        await DerivApi().authorize('YOUR TOKEN');

    print('Test result: authorize: ${authorizeResponse.authorize}');

    if (authorizeResponse.authorize == null) {
      return;
    }

    final OrderList orderList = await OrderList.fetch();

    if (orderList.orders.isNotEmpty) {
      print('Number of orders: ${orderList.orders.length}');
      final Order order = await Order.fetch(orderList.orders.first.id);
      print('Order info: ${order.id}, ${order.status} ');
    }

    OrderList.fetchListUpdate().listen((OrderList orders) {
      print(orders);
    });

    final AdvertiserCaller advertiserCaller = AdvertiserCaller();
    final Advertiser advertiser =
        await advertiserCaller.modelCall(P2pAdvertiserInfoRequest(id: '1'));

    print('Advertiser: ${advertiser.name}  id: ${advertiser.id}');

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
