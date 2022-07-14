import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/self_exclusion/self_exclusion.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('Self Exclusive Group ->', () {
    test('Fetch Self Exclusive Test', () async {
      final SelfExclusion selfExclusive =
          await SelfExclusion.fetchSelfExclusion();

      expect(selfExclusive.excludeUntil, DateTime.tryParse('2020-01-01'));
      expect(selfExclusive.max30dayDeposit, 700000);
      expect(selfExclusive.max30dayLosses, 100000);
      expect(selfExclusive.max30dayTurnover, 1000);
      expect(selfExclusive.max7dayDeposit, 700000);
      expect(selfExclusive.max7dayLosses, 100000);
      expect(selfExclusive.max7dayTurnover, 1000);
      expect(selfExclusive.maxBalance, 100000);
      expect(selfExclusive.maxDeposit, 1000);
      expect(selfExclusive.maxLosses, 100000);
      expect(selfExclusive.maxOpenBets, 1000);
      expect(selfExclusive.maxTurnover, 1000);
      expect(selfExclusive.sessionDurationLimit, 3600);
      expect(selfExclusive.timeoutUntil, getDateTime(1497357184));
    });

    test('Set Self Exclusive Test', () async {
      final bool? setSelfExclusion = await SelfExclusion.setSelfExclusion(
        const SetSelfExclusionRequest(
          excludeUntil: '2020-01-01',
          max30dayDeposit: 700000,
          max30dayLosses: 100000,
          max30dayTurnover: 1000,
          max7dayDeposit: 700000,
          max7dayLosses: 100000,
          max7dayTurnover: 1000,
          maxDeposit: 1000,
          maxLosses: 100000,
          maxTurnover: 1000,
          sessionDurationLimit: 3600,
          timeoutUntil: 1497357184,
        ),
      );

      expect(setSelfExclusion, true);
    });

    test('Exclude Self Exclusion Instance Test', () async {
      final bool? setSelfExclusion = await SelfExclusion(
        excludeUntil: DateTime.tryParse('2020-01-01'),
        max30dayDeposit: 700000,
        max30dayLosses: 100000,
        max30dayTurnover: 1000,
        max7dayDeposit: 700000,
        max7dayLosses: 100000,
        max7dayTurnover: 1000,
        maxDeposit: 1000,
        maxLosses: 100000,
        maxTurnover: 1000,
        sessionDurationLimit: 3600,
        timeoutUntil: DateTime.tryParse('2020-01-02'),
      ).exclude();

      expect(setSelfExclusion, true);
    });
  });
}
