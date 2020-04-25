const String landingCompanyDetailJSON = '''{
  "echo_req": {
    "landing_company_details": "svg"
  },
  "landing_company_details": {
    "address": {},
    "changeable_fields": {
      "only_before_auth": [
        "salutation",
        "first_name",
        "last_name",
        "date_of_birth",
        "citizen",
        "account_opening_reason"
      ]
    },
    "country": "Saint Vincent and the Grenadines",
    "currency_config": {
      "commodities": {
        "AUD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "BTC": {
          "max_payout": 5,
          "min_stake": 0.0002
        },
        "ETH": {
          "max_payout": 10,
          "min_stake": 0.002
        },
        "EUR": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "GBP": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "LTC": {
          "max_payout": 50,
          "min_stake": 0.01
        },
        "USD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "UST": {
          "max_payout": 5000,
          "min_stake": 0.5
        }
      },
      "forex": {
        "AUD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "BTC": {
          "max_payout": 5,
          "min_stake": 0.0002
        },
        "ETH": {
          "max_payout": 10,
          "min_stake": 0.002
        },
        "EUR": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "GBP": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "LTC": {
          "max_payout": 50,
          "min_stake": 0.01
        },
        "USD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "UST": {
          "max_payout": 5000,
          "min_stake": 0.5
        }
      },
      "indices": {
        "AUD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "BTC": {
          "max_payout": 5,
          "min_stake": 0.0002
        },
        "ETH": {
          "max_payout": 10,
          "min_stake": 0.002
        },
        "EUR": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "GBP": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "LTC": {
          "max_payout": 50,
          "min_stake": 0.01
        },
        "USD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "UST": {
          "max_payout": 5000,
          "min_stake": 0.5
        }
      },
      "synthetic_index": {
        "AUD": {
          "max_payout": 50000,
          "min_stake": 0.35
        },
        "BTC": {
          "max_payout": 5,
          "min_stake": 0.0002
        },
        "ETH": {
          "max_payout": 10,
          "min_stake": 0.002
        },
        "EUR": {
          "max_payout": 50000,
          "min_stake": 0.35
        },
        "GBP": {
          "max_payout": 50000,
          "min_stake": 0.35
        },
        "LTC": {
          "max_payout": 50,
          "min_stake": 0.01
        },
        "USD": {
          "max_payout": 50000,
          "min_stake": 0.35
        },
        "UST": {
          "max_payout": 5000,
          "min_stake": 0.5
        }
      }
    },
    "has_reality_check": 0,
    "legal_allowed_contract_categories": [
      "asian",
      "callput",
      "callputequal",
      "digits",
      "endsinout",
      "staysinout",
      "touchnotouch",
      "lookback",
      "highlowticks",
      "runs",
      "reset",
      "callputspread"
    ],
    "legal_allowed_currencies": [
      "AUD",
      "BTC",
      "ETH",
      "EUR",
      "GBP",
      "LTC",
      "USD",
      "UST"
    ],
    "legal_allowed_markets": [
      "commodities",
      "forex",
      "indices",
      "synthetic_index"
    ],
    "legal_default_currency": "USD",
    "name": "Binary (SVG) Ltd.",
    "requirements": {
      "signup": [
        "first_name",
        "last_name",
        "residence",
        "date_of_birth"
      ],
      "withdrawal": [
        "address_city",
        "address_line_1"
      ]
    },
    "shortcode": "svg"
  },
  "msg_type": "landing_company_details"
}''';