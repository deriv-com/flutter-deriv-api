const String profitTableModelMockData = '''
{
  "echo_req": {
    "description": 1,
    "limit": 25,
    "offset": 25,
    "profit_table": 1,
    "sort": "ASC"
  },
  "profit_table": {
    "count": "1",
    "transactions": [
      {
        "app_id": 1234,
        "buy_price": 250.0,
        "contract_id": 4867502908,
        "longcode": "long_code",
        "payout": 10.0,
        "purchase_time": 1587544006,
        "sell_price": 5.25,
        "sell_time": 1587554006,
        "shortcode": "short_code",
        "transaction_id": 10867502908
      }
    ]
  },
  "msg_type": "profit_table"
}
''';
