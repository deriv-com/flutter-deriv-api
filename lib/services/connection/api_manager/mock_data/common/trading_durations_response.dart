/// Trading durations response
const String tradingDurationsResponse = '''
{
  "echo_req": {
    "trading_durations": 1
  },
  "msg_type": "trading_durations",
  "trading_durations": [
    {
      "data": [
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
            },
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 120,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 2,
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
              "display_name": "USD/CHF",
              "name": "frxUSDCHF"
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
                  "max": 120,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 2,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Call Spread/Put Spread",
                "name": "callputspread"
              }
            },
            {
              "durations": [
                {
                  "display_name": "No Expiry",
                  "max": 0,
                  "min": 0,
                  "name": "no_expiry"
                }
              ],
              "trade_type": {
                "display_name": "Multiply Up/Multiply Down",
                "name": "multiplier"
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
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "GBP/NOK",
              "name": "frxGBPNOK"
            },
            {
              "display_name": "USD/NOK",
              "name": "frxUSDNOK"
            },
            {
              "display_name": "USD/SEK",
              "name": "frxUSDSEK"
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
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal (Forward Start)",
                "name": "rise_fall_equal_forward"
              }
            }
          ]
        },
        {
          "symbol": [
            {
              "display_name": "AUD/CAD",
              "name": "frxAUDCAD"
            },
            {
              "display_name": "AUD/CHF",
              "name": "frxAUDCHF"
            },
            {
              "display_name": "AUD/NZD",
              "name": "frxAUDNZD"
            },
            {
              "display_name": "EUR/NZD",
              "name": "frxEURNZD"
            },
            {
              "display_name": "GBP/CAD",
              "name": "frxGBPCAD"
            },
            {
              "display_name": "GBP/CHF",
              "name": "frxGBPCHF"
            },
            {
              "display_name": "GBP/NZD",
              "name": "frxGBPNZD"
            },
            {
              "display_name": "NZD/USD",
              "name": "frxNZDUSD"
            }
          ],
          "trade_durations": [
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
            }
          ]
        },
        {
          "symbol": [
            {
              "display_name": "NZD/JPY",
              "name": "frxNZDJPY"
            },
            {
              "display_name": "USD/MXN",
              "name": "frxUSDMXN"
            },
            {
              "display_name": "USD/PLN",
              "name": "frxUSDPLN"
            }
          ],
          "trade_durations": [
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
            }
          ]
        }
      ],
      "market": {
        "display_name": "Forex",
        "name": "forex"
      },
      "submarket": {
        "display_name": "Minor Pairs",
        "name": "minor_pairs"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "AUD Index",
              "name": "WLDAUD"
            },
            {
              "display_name": "EUR Index",
              "name": "WLDEUR"
            },
            {
              "display_name": "GBP Index",
              "name": "WLDGBP"
            },
            {
              "display_name": "USD Index",
              "name": "WLDUSD"
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
                  "max": 600,
                  "min": 1,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 10,
                  "min": 1,
                  "name": "h"
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
                  "max": 600,
                  "min": 3,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 10,
                  "min": 1,
                  "name": "h"
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall Equal",
                "name": "rise_fall_equal"
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
        "display_name": "Smart FX",
        "name": "smart_fx"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "Japanese Index",
              "name": "OTC_N225"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 60,
                  "min": 30,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 1,
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
                  "min": 30,
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
                  "display_name": "Days",
                  "max": 365,
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
              "display_name": "Australian Index",
              "name": "OTC_AS51"
            },
            {
              "display_name": "Hong Kong Index",
              "name": "OTC_HSI"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 60,
                  "min": 15,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 1,
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
                  "min": 15,
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
                  "display_name": "Days",
                  "max": 365,
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
        "display_name": "Stock Indices",
        "name": "indices"
      },
      "submarket": {
        "display_name": "Asia/Oceania",
        "name": "asia_oceania_OTC"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "French Index",
              "name": "OTC_FCHI"
            },
            {
              "display_name": "UK Index",
              "name": "OTC_FTSE"
            },
            {
              "display_name": "German Index",
              "name": "OTC_GDAXI"
            },
            {
              "display_name": "Swiss Index",
              "name": "OTC_SSMI"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 60,
                  "min": 15,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 1,
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
                  "min": 15,
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
                  "display_name": "Days",
                  "max": 365,
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
              "display_name": "Dutch Index",
              "name": "OTC_AEX"
            },
            {
              "display_name": "Euro 50 Index",
              "name": "OTC_SX5E"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 60,
                  "min": 30,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 1,
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
                  "min": 30,
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
                  "display_name": "Days",
                  "max": 365,
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
        "display_name": "Stock Indices",
        "name": "indices"
      },
      "submarket": {
        "display_name": "Europe",
        "name": "europe_OTC"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "Wall Street Index",
              "name": "OTC_DJI"
            },
            {
              "display_name": "US Tech Index",
              "name": "OTC_NDX"
            },
            {
              "display_name": "US Index",
              "name": "OTC_SPC"
            }
          ],
          "trade_durations": [
            {
              "durations": [
                {
                  "display_name": "Minutes",
                  "max": 60,
                  "min": 15,
                  "name": "m"
                },
                {
                  "display_name": "Hours",
                  "max": 1,
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
                  "min": 15,
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
                  "display_name": "Days",
                  "max": 365,
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
                  "min": 7,
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
        "display_name": "Stock Indices",
        "name": "indices"
      },
      "submarket": {
        "display_name": "Americas",
        "name": "americas_OTC"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "Silver/USD",
              "name": "frxXAGUSD"
            },
            {
              "display_name": "Gold/USD",
              "name": "frxXAUUSD"
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
                  "min": 7,
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
                  "min": 7,
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
              "display_name": "Palladium/USD",
              "name": "frxXPDUSD"
            },
            {
              "display_name": "Platinum/USD",
              "name": "frxXPTUSD"
            }
          ],
          "trade_durations": [
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
                "display_name": "Rise/Fall",
                "name": "rise_fall"
              }
            }
          ]
        }
      ],
      "market": {
        "display_name": "Commodities",
        "name": "commodities"
      },
      "submarket": {
        "display_name": "Metals",
        "name": "metals"
      }
    },
    {
      "data": [
        {
          "symbol": [
            {
              "display_name": "Oil/USD",
              "name": "frxBROUSD"
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
                }
              ],
              "trade_type": {
                "display_name": "Rise/Fall (Forward Start)",
                "name": "rise_fall_forward"
              }
            }
          ]
        }
      ],
      "market": {
        "display_name": "Commodities",
        "name": "commodities"
      },
      "submarket": {
        "display_name": "Energy",
        "name": "energy"
      }
    }
  ]
}
''';
