/// Login history response
const String loginHistoryResponse = '''
{
  "echo_req": {
    "limit": 2,
    "login_history": 1
  },
  "login_history": [
    {
      "action": "login",
      "environment": "27-Apr-20 10:44:02GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN",
      "status": 1,
      "time": 1587984243
    },
    {
      "action": "login",
      "environment": "27-Apr-20 10:42:12GMT IP=x.x.x.x IP_COUNTRY=x User_AGENT=Mozilla/5.0 (Linux; Android 9; AOSP on IA Emulator Build/PSR1.180720.117) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36 LANG=EN",
      "status": 1,
      "time": 1587984133
    }
  ],
  "msg_type": "login_history"
}
''';
