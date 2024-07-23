/// App markup details response
const String appMarkupDetailsResponse = '''
{
  "echo_req": {
    "app_id": 1234,
    "app_markup_details": 1,
    "client_loginid": "CR12345",
    "date_from": "2017-08-01 00:00:00",
    "date_to": "2017-08-31 23:59:59",
    "description": 1,
    "limit": 100,
    "offset": 0,
    "passthrough": {},
    "req_id": 3,
    "sort": "ASC",
    "sort_fields": [
      "app_id",
      "client_loginid",
      "transaction_time"
    ]
  },
  "app_markup_details": {
    "transactions": [
      {
        "app_id": 1234,
        "app_markup": 15.0,
        "app_markup_usd": 25.0,
        "app_markup_value": 12.0,
        "client_currcode": "USD",
        "client_loginid": "CR12345",
        "dev_currcode": "USD",
        "dev_loginid": "CR45627",
        "transaction_id": 10867502908,
        "transaction_time": "1587544006"
      }
    ]
  },
  "msg_type": "app_markup_details"
}
''';
