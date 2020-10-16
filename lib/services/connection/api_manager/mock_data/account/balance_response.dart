/// Balance Response
const String balanceResponse = '''{
  "balance": {
    "accounts": {
      "VRTC2351953": {
        "balance": 9650.74,
        "converted_amount": 10006.86,
        "currency": "USD",
        "demo_account": 1,
        "type": "deriv"
      }
    },
    "balance": 9650.74,
    "currency": "USD",
    "id": "811e7ac4-1454-b909-6adb-904a2e9cb374",
    "loginid": "VRTC2351953",
    "total": {
      "deriv": {
        "amount": 0,
        "currency": "USD"
      },
      "deriv_demo": {
        "amount": 9650.74,
        "currency": "USD"
      },
      "mt5": {
        "amount": 0,
        "currency": "USD"
      },
      "mt5_demo": {
        "amount": 0,
        "currency": "USD"
      }
    }
  },
  "echo_req": {
    "balance": 1,
    "subscribe": 1
  },
  "msg_type": "balance",
  "passthrough": {},
  "subscription": {
    "id": "811e7ac4-1454-b909-6adb-904a2e9cb374"
  }
}''';
