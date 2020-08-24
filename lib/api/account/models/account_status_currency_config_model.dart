import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account Status CurrencyConfig Model class
class AccountStatusCurrencyConfigModel extends APIBaseModel {
  /// Initializes
  AccountStatusCurrencyConfigModel({
    this.currency,
    this.isDepositSuspended,
    this.isWithdrawalSuspended,
  });

  /// Creates instance from JSON
  factory AccountStatusCurrencyConfigModel.fromJson(
    String currency,
    Map<String, dynamic> json,
  ) =>
      AccountStatusCurrencyConfigModel(
        currency: currency,
        isDepositSuspended: getBool(json['is_deposit_suspended']),
        isWithdrawalSuspended: getBool(json['is_withdrawal_suspended']),
      );

  /// Currency code
  final String currency;

  /// Deposit is allowed for currency or not
  final bool isDepositSuspended;

  /// Withdrawal is allowed for currency or not
  final bool isWithdrawalSuspended;

  /// Creates a copy of instance with given parameters
  AccountStatusCurrencyConfigModel copyWith({
    String currency,
    bool isDepositSuspended,
    bool isWithdrawalSuspended,
  }) =>
      AccountStatusCurrencyConfigModel(
        currency: currency ?? this.currency,
        isDepositSuspended: isDepositSuspended ?? this.isDepositSuspended,
        isWithdrawalSuspended:
            isWithdrawalSuspended ?? this.isWithdrawalSuspended,
      );
}
