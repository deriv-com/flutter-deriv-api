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
        "further_resubmissions_allowed": 0,
        "services": {
          "onfido": {
            "documents_supported": [

            ],
            "is_country_supported": 0
          }
        },
        "status": "none"
      },
      "needs_verification": [

      ]
    },
    "experimental_suspended": {
      "USD": {
        "is_deposit_suspended": 0,
        "is_withdrawal_suspended": 0
      }
    },
    "prompt_client_to_authenticate": 0,
    "risk_classification": "low",
    "status": [
      "financial_information_not_complete",
      "trading_experience_not_complete"
    ]
  },
  "msg_type": "get_account_status"
}''';