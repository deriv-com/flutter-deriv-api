/// Trading times response
const String tradingTimesResponse = '''
{
  "echo_req": {
    "trading_times": "2015-09-14"
  },
  "msg_type": "trading_times",
  "trading_times": {
    "markets": [
      {
        "name": "Forex",
        "submarkets": [
          {
            "name": "Major Pairs",
            "symbols": [
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "AUD/JPY",
                "symbol": "frxAUDJPY",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}
''';
