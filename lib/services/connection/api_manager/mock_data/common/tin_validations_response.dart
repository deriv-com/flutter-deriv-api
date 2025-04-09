/// TIN Validation response mock data.
const String tinValidationsResponse = '''
{
  "echo_req": {
    "req_id": 4,
    "tax_residence": "ke",
    "tin_validations": 1
  },
  "msg_type": "tin_validations",
  "req_id": 4,
  "tin_validations": {
    "invalid_patterns": [
      "^(\d)\1*[a-zA-Z]?\$",
      "^(0?1?2?3?4?5?6?7?8?9?0?)[a-zA-Z]?\$",
      "^(0?9?8?7?6?5?4?3?2?1?0?)[a-zA-Z]?\$"
    ],
    "is_tin_mandatory": 0,
    "tin_employment_status_bypass": [
      
    ],
    "tin_format": [
      "^[A-Z]\d{9}[A-Z]\$"
    ]
  }
}
''';
