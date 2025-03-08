import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/tin_validations_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/tin_validations_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/tin_validations_send.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [TinValidationsResponse] class to implement
/// the API call methods.
class TinValidationsResponseExtended extends TinValidationsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// It calls the API to reset the password.
  static Future<TinValidationsResponse> getTINValidations({
    required TinValidationsRequest request,
  }) async {
    final TinValidationsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TinValidationsResponse.fromJson(response.tinValidations);
  }
}
