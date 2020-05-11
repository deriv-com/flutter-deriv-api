import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/new_account/new_account_virtual.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('new account virtual', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final NewAccountVirtual newAccountVirtual =
        await NewAccountVirtual.openNewVirtualAccount(
      const NewAccountVirtualRequest(
        newAccountVirtual: 1,
        clientPassword: 'Abc123de',
        residence: 'id',
        verificationCode: 'uoJvVuQ6',
      ),
    );

    expect(newAccountVirtual.balance, 250.0);
    expect(newAccountVirtual.clientId, 'VRTC0000');
    expect(newAccountVirtual.currency, 'USD');
    expect(newAccountVirtual.email, 'test@email.com');
    expect(newAccountVirtual.oauthToken, 'sample_token');
  });
}
