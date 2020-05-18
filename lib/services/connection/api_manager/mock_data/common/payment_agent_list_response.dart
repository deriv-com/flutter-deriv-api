/// Payment agent list response
const String paymentAgentListResponse = '''
{
  "echo_req": {
    "paymentagent_list": "id"
  },
  "msg_type": "paymentagent_list",
  "paymentagent_list": {
    "available_countries": [
      [
        "id",
        "Indonesia"
      ],
      [
        "in",
        "India"
      ]
    ],
    "list": [
      {
        "currencies": "USD",
        "deposit_commission": "2",
        "email": "payme_a@gmail.com",
        "further_information": "Nothing",
        "max_withdrawal": "100",
        "min_withdrawal": "10",
        "name": "Bider",
        "paymentagent_loginid": "CR90000073",
        "summary": "nothgin",
        "supported_banks": "DiamondBank",
        "telephone": "0123456789",
        "url": "http://a.com",
        "withdrawal_commission": "5"
      },
      {
        "currencies": "USD",
        "deposit_commission": "0",
        "email": "dk@binary.com",
        "further_information": "Test ",
        "max_withdrawal": "1000",
        "min_withdrawal": "100",
        "name": "dkTest",
        "paymentagent_loginid": "CR90000000",
        "summary": "test",
        "supported_banks": "Maybank",
        "telephone": "+15123456789",
        "url": "",
        "withdrawal_commission": "0"
      }
    ]
  }
}
''';
