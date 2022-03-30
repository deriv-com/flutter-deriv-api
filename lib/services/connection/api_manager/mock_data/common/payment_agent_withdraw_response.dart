/// Payment agent withdraw response
const String paymentAgentWithdrawResponse = '''
{
  "echo_req": {
    "amount": 1000,
    "currency": "USD",
    "paymentagent_loginid": "CR100001",
    "paymentagent_withdraw": 1,
    "verification_code": "verification_code"
  },
  "paymentagent_withdraw": 1,
  "paymentagent_name": "John Doe",
  "transaction_id": 45735309,
  "msg_type": "paymentagent_withdraw"
}
''';
