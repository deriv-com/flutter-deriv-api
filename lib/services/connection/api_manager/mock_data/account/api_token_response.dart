/// API token response
const String apiTokenResponse = '''
{
  "api_token": {
    "delete_token": 1,
    "new_token": 1,
    "tokens": [
      {
        "display_name": "sample token",
        "last_used": "2020-01-11",
        "scopes": ["read", "trading_information"],
        "token": "thisIsASampleTOKEN123",
        "valid_for_ip": "178.32.12.45"
      }
    ]
  },
  "msg_type": "api_token"
}
''';
