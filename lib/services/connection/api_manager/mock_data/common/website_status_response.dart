/// WebsiteStatus Response
const String websiteStatusResponse = '''{
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
    "clients_country": "de",
    "crypto_config": {
      "BTC": {
        "minimum_withdrawal": 0.00074296
      },
      "BUSD": {
        "minimum_withdrawal": 25
      },
      "DAI": {
        "minimum_withdrawal": 24.96
      },
      "ETH": {
        "minimum_withdrawal": 0.01348475
      },
      "EURS": {
        "minimum_withdrawal": 20.63
      },
      "IDK": {
        "minimum_withdrawal": 72
      },
      "LTC": {
        "minimum_withdrawal": 0.03657163
      },
      "PAX": {
        "minimum_withdrawal": 25
      },
      "TUSD": {
        "minimum_withdrawal": 25
      },
      "USB": {
        "minimum_withdrawal": 25
      },
      "USDC": {
        "minimum_withdrawal": 25
      },
      "USDK": {
        "minimum_withdrawal": 24.75
      },
      "UST": {
        "minimum_withdrawal": 24.99
      },
      "eUSDT": {
        "minimum_withdrawal": 24.99
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
            "BUSD": 2,
            "DAI": 2,
            "ETH": 2,
            "EUR": 1,
            "EURS": 2,
            "GBP": 1,
            "IDK": 2,
            "LTC": 2,
            "PAX": 2,
            "TUSD": 2,
            "USB": 2,
            "USD": 1,
            "USDC": 2,
            "USDK": 2,
            "UST": 2,
            "eUSDT": 2
          },
          "limits": {
            "max": 3323.76,
            "min": 1.33
          },
          "limits_dxtrade": {
            "max": 3321.46,
            "min": 1.33
          },
          "limits_mt5": {
            "max": 3321.46,
            "min": 1.33
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
        "stake_default": 0.0002,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 0.07320128,
            "min": 0.00002928
          },
          "limits_dxtrade": {
            "max": 0.07429607,
            "min": 0.00002972
          },
          "limits_mt5": {
            "max": 0.07429607,
            "min": 0.00002972
          }
        },
        "type": "crypto"
      },
      "BUSD": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "Binance USD",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2499.75,
            "min": 1
          },
          "limits_mt5": {
            "max": 2499.75,
            "min": 1
          }
        },
        "type": "crypto"
      },
      "DAI": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "Multi-Collateral DAI",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2496.26,
            "min": 1
          },
          "limits_mt5": {
            "max": 2496.26,
            "min": 1
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
        "stake_default": 0.006,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 1.10171714,
            "min": 0.00044069
          },
          "limits_dxtrade": {
            "max": 1.12372934,
            "min": 0.00044949
          },
          "limits_mt5": {
            "max": 1.12372934,
            "min": 0.00044949
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
            "BUSD": 2,
            "DAI": 2,
            "ETH": 2,
            "EURS": 2,
            "GBP": 1,
            "IDK": 2,
            "LTC": 2,
            "PAX": 2,
            "TUSD": 2,
            "USB": 2,
            "USD": 1,
            "USDC": 2,
            "USDK": 2,
            "UST": 2,
            "eUSDT": 2
          },
          "limits": {
            "max": 2108.48,
            "min": 0.84
          },
          "limits_dxtrade": {
            "max": 2107.23,
            "min": 0.84
          },
          "limits_mt5": {
            "max": 2107.23,
            "min": 0.84
          }
        },
        "type": "fiat"
      },
      "EURS": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "STATIS Euro",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2061.01,
            "min": 0.82
          },
          "limits_dxtrade": {
            "max": 2062.62,
            "min": 0.83
          },
          "limits_mt5": {
            "max": 2062.62,
            "min": 0.83
          }
        },
        "type": "crypto"
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
            "BUSD": 2,
            "DAI": 2,
            "ETH": 2,
            "EUR": 1,
            "EURS": 2,
            "IDK": 2,
            "LTC": 2,
            "PAX": 2,
            "TUSD": 2,
            "USB": 2,
            "USD": 1,
            "USDC": 2,
            "USDK": 2,
            "UST": 2,
            "eUSDT": 2
          },
          "limits": {
            "max": 1806.72,
            "min": 0.72
          },
          "limits_dxtrade": {
            "max": 1805.8,
            "min": 0.72
          },
          "limits_mt5": {
            "max": 1805.8,
            "min": 0.72
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
        "stake_default": 140,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 35888,
            "min": 14
          },
          "limits_dxtrade": {
            "max": 35888,
            "min": 14
          },
          "limits_mt5": {
            "max": 35888,
            "min": 14
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
        "stake_default": 0.06,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 17.86888527,
            "min": 0.00714755
          },
          "limits_dxtrade": {
            "max": 18.2858146,
            "min": 0.00731433
          },
          "limits_mt5": {
            "max": 18.2858146,
            "min": 0.00731433
          }
        },
        "type": "crypto"
      },
      "PAX": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "Paxos Standard",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2500,
            "min": 1
          },
          "limits_mt5": {
            "max": 2500,
            "min": 1
          }
        },
        "type": "crypto"
      },
      "TUSD": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "True USD",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2500.41,
            "min": 1
          },
          "limits_mt5": {
            "max": 2500.41,
            "min": 1
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
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2500,
            "min": 1
          },
          "limits_mt5": {
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
            "BUSD": 2,
            "DAI": 2,
            "ETH": 2,
            "EUR": 1,
            "EURS": 2,
            "GBP": 1,
            "IDK": 2,
            "LTC": 2,
            "PAX": 2,
            "TUSD": 2,
            "USB": 2,
            "USDC": 2,
            "USDK": 2,
            "UST": 2,
            "eUSDT": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2500,
            "min": 1
          },
          "limits_mt5": {
            "max": 2500,
            "min": 1
          }
        },
        "type": "fiat"
      },
      "USDC": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "USD Coin",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2500.38,
            "min": 1
          },
          "limits_mt5": {
            "max": 2500.38,
            "min": 1
          }
        },
        "type": "crypto"
      },
      "USDK": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "USDK",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2475.25,
            "min": 0.99
          },
          "limits_mt5": {
            "max": 2475.25,
            "min": 0.99
          }
        },
        "type": "crypto"
      },
      "UST": {
        "fractional_digits": 2,
        "is_deposit_suspended": 0,
        "is_suspended": 0,
        "is_withdrawal_suspended": 0,
        "name": "Tether Omni",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2499.11,
            "min": 1
          },
          "limits_mt5": {
            "max": 2499.11,
            "min": 1
          }
        },
        "type": "crypto"
      },
      "eUSDT": {
        "fractional_digits": 2,
        "is_deposit_suspended": 1,
        "is_suspended": 1,
        "is_withdrawal_suspended": 1,
        "name": "Tether ERC20",
        "stake_default": 10,
        "transfer_between_accounts": {
          "fees": {
            "AUD": 2,
            "EUR": 2,
            "GBP": 2,
            "USD": 2
          },
          "limits": {
            "max": 2500,
            "min": 1
          },
          "limits_dxtrade": {
            "max": 2499.11,
            "min": 1
          },
          "limits_mt5": {
            "max": 2499.11,
            "min": 1
          }
        },
        "type": "crypto"
      }
    },
    "p2p_config": {
      "adverts_active_limit": 3,
      "cancellation_block_duration": 24,
      "cancellation_count_period": 24,
      "cancellation_grace_period": 15,
      "cancellation_limit": 3,
      "maximum_advert_amount": 3000,
      "maximum_order_amount": 1000,
      "order_daily_limit": 200,
      "payment_methods_enabled" : true,
      "disabled" : 1,
      "order_payment_period": 120
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
