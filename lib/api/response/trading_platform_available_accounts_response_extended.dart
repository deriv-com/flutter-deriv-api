import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/trading_platform_available_accounts_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_available_accounts_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_available_accounts_send.dart';
import 'package:flutter_deriv_api/helpers/miscellaneous_helper.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [TradingPlatformAvailableAccountsResponse] class.
class TradingPlatformAvailableAccountsResponseExtended
    extends TradingPlatformAvailableAccountsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetch available platform accounts, this would include all records regardless
  /// of already registered products and account types.
  static Future<TradingPlatformAvailableAccountsResponse>
      fetchAvailableAccounts(
          {required TradingPlatformAvailableAccountsRequest request}) async {
    final TradingPlatformAvailableAccountsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return TradingPlatformAvailableAccountsResponse.fromJson(response.toJson());
  }
}
