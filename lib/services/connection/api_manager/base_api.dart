import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Callbacks for websocket connection.
typedef ConnectionCallback = void Function(UniqueKey uniqueKey);

/// Base class for handling API connection and calling APIs.
abstract class BaseAPI {
  /// Initializes base api.
  BaseAPI({required this.uniqueKey});

  /// A key to check the `onDone` function is called from the same instance.
  final UniqueKey uniqueKey;

  /// Connects to API.
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onDone,
    ConnectionCallback? onOpen,
    ConnectionCallback? onError,
    bool printResponse,
  });

  /// Adds request to stream channel.
  void addToChannel(Map<String, dynamic> request);

  /// Calls a API method by [request].
  Future<T> call<T>({required Request request});

  /// Subscribe to a [request].
  /// [comparePredicate] indicates compare condition for current [request] and [pendingRequest]s
  Stream<Response>? subscribe({
    required Request request,
    RequestCompareFunction? comparePredicate,
  });

  /// Unsubscribe with a specific [subscriptionId]
  Future<ForgetReceive> unsubscribe({required String subscriptionId});

  /// Unsubscribe to multiple [method]s all at once
  Future<ForgetAllReceive> unsubscribeAll({required ForgetStreamType method});

  /// Disconnects from API.
  Future<void> disconnect();
}
