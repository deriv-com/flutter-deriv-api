/// Wallet migration response mock data.
const String walletMigrationResponse = '''{
  "echo_req": {
    "wallet_migration": "state"
  },
  "msg_type": "wallet_migration",
  "wallet_migration": {
    "account_list": [
      {
        "account_category": "wallet",
        "account_type": "virtual",
        "currency": "USD",
        "landing_company_short": "virtual",
        "link_accounts": [
          {
            "account_category": "trading",
            "account_type": "standard",
            "loginid": "VRTC90000164",
            "platform": "dtrade"
          }
        ],
        "platform": "dwallet"
      },
      {
        "account_category": "wallet",
        "account_type": "doughflow",
        "currency": "USD",
        "landing_company_short": "svg",
        "link_accounts": [
          {
            "account_category": "trading",
            "account_type": "standard",
            "loginid": "CR90000255",
            "platform": "dtrade"
          }
        ],
        "platform": "dwallet"
      }
    ],
    "state": "eligible"
  }
}''';
