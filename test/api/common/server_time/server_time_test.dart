import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/server_time/server_time.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Server Time Test', () async {
    final ServerTime serverTime = await ServerTime.fetchTime();

    expect(serverTime.time, getDateTime(1587544006));
  });
}
