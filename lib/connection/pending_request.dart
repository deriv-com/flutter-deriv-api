import 'dart:async';

import 'package:flutter_deriv_api/api/request.dart';

/// Represent a pending request.
class PendingRequest<T> {
  /// Class constructor
  PendingRequest({
    this.method,
    this.request,
    this.response,
  });

  /// api call method (e.g. 'active_symbols')
  final String method;

  /// Map of the sent request
  final Request request;

  /// this completer will complete whenever the response of the request arrives
  final Completer<T> response;
}
