import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/reality_check_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

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
