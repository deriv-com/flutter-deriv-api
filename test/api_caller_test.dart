import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
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
    await DerivApi().init();

    final AuthorizeResponse authorizeResponse =
        await DerivApi().authorize('YOUR TOKEN');

    print('Test result: authorize: ${authorizeResponse.authorize}');

    final OrderList orderList = await OrderList.fetch();


    OrderList.fetchListUpdate().listen((OrderList orders) {
      print(orders);
    });

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
