import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/app_delete.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('app delete test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppDelete appDelete = await AppDelete.deleteApplication(
      request: const AppDeleteRequest(appDelete: 1234),
    );

    expect(appDelete.succeeded, true);
  });
}
