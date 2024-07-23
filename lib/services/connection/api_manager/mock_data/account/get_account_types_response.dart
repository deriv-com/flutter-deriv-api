/// Mock data for get_account_types response.
const String getAccountTypesResponse = '''{
  "echo_req": {
    "get_account_types": 1
  },
  "get_account_types": {
    "trading": {
      "binary": {
        "allowed_wallet_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST",
          "eUSDT",
          "tUSDT"
        ],
        "linkable_to_different_currency": 0,
        "linkable_wallet_types": [
          "doughflow",
          "crypto",
          "p2p",
          "paymentagent_client"
        ]
      },
      "derivez": {
        "allowed_wallet_currencies": [
          "AUD",
          "EUR",
          "GBP",
          "USD"
        ],
        "linkable_to_different_currency": 1,
        "linkable_wallet_types": [
          "doughflow",
          "p2p",
          "paymentagent_client"
        ]
      },
      "dxtrade": {
        "allowed_wallet_currencies": [
          "AUD",
          "EUR",
          "GBP",
          "USD"
        ],
        "linkable_to_different_currency": 1,
        "linkable_wallet_types": [
          "doughflow",
          "p2p",
          "paymentagent_client"
        ]
      },
      "mt5": {
        "allowed_wallet_currencies": [
          "AUD",
          "EUR",
          "GBP",
          "USD"
        ],
        "linkable_to_different_currency": 1,
        "linkable_wallet_types": [
          "doughflow",
          "p2p",
          "paymentagent_client"
        ]
      },
      "standard": {
        "allowed_wallet_currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST",
          "eUSDT",
          "tUSDT"
        ],
        "linkable_to_different_currency": 0,
        "linkable_wallet_types": [
          "doughflow",
          "crypto",
          "p2p",
          "paymentagent_client"
        ]
      }
    },
    "wallet": {
      "crypto": {
        "currencies": [
          "BTC",
          "ETH",
          "LTC",
          "USDC",
          "UST",
          "eUSDT",
          "tUSDT"
        ]
      },
      "doughflow": {
        "currencies": [
          "AUD",
          "EUR",
          "GBP",
          "USD"
        ]
      },
      "p2p": {
        "currencies": [
          "USD"
        ]
      },
      "paymentagent": {
        "currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST",
          "eUSDT",
          "tUSDT"
        ]
      },
      "paymentagent_client": {
        "currencies": [
          "AUD",
          "BTC",
          "ETH",
          "EUR",
          "GBP",
          "LTC",
          "USD",
          "USDC",
          "UST",
          "eUSDT",
          "tUSDT"
        ]
      }
    }
  },
  "msg_type": "get_account_types"
}''';
