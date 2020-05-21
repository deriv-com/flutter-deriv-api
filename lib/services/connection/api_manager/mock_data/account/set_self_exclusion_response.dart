/// Set self exclusive response
const String setSelfExclusiveResponse = '''
{
  "echo_req": {
    "exclude_until": "2020-01-01",
    "max_30day_losses": 100000,
    "max_30day_turnover": 1000,
    "max_7day_losses": 100000,
    "max_7day_turnover": 1000,
    "max_deposit": 1000,
    "max_deposit_end_date": "2020-01-01",
    "max_losses": 100000,
    "max_turnover": 1000,
    "session_duration_limit": 3600,
    "set_self_exclusion": 1,
    "timeout_until": 1497357184
  },
  "set_self_exclusion": 1,
  "msg_type": "set_self_exclusion"
}
''';
