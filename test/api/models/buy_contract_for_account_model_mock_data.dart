const String buyContractForAccountModelMockData = '''
{
  "buy_contract_for_multiple_accounts": {
    "result": [
      {
        "buy_price": 48.65,
        "contract_id": 80476091408,
        "longcode": "Win payout if Volatility 100 Index is strictly higher than entry spot plus 0.10 at 1 minute after contract start time.",
        "payout": 100,
        "purchase_time": 1587926403,
        "shortcode": "CALL_R_100_100_1587926403_1587926463_S10P_0",
        "start_time": 1587926403,
        "token": "sampleToken324",
        "transaction_id": 160845602068
      },
      {
        "code": "error_code",
        "message_to_client": "error_message",
        "token": "sampleToken324"
      }
    ]
  }
}
''';
