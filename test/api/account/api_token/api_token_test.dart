import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/api_token_response_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('API Token Group ->', () {
    test('Create Token Test', () async {
      final ApiTokenResponse createAPIToken = await ApiTokenResponse.create(
        name: 'sample token',
        scopes: <ScopesItemEnum>[
          ScopesItemEnum.read,
          ScopesItemEnum.tradingInformation,
        ],
        validForCurrentIPOnly: false,
      );

      expect(createAPIToken.apiToken?.newToken, 1);

      expect(createAPIToken.apiToken?.tokens?.length, 1);

      expect(
          createAPIToken.apiToken?.tokens?.first.displayName, 'sample token');
      expect(
          createAPIToken.apiToken?.tokens?.first.lastUsed,
          // DateTime.tryParse('2020-01-11'),
          '2020-01-11');

      expect(createAPIToken.apiToken?.tokens?.first.scopes?.length, 2);

      expect(createAPIToken.apiToken?.tokens?.first.scopes?.first,
          ScopesItemEnum.read);
      expect(
        createAPIToken.apiToken?.tokens?.first.scopes?[1],
        ScopesItemEnum.tradingInformation,
      );

      expect(createAPIToken.apiToken?.tokens?.first.token,
          'thisIsASampleTOKEN123');
      expect(createAPIToken.apiToken?.tokens?.first.validForIp, '178.32.12.45');
    });

    test('Delete Token Test', () async {
      final ApiTokenResponse deleteAPIToken =
          await ApiTokenResponse.delete(token: 'thisIsASampleTOKEN123');

      expect(deleteAPIToken.apiToken?.deleteToken, 1);

      expect(deleteAPIToken.apiToken?.tokens?.length, 1);

      expect(
          deleteAPIToken.apiToken?.tokens?.first.displayName, 'sample token');
      expect(
          deleteAPIToken.apiToken?.tokens?.first.lastUsed,
          //DateTime.tryParse('2020-01-11'),
          '2020-01-11');

      expect(deleteAPIToken.apiToken?.tokens?.first.scopes?.length, 2);

      expect(deleteAPIToken.apiToken?.tokens?.first.scopes?.first,
          ScopesItemEnum.read);
      expect(
        deleteAPIToken.apiToken?.tokens?.first.scopes?[1],
        ScopesItemEnum.tradingInformation,
      );

      expect(deleteAPIToken.apiToken?.tokens?.first.token,
          'thisIsASampleTOKEN123');
      expect(deleteAPIToken.apiToken?.tokens?.first.validForIp, '178.32.12.45');
    });
  });
}
