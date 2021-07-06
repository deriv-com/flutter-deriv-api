import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/api/response/reality_check_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Reality Check Test', () async {
    final RealityCheckResponse realityCheck =
        await RealityCheckResponse.check();

    expect(realityCheck.realityCheck?.buyAmount, 200.0);
    expect(realityCheck.realityCheck?.buyCount, 7);
    expect(realityCheck.realityCheck?.currency, 'USD');
    expect(realityCheck.realityCheck?.loginid, 'CR90000002');
    expect(realityCheck.realityCheck?.openContractCount, 2);
    expect(realityCheck.realityCheck?.potentialProfit, 85.5);
    expect(realityCheck.realityCheck?.sellAmount, 150.0);
    expect(realityCheck.realityCheck?.sellCount, 6);
    expect(realityCheck.realityCheck?.startTime, getDateTime(1587544006));
  });
}
