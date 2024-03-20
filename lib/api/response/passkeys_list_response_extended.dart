import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/passkeys_list_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [PasskeysListResponse] class.
class PasskeysListResponseExtended extends PasskeysListResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// List all passkeys.
  static Future<PasskeysListResponse> fetch(
    PasskeysListRequest request,
  ) async {
    final PasskeysListReceive response = await fetchRaw(request);

    return PasskeysListResponse.fromJson(response.toJson());
  }

  /// Fetches raw passkeys list response.
  static Future<PasskeysListReceive> fetchRaw(
    PasskeysListRequest request,
  ) async {
    final PasskeysListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
