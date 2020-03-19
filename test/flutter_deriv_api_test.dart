import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_send.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/website_status_receive.dart';
import 'package:flutter_deriv_api/api/website_status_send.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/flutter_deriv_api.dart';
import 'package:preferences/preferences.dart';

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

  test('Base classes usage in deriv connection', () async {
    final BinaryAPI api = BinaryAPI();
    await api.run();
    final AuthorizeResponse response = await api.call(
        'authorize', AuthorizeRequest(authorize: 'LO7lmvEDYYbGomo'));

    print('Test result: authorize: ${response.authorize}');

    final P2pOrderListResponse orderListResponse = await api.call(
        'p2p_order_list', P2pOrderListRequest(offset: 0, limit: 10));

    print(
        'Test result: orderList length: ${orderListResponse.p2pOrderList.length}');

    final P2pAdvertListResponse advertListResponse =
        await api.call('p2p_advert_list', P2pAdvertListRequest());

    print(
        'Test result: advertList length: ${advertListResponse.p2pAdvertList.length}');

    api
        .subscribe('p2p_order_list', P2pOrderListRequest())
        .listen((Response orderList) {
      print('');
    });

    final P2pOrderInfoResponse orderInfoResponse = await api.call(
      'p2p_order_info',
      P2pOrderInfoRequest(id: orderListResponse.p2pOrderList['list'][0]['id']),
    );

    print('Test result: Order info: ${orderInfoResponse.p2pOrderInfo}');

    final WebsiteStatusResponse websiteStatusResponse =
        await api.call('website_status', WebsiteStatusRequest());
    print('Test result: Website status: ${websiteStatusResponse.websiteStatus}');

    await Future<void>.delayed(const Duration(seconds: 2));
  });
}
