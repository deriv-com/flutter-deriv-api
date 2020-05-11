/// landingCompanyDetails Response
const String landingCompanyDetailsResponse = '''{
  "echo_req": {
    "landing_company_details": "svg"
  },
  "msg_type": "landing_company_details",
  "landing_company_details": {
    "address": [
      "block",
      "street",
      "city",
      "Country"
    ],
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
    "country": "Sample country",
    "currency_config": {
      "forex": {
        "AUD": {
          "max_payout": 50000,
          "min_stake": 0.5
        },
        "BTC": {
          "max_payout": 5,
          "min_stake": 0.0002
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
        }
      }
    },
    "has_reality_check": 0,
    "legal_allowed_contract_categories": [
      "asian",
      "callput",
      "callputequal",
      "digits"
    ],
    "legal_allowed_currencies": [
      "AUD",
      "BTC"
    ],
    "legal_allowed_markets": [
      "indices",
      "synthetic_index"
    ],
    "legal_default_currency": "BTC",
    "name": "Sample LC (SLC).",
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
    "shortcode": "s"
  }
}''';
