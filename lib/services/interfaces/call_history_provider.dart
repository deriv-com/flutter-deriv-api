/// This interface provides stream of network payload that is going out(SENT)
///  and coming in(RECEIVED) to the application.
abstract class CallHistoryProvider {
  /// Stream of network payload that is going out(SENT) and coming in(RECEIVED)
  Stream<NetworkPayload> get stream;
}

/// Network payload that is going out and coming in from the web socket.
class NetworkPayload {
  /// Initializes [NetworkPayload] instance.
  NetworkPayload({
    required this.method,
    required this.body,
    required this.direction,
    required this.timeStamp,
  });

  /// name of the api.
  final String method;

  /// content of the api.
  final Object body;

  /// direction of the api i.e SENT or RECEIVED.
  final String direction;

  /// time of the api.
  final int timeStamp;
}
