import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  group('Forget Group ->', () {
    test('Forget Test', () async {
      final Forget forget = await Forget.forget(
        const ForgetRequest(forget: 'd1ee7d0d-3ca9-fbb4-720b-5312d487185b'),
      );

      expect(forget.succeeded, true);
    });

    test('Forget All Test', () async {
      final ForgetAll forgetAll =
          await ForgetAll.forgetAll(const ForgetAllRequest());

      expect(forgetAll.cancelledStreams.length, 2);

      expect(
        forgetAll.cancelledStreams[0],
        'ea8d3223-9922-5552-4309-6a1e97522f05',
      );
      expect(
        forgetAll.cancelledStreams[1],
        'ea8d3288-9922-5552-4309-6a1e97522f21',
      );
    });
  });
}
