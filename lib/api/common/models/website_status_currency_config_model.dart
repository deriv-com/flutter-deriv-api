import 'package:flutter_deriv_api/api/common/models/transfer_account_limitation_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Currency information
class WebsiteStatusCurrencyConfigModel extends APIBaseModel {
  /// Initializes
  WebsiteStatusCurrencyConfigModel({
    this.code,
    this.fractionalDigits,
    this.isSuspended,
    this.name,
    this.stakeDefault,
    this.type,
    this.transferBetweenAccounts,
  });

  /// Generate an instance from JSON
  factory WebsiteStatusCurrencyConfigModel.fromJson(
    String? code,
    Map<String, dynamic> json,
  ) =>
      WebsiteStatusCurrencyConfigModel(
        code: code,
        fractionalDigits: json['fractional_digits'],
        isSuspended: getBool(json['is_suspended']),
        name: json['name'],
        stakeDefault: json['stake_default']?.toDouble(),
        type: getEnumFromString(
          values: CurrencyType.values,
          name: json['type'],
        ),
        transferBetweenAccounts: getItemFromMap(
          json['transfer_between_accounts'],
          itemToTypeCallback: (dynamic item) =>
              TransferAccountLimitationModel.fromJson(item),
        ),
      );

  /// Currency code
  final String? code;

  /// Number of fractional digits.
  final int? fractionalDigits;

  /// Current status for the currency
  final bool? isSuspended;

  /// name
  final String? name;

  /// Default stake value for the currency.
  final double? stakeDefault;

  /// Type of the currency.
  final CurrencyType? type;

  /// Fees and range of allowed amount for transfer between accounts with different types of currencies.
  final TransferAccountLimitationModel? transferBetweenAccounts;

  /// Generate a copy of instance with given parameters
  WebsiteStatusCurrencyConfigModel copyWith({
    String? code,
    int? fractionalDigits,
    bool? isSuspended,
    String? name,
    double? stakeDefault,
    CurrencyType? type,
    TransferAccountLimitationModel? transferBetweenAccounts,
  }) =>
      WebsiteStatusCurrencyConfigModel(
        code: code ?? this.code,
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
        isSuspended: isSuspended ?? this.isSuspended,
        name: name ?? this.name,
        stakeDefault: stakeDefault ?? this.stakeDefault,
        type: type ?? this.type,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
      );
}
