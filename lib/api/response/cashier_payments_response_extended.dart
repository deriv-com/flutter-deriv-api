import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_payments_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_payments_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

import 'cashier_payments_response_result.dart';
import 'forget_all_response_result.dart';
import 'forget_response_result.dart';

/// The extended version of the [CashierPaymentsResponse] class to implement
/// the API call methods.
class CashierPaymentsResponseExtended extends CashierPaymentsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetches the cashier payments.
  static Future<CashierPaymentsResponse> fetchCashierPayments({
    required CashierPaymentsRequest request,
  }) async {
    final CashierPaymentsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return CashierPaymentsResponse.fromJson(
      response.cashierPayments,
      response.subscription,
    );
  }

  /// Subscribes to the bought contract state specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Stream<CashierPaymentsResponse?> subscribeCashierPayment(
    CashierPaymentsRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<CashierPaymentsResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is CashierPaymentsReceive
              ? CashierPaymentsResponse.fromJson(
                  response.cashierPayments,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from cashier payments subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<ForgetResponse?> unsubscribeCashierPayments() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all open contract subscriptions.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllCashierPayments() async {
    final ForgetAllReceive response = await _api.unsubscribeAll(
      method: ForgetStreamType.cashierPayments,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }
}
