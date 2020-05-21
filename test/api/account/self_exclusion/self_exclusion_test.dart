import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/self_exclusion/self_exclusion.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  group('Self Exclusive Group ->', () {
    test('Fetch Self Exclusive Test', () async {
      final SelfExclusion selfExclusive =
          await SelfExclusion.fetchSelfExclusion();

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

    test('Set Self Exclusive Test', () async {
      final bool setSelfExclusion = await SelfExclusion.setSelfExclusion(
        const SetSelfExclusionRequest(
          excludeUntil: '2020-01-01',
          max30dayLosses: 100000,
          max30dayTurnover: 1000,
          max7dayLosses: 100000,
          max7dayTurnover: 1000,
          maxDeposit: 1000,
          maxDepositEndDate: '2020-01-01',
          maxLosses: 100000,
          maxTurnover: 1000,
          sessionDurationLimit: 3600,
          timeoutUntil: 1497357184,
        ),
      );

      expect(setSelfExclusion, true);
    });

    test('Exclude Self Exclusion Instance Test', () async {
      final bool setSelfExclusion = await SelfExclusion(
        excludeUntil: DateTime.parse('2020-01-01'),
        max30dayLosses: 100000,
        max30dayTurnover: 1000,
        max7dayLosses: 100000,
        max7dayTurnover: 1000,
        maxDeposit: 1000,
        maxDepositEndDate: DateTime.parse('2020-01-03'),
        maxLosses: 100000,
        maxTurnover: 1000,
        sessionDurationLimit: 3600,
        timeoutUntil: DateTime.parse('2020-01-02'),
      ).exclude();

      expect(setSelfExclusion, true);
    });
  });
}
