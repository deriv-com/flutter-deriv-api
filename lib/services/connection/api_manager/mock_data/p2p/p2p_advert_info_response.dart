/// P2P advert info response
const String p2pAdvertInfoResponse = '''
{
  "echo_req": {
    "id": "21",
    "p2p_advert_info": 1
  },
  "msg_type": "p2p_advert_info",
  "p2p_advert_info": {
    "account_currency": "USD",
    "advertiser_details": {
      "id": "2",
      "name": "za advertiser 1010",
      "completed_orders_count" : 1
    },
    "counterparty_type": "sell",
    "country": "za",
    "created_time": 1589279547,
    "description": "Please transfer to account number 1234",
    "id": "21",
    "is_active": 1,
    "local_currency": "ZAR",
    "max_order_amount_limit": 15,
    "max_order_amount_limit_display": "15.00",
    "min_order_amount_limit": 3,
    "min_order_amount_limit_display": "3.00",
    "payment_method": "bank_transfer",
    "price": 2.3,
    "price_display": "2.30",
    "rate": 2.3,
    "rate_display": "2.30",
    "type": "buy"
  }
}
''';
