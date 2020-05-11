import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/revoke_oauth_app/revoke_oauth_app.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('revoke oauth app test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final RevokeOauthApp revokeOauthApp =
        await RevokeOauthApp.revokeOauthApplication(
      request: const RevokeOauthAppRequest(
        revokeOauthApp: 1,
      ),
    );

    expect(revokeOauthApp.succeeded, true);
  });
}
