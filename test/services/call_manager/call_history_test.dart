import 'package:test/test.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/call_history.dart';

void main() {
  group('CallHistory tests =>', () {
    late CallHistory callHistory;

    setUp(() {
      callHistory = CallHistory();
    });

    test('test pushIncoming method.', () {
      const int timestamp = 1621188000;
      const String method = 'test';

      final Map<String, dynamic> message = <String, dynamic>{
        'content': 'Hello'
      };

      callHistory.pushIncoming(
        timestamp: timestamp,
        method: method,
        message: message,
      );

      expect(callHistory.incoming.length, equals(1));
      expect(callHistory.incoming.first.timeStamp, equals(timestamp));
      expect(callHistory.incoming.first.method, equals(method));
      expect(callHistory.incoming.first.message, equals(message));
    });

    test('test pushOutgoing method.', () {
      const int timestamp = 1621188000;
      const String method = 'test';

      final Map<String, dynamic> message = <String, dynamic>{
        'content': 'World'
      };

      callHistory.pushOutgoing(
        timestamp: timestamp,
        method: method,
        message: message,
      );

      expect(callHistory.outgoing.length, equals(1));
      expect(callHistory.outgoing.first.timeStamp, equals(timestamp));
      expect(callHistory.outgoing.first.method, equals(method));
      expect(callHistory.outgoing.first.message, equals(message));
    });

    test('should trim history based on limit for incomming responses.', () {
      const int limit = 2;

      callHistory.limit = limit;

      const int timestamp1 = 1621188000;
      const String method1 = 'test 1';

      final Map<String, dynamic> message1 = <String, dynamic>{
        'content': 'Hello'
      };

      callHistory.pushIncoming(
        timestamp: timestamp1,
        method: method1,
        message: message1,
      );

      const int timestamp2 = 1621189000;
      const String method2 = 'test 2';

      final Map<String, dynamic> message2 = <String, dynamic>{
        'content': 'World'
      };

      callHistory.pushIncoming(
        timestamp: timestamp2,
        method: method2,
        message: message2,
      );

      const int timestamp3 = 1621190000;
      const String method3 = 'test 3';

      final Map<String, dynamic> message3 = <String, dynamic>{
        'content': 'Test'
      };

      callHistory.pushIncoming(
        timestamp: timestamp3,
        method: method3,
        message: message3,
      );

      expect(callHistory.incoming.length, equals(limit));
      expect(callHistory.incoming.first.timeStamp, equals(timestamp2));
      expect(callHistory.incoming.first.method, equals(method2));
      expect(callHistory.incoming.first.message, equals(message2));
      expect(callHistory.incoming.last.timeStamp, equals(timestamp3));
      expect(callHistory.incoming.last.method, equals(method3));
      expect(callHistory.incoming.last.message, equals(message3));
    });

    test('should trim history based on limit for outgoing responses.', () {
      const int limit = 2;

      callHistory.limit = limit;

      const int timestamp1 = 1621188000;
      const String method1 = 'test 1';

      final Map<String, dynamic> message1 = <String, dynamic>{
        'content': 'Hello'
      };

      callHistory.pushOutgoing(
        timestamp: timestamp1,
        method: method1,
        message: message1,
      );

      const int timestamp2 = 1621189000;
      const String method2 = 'test 2';

      final Map<String, dynamic> message2 = <String, dynamic>{
        'content': 'World'
      };

      callHistory.pushOutgoing(
        timestamp: timestamp2,
        method: method2,
        message: message2,
      );

      const int timestamp3 = 1621190000;
      const String method3 = 'test 3';

      final Map<String, dynamic> message3 = <String, dynamic>{
        'content': 'Test'
      };

      callHistory.pushOutgoing(
        timestamp: timestamp3,
        method: method3,
        message: message3,
      );

      expect(callHistory.outgoing.length, equals(limit));
      expect(callHistory.outgoing.first.timeStamp, equals(timestamp2));
      expect(callHistory.outgoing.first.method, equals(method2));
      expect(callHistory.outgoing.first.message, equals(message2));
      expect(callHistory.outgoing.last.timeStamp, equals(timestamp3));
      expect(callHistory.outgoing.last.method, equals(method3));
      expect(callHistory.outgoing.last.message, equals(message3));
    });
  });
}
