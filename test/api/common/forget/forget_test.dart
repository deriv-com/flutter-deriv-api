import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Forget Group ->', () {
    test('Forget Test', () async {
      final Forget forget = await Forget.forget(
        const ForgetRequest(forget: 'd1ee7d0d-3ca9-fbb4-720b-5312d487185b'),
      );

      expect(forget.succeeded, true);
    });

    test('Forget All Test', () async {
      final ForgetAll forgetAll = await ForgetAll.forgetAll(
          const ForgetAllRequest(forgetAll: <String>['tick', 'p2p_order']));

      expect(forgetAll.cancelledStreams!.length, 2);

      final String firstCancelledStream = forgetAll.cancelledStreams!.first;
      final String secondCancelledStream = forgetAll.cancelledStreams![1];

      expect(
        firstCancelledStream,
        'ea8d3223-9922-5552-4309-6a1e97522f05',
      );
      expect(
        secondCancelledStream,
        'ea8d3288-9922-5552-4309-6a1e97522f21',
      );
    });
  });
}
