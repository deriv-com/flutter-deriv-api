import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/ping_response_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Ping Test', () async {
    final PingResponse ping = await PingResponse.pingMethod();

    expect(ping.ping, PingEnum.pong);
  });
}
