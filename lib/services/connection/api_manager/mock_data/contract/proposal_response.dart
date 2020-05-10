/// Proposal response
const String proposalResponse = '''
{
  "echo_req": {
    "amount": 10,
    "basis": "stake",
    "contract_type": "PUT",
    "currency": "USD",
    "date_expiry": 1586448000,
    "duration_unit": "m",
    "passthrough": {
      "form_id": 12
    },
    "product_type": "basic",
    "proposal": 1,
    "req_id": 87,
    "symbol": "OTC_SSMI"
  },
  "msg_type": "proposal",
  "passthrough": {
    "form_id": 12
  },
  "proposal": {
    "ask_price": 10,
    "date_start": 1586335719,
    "display_value": "10.00",
    "id": "042922fe-5664-09e4-c3bf-b3bbe98f31db",
    "longcode": "Win payout if Swiss Index is strictly lower than entry spot at close on 2020-04-09.",
    "payout": 20.33,
    "spot": 9392.5,
    "spot_time": 1586335713
  },
  "req_id": 87
}
''';
