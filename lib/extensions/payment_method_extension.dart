import 'package:flutter_deriv_api/enums.dart';

/// Payment method extensions
extension PaymentMethodExtension on PaymentMethod {
  /// Class constructor
  static const Map<PaymentMethod, String> methodsDisplay =
      <PaymentMethod, String>{
    PaymentMethod.bankTransfer: 'Bank transfer',
  };

  /// Get payment method code
  static const Map<PaymentMethod, String> methodsCode = <PaymentMethod, String>{
    PaymentMethod.bankTransfer: 'bank_transfer',
  };

  /// Get payment method display name
  String get methodDisplay => methodsDisplay[this];

  /// Get payment method code
  String get methodCode => methodsCode[this];
}
