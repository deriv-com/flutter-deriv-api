const String p2pOrderListJSON = '''{
  "echo_req": {
    "p2p_order_list": 1
  },
  "msg_type": "p2p_order_list",
  "p2p_order_list": {
    "list": [
      {
        "account_currency": "USD",
        "advert_details": {
          "description": "Call before buying USD :)",
          "id": "8",
          "payment_method": "bank_transfer",
          "type": "sell"
        },
        "advertiser_details": {
          "id": "4",
          "name": "Carol"
        },
        "amount": 2.91,
        "amount_display": "2.91",
        "chat_channel_url": "p2porder_CR_14_1588579519",
        "contact_info": "Call/Whatsapp/Telegram +12345678987654",
        "created_time": 1588579491,
        "expiry_time": 1588579611,
        "id": "14",
        "is_incoming": 0,
        "local_currency": "ZAR",
        "payment_info": "Bank of Dubai 1234567898765432345678",
        "price": 16.5,
        "price_display": "16.50",
        "rate": 5.67,
        "rate_display": "5.67",
        "status": "cancelled",
        "type": "buy"
      },
      {
        "account_currency": "USD",
        "advert_details": {
          "description": "Call before buying USD :)",
          "id": "8",
          "payment_method": "bank_transfer",
          "type": "sell"
        },
        "advertiser_details": {
          "id": "4",
          "name": "Carol"
        },
        "amount": 2.91,
        "amount_display": "2.91",
        "chat_channel_url": "p2porder_CR_10_1588578271",
        "contact_info": "Call/Whatsapp/Telegram +12345678987654",
        "created_time": 1588578100,
        "expiry_time": 1588578220,
        "id": "10",
        "is_incoming": 0,
        "local_currency": "ZAR",
        "payment_info": "Bank of Dubai 1234567898765432345678",
        "price": 16.5,
        "price_display": "16.50",
        "rate": 5.67,
        "rate_display": "5.67",
        "status": "timed-out",
        "type": "buy"
      }
    ]
  }
}''';