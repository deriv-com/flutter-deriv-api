/// Cashier receive model class
abstract class CashierReceiveModel {
  /// Initializes
  CashierReceiveModel({
    @required this.cashier,
  });

  /// Possible error codes are:
  /// - `ASK_TNC_APPROVAL`: API call `tnc_approval`
  /// - `ASK_AUTHENTICATE`
  /// - `ASK_UK_FUNDS_PROTECTION`: API call `tnc_approval`
  /// - `ASK_CURRENCY`: API call `set_account_currency`
  /// - `ASK_EMAIL_VERIFY`: API call `verify_email`
  /// - `ASK_FIX_DETAILS`: API call `set_settings`
  final UNKNOWN_TYPE cashier;
}

/// Cashier receive class
class CashierReceive extends CashierReceiveModel {
  /// Initializes
  CashierReceive({
    @required UNKNOWN_TYPE cashier,
  }) : super(
          cashier: cashier,
        );

  /// Creates an instance from JSON
  factory CashierReceive.fromJson(Map<String, dynamic> json) => CashierReceive(
        cashier: json['cashier'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['cashier'] = cashier;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CashierReceive copyWith({
    UNKNOWN_TYPE cashier,
  }) =>
      CashierReceive(
        cashier: cashier ?? this.cashier,
      );
}
