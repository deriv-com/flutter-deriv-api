import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/api_token/api_token.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('api token group ->', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('create', () async {
      final APIToken apiToken = await APIToken.create(
        name: 'sample token',
        scopes: <TokenScope>[
          TokenScope.read,
          TokenScope.tradingInformation,
        ],
        validForCurrentIPOnly: false,
      );

      expect(apiToken.newToken, true);

      expect(apiToken.tokens.length, 1);

      expect(apiToken.tokens.first.displayName, 'sample token');
      expect(apiToken.tokens.first.lastUsed, DateTime.parse('2020-01-11'));

      expect(apiToken.tokens.first.scopes.length, 2);

      expect(apiToken.tokens.first.scopes.first, TokenScope.read);
      expect(apiToken.tokens.first.scopes[1], TokenScope.tradingInformation);

      expect(apiToken.tokens.first.token, 'thisIsASampleTOKEN123');
      expect(apiToken.tokens.first.validForIp, '178.32.12.45');
    });

    test('delete', () async {
      final APIToken apiToken =
          await APIToken.delete(token: 'thisIsASampleTOKEN123');

      expect(apiToken.deleteToken, true);

      expect(apiToken.tokens.length, 1);

      expect(apiToken.tokens.first.displayName, 'sample token');
      expect(apiToken.tokens.first.lastUsed, DateTime.parse('2020-01-11'));

      expect(apiToken.tokens.first.scopes.length, 2);

      expect(apiToken.tokens.first.scopes.first, TokenScope.read);
      expect(apiToken.tokens.first.scopes[1], TokenScope.tradingInformation);

      expect(apiToken.tokens.first.token, 'thisIsASampleTOKEN123');
      expect(apiToken.tokens.first.validForIp, '178.32.12.45');
    });
  });
}
