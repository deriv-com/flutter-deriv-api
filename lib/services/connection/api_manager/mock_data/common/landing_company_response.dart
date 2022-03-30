/// LandingCompany Response
const String landingCompanyResponse = '''{
  "echo_req": {
    "landing_company": "id"
  },
  "landing_company": {
    "config": {
      "tax_details_required": 1
    },
    "financial_company": {
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
        "BTC"
      ],
      "legal_allowed_markets": [
        "commodities",
        "forex"
      ],
      "legal_default_currency": "AUD",
      "name": "Binary (SVG) Ltd.",
      "requirements": {
        "after_first_deposit": {},
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
        "staysinout"
      ],
      "legal_allowed_currencies": [
        "AUD",
        "BTC"
      ],
      "legal_allowed_markets": [
        "commodities",
        "forex"
      ],
      "legal_default_currency": "AUD",
      "name": "Binary (SVG) Ltd.",
      "requirements": {
        "after_first_deposit": {},
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
      "advanced": {
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
        "legal_default_currency": "AUD",
        "name": "Binary (FX) Ltd",
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
            "citizen"
          ]
        },
        "shortcode": "labuan"
      },
      "standard": {
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
            }
          }
        },
        "has_reality_check": 0,
        "legal_allowed_contract_categories": [
          "asian",
          "callput",
          "callputequal",
          "digits",
          "endsinout"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex"
        ],
        "legal_default_currency": "AUD",
        "name": "Binary (SVG) Ltd.",
        "requirements": {
          "after_first_deposit": {},
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
      "standard": {
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
          "staysinout"
        ],
        "legal_allowed_currencies": [
          "AUD",
          "BTC"
        ],
        "legal_allowed_markets": [
          "commodities",
          "forex",
          "indices",
          "synthetic_index"
        ],
        "legal_default_currency": "AUD",
        "name": "Binary (SVG) Ltd.",
        "requirements": {
          "after_first_deposit": {},
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