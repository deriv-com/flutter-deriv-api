const String statementModelMockData = '''
{
  "echo_req": {
    "description": 1,
    "limit": 100,
    "offset": 25,
    "statement": 1
  },
  "msg_type": "statement",
  "statement": {
    "count": 1,
    "transactions": [
      {
        "action_type": "deposit",
        "amount": -83.23,
        "app_id": 34123,
        "balance_after": 10150.13,
        "contract_id": 4867502908,
        "longcode": "a sample long code",
        "payout": 35.5,
        "purchase_time": 1587544006,
        "reference_id": 1234,
        "shortcode": "a short code",
        "transaction_id": 23432,
        "transaction_time": 1587544006
      }
    ]
  }
}
''';
