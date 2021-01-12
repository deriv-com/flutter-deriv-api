import 'package:flutter_deriv_api/api/response/ping_receive_result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Ping Test', () async {
    final PingResponse ping = await PingResponse.pingMethod();

    expect(ping.ping, PingEnum.pong);
  });
}
