import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/services/deriv_api.dart';

/// [T] the return type pf API calls
mixin ApiCaller<T> {

  /// Subscribe with [T] return type
  Stream<T> modelSubscribe(Request request) =>
      DerivApi().subscribe(request).transform(
        StreamTransformer<Response, T>.fromHandlers(
          handleData: (Response response, EventSink<T> sink) {
            if (response.error == null) {
              sink.add(responseToModel(response));
            } else {
              // TODO: Will add our class of Errors later
              sink.addError(FlutterError(response.error['code']));
            }
          },
        ),
      );

  /// API call with return type of [T]
  Future<T> modelCall(Request request) async {
    final Response response = await DerivApi().call(request);
    if (response.error != null) {
      throw FlutterError(response.error['code']);
    }
    return responseToModel(response);
  }

  /// Subclass should extract its model from [Response]
  T responseToModel(Response response);
}
