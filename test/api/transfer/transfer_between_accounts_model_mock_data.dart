const String transferBetweenAccountsMockData = '''
{
  "echo_req": {
    "account_from": "CR000000",
    "account_to": "CR000001",
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
      "loginid": "CR000000",
      "mt5_group": "real_vanuatu_standard"
    }
  ],
  "client_to_full_name": "John Doe",
  "client_to_loginid": "CR000001",
  "transaction_id": 34625723,
  "msg_type": "transfer_between_accounts"
}
''';
