import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_send.dart';
import 'package:flutter_deriv_api/api/response.dart';
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
        'authorize', AuthorizeRequest(authorize: ''));

    final P2pOrderListResponse orderListResponse = await api.call(
        'p2p_order_list', P2pOrderListRequest(offset: 0, limit: 10));

    final P2pAdvertListResponse advertListResponse =
        await api.call('p2p_advert_list', P2pAdvertListRequest());

    api
        .subscribe('p2p_order_list', P2pOrderListRequest())
        .listen((Response orderList) {
      print('');
    });

    await Future<void>.delayed(const Duration(seconds: 2));

    print('');
  });
}
