import 'package:test/test.dart';

import 'package:flutter_deriv_api/services/connection/call_manager/call_history_entry.dart';

void main() {
  group('CallHistoryEntry tests =>', () {
    test('initialization with values.', () {
      const int timeStamp = 1621188000;
      const String method = 'test';

      final Map<String, dynamic> message = <String, dynamic>{
        'content': 'Hello'
      };

      final CallHistoryEntry entry = CallHistoryEntry(
        timeStamp: timeStamp,
        method: method,
        message: message,
      );

      expect(entry.timeStamp, equals(timeStamp));
      expect(entry.method, equals(method));
      expect(entry.message, equals(message));
    });

    test('initialization with null values.', () {
      final CallHistoryEntry entry = CallHistoryEntry();

      expect(entry.timeStamp, isNull);
      expect(entry.method, isNull);
      expect(entry.message, isNull);
    });
  });
}
