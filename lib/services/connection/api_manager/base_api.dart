import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Base class for handling API calls
abstract class BaseAPI {
  /// Connects to API
  Future<void> connect(ConnectionInformation connectionInformation);

  /// Adds request to stream channel
  void addToChannel(Map<String, dynamic> request);

  /// Calls a API method by [request]
  Future<Response> call({@required Request request});

  /// Subscribe to a [request]
  /// [comparePredicate] indicates compare condition for current [request] and [pendingRequest]s
  Stream<Response> subscribe({
    @required Request request,
    RequestCompareFunction comparePredicate,
  });

  /// Unsubscribe with a specific [subscriptionId]
  Future<ForgetResponse> unsubscribe({
    @required String subscriptionId,
    bool shouldForced = false,
  });

  /// Unsubscribe to multiple [method]s all at once
  Future<ForgetAllResponse> unsubscribeAll({
    @required ForgetStreamType method,
    bool shouldForced = false,
  });

  /// Disconnects from API
  Future<void> disconnect();
}
