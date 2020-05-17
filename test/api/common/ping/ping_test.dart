import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('ping', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final Ping ping = await Ping.ping();

    expect(ping.succeeded, true);
  });
}
