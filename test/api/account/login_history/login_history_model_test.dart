import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/login_history/login_history.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'login_history_model_mock_data.dart';

void main() {
  test('login history json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(loginHistoryModelMockData);
    final LoginHistory loginHistory =
        LoginHistory.fromJson(mapData['login_history'][1]);

    expect(loginHistory.action, LoginAction.login);
    expect(loginHistory.environment,
        '27-Apr-20 10:42:12GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN');
    expect(loginHistory.status, true);
    expect(loginHistory.time, getDateTime(1587984133));
  });
}
