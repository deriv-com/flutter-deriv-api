/// Transfer between accounts response
const String transferBetweenAccountsResponse = '''
{
  "echo_req": {
    "account_from": "MLT100",
    "account_to": "MF100",
    "amount": 100,
    "currency": "EUR",
    "transfer_between_accounts": 1
  },
  "transfer_between_accounts": 1,
  "accounts": [
    {
      "account_type": "mt5",
      "balance": "120.0",
      "currency": "EUR",
      "loginid": "MLT100",
      "mt5_group": "real_vanuatu_standard"
    }
  ],
  "client_to_full_name": "John Doe",
  "client_to_loginid": "MF100",
  "transaction_id": 34625723,
  "msg_type": "transfer_between_accounts"
}
''';
