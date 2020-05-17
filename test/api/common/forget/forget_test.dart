import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('forget', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final Forget forget = await Forget.forget(
      const ForgetRequest(forget: 'd1ee7d0d-3ca9-fbb4-720b-5312d487185b'),
    );

    expect(forget.succeeded, true);
  });
}
