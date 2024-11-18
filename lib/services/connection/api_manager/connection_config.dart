import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

/// [ConnectionCubit] configuration.
class ConnectionConfig {
  /// Initializes [ConnectionConfig].
  const ConnectionConfig({
    this.enableDebug = false,
    this.printResponse = false,
    this.proxyAwareConnection = false,
    this.callTimeout,
  });

  /// Enables debug mode.
  ///
  /// Default value is `false`.
  final bool enableDebug;

  /// Prints API response to console, only works if [enableDebug] is `true`.
  ///
  /// Default value is `false`.
  final bool printResponse;

  /// A flag to indicate if the connection is proxy aware.
  final bool proxyAwareConnection;

  /// The timeout duration for the API calls that are request/response model
  /// and are not subscription. The return type of these calls are [Future].
  ///
  /// If this duration is set, and the [call] method takes more than this
  /// duration to complete, it will throw a [TimeoutException].
  ///
  /// Since these are calls from a remote server and because of lack of
  /// connection or some other reason their future may never complete. This can
  /// cause the caller of the methods to wait indefinitely. To prevent this, we
  /// set a timeout duration for these calls.
  ///
  /// Default is `null` which means no timeout is considered.
  final Duration? callTimeout;
}
