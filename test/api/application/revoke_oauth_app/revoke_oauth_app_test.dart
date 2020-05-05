import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/revoke_oauth_app/revoke_oauth_app.dart';

import 'revoke_oauth_app_mock_date.dart';

void main() {
  test('revoke oauth app json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(revokeOauthAppMockData);
    final RevokeOauthApp revokeOauthApp = RevokeOauthApp.fromJson(mapData);

    expect(revokeOauthApp.succeeded, true);
  });
}
