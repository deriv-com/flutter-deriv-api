import 'package:flutter/services.dart';
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
import 'package:flutter_deriv_api/api/ticks_history_receive.dart';
import 'package:flutter_deriv_api/api/ticks_history_send.dart';
import 'package:flutter_deriv_api/api/ticks_receive.dart';
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
    final AuthorizeResponse authorizeResponse =
        await api.call(AuthorizeRequest(authorize: 'YOU TOKEN'));

    print('Test result: authorize: ${authorizeResponse.authorize}');

    if (authorizeResponse.authorize == null) {
      return;
    }

    final P2pOrderListResponse orderListResponse =
        await api.call(P2pOrderListRequest(offset: 0, limit: 10));

    print(
        'Test result: orderList length: ${orderListResponse.p2pOrderList['list'].length}');

    final P2pAdvertListResponse advertListResponse =
        await api.call(P2pAdvertListRequest());

    print(
        'Test result: advertList length: ${advertListResponse.p2pAdvertList['list'].length}');

    final P2pOrderInfoResponse orderInfoResponse = await api.call(
      P2pOrderInfoRequest(id: orderListResponse.p2pOrderList['list'][0]['id']),
    );

    print('Test result: Order info: ${orderInfoResponse.p2pOrderInfo}');

    final WebsiteStatusResponse websiteStatusResponse =
        await api.call(WebsiteStatusRequest());
    print(
        'Test result: Website status: ${websiteStatusResponse.websiteStatus}');

    final ActiveSymbolsResponse activeSymbolsResponse =
        await api.call(ActiveSymbolsRequest(activeSymbols: 'brief'));
    print(
        'Test result: ActiveSymbolsRequest: ${activeSymbolsResponse.activeSymbols}');

    final PingResponse pingResponse = await api.call(PingRequest());
    print('Test result: PingResponse: ${pingResponse.ping}');

    api.subscribe(BalanceRequest()).listen((Response response) {
      final BalanceResponse balanceResponse = response;
      print('BALANCE: ${balanceResponse.balance}');
    });

    api.subscribe(P2pOrderListRequest()).listen((Response response) {
      final P2pOrderListResponse orderListResponse = response;
      print('ORDER_List: ${orderListResponse.p2pOrderList}');
    });

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
