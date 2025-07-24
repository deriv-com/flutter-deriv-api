const String financialAssessmentQuestionsResponse = '''
{
  "echo_req": {
    "financial_assessment_questions": 1,
    "req_id": 3,
    "version": "v1"
  },
  "financial_assessment_questions": {
    "questions": {
      "account_turnover": {
        "answers": [
          {
            "hide_if": [],
            "key": "less_than_25000",
            "next_node": null,
            "value": "Less than \$25,000"
          }
        ],
        "hide_if": [],
        "question": "Anticipated annual turnover",
        "type": "single_choice"
      },
      "education_level": {
        "answers": [
          {
            "hide_if": [],
            "key": "primary",
            "next_node": "net_income",
            "value": "Primary"
          } 
        ],
        "hide_if": [],
        "question": "Education level",
        "type": "single_choice"
      },
      "employment_industry": {
        "answers": [
          {
            "hide_if": [],
            "key": "construction",
            "next_node": "occupation",
            "value": "Construction"
          }
        ],
        "hide_if": [],
        "question": "Industry of employment",
        "type": "single_choice"
      },
      "employment_status": {
        "answers": [
          {
            "hide_if": [],
            "key": "employed",
            "next_node": "employment_industry",
            "value": "Employed"
          }
        ],
        "hide_if": [],
        "question": "Employment status",
        "type": "single_choice"
      },
      "estimated_worth": {
        "answers": [
          {
            "hide_if": [],
            "key": "less_than_100000",
            "next_node": "account_turnover",
            "value": "Less than \$100,000"
          }
        ],
        "hide_if": [],
        "question": "Estimated net worth",
        "type": "single_choice"
      },
      "income_source": {
        "answers": [
          {
            "hide_if": [],
            "key": "salaried_employee",
            "next_node": "source_of_wealth",
            "value": "Salaried Employee"
          }
        ],
        "hide_if": [],
        "question": "Source of income",
        "type": "single_choice"
      },
      "net_income": {
        "answers": [
          {
            "hide_if": [],
            "key": "less_than_25000",
            "next_node": "estimated_worth",
            "value": "Less than \$25,000"
          }
        ],
        "hide_if": [],
        "question": "Net annual income",
        "type": "single_choice"
      },
      "occupation": {
        "answers": [
          {
            "hide_if": [],
            "key": "chief_executives",
            "next_node": "income_source",
            "value": "Chief Executives, Senior Officials and Legislators"
          }
        ],
        "hide_if": [],
        "question": "Occupation",
        "type": "single_choice"
      },
      "source_of_wealth": {
        "answers": [
          {
            "hide_if": [],
            "key": "income_savings",
            "next_node": "education_level",
            "value": "Accumulation of Income/Savings"
          }
        ],
        "hide_if": [],
        "question": "Source of Wealth",
        "type": "single_choice"
      }
    },
    "version": "v1"
  },
  "msg_type": "financial_assessment_questions",
  "req_id": 3
}
''';
