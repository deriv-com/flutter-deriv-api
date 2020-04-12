import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/active_symbols_receive.dart';
import 'package:flutter_deriv_api/api/active_symbols_send.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/balance_receive.dart';
import 'package:flutter_deriv_api/api/balance_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_send.dart';
import 'package:flutter_deriv_api/api/ping_receive.dart';
import 'package:flutter_deriv_api/api/ping_send.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/website_status_receive.dart';
import 'package:flutter_deriv_api/api/website_status_send.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';
import 'package:flutter_deriv_api/flutter_deriv_api.dart';

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
    final AuthorizeResponse authorizeResponse =
        await api.call(const AuthorizeRequest(authorize: 'YOU TOKEN'));

    print('Test result: authorize: ${authorizeResponse.authorize}');

    if (authorizeResponse.authorize == null) {
      return;
    }

    final P2pOrderListResponse orderListResponse =
        await api.call(const P2pOrderListRequest(offset: 0, limit: 10));

    print(
        'Test result: orderList length: ${orderListResponse.p2pOrderList['list'].length}');

    if (orderListResponse?.p2pOrderList?.isNotEmpty ?? false) {
      final List<dynamic> orders = orderListResponse.p2pOrderList['list'];
      if (orders?.isNotEmpty ?? false) {
        final P2pOrderInfoResponse orderInfoResponse = await api.call(
          P2pOrderInfoRequest(
            id: orderListResponse.p2pOrderList['list'][0]['id'],
          ),
        );
        print('Test result: Order info: ${orderInfoResponse.p2pOrderInfo}');
      }
    }

    final P2pAdvertListResponse advertListResponse =
        await api.call(const P2pAdvertListRequest());

    print(
        'Test result: advertList length: ${advertListResponse.p2pAdvertList['list'].length}');

    final WebsiteStatusResponse websiteStatusResponse =
        await api.call(const WebsiteStatusRequest());
    print(
        'Test result: Website status: ${websiteStatusResponse.websiteStatus}');

    final ActiveSymbolsResponse activeSymbolsResponse =
        await api.call(const ActiveSymbolsRequest(activeSymbols: 'brief'));
    print(
        'Test result: ActiveSymbolsRequest: ${activeSymbolsResponse.activeSymbols}');

    final PingResponse pingResponse = await api.call(const PingRequest());
    print('Test result: PingResponse: ${pingResponse.ping}');

    api.subscription(const BalanceRequest()).listen((Response response) {
      final BalanceResponse balanceResponse = response;
      print('balance: ${balanceResponse.balance}');
    });

    api.subscription(const P2pOrderListRequest()).listen((Response response) {
      final P2pOrderListResponse orderListResponse = response;
      print('p2pOrderList: ${orderListResponse.p2pOrderList}');
    });

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
