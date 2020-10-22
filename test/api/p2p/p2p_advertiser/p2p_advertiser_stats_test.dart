import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser_stats.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('P2P Advertiser Stats Group ->', () {
    test('Fetch Advertiser Stats Test', () async {
      final P2PAdvertiserStats advertiserStats =
          await P2PAdvertiserStats.fetchAdvertiserStats(
        const P2pAdvertiserStatsRequest(),
      );

      expect(advertiserStats.buyOrdersCount, 5);
      expect(advertiserStats.cancelTimeAvg, 100);
      expect(advertiserStats.completionRate, 50.0);
      expect(advertiserStats.releaseTimeAvg, 150);
      expect(advertiserStats.sellOrdersCount, 15);
      expect(advertiserStats.totalOrdersCount, 12);
    });
  });
}
