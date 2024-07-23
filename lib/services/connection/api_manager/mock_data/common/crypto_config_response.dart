const String cryptoConfigResponse = '''
{
  "crypto_config": {
    "currencies_config": {
      "BTC": {
        "minimum_withdrawal": 0.0002968
      },
      "ETH": {
        "minimum_withdrawal": 0.01445239
      },
      "LTC": {
        "minimum_withdrawal": 0.05539552
      },
      "USDC": {
        "minimum_withdrawal": 50
      },
      "eUSDT": {
        "minimum_withdrawal": 49.96
      },
      "tUSDT": {
        "minimum_deposit": 50,
        "minimum_withdrawal": 24.98
      }
    }
  },
  "echo_req": {
    "crypto_config": 1,
    "req_id": 2
  },
  "msg_type": "crypto_config",
}
''';
