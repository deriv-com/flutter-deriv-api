/// Represents a message sent or received via the web sockets connection
class CallHistoryEntry {
  /// Initializes
  CallHistoryEntry({
    this.timeStamp,
    this.method,
    this.message,
  });

  /// Time stamp when is created
  final int? timeStamp;

  /// API call method
  final String? method;

  /// Content of sent or received message
  final Object? message;
}
