part of 'deriv_connection_bloc.dart';

@immutable
abstract class DerivConnectionState {}

class InitialDerivConnectionState extends DerivConnectionState {
  @override
  String toString() => 'InitialDerivConnectionState';
}

class Connecting extends DerivConnectionState {
  final BinaryAPI api;
  Connecting(this.api);

  @override
  String toString() => 'DerivConnectionState(Connecting)';
}

class Connected extends DerivConnectionState {
  final BinaryAPI api;
  final int serverTime;
  final int timeDifference;

  Connected(this.api, {this.serverTime})
      : timeDifference =
            serverTime != null ? serverTime - getCurrentLocalEpoch() : null;

  Connected copyWith({BinaryAPI api, int serverTime}) =>
      Connected(api ?? this.api, serverTime: serverTime ?? this.serverTime);

  @override
  String toString() =>
      'DerivConnectionState(Connected, serverTime: $serverTime, timeDifference: $timeDifference)';
}

class ConnectionError extends DerivConnectionState {
  /// An exception or message from the server
  final String error;

  ConnectionError(this.error);

  @override
  String toString() => 'DerivConnectionState(Error)';
}
