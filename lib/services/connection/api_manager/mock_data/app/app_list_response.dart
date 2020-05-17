/// App list response
const String appListResponse = '''
{
  "app_list": [
    {
      "app_id": 1234,
      "app_markup_percentage": 22.0,
      "appstore": "https://itunes.apple.com/test_app",
      "github": "https://github.com/test_org/app",
      "googleplay": "https://play.google.com/store/apps/details?id=test.app",
      "homepage": "https://test.example.com/",
      "name": "Test Application",
      "redirect_uri": "https://test.example.com/redirect",
      "verification_uri": "https://test.example.com/verify"
    }
  ],
  "echo_req": {
    "app_list": 1
  },
  "msg_type": "app_list"
}
''';
