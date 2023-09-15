import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

import 'new_account_wallet_response_result.dart';

/// The extended version of the [NewAccountWalletResponse] class to implement
/// the API call methods.
class NewAccountWalletResponseExtended extends NewAccountWalletResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Creates a new wallet account.
  static Future<NewAccountWalletResponse> fetchAccountTypes({
    required NewAccountWalletRequest request,
  }) async {
    final NewAccountWalletReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return NewAccountWalletResponse.fromJson(response);
  }
}
