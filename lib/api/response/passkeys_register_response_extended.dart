import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [PasskeysRegisterResponse] class.
class PasskeysRegisterResponseExtended extends PasskeysRegisterResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// register a new passkey.
  static Future<PasskeysRegisterResponse> fetch(
    PasskeysRegisterRequest request,
  ) async {
    final PasskeysRegisterReceive response = await fetchRaw(request);

    return PasskeysRegisterResponse.fromJson(response.toJson());
  }

  /// Fetches raw passkeys register response.
  static Future<PasskeysRegisterReceive> fetchRaw(
    PasskeysRegisterRequest request,
  ) async {
    final PasskeysRegisterReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
