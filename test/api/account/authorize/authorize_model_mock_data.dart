const String authorizeModelMockData = '''
{
  "authorize": {
    "account_list": [
      {
        "currency": "USD",
        "excluded_until": 1587486726,
        "is_disabled": 0,
        "is_virtual": 0,
        "landing_company_name": "svg",
        "loginid": "CR90000028"
      },
      {
        "currency": "USD",
        "excluded_until": 1587486726,
        "is_disabled": 0,
        "is_virtual": 1,
        "landing_company_name": "virtual",
        "loginid": "VRTC90000028"
      }
    ],
    "balance": 10000,
    "country": "za",
    "currency": "USD",
    "email": "test@site.com",
    "fullname": "Ms QA script testSTX",
    "is_virtual": 0,
    "landing_company_fullname": "Binary (SVG) Ltd.",
    "landing_company_name": "svg",
    "local_currencies": {
      "ZAR": {
        "fractional_digits": 2
      },
      "USD": {
        "fractional_digits": 3
      }
    },
    "loginid": "CR90000028",
    "scopes": [
      "read",
      "trade",
      "payments",
      "admin"
    ],
    "upgradeable_landing_companies": [
      "svg"
    ],
    "user_id": 29
  },
  "echo_req": {
    "authorize": "<not shown>"
  },
  "msg_type": "authorize"
}
''';
