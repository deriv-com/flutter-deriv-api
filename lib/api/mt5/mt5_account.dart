import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/mt5/exceptions/mt5_exception.dart';
import 'package:flutter_deriv_api/api/mt5/models/mt5_account_model.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_deposit.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_change.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_check.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_password_reset.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_settings.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_withdrawal.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// MT5 account class
class MT5Account extends MT5AccountModel {
  /// Initializes
  MT5Account({
    AccountType? accountType,
    double? balance,
    String? country,
    String? currency,
    String? displayBalance,
    String? email,
    String? group,
    int? leverage,
    String? login,
    MT5AccountType? mt5AccountType,
    String? name,
  }) : super(
          accountType: accountType,
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          mt5AccountType: mt5AccountType,
          name: name,
        );

  /// Creates an instance from JSON
  factory MT5Account.fromJson(Map<String, dynamic> json) => MT5Account(
        accountType: getEnumFromString(
          values: AccountType.values,
          name: json['account_type'],
        ),
        balance: json['balance'],
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        leverage: json['leverage'],
        login: json['login'],
        mt5AccountType: getEnumFromString(
          values: MT5AccountType.values,
          name: json['mt5_account_type'],
        ),
        name: json['name'],
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5Account copyWith({
    AccountType? accountType,
    double? balance,
    String? country,
    String? currency,
    String? displayBalance,
    String? email,
    String? group,
    int? leverage,
    String? login,
    MT5AccountType? mt5AccountType,
    String? name,
  }) =>
      MT5Account(
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        mt5AccountType: mt5AccountType ?? this.mt5AccountType,
        name: name ?? this.name,
      );

  /// Creates new MT5 user, either demo or real money user.
  ///
  /// For parameters information refer to [Mt5NewAccountRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<MT5Account> createNewAccount(
    Mt5NewAccountRequest request,
  ) async {
    final Mt5NewAccountResponse response =
        await _api!.call<Mt5NewAccountResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return MT5Account.fromJson(response.mt5NewAccount!);
  }

  /// Gets the list of MT5 accounts for client.
  ///
  /// For parameters information refer to [Mt5LoginListRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<List<MT5Account?>?> fetchLoginList(
    Mt5LoginListRequest request,
  ) async {
    final Mt5LoginListResponse response =
        await _api!.call<Mt5LoginListResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return getListFromMap(
      response.mt5LoginList,
      itemToTypeCallback: (dynamic item) => MT5Account.fromJson(item),
    );
  }

  /// Allows deposit into MT5 account from binary account.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5Deposit> deposit({
    required double amount,
    required String fromBinary,
  }) =>
      MT5Deposit.deposit(
        Mt5DepositRequest(
          amount: amount,
          fromBinary: fromBinary,
          toMt5: login!,
        ),
      );

  /// Changes password of the MT5 account.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5PasswordChange> changePassword({
    required String newPassword,
    required String oldPassword,
    PasswordType? passwordType,
  }) =>
      MT5PasswordChange.changePassword(
        Mt5PasswordChangeRequest(
          login: login!,
          newPassword: newPassword,
          oldPassword: oldPassword,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// Validates the main password for the MT5 user.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5PasswordCheck> checkPassword({
    required String password,
    PasswordType? passwordType,
  }) =>
      MT5PasswordCheck.checkPassword(
        Mt5PasswordCheckRequest(
          login: login!,
          password: password,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// Resets the password of MT5 account.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5PasswordReset> resetPassword({
    required String newPassword,
    required String verificationCode,
    PasswordType? passwordType,
  }) =>
      MT5PasswordReset.resetPassword(
        Mt5PasswordResetRequest(
          login: login!,
          newPassword: newPassword,
          passwordType: getStringFromEnum(passwordType),
          verificationCode: verificationCode,
        ),
      );

  /// Gets the MT5 user account settings.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5Settings> fetchSettings() =>
      MT5Settings.fetchSettings(Mt5GetSettingsRequest(login: login!));

  /// Allows withdrawal from MT5 account to Binary account.
  ///
  /// Throws a [MT5Exception] if API response contains an error
  Future<MT5Withdrawal> withdraw({
    required double amount,
    required String toBinary,
  }) =>
      MT5Withdrawal.withdraw(
        Mt5WithdrawalRequest(
          amount: amount,
          fromMt5: login!,
          toBinary: toBinary,
        ),
      );
}
