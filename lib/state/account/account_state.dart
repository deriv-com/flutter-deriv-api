part of 'account_bloc.dart';

/// Account states
abstract class AccountState {}

/// Represents initial creation when we have not yet attempted to retrieve
/// anything.
class InitialAccountState extends AccountState {
  @override
  String toString() => 'InitialAccountState';
}

/// Something went wrong when trying to get the accounts. Possible cases include:
/// - no network connection
/// - failed login
/// - user has no active accounts
class AccountError extends AccountState {
  /// Class constructor
  AccountError({
    this.error,
  });

  /// Api error
  final APIError error;

  @override
  String toString() => 'AccountError';
}

/// Account loaded state
class AccountLoaded extends AccountState {
  /// Class constructor
  AccountLoaded({
    this.accounts,
    this.accountInfo,
    this.advertiserInfo,
    this.localCurrencyConfig,
    this.defaultUser,
    this.defaultAccount,
    this.otherUsers,
  });

  /// List of accounts
  final List<Account> accounts;

  /// Account information
  final Map<String, dynamic> accountInfo;

  /// Advertiser information
  final Advertiser advertiserInfo;

  /// Default user
  final String defaultUser;

  /// Default account
  final String defaultAccount;

  /// Local currency config
  final Map<String, dynamic> localCurrencyConfig;

  /// Other users
  final List<String> otherUsers;

  /// Get account currency
  String get accountCurrency =>
      accountInfo != null ? accountInfo['currency'] : null;

  /// Get local currency
  String get localCurrency => localCurrencyConfig?.keys?.first;

  /// Update desired class fields
  AccountLoaded copyWith({
    List<Account> accounts,
    Map<String, dynamic> accountInfo,
    Advertiser advertiserInfo,
    Map<String, int> localCurrencyConfig,
    String defaultUser,
    String defaultAccount,
    List<String> otherUsers,
  }) =>
      AccountLoaded(
        accounts: accounts ?? this.accounts,
        accountInfo: accountInfo ?? this.accountInfo,
        advertiserInfo: advertiserInfo ?? this.advertiserInfo,
        localCurrencyConfig: localCurrencyConfig ?? this.localCurrencyConfig,
        defaultUser: defaultUser ?? this.defaultUser,
        defaultAccount: defaultAccount ?? this.defaultAccount,
        otherUsers: otherUsers ?? this.otherUsers,
      );

  @override
  String toString() => 'AccountLoaded(accounts: ${accounts.length})';
}

/// Loading account state
class LoadingAccount extends AccountState {
  @override
  String toString() => 'LoadingAccount';
}
