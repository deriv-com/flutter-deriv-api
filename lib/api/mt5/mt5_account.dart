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
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// MT5 account class
class MT5Account extends MT5AccountModel {
  /// Initializes
  MT5Account({
    AccountType accountType,
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    int leverage,
    String login,
    MT5AccountType mt5AccountType,
    String name,
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  MT5Account copyWith({
    AccountType accountType,
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    int leverage,
    String login,
    MT5AccountType mt5AccountType,
    String name,
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

  /// This call creates new MT5 user, either demo or real money user.
  /// For parameters information refer to [Mt5NewAccountRequest].
  static Future<MT5Account> createNewAccount(
    Mt5NewAccountRequest request,
  ) async {
    final Mt5NewAccountResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw MT5Exception(message: response.error['message']);
    }

    return MT5Account.fromJson(response.mt5NewAccount);
  }

  /// Gets list of MT5 accounts for client.
  /// For parameters information refer to [Mt5LoginListRequest].
  static Future<List<MT5Account>> fetchLoginList(
    Mt5LoginListRequest request,
  ) async {
    final Mt5LoginListResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw MT5Exception(message: response.error['message']);
    }

    return getListFromMap(
      response.mt5LoginList,
      itemToTypeCallback: (dynamic item) => MT5Account.fromJson(item),
    );
  }

  /// This call allows deposit into MT5 account from binary account.
  Future<MT5Deposit> deposit({
    double amount,
    String fromBinary,
  }) =>
      MT5Deposit.deposit(
        Mt5DepositRequest(
          amount: amount,
          fromBinary: fromBinary,
          toMt5: login,
        ),
      );

  /// Changes password of the MT5 account.
  Future<MT5PasswordChange> changePassword({
    String newPassword,
    String oldPassword,
    PasswordType passwordType,
  }) =>
      MT5PasswordChange.changePassword(
        Mt5PasswordChangeRequest(
          login: login,
          newPassword: newPassword,
          oldPassword: oldPassword,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// This call validates the main password for the MT5 user.
  Future<MT5PasswordCheck> checkPassword({
    String password,
    PasswordType passwordType,
  }) =>
      MT5PasswordCheck.checkPassword(
        Mt5PasswordCheckRequest(
          login: login,
          password: password,
          passwordType: getStringFromEnum(passwordType),
        ),
      );

  /// Reset password of MT5 account.
  Future<MT5PasswordReset> resetPassword({
    String newPassword,
    PasswordType passwordType,
    String verificationCode,
  }) =>
      MT5PasswordReset.resetPassword(
        Mt5PasswordResetRequest(
          login: login,
          newPassword: newPassword,
          passwordType: getStringFromEnum(passwordType),
          verificationCode: verificationCode,
        ),
      );

  /// Get MT5 user account settings.
  Future<MT5Settings> fetchSettings() =>
      MT5Settings.fetchSettings(Mt5GetSettingsRequest(login: login));

  /// This call allows withdrawal from MT5 account to Binary account
  Future<MT5Withdrawal> withdraw({
    double amount,
    String toBinary,
  }) =>
      MT5Withdrawal.withdraw(
        Mt5WithdrawalRequest(
          amount: amount,
          fromMt5: login,
          toBinary: toBinary,
        ),
      );
}
