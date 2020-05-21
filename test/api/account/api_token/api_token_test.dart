import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/api_token/api_token.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  group('API Token Group ->', () {
    test('Create Token Test', () async {
      final APIToken createAPIToken = await APIToken.create(
        name: 'sample token',
        scopes: <TokenScope>[
          TokenScope.read,
          TokenScope.tradingInformation,
        ],
        validForCurrentIPOnly: false,
      );

      expect(createAPIToken.newToken, true);

      expect(createAPIToken.tokens.length, 1);

      expect(createAPIToken.tokens.first.displayName, 'sample token');
      expect(
          createAPIToken.tokens.first.lastUsed, DateTime.parse('2020-01-11'));

      expect(createAPIToken.tokens.first.scopes.length, 2);

      expect(createAPIToken.tokens.first.scopes.first, TokenScope.read);
      expect(
          createAPIToken.tokens.first.scopes[1], TokenScope.tradingInformation);

      expect(createAPIToken.tokens.first.token, 'thisIsASampleTOKEN123');
      expect(createAPIToken.tokens.first.validForIp, '178.32.12.45');
    });

    test('Delete Token Test', () async {
      final APIToken deleteAPIToken =
          await APIToken.delete(token: 'thisIsASampleTOKEN123');

      expect(deleteAPIToken.deleteToken, true);

      expect(deleteAPIToken.tokens.length, 1);

      expect(deleteAPIToken.tokens.first.displayName, 'sample token');
      expect(
        deleteAPIToken.tokens.first.lastUsed,
        DateTime.parse('2020-01-11'),
      );

      expect(deleteAPIToken.tokens.first.scopes.length, 2);

      expect(deleteAPIToken.tokens.first.scopes.first, TokenScope.read);
      expect(
        deleteAPIToken.tokens.first.scopes[1],
        TokenScope.tradingInformation,
      );

      expect(deleteAPIToken.tokens.first.token, 'thisIsASampleTOKEN123');
      expect(deleteAPIToken.tokens.first.validForIp, '178.32.12.45');
    });
  });
}
