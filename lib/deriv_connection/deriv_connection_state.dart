part of 'deriv_connection_bloc.dart';

///
@immutable
abstract class DerivConnectionState {}

/// Initial state
class InitialDerivConnectionState extends DerivConnectionState {
  @override
  String toString() => 'InitialDerivConnectionState';
}

/// shows that we are in the process of connecting
class Connecting extends DerivConnectionState {
  ///
  Connecting(this.api);

  ///
  final BinaryAPI api;

  @override
  String toString() => 'DerivConnectionState(Connecting)';
}

/// connected state
class Connected extends DerivConnectionState {
  ///
  Connected(this.api, {this.serverTime})
      : timeDifference =
            serverTime != null ? serverTime - getCurrentLocalEpoch() : null;

  /// a reference of BinaryAPI is currently connected
  final BinaryAPI api;
  /// fetched server time
  final int serverTime;
  /// difference between [serverTime] and the time of the device
  final int timeDifference;

  ///
  Connected copyWith({BinaryAPI api, int serverTime}) =>
      Connected(api ?? this.api, serverTime: serverTime ?? this.serverTime);

  @override
  String toString() =>
      'DerivConnectionState(Connected, serverTime: $serverTime, timeDifference: $timeDifference)';
}

///
class ConnectionError extends DerivConnectionState {
  ///
  ConnectionError(this.error);

  /// An exception or message from the server
  final String error;


  @override
  String toString() => 'DerivConnectionState(Error)';
}
