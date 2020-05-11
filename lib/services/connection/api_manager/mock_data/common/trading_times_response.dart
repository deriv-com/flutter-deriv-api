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
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "AUD/USD",
                "symbol": "frxAUDUSD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "EUR/AUD",
                "symbol": "frxEURAUD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "EUR/CAD",
                "symbol": "frxEURCAD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "EUR/GBP",
                "symbol": "frxEURGBP",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "EUR/JPY",
                "symbol": "frxEURJPY",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "EUR/USD",
                "symbol": "frxEURUSD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "GBP/AUD",
                "symbol": "frxGBPAUD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "GBP/JPY",
                "symbol": "frxGBPJPY",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "GBP/USD",
                "symbol": "frxGBPUSD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "USD/CAD",
                "symbol": "frxUSDCAD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "USD/CHF",
                "symbol": "frxUSDCHF",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "USD/JPY",
                "symbol": "frxUSDJPY",
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
          },
          {
            "name": "Minor Pairs",
            "symbols": [
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "AUD/CAD",
                "symbol": "frxAUDCAD",
                "times": {
                  "close": [
                    "23:59:59"
                  ],
                  "open": [
                    "00:00:00"
                  ],
                  "settlement": "23:59:59"
                }
              },
              {
                "events": [
                  {
                    "dates": "Fridays",
                    "descrip": "Closes early (at 20:55)"
                  }
                ],
                "name": "AUD/CHF",
                "symbol": "frxAUDCHF",
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
