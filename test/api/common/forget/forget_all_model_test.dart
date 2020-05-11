import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('forget all', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

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
}
