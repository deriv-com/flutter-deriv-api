import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/available_accounts_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/available_accounts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/available_accounts_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [AvailableAccountsResponse] class to implement
/// the API call methods.
class AvailableAccountsResponseExtended extends AvailableAccountsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetches the available wallets that can be created
  static Future<AvailableAccountsResponse> fetchAvailableWalletsToCreate({
    required AvailableAccountsRequest request,
  }) async {
    final AvailableAccountsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return AvailableAccountsResponse.fromJson(response.availableAccounts);
  }
}
