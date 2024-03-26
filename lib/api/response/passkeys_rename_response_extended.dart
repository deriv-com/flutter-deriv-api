import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/passkeys_rename_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [PasskeysRenameResponse] class.
class PasskeysRenameResponseExtended extends PasskeysRenameResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// rename a passkey.
  static Future<PasskeysRenameResponse> fetch(
    PasskeysRenameRequest request,
  ) async {
    final PasskeysRenameReceive response = await fetchRaw(request);

    return PasskeysRenameResponse.fromJson(response.toJson());
  }

  /// Fetches raw passkeys rename response.
  static Future<PasskeysRenameReceive> fetchRaw(
    PasskeysRenameRequest request,
  ) async {
    final PasskeysRenameReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
