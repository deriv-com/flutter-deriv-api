const String websiteStatusJSON = '''{
  "echo_req": {
    "website_status": 1
  },
  "msg_type": "website_status",
  "website_status": {
    "api_call_limits": {
      "max_proposal_subscription": {
        "applies_to": "subscribing to proposal concurrently",
        "max": 5
      },
      "max_requestes_general": {
        "applies_to": "rest of calls",
        "hourly": 14400,
        "minutely": 180
      },
      "max_requests_outcome": {
        "applies_to": "portfolio, statement and proposal",
        "hourly": 1500,
        "minutely": 25
      },
      "max_requests_pricing": {
        "applies_to": "proposal and proposal_open_contract",
        "hourly": 3600,
        "minutely": 80
      }
    },
    "clients_country": "us",
    "crypto_config": {
      "BTC": {
        "minimum_withdrawal": 0.00299415
      },
      "ETH": {
        "minimum_withdrawal": 0.02389955
      },
      "IDK": {
        "minimum_withdrawal": 76
      },
      "LTC": {
        "minimum_withdrawal": 0.10506188
      },
      "USB": {
        "minimum_withdrawal": 5
      },
      "UST": {
        "minimum_withdrawal": 25
      }
    },
    "currencies_config": {
      "AUD": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Australian Dollar",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "BTC": 2,
            "ETH": 2,
            "EUR": 1,
            "GBP": 1,
            "IDK": 1,
            "LTC": 2,
            "USB": 1,
            "USD": 1,
            "UST": 1
          },
          "limits": {
            "max": 3825.96,
            "min": 1.53
          }
        },
        "type": "fiat"
      },
      "BTC": {
        "fractional_digits": 8,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Bitcoin",
        "stake_default": 0.003,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 0.29963981,
            "min": 0.00011986
          }
        },
        "type": "crypto"
      },
      "ETH": {
        "fractional_digits": 8,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Ethereum",
        "stake_default": 0.05,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 11.94883033,
            "min": 0.00477953
          }
        },
        "type": "crypto"
      },
      "EUR": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Euro",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "BTC": 2,
            "ETH": 2,
            "GBP": 1,
            "IDK": 1,
            "LTC": 2,
            "USB": 1,
            "USD": 1,
            "UST": 1
          },
          "limits": {
            "max": 2303.85,
            "min": 0.92
          }
        },
        "type": "fiat"
      },
      "GBP": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Pound Sterling",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "BTC": 2,
            "ETH": 2,
            "EUR": 1,
            "IDK": 1,
            "LTC": 2,
            "USB": 1,
            "USD": 1,
            "UST": 1
          },
          "limits": {
            "max": 2011.52,
            "min": 0.8
          }
        },
        "type": "fiat"
      },
      "IDK": {
        "fractional_digits": 0,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "IDK",
        "stake_default": 150,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "EUR": 1,
            "GBP": 1,
            "USD": 1
          },
          "limits": {
            "max": 37989,
            "min": 15
          }
        },
        "type": "crypto"
      },
      "LTC": {
        "fractional_digits": 8,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Litecoin",
        "stake_default": 0.25,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 52.62880901,
            "min": 0.02105152
          }
        },
        "type": "crypto"
      },
      "USB": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "Binary Coin",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "EUR": 1,
            "GBP": 1,
            "USD": 1
          },
          "limits": {
            "max": 2500,
            "min": 1
          }
        },
        "type": "crypto"
      },
      "USD": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "US Dollar",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "BTC": 2,
            "ETH": 2,
            "EUR": 1,
            "GBP": 1,
            "IDK": 1,
            "LTC": 2,
            "USB": 1,
            "UST": 1
          },
          "limits": {
            "max": 2500,
            "min": 1
          }
        },
        "type": "fiat"
      },
      "UST": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Tether",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 1,
            "EUR": 1,
            "GBP": 1,
            "USD": 1
          },
          "limits": {
            "max": 2500,
            "min": 1
          }
        },
        "type": "crypto"
      }
    },
    "site_status": "up",
    "supported_languages": [
      "EN",
      "ID",
      "RU",
      "ES",
      "FR",
      "IT",
      "PT",
      "PL",
      "DE",
      "ZH_CN",
      "VI",
      "ZH_TW",
      "TH"
    ],
    "terms_conditions_version": "Version 48 2019-05-10"
  }
}''';