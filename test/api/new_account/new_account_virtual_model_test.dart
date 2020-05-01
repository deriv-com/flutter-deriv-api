import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/new_account/new_account_virtual.dart';

import 'new_account_virtual_model_mock_data.dart';

void main() {
  test('new account virtual json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(newAccountVirtualModelMockData);
    final NewAccountVirtual newAccountVirtual =
        NewAccountVirtual.fromJson(mapData['new_account_virtual']);

    expect(newAccountVirtual.balance, 250.0);
    expect(newAccountVirtual.clientId, 'VRTC0000');
    expect(newAccountVirtual.currency, 'USD');
    expect(newAccountVirtual.email, 'test@email.com');
    expect(newAccountVirtual.oauthToken, 'sample_token');
  });
}
