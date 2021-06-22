part of 'login_cubit.dart';

/// Login feature states
abstract class LoginState {
  /// Initializes login states.
  const LoginState();
}

/// Initial state.
class LoginInitialState extends LoginState {
  /// Initializes initial state.
  const LoginInitialState();
}

/// Get emitted whenever app authorized to login.
class AppAuthorizedState extends LoginState {
  /// Initializes AppAuthorized state.
  const AppAuthorizedState(this.info);

  /// Contains response of server for AppAuthorization request.
  final AppAuthorizationResponse info;
}

/// Get emitted whenever user Logged in.
class UserAuthorizedState extends LoginState {
  /// Initializes UserAuthorized state.
  const UserAuthorizedState(this.info);

  /// Contains information of authorized user.
  final LoginResponse info;
}

/// Loading state.
class LoginLoadingState extends LoginState {
  /// Initializes loading state.
  const LoginLoadingState();
}

/// LoginErrorState state.
class LoginErrorState extends LoginState {
  /// Initializes LoginError state.
  const LoginErrorState(this.errorMessage);

  /// Contains message of occurred error.
  final String errorMessage;
}
