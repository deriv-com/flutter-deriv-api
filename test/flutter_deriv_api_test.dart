import 'package:flutter/services.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/deriv_connection/deriv_connection_bloc.dart';
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


  group('deriv connection test', () {
    test('connection bloc', () async{

      final DerivConnectionBloc connectionBloc = DerivConnectionBloc();

      connectionBloc.listen((DerivConnectionState connectionState) async{

        if (connectionState is Connected) {
          print('connected');
          final AuthorizeResponse authorizeResponse = await connectionState.api.authorize('token') ;
        }

      });
    });
  });
}
