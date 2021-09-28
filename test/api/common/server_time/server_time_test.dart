import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/time_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Server Time Test', () async {
    final TimeResponse serverTime = await TimeResponse.fetchTime();

    expect(serverTime.time, getDateTime(1587544006));
  });
}
