import 'package:flutter_deriv_api/services/connection/call_manager/call_history_entry.dart';

/// Provides storage for messages sent/received via the web socket connection
class CallHistory {
  /// Messages that were sent to the remote endpoint
  final List<CallHistoryEntry> outgoing = <CallHistoryEntry>[];

  /// Messages that were received from the remote endpoint
  final List<CallHistoryEntry> incoming = <CallHistoryEntry>[];

  int _limit = 1024;

  /// Messages limit
  int get limit => _limit;

  set limit(int limit) {
    _limit = limit;

    trimIncoming();
    trimOutgoing();
  }

  /// Record a message that was received from the remote endpoint
  void pushIncoming({
    int timestamp,
    String method,
    Object message,
  }) {
    incoming.add(
      CallHistoryEntry(
        timeStamp: timestamp,
        method: method,
        message: message,
      ),
    );

    trimIncoming();
  }

  /// Record a message being sent to the remote endpoint
  void pushOutgoing({
    int timestamp,
    String method,
    Object message,
  }) {
    outgoing.add(
      CallHistoryEntry(
        timeStamp: timestamp,
        method: method,
        message: message,
      ),
    );

    trimOutgoing();
  }

  /// Trim early entries from [incoming] if we exceed the current limit
  void trimIncoming() {
    if (incoming.length >= limit) {
      incoming.removeRange(0, (limit - incoming.length) - 1);
    }
  }

  /// Trim early entries from [outgoing] if we exceed the current limit
  void trimOutgoing() {
    if (outgoing.length >= limit) {
      outgoing.removeRange(0, (limit - outgoing.length) - 1);
    }
  }
}
