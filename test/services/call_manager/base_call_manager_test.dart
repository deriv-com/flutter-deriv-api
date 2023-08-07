import 'dart:async';

import 'package:test/test.dart';

import 'package:deriv_web_socket_client/deriv_web_socket_client.dart' as ws;

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

void main() {
  group('BaseCallManager tests =>', () {
    late BaseCallManager<MockResponse> callManager;
    late MockAPI mockAPI;

    setUp(() {
      mockAPI = MockAPI();
      callManager = MockCallManager(mockAPI);
    });

    test('should add a request to the channel and return a response.',
        () async {
      final MockRequest request = MockRequest();
      final MockResponse response = MockResponse();

      final Completer<Response> completer = Completer<Response>();

      unawaited(
        callManager
            .addToChannel(request: request)
            .then((Response value) => completer.complete(value)),
      );

      callManager.handleResponse(
        requestId: 1,
        response: <String, dynamic>{'msg_type': 'response'},
      );

      completer.complete(response);

      expect(await completer.future, response);
    });
  });
}

class MockCallManager extends BaseCallManager<MockResponse> {
  MockCallManager(BaseAPI api) : super(api);

  @override
  MockResponse call({required Request request}) {
    throw UnimplementedError();
  }
}

class MockAPI implements BaseAPI {
  @override
  Stream<ws.ConnectedState> get connectionStatus =>
      Stream<ws.ConnectedState>.value(const ws.ConnectedState());

  @override
  void addToChannel(Map<String, dynamic> request) {}

  @override
  Future<T> call<T>({required Request request}) => throw UnimplementedError();

  @override
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onDone,
    ConnectionCallback? onOpen,
    ConnectionCallback? onError,
    bool printResponse = false,
  }) =>
      throw UnimplementedError();

  @override
  Future<void> disconnect() => throw UnimplementedError();

  @override
  bool get enableDebug => throw UnimplementedError();

  @override
  String get key => throw UnimplementedError();

  @override
  Stream<Response>? subscribe({
    required Request request,
    RequestCompareFunction? comparePredicate,
  }) =>
      throw UnimplementedError();

  @override
  Future<ForgetReceive> unsubscribe({required String subscriptionId}) =>
      throw UnimplementedError();

  @override
  Future<ForgetAllReceive> unsubscribeAll({required ForgetStreamType method}) =>
      throw UnimplementedError();
}

class MockRequest extends Request {}

class MockResponse extends Response {}
