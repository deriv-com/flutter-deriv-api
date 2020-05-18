/// Copy trading list response
const String copyTradingListResponse = '''{
  "echo_req": {},
  "msg_type": "copytrading_list",
  "copytrading_list": {
    "copiers": [
      {
        "loginid": "C241542"
      },
      {
        "loginid": "C246768"
      }
    ],
    "traders": [
      {
        "assets": [
          "asset1",
          "asset2"
        ],
        "loginid": "C241542",
        "max_trade_stake": 123.3,
        "min_trade_stake": 100.3,
        "token": "thisisasampletoken",
        "trade_types": [
          "type1",
          "type2"
        ]
      }
    ]
  },
  "req_id": 852
}''';