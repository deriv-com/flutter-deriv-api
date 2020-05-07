/// Proposal response
const String proposalResponse = '''
{
  "echo_req": {
    "amount": 100,
    "barrier": "+0.1",
    "basis": "payout",
    "contract_type": "CALL",
    "currency": "USD",
    "duration": 60,
    "duration_unit": "s",
    "product_type": "basic",
    "proposal": 1,
    "symbol": "R_100"
  },
  "msg_type": "proposal",
  "proposal": {
    "ask_price": 50.8,
    "date_start": 1588773056,
    "display_value": "50.80",
    "id": "74cbf26f-f9a6-f29d-fdee-bc35d49701cb",
    "longcode": "Win payout if Volatility 100 Index is strictly higher than entry spot plus 0.10 at 1 minute after contract start time.",
    "payout": 100,
    "spot": 7929.93,
    "spot_time": 1588773056
  }
}
''';
