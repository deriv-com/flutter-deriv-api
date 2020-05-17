/// P2P advert list response
const String p2pAdvertListResponse = '''
{
  "echo_req": {
    "counterparty_type": "sell",
    "p2p_advert_list": 1
  },
  "msg_type": "p2p_advert_list",
  "p2p_advert_list": {
    "list": [
      {
        "account_currency": "USD",
        "advertiser_details": {
          "id": "6",
          "name": "advertiser CR90000018"
        },
        "counterparty_type": "sell",
        "country": "za",
        "created_time": 1589270475,
        "description": "Please contact via whats app 1234",
        "id": "7",
        "is_active": 1,
        "local_currency": "ZAR",
        "max_order_amount_limit": 100,
        "max_order_amount_limit_display": "100.00",
        "min_order_amount_limit": 10,
        "min_order_amount_limit_display": "10.00",
        "payment_method": "bank_transfer",
        "price": 14500,
        "price_display": "14500.00",
        "rate": 14500,
        "rate_display": "14500.00",
        "type": "buy"
      },
      {
        "account_currency": "USD",
        "advertiser_details": {
          "id": "7",
          "name": "advertiser CR90000022"
        },
        "counterparty_type": "sell",
        "country": "za",
        "created_time": 1589275813,
        "description": "Please contact via whats app 1234",
        "id": "9",
        "is_active": 1,
        "local_currency": "ZAR",
        "max_order_amount_limit": 100,
        "max_order_amount_limit_display": "100.00",
        "min_order_amount_limit": 10,
        "min_order_amount_limit_display": "10.00",
        "payment_method": "bank_transfer",
        "price": 14500,
        "price_display": "14500.00",
        "rate": 14500,
        "rate_display": "14500.00",
        "type": "buy"
      }
    ]
  }
}
''';
