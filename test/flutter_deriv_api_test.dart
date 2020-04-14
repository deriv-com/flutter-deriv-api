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
import 'package:flutter_deriv_api/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/flutter_deriv_api.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_deriv_api');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => channel.setMockMethodCallHandler(
        (MethodCall methodCall) async => '42',
      ));

  tearDown(() => channel.setMockMethodCallHandler(null));

  test('getPlatformVersion',
      () async => expect(await FlutterDerivApi.platformVersion, '42'));

  test('Base classes usage in deriv connection', () async {
    final BasicBinaryAPI api = BasicBinaryAPI();
    await api.run();

    final AuthorizeResponse authorizeResponse = await api.call(
      request: const AuthorizeRequest(authorize: 'YOU TOKEN'),
    );

    print('Test result: authorize: ${authorizeResponse.authorize}');

    if (authorizeResponse.authorize == null) {
      return;
    }

    final P2pOrderListResponse orderListResponse = await api.call(
      request: const P2pOrderListRequest(offset: 0, limit: 10),
    );

    print(
      'Test result: orderList length: ${orderListResponse.p2pOrderList['list'].length}',
    );

    if (orderListResponse?.p2pOrderList?.isNotEmpty ?? false) {
      final List<dynamic> orders = orderListResponse.p2pOrderList['list'];

      if (orders?.isNotEmpty ?? false) {
        final P2pOrderInfoResponse orderInfoResponse = await api.call(
          request: P2pOrderInfoRequest(
            id: orderListResponse.p2pOrderList['list'][0]['id'],
          ),
        );

        print('Test result: Order info: ${orderInfoResponse.p2pOrderInfo}');
      }
    }

    final P2pAdvertListResponse advertListResponse =
        await api.call(request: const P2pAdvertListRequest());

    print(
      'Test result: advertList length: ${advertListResponse.p2pAdvertList['list'].length}',
    );

    final WebsiteStatusResponse websiteStatusResponse =
        await api.call(request: const WebsiteStatusRequest());
    print(
      'Test result: Website status: ${websiteStatusResponse.websiteStatus}',
    );

    final ActiveSymbolsResponse activeSymbolsResponse = await api.call(
        request: const ActiveSymbolsRequest(activeSymbols: 'brief'));
    print(
      'Test result: ActiveSymbolsRequest: ${activeSymbolsResponse.activeSymbols}',
    );

    final PingResponse pingResponse =
        await api.call(request: const PingRequest());

    print('Test result: PingResponse: ${pingResponse.ping}');

    api.subscribe(request: const BalanceRequest()).listen(
      (Response response) {
        final BalanceResponse balanceResponse = response;
        print('balance: ${balanceResponse.balance}');
      },
    );

    api.subscribe(request: const P2pOrderListRequest()).listen(
      (Response response) {
        final P2pOrderListResponse orderListResponse = response;
        print('p2pOrderList: ${orderListResponse.p2pOrderList}');
      },
    );

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
