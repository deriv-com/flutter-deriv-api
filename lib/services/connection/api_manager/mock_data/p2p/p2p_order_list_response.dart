/// Order list response
const String p2pOrderListResponse = '''{
  "echo_req": {
    "p2p_order_list": 1
  },
  "msg_type": "p2p_order_list",
  "p2p_order_list": {
    "list": [
      {
        "account_currency": "USD",
        "advert_details": {
          "block_trade": 1,
          "description": "Please contact via whatsapp 1234",
          "id": "6",
          "payment_method": "bank_transfer",
          "type": "sell"
        },
        "advertiser_details": {
          "id": "2",
          "name": "advertiser CR90000018",
          "loginid": "CR90000006",
          "completed_orders_count": 0,
          "is_online": true
        },
        "client_details":{
          "id":"5",
          "loginid": "CR90000006",
          "name": "client CR90000006",
          "completed_orders_count": 0,
          "is_online": true
        },
        "dispute_details":{
          "dispute_reason": null,
          "disputer_loginid": null
        },
        "amount": 50,
        "amount_display": "50.00",
        "chat_channel_url": "",
        "contact_info": "Please contact via whatsapp 1234",
        "created_time": 1589688096,
        "expiry_time": 1589695296,
        "id": "107",
        "is_incoming": 0,
        "local_currency": "ZAR",
        "payment_info": "Transfer to account 000-1111",
        "price": 675000,
        "price_display": "675000.00",
        "rate": 13500,
        "rate_display": "13500.00",
        "status": "pending",
        "type": "buy",
        "is_reviewable": true,
        "verification_pending": true,
        "is_seen": true
      }
    ]
  },
  "subscription": {
    "id": "857cfc96-1014-66ce-9c49-0a4dbd22857a"
  }
}''';
