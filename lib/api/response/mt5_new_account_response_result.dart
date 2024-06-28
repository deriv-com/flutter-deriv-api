// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/mt5_deposit_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_get_settings_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_password_change_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_password_check_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_password_reset_response_result.dart';
import 'package:flutter_deriv_api/api/response/mt5_withdrawal_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_deposit_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_get_settings_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_new_account_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_new_account_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_change_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_check_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_password_reset_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/mt5_withdrawal_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Mt5 new account response model class.
abstract class Mt5NewAccountResponseModel {
  /// Initializes Mt5 new account response model class .
  const Mt5NewAccountResponseModel({
    this.mt5NewAccount,
  });

  /// New MT5 account details
  final Mt5NewAccount? mt5NewAccount;
}

/// Mt5 new account response class.
class Mt5NewAccountResponse extends Mt5NewAccountResponseModel {
  /// Initializes Mt5 new account response class.
  const Mt5NewAccountResponse({
    super.mt5NewAccount,
  });

  /// Creates an instance from JSON.
  factory Mt5NewAccountResponse.fromJson(
    dynamic mt5NewAccountJson,
  ) =>
      Mt5NewAccountResponse(
        mt5NewAccount: mt5NewAccountJson == null
            ? null
            : Mt5NewAccount.fromJson(mt5NewAccountJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5NewAccount != null) {
      resultMap['mt5_new_account'] = mt5NewAccount!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Creates new MT5 user, either demo or real money user.
  ///
  /// For parameters information refer to [Mt5NewAccountRequest].
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<Mt5NewAccountResponse> createNewAccount(
    Mt5NewAccountRequest request,
  ) async {
    final Mt5NewAccountReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return Mt5NewAccountResponse.fromJson(response.mt5NewAccount);
  }

  /// Allows deposit into MT5 account from binary account.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5DepositResponse> deposit({
    required double amount,
    required String fromBinary,
  }) =>
      Mt5DepositResponse.deposit(
        Mt5DepositRequest(
          amount: amount,
          fromBinary: fromBinary,
          toMt5: mt5NewAccount?.login,
        ),
      );

  /// Changes password of the MT5 account.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5PasswordChangeResponse> changePassword({
    required String newPassword,
    required String oldPassword,
    required PasswordType passwordType,
  }) =>
      Mt5PasswordChangeResponse.changePassword(
        Mt5PasswordChangeRequest(
          login: mt5NewAccount?.login,
          newPassword: newPassword,
          oldPassword: oldPassword,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// Validates the main password for the MT5 user.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5PasswordCheckResponse> checkPassword({
    required String password,
    required PasswordType passwordType,
  }) =>
      Mt5PasswordCheckResponse.checkPassword(
        Mt5PasswordCheckRequest(
          login: mt5NewAccount?.login,
          password: password,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// Resets the password of MT5 account.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5PasswordResetResponse> resetPassword({
    required String newPassword,
    required PasswordType passwordType,
    required String verificationCode,
  }) =>
      Mt5PasswordResetResponse.resetPassword(
        Mt5PasswordResetRequest(
          login: mt5NewAccount?.login,
          newPassword: newPassword,
          passwordType: getStringFromEnum(passwordType),
          verificationCode: verificationCode,
        ),
      );

  /// Gets the MT5 user account settings.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5GetSettingsResponse> fetchSettings() =>
      Mt5GetSettingsResponse.fetchSettings(
          Mt5GetSettingsRequest(login: mt5NewAccount?.login));

  /// Allows withdrawal from MT5 account to Binary account.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<Mt5WithdrawalResponse> withdraw({
    required double amount,
    required String toBinary,
  }) =>
      Mt5WithdrawalResponse.withdraw(
        Mt5WithdrawalRequest(
          amount: amount,
          fromMt5: mt5NewAccount?.login,
          toBinary: toBinary,
        ),
      );

  /// Creates a copy of instance with given parameters.
  Mt5NewAccountResponse copyWith({
    Mt5NewAccount? mt5NewAccount,
  }) =>
      Mt5NewAccountResponse(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
      );
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "demo": AccountTypeEnum.demo,
  "gaming": AccountTypeEnum.gaming,
  "financial": AccountTypeEnum.financial,
  "all": AccountTypeEnum.all,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// demo.
  demo,

  /// gaming.
  gaming,

  /// financial.
  financial,

  /// all.
  all,
}

/// Mt5AccountCategoryEnum mapper.
final Map<String, Mt5AccountCategoryEnum> mt5AccountCategoryEnumMapper =
    <String, Mt5AccountCategoryEnum>{
  "conventional": Mt5AccountCategoryEnum.conventional,
  "swap_free": Mt5AccountCategoryEnum.swapFree,
};

/// Mt5AccountCategory Enum.
enum Mt5AccountCategoryEnum {
  /// conventional.
  conventional,

  /// swap_free.
  swapFree,
}

/// Mt5AccountTypeEnum mapper.
final Map<String, Mt5AccountTypeEnum> mt5AccountTypeEnumMapper =
    <String, Mt5AccountTypeEnum>{
  "financial": Mt5AccountTypeEnum.financial,
  "financial_stp": Mt5AccountTypeEnum.financialStp,
  "standard": Mt5AccountTypeEnum.standard,
};

/// Mt5AccountType Enum.
enum Mt5AccountTypeEnum {
  /// financial.
  financial,

  /// financial_stp.
  financialStp,

  /// standard.
  standard,
}

/// Mt5 new account model class.
abstract class Mt5NewAccountModel {
  /// Initializes Mt5 new account model class .
  const Mt5NewAccountModel({
    this.accountType,
    this.agent,
    this.balance,
    this.currency,
    this.displayBalance,
    this.login,
    this.mt5AccountCategory,
    this.mt5AccountType,
  });

  /// Account type.
  final AccountTypeEnum? accountType;

  /// Agent Details.
  final String? agent;

  /// Account balance.
  final double? balance;

  /// MT5 account currency (`USD` or `EUR`) that depends on the MT5 company (`vanuatu`, `svg`, `malta`).
  final String? currency;

  /// Account balance, formatted to appropriate decimal places.
  final String? displayBalance;

  /// Login ID of the user's new MT5 account. Login could have 2 types of prefixes: MTD, MTR. MTD - for demo accounts and MTR for real money accounts.
  final String? login;

  /// With default value of conventional, unavailable for `financial_stp` sub account type.
  final Mt5AccountCategoryEnum? mt5AccountCategory;

  /// Sub account type for classic MT5 account.
  final Mt5AccountTypeEnum? mt5AccountType;
}

/// Mt5 new account class.
class Mt5NewAccount extends Mt5NewAccountModel {
  /// Initializes Mt5 new account class.
  const Mt5NewAccount({
    super.accountType,
    super.agent,
    super.balance,
    super.currency,
    super.displayBalance,
    super.login,
    super.mt5AccountCategory,
    super.mt5AccountType,
  });

  /// Creates an instance from JSON.
  factory Mt5NewAccount.fromJson(Map<String, dynamic> json) => Mt5NewAccount(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        agent: json['agent'],
        balance: getDouble(json['balance']),
        currency: json['currency'],
        displayBalance: json['display_balance'],
        login: json['login'],
        mt5AccountCategory: json['mt5_account_category'] == null
            ? null
            : mt5AccountCategoryEnumMapper[json['mt5_account_category']],
        mt5AccountType: json['mt5_account_type'] == null
            ? null
            : mt5AccountTypeEnumMapper[json['mt5_account_type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['agent'] = agent;
    resultMap['balance'] = balance;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['login'] = login;
    resultMap['mt5_account_category'] = mt5AccountCategoryEnumMapper.entries
        .firstWhere((MapEntry<String, Mt5AccountCategoryEnum> entry) =>
            entry.value == mt5AccountCategory)
        .key;
    resultMap['mt5_account_type'] = mt5AccountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, Mt5AccountTypeEnum> entry) =>
            entry.value == mt5AccountType)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5NewAccount copyWith({
    AccountTypeEnum? accountType,
    String? agent,
    double? balance,
    String? currency,
    String? displayBalance,
    String? login,
    Mt5AccountCategoryEnum? mt5AccountCategory,
    Mt5AccountTypeEnum? mt5AccountType,
  }) =>
      Mt5NewAccount(
        accountType: accountType ?? this.accountType,
        agent: agent ?? this.agent,
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        login: login ?? this.login,
        mt5AccountCategory: mt5AccountCategory ?? this.mt5AccountCategory,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
      );
}
