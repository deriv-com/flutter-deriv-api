/// P2P  advertiser update response
const String p2pAdvertiserUpdateResponse = '''
{
  "echo_req": {
    "p2p_advertiser_update": 1
  },
  "msg_type": "p2p_advertiser_update",
  "p2p_advertiser_update": {
    "chat_token": "invalid_token_for_test_2ea8d690e2e98582",
    "chat_user_id": "p2p_CR_1589256468",
    "contact_info": "contract information",
    "created_time": 1589256469,
    "default_advert_description": "default advert description",
    "id": "18",
    "is_approved": 1,
    "is_listed": 1,
    "name": "John Doe",
    "payment_info": "payment information"
  },
  "subscription": {
    "id": "4b0ef5f5-a3cd-7a01-01cb-871f0b504143"
  }
}
''';
