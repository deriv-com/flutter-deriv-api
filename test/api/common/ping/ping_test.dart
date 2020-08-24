import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/ping/ping.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Ping Test', () async {
    final Ping ping = await Ping.ping();

    expect(ping.succeeded, true);
  });
}
