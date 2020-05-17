import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/server_time/server_time.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  test('server time', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final ServerTime serverTime = await ServerTime.fetchTime();

    expect(serverTime.time, getDateTime(1587544006));
  });
}
