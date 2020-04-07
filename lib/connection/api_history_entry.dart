/// Represents a message sent or received via the webSockets connection
class ApiHistoryEntry {
  /// Initializes
  ApiHistoryEntry({this.timeStamp, this.method, this.message});

  /// time stamp when is created
  final int timeStamp;

  /// API call method
  final String method;

  /// content of sent or received message
  final Object message;
}
