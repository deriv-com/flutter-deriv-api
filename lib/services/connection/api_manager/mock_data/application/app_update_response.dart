/// App update response
const String appUpdateResponse = '''
{
  "echo_req": {
    "app_update": 1234,
    "appstore": "https://itunes.apple.com/test_app",
    "github": "https://github.com/test_org/app",
    "googleplay": "https://play.google.com/store/apps/details?id=test.app",
    "homepage": "https://test.example.com/",
    "name": "Test Application",
    "redirect_uri": "https://test.example.com/redirect",
    "scopes": [
      "read",
      "trade"
    ],
    "verification_uri": "https://test.example.com/verify"
  },
  "app_update": {
    "app_id": 1234,
    "app_markup_percentage": 22.0,
    "appstore": "https://itunes.apple.com/test_app",
    "github": "https://github.com/test_org/app",
    "googleplay": "https://play.google.com/store/apps/details?id=test.app",
    "homepage": "https://test.example.com/",
    "name": "Test Application",
    "redirect_uri": "https://test.example.com/redirect",
    "verification_uri": "https://test.example.com/verify"
  },
  "msg_type": "app_update"
}
''';
