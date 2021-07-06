/// getAccountStatus Response
const String getAccountStatusResponse = '''{
  "echo_req": {
    "get_account_status": 1
  },
  "get_account_status": {
    "authentication": {
      "document": {
        "status": "none"
      },
      "identity": {
        "services": {
          "idv": {
            "last_rejected": [

            ],
            "reported_properties": {},
            "status": "none",
            "submissions_left": 0
          },
          "manual": {
            "status": "none"
          },
          "onfido": {
            "country_code": "ZAF",
            "documents_supported": [
              "Driving Licence",
              "National Identity Card",
              "Passport"
            ],
            "is_country_supported": 1,
            "last_rejected": [

            ],
            "reported_properties": {},
            "status": "none",
            "submissions_left": 3
          }
        },
        "status": "none"
      },
      "needs_verification": [

      ]
    },
    "currency_config": {
      "USD": {
        "is_deposit_suspended": 0,
        "is_withdrawal_suspended": 0
      }
    },
    "prompt_client_to_authenticate": 0,
    "risk_classification": "low",
    "status": [
      "allow_document_upload",
      "financial_information_not_complete",
      "trading_experience_not_complete",
      "trading_password_required"
    ]
  },
  "msg_type": "get_account_status"
}''';
