/// P2P  advertiser stats response
const String p2pAdvertiserStatsResponse = '''
{
  "echo_req": {
    "p2p_advertiser_stats": 1
  },
  "msg_type": "p2p_advertiser_stats",
  "p2p_advertiser_stats": {
    "buy_orders_count": 5,
    "cancel_time_avg": 100,
    "completion_rate": 50.0,
    "release_time_avg": 150,
    "sell_orders_count": 15,
    "total_orders_count": 12
  }
}
''';
