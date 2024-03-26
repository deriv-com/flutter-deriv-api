import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/passkeys_register_options_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [PasskeysRegisterOptionsResponse] class.
class PasskeysRegisterOptionsResponseExtended
    extends PasskeysRegisterOptionsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// List all register passkeys options.
  static Future<PasskeysRegisterOptionsResponse> fetch(
    PasskeysRegisterOptionsRequest request,
  ) async {
    final PasskeysRegisterOptionsReceive response = await fetchRaw(request);

    return PasskeysRegisterOptionsResponse.fromJson(response.toJson());
  }

  /// Fetches raw register passkeys options response.
  static Future<PasskeysRegisterOptionsReceive> fetchRaw(
    PasskeysRegisterOptionsRequest request,
  ) async {
    final PasskeysRegisterOptionsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
