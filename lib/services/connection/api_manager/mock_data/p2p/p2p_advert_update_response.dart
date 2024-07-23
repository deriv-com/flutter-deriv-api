/// P2P advert update response
const String p2pAdvertUpdateResponse = '''
{
  "echo_req": {
    "amount": 100,
    "description": "Please transfer to account number 1234",
    "max_order_amount": 50,
    "min_order_amount": 20,
    "p2p_advert_update": 1,
    "payment_method": "bank_transfer",
    "rate": 4.25,
    "type": "buy"
  },
  "p2p_advert_update": {
    "account_currency": "USD",
    "advertiser_details": {
      "id": "3",
      "name": "za advertiser 1010",
       "completed_orders_count" : 1,
       "rating_count" : 0,
      "is_online": true
    },
    "amount": 100,
    "amount_display": "100.00",
    "contact_info": "Please transfer to account number 1234",
    "counterparty_type": "buy",
    "country": "za",
    "created_time": 1589279547,
    "description": "advert information",
    "id": "25",
    "is_active": 0,
    "local_currency": "ZAR",
    "max_order_amount": 50,
    "max_order_amount_display": "50.00",
    "min_order_amount": 20,
    "min_order_amount_display": "20.00",
    "payment_info": "it is a sell order",
    "payment_method": "bank_transfer",
    "price": 2.3,
    "price_display": "2.30",
    "rate": 2.7,
    "rate_display": "2.70",
    "remaining_amount": 50,
    "remaining_amount_display":"50.00",
    "type": "sell"
  },
  "msg_type": "p2p_advert_update"
}
''';
