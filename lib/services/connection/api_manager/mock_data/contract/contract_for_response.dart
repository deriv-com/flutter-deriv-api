/// Contracts for response
const String contractForResponse = '''
{
  "contracts_for": {
    "available": [
      {
        "barrier_category": "euro_atm",
        "barriers": 0,
        "contract_category": "callput",
        "contract_category_display": "Up/Down",
        "contract_display": "Higher",
        "contract_type": "CALL",
        "exchange_name": "RANDOM",
        "expiry_type": "intraday",
        "forward_starting_options": [
          {
            "close": "1586303999",
            "date": "1586217600",
            "open": "1586217600"
          },
          {
            "close": "1586390399",
            "date": "1586304000",
            "open": "1586304000"
          },
          {
            "close": "1586476799",
            "date": "1586390400",
            "open": "1586390400"
          }
        ],
        "market": "synthetic_index",
        "max_contract_duration": "1d",
        "min_contract_duration": "2m",
        "sentiment": "up",
        "start_type": "forward",
        "submarket": "random_index",
        "underlying_symbol": "R_50"
      }
    ],
    "close": 1586303999,
    "feed_license": "realtime",
    "hit_count": 59,
    "open": 1586217600,
    "spot": 220.8961
  },
  "echo_req": {
    "contracts_for": "R_50",
    "currency": "USD",
    "landing_company": "svg",
    "product_type": "basic"
  },
  "msg_type": "contracts_for"
}
''';
