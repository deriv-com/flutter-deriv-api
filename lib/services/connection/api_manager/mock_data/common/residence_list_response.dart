/// ResidenceList Response
const String residenceListResponse = '''{
  "echo_req": {
    "req_id": 2,
    "residence_list": 1
  },
  "msg_type": "residence_list",
  "req_id": 2,
  "residence_list": [
    {
      "common_reporting_standard": {
        "non_participating_jurisdictions": {
          "default": false,
          "landing_company": {
            "bvi": true,
            "labuan": true,
            "vanuatu": true
          }
        },
        "postcode": {
          "invalid_pattern": null
        },
        "tax": {
          "mandatory": false,
          "poi_equivalent": false,
          "tin_cleaner": "[.\-\/\s]",
          "tin_format": [
            "^[FfEe]-\d{6}-[A-Za-z]\$"
          ],
          "tin_format_description": null
        }
      },
      "identity": {
        "services": {
          "idv": {
            "documents_supported": {
              
            },
            "has_visual_sample": 0,
            "is_country_supported": 0
          },
          "onfido": {
            "documents_supported": {
              "driving_licence": {
                "display_name": "Driving Licence"
              }
            },
            "is_country_supported": 0
          }
        }
      },
      "jurisdiction_risk_assessment": {
        "disclaimer": {
          "accept": false,
          "message": ""
        },
        "risk_level": {
          "default": "low",
          "landing_company": {
            "bvi": "low",
            "labuan": "low",
            "vanuatu": "standard"
          }
        },
        "turnover": {
          "max_limit": false
        }
      },
      "disabled": "DISABLED",
      "phone_idd": "35818",
      "text": "Aland Islands",
      "value": "ax",
      "wallet_signup": 0,
      "partner_signup": 0,
      "account_opening_self_declaration_required": 0
    }
  ]
}''';
