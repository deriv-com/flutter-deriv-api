import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Account model class
class TransferAccountModel extends APIBaseModel {
  /// Initializes
  TransferAccountModel({
    this.accountType,
    this.balance,
    this.currency,
    this.loginId,
    this.mt5Group,
  });

  /// Generate an instance from JSON
  factory TransferAccountModel.fromJson(Map<String, dynamic> json) =>
      TransferAccountModel(
        accountType: getEnumFromString(
          values: TransferAccountType.values,
          name: json['account_type'],
        ),
        balance: json['balance'],
        currency: json['currency'],
        loginId: json['loginid'],
        mt5Group: json['mt5_group'],
      );

  /// Type of the account.
  final TransferAccountType accountType;

  /// Account balance.
  final String balance;

  /// Default account currency.
  final String currency;

  /// Client loginid.
  final String loginId;

  /// The group of mt5 account.
  final String mt5Group;

  /// Generate a copy of instance with given parameters
  TransferAccountModel copyWith({
    TransferAccountType accountType,
    String balance,
    String currency,
    String loginId,
    String mt5Group,
  }) =>
      TransferAccountModel(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        loginId: loginId ?? this.loginId,
        mt5Group: mt5Group ?? this.mt5Group,
      );
}
