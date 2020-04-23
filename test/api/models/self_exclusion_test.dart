import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/self_exclusion/self_exclusion.dart';

import 'self_exclusion_mock_data.dart';

void main() {
  test('self exclusive json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(selfExclusiveMockData);
    final SelfExclusion selfExclusive = SelfExclusion.fromJson(mapData);

    expect(selfExclusive.excludeUntil, DateTime.parse('2020-01-01'));
    expect(selfExclusive.max30dayLosses, 100000);
    expect(selfExclusive.max30dayTurnover, 1000);
    expect(selfExclusive.max7dayLosses, 100000);
    expect(selfExclusive.max7dayTurnover, 1000);
    expect(selfExclusive.maxBalance, 100000);
    expect(selfExclusive.maxDeposit, 1000);
    expect(selfExclusive.maxDepositEndDate, DateTime.parse('2020-02-01'));
    expect(selfExclusive.maxLosses, 100000);
    expect(selfExclusive.maxOpenBets, 1000);
    expect(selfExclusive.maxTurnover, 1000);
    expect(selfExclusive.sessionDurationLimit, 3600);
    expect(selfExclusive.timeoutUntil, getDateTime(1497357184));
  });
}
