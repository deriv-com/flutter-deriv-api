import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_token/api_token.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

import 'api_token_model_mock_data.dart';

void main() {
  test('api token json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(apiTokenModelMockData);
    final APIToken apiToken = APIToken.fromJson(mapData['api_token']);

    expect(apiToken.newToken, true);

    expect(apiToken.tokens.length, 1);

    expect(apiToken.tokens[0].displayName, 'sample_token');
    expect(apiToken.tokens[0].lastUsed, DateTime.parse('2020-01-11'));

    expect(apiToken.tokens[0].scopes.length, 2);

    expect(apiToken.tokens[0].scopes[0], TokenScope.read);
    expect(apiToken.tokens[0].scopes[1], TokenScope.tradingInformation);

    expect(apiToken.tokens[0].token, 'thisIsASampleTOKEN123');
    expect(apiToken.tokens[0].validForIp, '178.32.12.45');
  });
}
