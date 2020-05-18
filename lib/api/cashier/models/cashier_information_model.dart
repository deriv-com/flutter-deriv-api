import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Cashier information model class
abstract class CashierInformationModel extends APIBaseModel {
  /// Initializes
  CashierInformationModel({
    this.cashierURL,
  });

  /// Cashier URL. Note: possible error codes are: ASK_TNC_APPROVAL
  /// (API tnc_approval), ASK_AUTHENTICATE, ASK_UK_FUNDS_PROTECTION
  /// (API tnc_approval), ASK_CURRENCY (API set_account_currency),
  /// ASK_EMAIL_VERIFY (verify_email), ASK_FIX_DETAILS (API set_settings).
  final String cashierURL;
}
