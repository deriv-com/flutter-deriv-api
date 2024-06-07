import 'dart:async';

import 'package:flutter_deriv_api/services/connection/call_manager/call_history_entry.dart';
import 'package:flutter_deriv_api/services/interfaces/call_history_provider.dart';

/// Provides storage for messages sent/received via the web socket connection
class CallHistory implements CallHistoryProvider {
  /// It initializes [CallHistory] instance.
  CallHistory() {
    _callHistoryBroadcaster = StreamController<NetworkPayload>.broadcast();
  }

  late final StreamController<NetworkPayload> _callHistoryBroadcaster;

  /// Messages that were sent to the remote endpoint
  final List<CallHistoryEntry> outgoing = <CallHistoryEntry>[];

  /// Messages that were received from the remote endpoint
  final List<CallHistoryEntry> incoming = <CallHistoryEntry>[];

  int _limit = 1024;

  /// Messages limit
  int get limit => _limit;

  set limit(int limit) {
    _limit = limit;

    _trimHistory(incoming);
    _trimHistory(outgoing);
  }

  /// Record a message that was received from the remote endpoint
  void pushIncoming({
    required int timestamp,
    required String method,
    required Object message,
  }) {
    incoming.add(
      CallHistoryEntry(timeStamp: timestamp, method: method, message: message),
    );
    if (!method.contains('ping')) {
      _callHistoryBroadcaster.add(
        NetworkPayload(
            method: method,
            body: message,
            direction: 'RECEIVED',
            timeStamp: timestamp),
      );
    }
    _trimHistory(incoming);
  }

  /// Record a message being sent to the remote endpoint
  void pushOutgoing({
    required int timestamp,
    required String method,
    required Object message,
  }) {
    outgoing.add(
      CallHistoryEntry(timeStamp: timestamp, method: method, message: message),
    );
    if (!method.contains('ping')) {
      _callHistoryBroadcaster.add(
        NetworkPayload(
            method: method,
            body: message,
            direction: 'SENT',
            timeStamp: timestamp),
      );
    }

    _trimHistory(outgoing);
  }

  /// Trim early entries from [CallHistory] if we exceed the current limit
  void _trimHistory(List<CallHistoryEntry> callHistory) {
    if (callHistory.length > limit) {
      callHistory.removeRange(0, callHistory.length - limit);
    }
  }

  @override
  Stream<NetworkPayload> get stream => _callHistoryBroadcaster.stream;
}
