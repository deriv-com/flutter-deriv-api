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
  WebsiteStatusCurrencyConfigModel.fromJson(this.code, Map<String, dynamic> item)
      : fractionalDigits = item['fractional_digits'],
        isSuspended = getBool(item['is_suspended']),
        name = item['name'],
        stakeDefault = item['stake_default'] != null
            ? item['stake_default'].toDouble()
            : null,
        type = item['type'] != null
            ? (item['type'] == 'fiat' ? CurrencyType.fiat : CurrencyType.crypto)
            : null,
        transferBetweenAccounts = item['transfer_between_accounts'] != null
            ? TransferAccountLimitationModel.fromJson(
                item['transfer_between_accounts'])
            : null;

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
