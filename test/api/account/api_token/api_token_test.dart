import 'package:flutter_deriv_api/api/account/models/token_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/api_token/api_token.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

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

      final List<TokenModel?> tokens = createAPIToken.tokens!;
      final TokenModel firstToken = tokens.first!;
      final List<TokenScope?> scopes = firstToken.scopes!;

      expect(createAPIToken.newToken, true);
      
      expect(tokens.length, 1);
      expect(firstToken.displayName, 'sample token');
      expect(
        firstToken.lastUsed,
        DateTime.tryParse('2020-01-11'),
      );

      expect(scopes.length, 2);
      expect(scopes.first, TokenScope.read);
      expect(
        scopes[1],
        TokenScope.tradingInformation,
      );

      expect(firstToken.token, 'thisIsASampleTOKEN123');
      expect(firstToken.validForIp, '178.32.12.45');
    });

    test('Delete Token Test', () async {
      final APIToken deleteAPIToken =
          await APIToken.delete(token: 'thisIsASampleTOKEN123');
      final TokenModel token = deleteAPIToken.tokens!.first!;
      final List<TokenScope?> scopes = token.scopes!;

      expect(deleteAPIToken.deleteToken, true);

      expect(deleteAPIToken.tokens!.length, 1);

      expect(token.displayName, 'sample token');
      expect(
        token.lastUsed,
        DateTime.tryParse('2020-01-11'),
      );

      expect(scopes.length, 2);

      expect(scopes.first, TokenScope.read);
      expect(
        scopes[1],
        TokenScope.tradingInformation,
      );

      expect(token.token, 'thisIsASampleTOKEN123');
      expect(token.validForIp, '178.32.12.45');
    });
  });
}
