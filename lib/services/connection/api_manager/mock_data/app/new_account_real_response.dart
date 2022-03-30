/// New account real response
const String newAccountRealResponse = '''
{
  "echo_req": {
    "account_opening_reason": "Speculative",
    "account_turnover": "Less than \$25,000",
    "address_city": "Melbourne",
    "address_line_1": "20 Broadway Av",
    "address_line_2": "East Melbourne VIC",
    "address_postcode": "3002",
    "address_state": "Victoria",
    "date_of_birth": "1980-01-31",
    "first_name": "Peter",
    "last_name": "Pan",
    "new_account_real": 1,
    "non_pep_declaration": 1,
    "phone": "+6123456789",
    "place_of_birth": "id",
    "residence": "au",
    "salutation": "Mr",
    "secret_answer": "<not shown>",
    "secret_question": "Mother's maiden name",
    "tax_identification_number": "012142545",
    "tax_residence": "ar,sg"
  },
  "new_account_real": {
    "client_id": "CR0000",
    "landing_company": "landing_company",
    "landing_company_short": "landing_company_short",
    "oauth_token": "sample_token",
    "refresh_token": "refresh_token"
  },
  "msg_type": "new_account_real"
}
''';
