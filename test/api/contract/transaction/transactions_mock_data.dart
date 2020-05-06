const String transactionsJSON = '''{
  "echo_req": {
    "passthrough": {},
    "req_id": 8,
    "subscribe": 1,
    "transaction": 1
  },
  "msg_type": "transaction",
  "passthrough": {},
  "req_id": 8,
  "subscription": {
    "id": "9c3d0143-24ac-b8d9-c68b-06856b5f78d2"
  },
  "transaction": {
    "action": "sell",
    "amount": 0,
    "balance": 9654.38,
    "barrier": "S0P",
    "contract_id": 80072336728,
    "currency": "USD",
    "date_expiry": 1587626738,
    "display_name": "AUD/JPY",
    "id": "9c3d0143-24ac-b8d9-c68b-06856b5f78d2",
    "longcode": "Win payout if AUD/JPY is strictly higher than entry spot at 1 minute after contract start time.",
    "purchase_time": 1587626678,
    "symbol": "frxAUDJPY",
    "transaction_id": 160042962588,
    "transaction_time": 1587626739
  }
}''';