/// Set financial assessment response
const String setFinancialAssessmentResponse = '''
{
  "echo_req": {
    "account_turnover": "Less than \$25,000",
    "binary_options_trading_experience": "1-2 years",
    "binary_options_trading_frequency": "40 transactions or more in the past 12 months",
    "cfd_trading_experience": "Over 3 years",
    "cfd_trading_frequency": "6-10 transactions in the past 12 months",
    "education_level": "Secondary",
    "employment_industry": "Finance",
    "employment_status": "Self-Employed",
    "estimated_worth": "\$100,000 - \$250,000",
    "forex_trading_experience": "Over 3 years",
    "forex_trading_frequency": "0-5 transactions in the past 12 months",
    "income_source": "Self-Employed",
    "net_income": "\$25,000 - \$50,000",
    "occupation": "Managers",
    "other_instruments_trading_experience": "Over 3 years",
    "other_instruments_trading_frequency": "6-10 transactions in the past 12 months",
    "set_financial_assessment": 1,
    "source_of_wealth": "Company Ownership"
  },
  "msg_type": "set_financial_assessment",
  "set_financial_assessment": {
    "cfd_score": 926,
    "financial_information_score": 751,
    "total_score": 921,
    "trading_score": 460
  },
  "req_id": 32
}
''';
