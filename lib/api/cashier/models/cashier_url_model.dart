import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Cashier URL
class CashierURLModel extends APIBaseModel {
  /// Initializes
  CashierURLModel({
    this.cashierURL,
  });

  /// Generates an instance from JSON
  factory CashierURLModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CashierURLModel(
        cashierURL: json['cashier'],
      );

  /// Cashier URL. Note: possible error codes are: ASK_TNC_APPROVAL
  /// (API tnc_approval), ASK_AUTHENTICATE, ASK_UK_FUNDS_PROTECTION
  /// (API tnc_approval), ASK_CURRENCY (API set_account_currency),
  /// ASK_EMAIL_VERIFY (verify_email), ASK_FIX_DETAILS (API set_settings).
  final String cashierURL;

  /// Creates a copy with given parameters
  CashierURLModel copyWith({
    String cashierURL,
  }) =>
      CashierURLModel(
        cashierURL: cashierURL ?? this.cashierURL,
      );
}
