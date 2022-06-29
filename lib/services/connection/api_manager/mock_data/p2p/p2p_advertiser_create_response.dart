/// P2P advertiser create response
const String p2pAdvertiserCreateResponse = '''
{
  "echo_req": {
    "p2p_advertiser_create": 1
  },
  "msg_type": "p2p_advertiser_create",
  "p2p_advertiser_create": {
      "basic_verification" : 1,
    "favourited" : 1,
    "buy_orders_amount" : "1",
    "buy_orders_count" : 1,
    "full_verification" : 1,
    "sell_orders_count" : 1,
    "total_orders_count" : 1,
    "chat_token": "invalid_token_for_test_2ea8d690e2e98582",
    "chat_user_id": "p2p_CR_1589256468",
    "contact_info": "contract information",
    "created_time": 1589256469,
    "default_advert_description": "default advert description",
    "id": "12",
    "is_approved": 1,
    "is_listed": 0,
    "name": "John Doe",
    "payment_info": "payment information",
    "partner_count": 1,
    "sell_orders_amount" : "",
    "total_turnover" : "",
    "balance_available" : 1,
    "cancels_remaining" : 1,
    "show_name" : true,
    "is_online" : false,
    "rating_count" : 0,
    "blocked_by_count" : 0
  
  },
  "subscription": {
    "id": "4b0ef5f5-a3cd-7a01-01cb-871f0b504143"
  }
}
''';
