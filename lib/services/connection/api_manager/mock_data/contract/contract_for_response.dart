/// Contracts for response
const String contractForResponse = '''
{
  "contracts_for": {
    "available": [
      {
        "barrier_category": "asian",
        "barriers": 0,
        "contract_category": "asian",
        "contract_category_display": "Asians",
        "contract_display": "Asian Up",
        "contract_type": "ASIANU",
        "exchange_name": "RANDOM",
        "expiry_type": "tick",
        "market": "synthetic_index",
        "max_contract_duration": "10t",
        "min_contract_duration": "5t",
        "sentiment": "up",
        "start_type": "spot",
        "submarket": "random_index",
        "underlying_symbol": "R_50"
      },
      {
        "barrier_category": "asian",
        "barriers": 0,
        "contract_category": "asian",
        "contract_category_display": "Asians",
        "contract_display": "Asian Down",
        "contract_type": "ASIAND",
        "exchange_name": "RANDOM",
        "expiry_type": "tick",
        "market": "synthetic_index",
        "max_contract_duration": "10t",
        "min_contract_duration": "5t",
        "sentiment": "down",
        "start_type": "spot",
        "submarket": "random_index",
        "underlying_symbol": "R_50"
      },
      {
        "barrier_category": "euro_atm",
        "barriers": 0,
        "contract_category": "callput",
        "contract_category_display": "Up/Down",
        "contract_display": "Higher",
        "contract_type": "CALL",
        "exchange_name": "RANDOM",
        "expiry_type": "daily",
        "market": "synthetic_index",
        "max_contract_duration": "365d",
        "min_contract_duration": "1d",
        "sentiment": "up",
        "start_type": "spot",
        "submarket": "random_index",
        "underlying_symbol": "R_50"
      }
    ],
    "close": 1588809599,
    "feed_license": "realtime",
    "hit_count": 55,
    "open": 1588723200,
    "spot": 7389.8297
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
