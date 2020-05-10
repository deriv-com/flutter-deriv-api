import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/app/application.dart';
import 'package:flutter_deriv_api/api/application/models/app_delete_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_send.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('app delete', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final AppDeleteModel appDelete = await Application.deleteApplication(
      request: const AppDeleteRequest(appDelete: 1234),
    );

    expect(appDelete.succeeded, true);
  });
}
