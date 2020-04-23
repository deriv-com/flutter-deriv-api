const String tradingDurationModelMockData = '''
{
  "trading_durations": [
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "USD/CHF",
              "name": "frxUSDCHF"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall",
                "name": "rise_fall"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall (Forward Start)",
                "name": "rise_fall_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal",
                "name": "rise_fall_equal"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal (Forward Start)",
                "name": "rise_fall_equal_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Higher/Lower",
                "name": "higher_lower"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Touch/No Touch",
                "name": "touchnotouch"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Ends Between/Ends Outside",
                "name": "endsinout"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Stays Between/Goes Outside",
                "name": "staysinout"
              }
            }
          ]
        },
        {
          "symbol": [
            {
              "display_name": "AUD/JPY",
              "name": "frxAUDJPY"
            },
            {
              "display_name": "AUD/USD",
              "name": "frxAUDUSD"
            },
            {
              "display_name": "EUR/AUD",
              "name": "frxEURAUD"
            },
            {
              "display_name": "EUR/CAD",
              "name": "frxEURCAD"
            },
            {
              "display_name": "EUR/CHF",
              "name": "frxEURCHF"
            },
            {
              "display_name": "EUR/GBP",
              "name": "frxEURGBP"
            },
            {
              "display_name": "EUR/JPY",
              "name": "frxEURJPY"
            },
            {
              "display_name": "EUR/USD",
              "name": "frxEURUSD"
            },
            {
              "display_name": "GBP/AUD",
              "name": "frxGBPAUD"
            },
            {
              "display_name": "GBP/JPY",
              "name": "frxGBPJPY"
            },
            {
              "display_name": "USD/CAD",
              "name": "frxUSDCAD"
            },
            {
              "display_name": "USD/JPY",
              "name": "frxUSDJPY"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Ticks",
                  "max": 10,
                  "min": 5,
                  "name": "ticks"
                },
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 1,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall",
                "name": "rise_fall"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall (Forward Start)",
                "name": "rise_fall_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal",
                "name": "rise_fall_equal"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal (Forward Start)",
                "name": "rise_fall_equal_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Higher/Lower",
                "name": "higher_lower"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Touch/No Touch",
                "name": "touchnotouch"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Ends Between/Ends Outside",
                "name": "endsinout"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Stays Between/Goes Outside",
                "name": "staysinout"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Call Spread/Put Spread",
                "name": "callputspread"
              }
            }
          ]
        },
        {
          "symbol": [
            {
              "display_name": "GBP/USD",
              "name": "frxGBPUSD"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 1,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall",
                "name": "rise_fall"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall (Forward Start)",
                "name": "rise_fall_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                },
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal",
                "name": "rise_fall_equal"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 1440,
                  "min": 5,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 24,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal (Forward Start)",
                "name": "rise_fall_equal_forward"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Higher/Lower",
                "name": "higher_lower"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Touch/No Touch",
                "name": "touchnotouch"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Ends Between/Ends Outside",
                "name": "endsinout"
              }
            },
            {
              "durations": [
                {
                  "display_name": "Days",
                  "max": 365,
                  "min": 1,
                  "name": "days"
                }
              ],
              "trade_type": {
                "display_name": "Stays Between/Goes Outside",
                "name": "staysinout"
              }
            }
          ]
        }
      ],
      "market": {
        "display_name": "Forex",
        "name": "forex"
      },
      "submarket": {
        "display_name": "Major Pairs",
        "name": "major_pairs"
      }
    }
  ]
}
''';
