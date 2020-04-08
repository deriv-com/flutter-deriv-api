/// Represents a message sent or received via the web sockets connection
class APIHistoryEntry {
  /// Class constructor
  APIHistoryEntry({
    this.timeStamp,
    this.method,
    this.message,
  });

  /// time stamp when is created
  final int timeStamp;

  /// API call method
  final String method;

  /// content of sent or received message
  final Object message;
}
