import 'package:flutter_deriv_api/utils/enum_helper.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';
import 'enums.dart';
import 'transfer_account_limitation_model.dart';

/// Currency information
class WebsiteStatusCurrencyConfigModel extends BaseModel {
  /// Initializes
  WebsiteStatusCurrencyConfigModel(
    this.code,
    this.fractionalDigits,
    this.isSuspended,
    this.name,
    this.stakeDefault,
    this.type,
    this.transferBetweenAccounts,
  );

  /// From Json
  factory WebsiteStatusCurrencyConfigModel.fromJson(
    String code,
    Map<String, dynamic> json,
  ) =>
      WebsiteStatusCurrencyConfigModel(
        code,
        json['fractional_digits'],
        getBool(json['is_suspended']),
        json['name'],
        json['stake_default']?.toDouble(),
        EnumHelper.getEnum(
          values: CurrencyType.values,
          name: json['type'],
        ),
        json['transfer_between_accounts'] == null
            ? null
            : TransferAccountLimitationModel.fromJson(
                json['transfer_between_accounts'],
              ),
      );

  /// Currency code
  final String code;

  /// Number of fractional digits.
  final int fractionalDigits;

  /// Current status for the currency
  final bool isSuspended;

  /// name
  final String name;

  /// Default stake value for the currency.
  final double stakeDefault;

  /// Type of the currency.
  final CurrencyType type;

  /// Fees and range of allowed amount for transfer between accounts with different types of currencies.
  final TransferAccountLimitationModel transferBetweenAccounts;

  /// Clones a new instance
  WebsiteStatusCurrencyConfigModel copyWith({
    String code,
    int fractionalDigits,
    bool isSuspended,
    String name,
    double stakeDefault,
    CurrencyType type,
    TransferAccountLimitationModel transferBetweenAccounts,
  }) =>
      WebsiteStatusCurrencyConfigModel(
        code ?? this.code,
        fractionalDigits ?? this.fractionalDigits,
        isSuspended ?? this.isSuspended,
        name ?? this.name,
        stakeDefault ?? this.stakeDefault,
        type ?? this.type,
        transferBetweenAccounts ?? this.transferBetweenAccounts,
      );
}
