

/// Payment methods response
const String paymentMethodsResponse = '''
{
  "echo_req": {
    "country": "id",
    "payment_methods": 1
  },
  "msg_type": "payment_methods",
  "payment_methods": [
    {
      "deposit_limits": {
        "USD": {
          "max": 2500,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "AirTM",
      "id": "AirTM",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "USD"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "USD": {
          "max": 2500,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Alipay",
      "display_name": "Alipay",
      "id": "Alipay",
      "payment_processor": "Skrill",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "BTC",
      "display_name": "BTC",
      "id": "BTC",
      "payment_processor": "Skrill",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "CryptoCurrency",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "GBP": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "BankWire",
      "display_name": "BankWire",
      "id": "BankWire",
      "payment_processor": "WorldPayBT",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {},
      "deposit_time": "instant",
      "description": "",
      "display_name": "Refund Debit/Credit Card",
      "id": "CFT",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "AUD",
        "EUR"
      ],
      "type": "Manual",
      "type_display_name": "Manual",
      "withdraw_limits": {
        "AUD": {
          "max": 10000,
          "min": 10
        },
        "EUR": {
          "max": 10000,
          "min": 10
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "CUPQR",
      "display_name": "CUPQR",
      "id": "CUPQR",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 5000,
          "min": 10
        },
        "EUR": {
          "max": 5000,
          "min": 10
        },
        "GBP": {
          "max": 5000,
          "min": 10
        },
        "USD": {
          "max": 5000,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "CreditCard",
      "display_name": "CreditCard",
      "id": "CreditCard",
      "payment_processor": "Skrill",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 1000,
          "min": 5
        },
        "EUR": {
          "max": 1000,
          "min": 5
        },
        "GBP": {
          "max": 1000,
          "min": 5
        },
        "USD": {
          "max": 1000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "Directa24S",
      "display_name": "Directa24S",
      "id": "Directa24S",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "GBP": {
          "max": 100,
          "min": 20
        },
        "USD": {
          "max": 10000,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "DragonPhBT",
      "display_name": "DragonPhBT",
      "id": "DragonPhBT",
      "payment_processor": "DragonPhx",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "Ecommpay",
      "display_name": "Ecommpay",
      "id": "Ecommpay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "FasaPay",
      "id": "FasaPay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "USD"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Foxapay",
      "display_name": "Foxapay",
      "id": "Foxapay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "ISignThis",
      "display_name": "ISignThis",
      "id": "ISignThis",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "Interkassa",
      "display_name": "Interkassa",
      "id": "Interkassa",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "EUR": {
          "max": 10000,
          "min": 10
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "Jeton Wallet Payout",
      "id": "JetonWL",
      "payment_processor": "Jeton",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "USD",
        "EUR"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Link4Pay",
      "display_name": "Link4Pay",
      "id": "Link4Pay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "MiFinity",
      "display_name": "MiFinity",
      "id": "MiFinity",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "MobileAfrica",
      "display_name": "MobileAfrica",
      "id": "MobileAfrica",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "MobileMoney",
      "display_name": "MobileMoney",
      "id": "MobileMoney",
      "payment_processor": "GTEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 10000,
          "min": 5
        },
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "GBP": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "NETeller",
      "display_name": "NETeller",
      "id": "NETeller",
      "payment_processor": "Skrill",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {},
      "deposit_time": "instant",
      "description": "",
      "display_name": "NETELLER",
      "id": "NETellerPS",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "AUD",
        "USD",
        "EUR",
        "GBP"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "AUD": {
          "max": 10000,
          "min": 5
        },
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "GBP": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "PayNow",
      "display_name": "PayNow",
      "id": "PayNow",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "PayOp",
      "display_name": "PayOp",
      "id": "PayOp",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 10000,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "PayTrust",
      "display_name": "PayTrust",
      "id": "PayTrust",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "PaymeroBT",
      "display_name": "PaymeroBT",
      "id": "PaymeroBT",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "PaymeroVA",
      "display_name": "PaymeroVA",
      "id": "PaymeroVA",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "EUR": {
          "max": 20000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "PerfectMoney",
      "id": "PerfectM",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "USD",
        "EUR"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "PymtsChina",
      "display_name": "PymtsChina",
      "id": "PymtsChina",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "SafeCharge",
      "display_name": "SafeCharge",
      "id": "SafeCharge",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 20000,
          "min": 10
        },
        "EUR": {
          "max": 10000,
          "min": 10
        },
        "GBP": {
          "max": 10000,
          "min": 10
        },
        "USD": {
          "max": 10000,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "Skrill",
      "id": "Skrill",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "AUD",
        "USD",
        "EUR",
        "GBP"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "AUD": {
          "max": 10000,
          "min": 5
        },
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "GBP": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 10000,
          "min": 10
        },
        "EUR": {
          "max": 10000,
          "min": 10
        },
        "GBP": {
          "max": 10000,
          "min": 10
        },
        "USD": {
          "max": 10000,
          "min": 10
        }
      },
      "deposit_time": "instant",
      "description": "Skrill1Tap",
      "display_name": "Skrill1Tap",
      "id": "Skrill1Tap",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 10000,
          "min": 5
        },
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "GBP": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "",
      "display_name": "SticPay",
      "id": "SticPay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "AUD",
        "USD",
        "EUR",
        "GBP"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "AUD": {
          "max": 10000,
          "min": 5
        },
        "EUR": {
          "max": 10000,
          "min": 5
        },
        "GBP": {
          "max": 10000,
          "min": 5
        },
        "USD": {
          "max": 1000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Terrexa",
      "display_name": "Terrexa",
      "id": "Terrexa",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Trustly",
      "display_name": "Trustly",
      "id": "Trustly",
      "payment_processor": "TrustlyAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 500,
          "min": 25
        }
      },
      "deposit_time": "instant",
      "description": "UnionPay",
      "display_name": "UnionPay",
      "id": "UnionPay",
      "payment_processor": "OneRoadAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Uphold",
      "display_name": "Uphold",
      "id": "Uphold",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "Walaopay",
      "display_name": "Walaopay",
      "id": "Walaopay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "EUR": {
          "max": 1000,
          "min": 5
        },
        "USD": {
          "max": 3000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "WebMoney",
      "display_name": "WebMoney",
      "id": "WebMoney",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [
        "USD"
      ],
      "type": "EWallet",
      "type_display_name": "EWallet",
      "withdraw_limits": {
        "USD": {
          "max": 5000,
          "min": 5
        }
      },
      "withdrawal_time": "n/a"
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 100,
          "min": 5
        },
        "EUR": {
          "max": 100,
          "min": 5
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "Yandex",
      "display_name": "Yandex",
      "id": "Yandex",
      "payment_processor": "WorldPayBT",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "ZPay",
      "display_name": "ZPay",
      "id": "ZPay",
      "payment_processor": "GenEWAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "advcash",
      "display_name": "advcash",
      "id": "advcash",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 10000,
          "min": 15
        }
      },
      "deposit_time": "instant",
      "description": "help2pay",
      "display_name": "help2pay",
      "id": "help2pay",
      "payment_processor": "PayzoffAPM",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "USD": {
          "max": 100,
          "min": 20
        }
      },
      "deposit_time": "instant",
      "description": "iPay",
      "display_name": "iPay",
      "id": "iPay",
      "payment_processor": "PEW",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    },
    {
      "deposit_limits": {
        "AUD": {
          "max": 10000,
          "min": 20
        },
        "USD": {
          "max": 10000,
          "min": 5
        }
      },
      "deposit_time": "instant",
      "description": "iWallet",
      "display_name": "iWallet",
      "id": "iWallet",
      "payment_processor": "",
      "predefined_amounts": [
        5,
        10,
        100,
        300,
        500
      ],
      "signup_link": "",
      "supported_currencies": [

      ],
      "type": "",
      "type_display_name": "EWallet",
      "withdraw_limits": {},
      "withdrawal_time": ""
    }
  ]
}
''';
