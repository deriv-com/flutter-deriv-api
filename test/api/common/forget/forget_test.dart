import 'package:flutter_deriv_api/basic_api/generated/forget_all_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Forget Group ->', () {
    test('Forget Test', () async {
      final ForgetResponse forget = await ForgetResponse.forgetMethod(
        const ForgetRequest(forget: 'd1ee7d0d-3ca9-fbb4-720b-5312d487185b'),
      );

      expect(forget.forget, true);
    });

    test('Forget All Test', () async {
      final ForgetAllResponse forgetAll =
          await ForgetAllResponse.forgetAllMethod(
              const ForgetAllRequest(forgetAll: <String>['tick', 'p2p_order']));

      expect(forgetAll.forgetAll?.length, 2);

      expect(
        forgetAll.forgetAll?.first,
        'ea8d3223-9922-5552-4309-6a1e97522f05',
      );
      expect(
        forgetAll.forgetAll?[1],
        'ea8d3288-9922-5552-4309-6a1e97522f21',
      );
    });
  });
}
