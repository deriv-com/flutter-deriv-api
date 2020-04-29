const String accountLimitsJSON = '''{
  "echo_req": {
    "get_limits": 1
  },
  "get_limits": {
    "account_balance": 300000,
    "daily_transfers": {
      "internal": {
        "allowed": 10,
        "available": 10
      },
      "mt5": {
        "allowed": 20,
        "available": 20
      }
    },
    "lifetime_limit": 10000,
    "market_specific": {
      "commodities": [
        {
          "name": "Commodities",
          "payout_limit": 5000,
          "profile_name": "moderate_risk",
          "turnover_limit": 50000
        }
      ],
      "forex": [
        {
          "name": "Minor Pairs",
          "payout_limit": 5000,
          "profile_name": "moderate_risk",
          "turnover_limit": 50000
        },
        {
          "name": "Smart FX",
          "payout_limit": 5000,
          "profile_name": "moderate_risk",
          "turnover_limit": 50000
        },
        {
          "name": "Major Pairs",
          "payout_limit": 20000,
          "profile_name": "medium_risk",
          "turnover_limit": 100000
        }
      ],
      "indices": [
        {
          "name": "Stock Indices",
          "payout_limit": 20000,
          "profile_name": "medium_risk",
          "turnover_limit": 100000
        }
      ],
      "synthetic_index": [
        {
          "name": "Synthetic Indices",
          "payout_limit": 50000,
          "profile_name": "low_risk",
          "turnover_limit": 500000
        }
      ]
    },
    "num_of_days": 30,
    "num_of_days_limit": 10000,
    "open_positions": 100,
    "payout": 50000,
    "remainder": 10000,
    "withdrawal_for_x_days_monetary": 0,
    "withdrawal_since_inception_monetary": 0
  },
  "msg_type": "get_limits"
}''';
