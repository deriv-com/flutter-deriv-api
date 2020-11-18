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
    "clients_country": "us",
    "crypto_config": {
      "BTC": {
        "minimum_withdrawal": 0.00299415
      },
      "ETH": {
        "minimum_withdrawal": 0.02389955
      }
    },
    "currencies_config": {
      "USD": {
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
            "EUR": 1
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
      }
    },
    "site_status": "up",
    "supported_languages": [
      "EN",
      "ID",
      "RU",
      "ES"
    ],
    "terms_conditions_version": "Version 48 2019-05-10"
  }
}''';
