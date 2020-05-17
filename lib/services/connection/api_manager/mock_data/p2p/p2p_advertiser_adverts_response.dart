/// P2P  advertiser adverts response
const String p2pAdvertiserAdvertsResponse = '''
{
  "echo_req": {
    "p2p_advertiser_adverts": 1
  },
  "msg_type": "p2p_advertiser_adverts",
  "p2p_advertiser_adverts": {
    "list": [
      {
        "account_currency": "USD",
        "advertiser_details": {
          "id": "1",
          "name": "John Doe"
        },
        "amount": 10,
        "amount_display": "10.00",
        "contact_info": "Please contact via whatsapp",
        "counterparty_type": "sell",
        "country": "za",
        "created_time": 1589258036,
        "description": "Please contact via 1234",
        "id": "3",
        "is_active": 1,
        "local_currency": "ZAR",
        "max_order_amount": 3,
        "max_order_amount_display": "3.00",
        "min_order_amount": 1,
        "min_order_amount_display": "1.00",
        "payment_info": "Transfer to account 000-1111",
        "payment_method": "bank_transfer",
        "price": 1,
        "price_display": "1.00",
        "rate": 2,
        "rate_display": "2.00",
        "remaining_amount": 15,
        "remaining_amount_display": "15.00",
        "type": "buy"
      },
      {
        "account_currency": "USD",
        "advertiser_details": {
          "id": "1",
          "name": "John Doe"
        },
        "amount": 3000,
        "amount_display": "3000.00",
        "contact_info": "Please contact via whatsapp",
        "counterparty_type": "buy",
        "country": "za",
        "created_time": 1589256469,
        "description": "Please contact via 1234",
        "id": "2",
        "is_active": 1,
        "local_currency": "ZAR",
        "max_order_amount": 100,
        "max_order_amount_display": "100.00",
        "min_order_amount": 10,
        "min_order_amount_display": "10.00",
        "payment_info": "Transfer to account 000-1111",
        "payment_method": "bank_transfer",
        "price": 13500,
        "price_display": "13500.00",
        "rate": 13500,
        "rate_display": "13500.00",
        "remaining_amount": 2990,
        "remaining_amount_display": "2990.00",
        "type": "sell"
      }
    ]
  }
}
''';
