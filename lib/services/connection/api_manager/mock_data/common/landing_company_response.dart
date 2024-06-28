/// LandingCompany Response
const String landingCompanyResponse = '''{
  "echo_req": {
    "landing_company": "id"
  },
  "landing_company": {
    "config": {
      "tax_details_required": 1,
      "tin_format": [
        ""
      ],
      "tin_format_description": "999999999999999"
    },
    "financial_company": {
      "address": null,
      "changeable_fields": {
        "only_before_auth": [
          "salutation",
          "first_name",
          "last_name",
          "date_of_birth",
          "citizen",
          "account_opening_reason",
          "tax_residence",
          "tax_identification_number"
        ],
        "personal_details_not_locked": [
          "first_name",
          "last_name",
          "date_of_birth",
          "citizen",
          "place_of_birth"
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.35
          },
          "USDC": {
            "max_payout": 5000,
            "min_stake": 0.35
          },
          "UST": {
            "max_payout": 5000,
            "min_stake": 0.35
          }
        }
      },
      "has_reality_check": 0,
      "legal_allowed_contract_categories": [
        "asian",
        "callput",
        "callputequal",
        "callputspread",
        "digits",
        "endsinout",
        "highlowticks",
        "lookback",
        "multiplier",
        "reset",
        "runs",
        "staysinout",
        "touchnotouch"
      ],
      "legal_allowed_currencies": [
        "AUD",
        "BTC",
        "ETH",
        "EUR",
        "GBP",
        "LTC",
        "USD",
        "USDC",
        "UST"
      ],
      "legal_allowed_markets": [
        "commodities",
        "forex",
        "indices",
        "synthetic_index"
      ],
      "legal_default_currency": "USD",
      "name": "Deriv (SVG) LLC",
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
    "gaming_company": {
      "address": null,
      "changeable_fields": {
        "only_before_auth": [
          "salutation",
          "first_name",
          "last_name",
          "date_of_birth",
          "citizen",
          "account_opening_reason",
          "tax_residence",
          "tax_identification_number"
        ],
        "personal_details_not_locked": [
          "first_name",
          "last_name",
          "date_of_birth",
          "citizen",
          "place_of_birth"
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.5
          },
          "USDC": {
            "max_payout": 5000,
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
            "max_payout": 200,
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
            "max_payout": 1000,
            "min_stake": 0.01
          },
          "USD": {
            "max_payout": 50000,
            "min_stake": 0.35
          },
          "USDC": {
            "max_payout": 5000,
            "min_stake": 0.35
          },
          "UST": {
            "max_payout": 5000,
            "min_stake": 0.35
          }
        }
      },
      "has_reality_check": 0,
      "legal_allowed_contract_categories": [
        "asian",
        "callput",
        "callputequal",
        "callputspread",
        "digits",
        "endsinout",
        "highlowticks",
        "lookback",
        "multiplier",
        "reset",
        "runs",
        "staysinout",
        "touchnotouch"
      ],
      "legal_allowed_currencies": [
        "AUD",
        "BTC",
        "ETH",
        "EUR",
        "GBP",
        "LTC",
        "USD",
        "USDC",
        "UST"
      ],
      "legal_allowed_markets": [
        "commodities",
        "forex",
        "indices",
        "synthetic_index"
      ],
      "legal_default_currency": "USD",
      "name": "Deriv (SVG) LLC",
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
    "id": "id",
    "minimum_age": 18,
    "mt_financial_company": {
      "financial": {
        "address": null,
        "changeable_fields": {
          "only_before_auth": [
            "salutation",
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "account_opening_reason",
            "tax_residence",
            "tax_identification_number"
          ],
          "personal_details_not_locked": [
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "place_of_birth"
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.35
            },
            "USDC": {
              "max_payout": 5000,
              "min_stake": 0.35
            },
            "UST": {
              "max_payout": 5000,
              "min_stake": 0.35
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "asian",
          "callput",
          "callputequal",
          "callputspread",
          "digits",
          "endsinout",
          "highlowticks",
          "lookback",
          "multiplier",
          "reset",
          "runs",
          "staysinout",
          "touchnotouch"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex",
          "indices",
          "synthetic_index"
        ],
        "legal_default_currency": "USD",
        "name": "Deriv (SVG) LLC",
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
      "financial_stp": {
        "address": [
          "Labuan Times Square",
          "Jalan Merdeka",
          "87000 Federal Territory of Labuan",
          "Malaysia"
        ],
        "changeable_fields": {},
        "country": "Malaysia",
        "currency_config": {
          "forex": {
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "callput"
        ],
        "legal_allowed_currencies": [
          "USD"
        ],
        "legal_allowed_markets": [
          "forex"
        ],
        "legal_default_currency": "USD",
        "name": "Deriv (FX) Ltd",
        "requirements": {
          "after_first_deposit": {
            "financial_assessment": [
              "financial_information",
              "trading_experience"
            ]
          },
          "compliance": {
            "tax_information": [
              "tax_residence",
              "tax_identification_number"
            ]
          },
          "signup": [
            "phone",
            "citizen",
            "account_opening_reason"
          ]
        },
        "shortcode": "labuan"
      },
      "swap_free": {
        "address": null,
        "changeable_fields": {
          "only_before_auth": [
            "salutation",
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "account_opening_reason",
            "tax_residence",
            "tax_identification_number"
          ],
          "personal_details_not_locked": [
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "place_of_birth"
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.35
            },
            "USDC": {
              "max_payout": 5000,
              "min_stake": 0.35
            },
            "UST": {
              "max_payout": 5000,
              "min_stake": 0.35
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "asian",
          "callput",
          "callputequal",
          "callputspread",
          "digits",
          "endsinout",
          "highlowticks",
          "lookback",
          "multiplier",
          "reset",
          "runs",
          "staysinout",
          "touchnotouch"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex",
          "indices",
          "synthetic_index"
        ],
        "legal_default_currency": "USD",
        "name": "Deriv (SVG) LLC",
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
      }
    },
    "mt_gaming_company": {
      "financial": {
        "address": null,
        "changeable_fields": {
          "only_before_auth": [
            "salutation",
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "account_opening_reason",
            "tax_residence",
            "tax_identification_number"
          ],
          "personal_details_not_locked": [
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "place_of_birth"
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.35
            },
            "USDC": {
              "max_payout": 5000,
              "min_stake": 0.35
            },
            "UST": {
              "max_payout": 5000,
              "min_stake": 0.35
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "asian",
          "callput",
          "callputequal",
          "callputspread",
          "digits",
          "endsinout",
          "highlowticks",
          "lookback",
          "multiplier",
          "reset",
          "runs",
          "staysinout",
          "touchnotouch"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex",
          "indices",
          "synthetic_index"
        ],
        "legal_default_currency": "USD",
        "name": "Deriv (SVG) LLC",
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
      "swap_free": {
        "address": null,
        "changeable_fields": {
          "only_before_auth": [
            "salutation",
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "account_opening_reason",
            "tax_residence",
            "tax_identification_number"
          ],
          "personal_details_not_locked": [
            "first_name",
            "last_name",
            "date_of_birth",
            "citizen",
            "place_of_birth"
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.5
            },
            "USDC": {
              "max_payout": 5000,
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
              "max_payout": 200,
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
              "max_payout": 1000,
              "min_stake": 0.01
            },
            "USD": {
              "max_payout": 50000,
              "min_stake": 0.35
            },
            "USDC": {
              "max_payout": 5000,
              "min_stake": 0.35
            },
            "UST": {
              "max_payout": 5000,
              "min_stake": 0.35
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "asian",
          "callput",
          "callputequal",
          "callputspread",
          "digits",
          "endsinout",
          "highlowticks",
          "lookback",
          "multiplier",
          "reset",
          "runs",
          "staysinout",
          "touchnotouch"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex",
          "indices",
          "synthetic_index"
        ],
        "legal_default_currency": "USD",
        "name": "Deriv (SVG) LLC",
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
      }
    },
    "name": "Indonesia",
    "virtual_company": "virtual"
  },
  "msg_type": "landing_company"
}''';
