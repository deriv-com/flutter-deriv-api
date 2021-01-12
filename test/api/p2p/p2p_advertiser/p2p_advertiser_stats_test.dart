import 'package:flutter_deriv_api/api/response/p2p_advertiser_stats_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_stats_send.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('P2P Advertiser Stats Group ->', () {
    test('Fetch Advertiser Stats Test', () async {
      final P2pAdvertiserStatsResponse advertiserStats =
          await P2pAdvertiserStatsResponse.fetchAdvertiserStats(
        const P2pAdvertiserStatsSend(),
      );

      expect(advertiserStats.p2pAdvertiserStats.buyOrdersCount, 5);
      expect(advertiserStats.p2pAdvertiserStats.cancelTimeAvg, 100);
      expect(advertiserStats.p2pAdvertiserStats.totalCompletionRate, 50.0);
      expect(advertiserStats.p2pAdvertiserStats.releaseTimeAvg, 150);
      expect(advertiserStats.p2pAdvertiserStats.sellOrdersCount, 15);
      expect(advertiserStats.p2pAdvertiserStats.totalOrdersCount, 12);
    });
  });
}
