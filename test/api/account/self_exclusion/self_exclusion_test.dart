import 'package:flutter_deriv_api/api/response/get_self_exclusion_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_self_exclusion_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Self Exclusive Group ->', () {
    test('Fetch Self Exclusive Test', () async {
      final GetSelfExclusionResponse selfExclusive =
          await GetSelfExclusionResponse.fetchSelfExclusion();

      expect(selfExclusive.getSelfExclusion?.excludeUntil, '2020-01-01');
      expect(selfExclusive.getSelfExclusion?.max30dayDeposit, 700000);
      expect(selfExclusive.getSelfExclusion?.max30dayLosses, 100000);
      expect(selfExclusive.getSelfExclusion?.max30dayTurnover, 1000);
      expect(selfExclusive.getSelfExclusion?.max7dayDeposit, 700000);
      expect(selfExclusive.getSelfExclusion?.max7dayLosses, 100000);
      expect(selfExclusive.getSelfExclusion?.max7dayTurnover, 1000);
      expect(selfExclusive.getSelfExclusion?.maxBalance, 100000);
      expect(selfExclusive.getSelfExclusion?.maxDeposit, 1000);
      expect(selfExclusive.getSelfExclusion?.maxLosses, 100000);
      expect(selfExclusive.getSelfExclusion?.maxOpenBets, 1000);
      expect(selfExclusive.getSelfExclusion?.maxTurnover, 1000);
      expect(selfExclusive.getSelfExclusion?.sessionDurationLimit, 3600);
      expect(selfExclusive.getSelfExclusion?.timeoutUntil, getDateTime(1497357184));
    });

    test('Set Self Exclusive Test', () async {
      final bool? setSelfExclusion = await GetSelfExclusionResponse.setSelfExclusion(
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
      final bool? setSelfExclusion = await GetSelfExclusionResponse(
        // ignore: missing_required_param
        getSelfExclusion: GetSelfExclusion(
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
          timeoutUntil: DateTime.tryParse('2020-01-02'),
        ),
      ).exclude();

      expect(setSelfExclusion, true);
    });
  });
}
