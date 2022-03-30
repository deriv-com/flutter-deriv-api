import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/reality_check/reality_check.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Reality Check Test', () async {
    final RealityCheck realityCheck = await RealityCheck.check();

    expect(realityCheck.buyAmount, 200.0);
    expect(realityCheck.buyCount, 7);
    expect(realityCheck.currency, 'USD');
    expect(realityCheck.loginId, 'CR90000002');
    expect(realityCheck.openContractCount, 2);
    expect(realityCheck.potentialProfit, 85.5);
    expect(realityCheck.sellAmount, 150.0);
    expect(realityCheck.sellCount, 6);
    expect(realityCheck.startTime, getDateTime(1587544006));
  });
}
