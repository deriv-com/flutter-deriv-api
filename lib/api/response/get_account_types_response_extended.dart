import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/get_account_status_response_result.dart';
import 'package:flutter_deriv_api/api/response/get_account_types_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [GetAccountStatusResponse] class to implement
/// the API call methods.
class GetAccountTypesResponseExtended extends GetAccountStatusResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the account types user can register for.
  static Future<GetAccountTypesResponse> fetchAccountTypes({
    required GetAccountTypesRequest request,
  }) async {
    final GetAccountTypesReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return GetAccountTypesResponse.fromJson(response);
  }
}
