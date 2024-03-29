/// Get self exclusive response
const String getSelfExclusiveResponse = '''
{
  "echo_req": {
    "get_self_exclusion": 1
  },
  "get_self_exclusion": {
  "exclude_until": "2020-01-01",
  "max_30day_deposit": 700000,
  "max_30day_losses": 100000,
  "max_30day_turnover": 1000,
  "max_7day_deposit": 700000,
  "max_7day_losses": 100000,
  "max_7day_turnover": 1000,
  "max_balance": 100000,
  "max_deposit": 1000,
  "max_deposit_end_date": "2020-02-01",
  "max_losses": 100000,
  "max_open_bets": 1000,
  "max_turnover": 1000,
  "session_duration_limit": 3600,
  "timeout_until": 1497357184
  },
  "msg_type": "get_self_exclusion"
}
''';
