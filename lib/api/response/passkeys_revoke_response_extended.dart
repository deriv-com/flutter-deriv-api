import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/passkeys_revoke_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [PasskeysRevokeReceive] class.
class PasskeysRevokeReceiveExtended extends PasskeysRevokeReceive {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// revoke a passkey.
  static Future<PasskeysRevokeResponse> fetch(
    PasskeysRevokeRequest request,
  ) async {
    final PasskeysRevokeReceive response = await fetchRaw(request);

    return PasskeysRevokeResponse.fromJson(response.toJson());
  }

  /// Fetches raw passkeys revoke response.
  static Future<PasskeysRevokeReceive> fetchRaw(
    PasskeysRevokeRequest request,
  ) async {
    final PasskeysRevokeReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
