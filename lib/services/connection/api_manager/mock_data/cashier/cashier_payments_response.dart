import 'package:flutter_deriv_api/api/response/cashier_payments_response_result.dart';

/// The mock data for [CashierPaymentsResponse].
const String cashierPaymentsResponse = '''
{
  "cashier_payments": {
    "crypto": [
      {
        "address_hash": "addressHash",
        "address_url": "addressUrl",
        "id": "id",
        "status_code": "CANCELLED",
        "status_message": "statusMessage",
        "transaction_type": "deposit",
        "amount": 1,
        "confirmations": 1,
        "is_valid_to_cancel": true,
        "submit_date": 1695118224,
        "transaction_hash": "transactionHash",
        "transaction_url": "transactionUrl"
      }
    ]
  },
  "msg_type": "cashier_payments",
  "req_id": 681
}
''';
