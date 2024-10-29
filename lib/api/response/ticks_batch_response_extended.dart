import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/ticks_batch_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_batch_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/ticks_batch_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extended version of [TicksBatchResponse] class to implement the API call
/// methods.
class TicksBatchResponseExtended extends TicksBatchResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Subscribes to ticks_batch stream.
  static Stream<TicksBatchResponse?> subscribeTicksBatch({
    required TicksBatchRequest request,
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<TicksBatchResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is TicksBatchReceive
              ? TicksBatchResponse.fromJson(
                  response.ticksBatch,
                  response.subscription,
                )
              : null;
        },
      );
}
