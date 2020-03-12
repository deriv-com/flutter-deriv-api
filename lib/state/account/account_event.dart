part of 'account_bloc.dart';

/// Account events
abstract class AccountEvent {}

/// Fetch account event
class Fetch extends AccountEvent {
  @override
  String toString() => 'Account fetch event';
}

/// Switch user event
class SwitchUser extends AccountEvent {
  /// Class constructor
  SwitchUser({
    this.email,
  });

  /// User email
  final String email;

  @override
  String toString() => 'User switch event: $email';
}

/// Setting target currency event
class SetTargetCurrency extends AccountEvent {
  /// Class constructor
  SetTargetCurrency({
    this.targetCurrency,
  });

  /// account target currency
  final String targetCurrency;

  @override
  String toString() => 'Set user\'s targetCurrency: $targetCurrency';
}

/// logging out account event
class LogoutAccount extends AccountEvent {
  @override
  String toString() => 'LogoutAccount';
}

/// login account event
class LoginAccount extends AccountEvent {
  /// When the value of accounts is null,
  /// the app tries to use saved account in the secure storage.
  LoginAccount({this.accounts});

  /// Accounts list
  final List<Account> accounts;

  @override
  String toString() => 'LoginAccount';
}
