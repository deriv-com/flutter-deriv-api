// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/cashier_withdrawal_cancel_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_withdrawal_cancel_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/cashier_withdrawal_cancel_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// The extended version of the [CashierWithdrawlCancelResponseExtended] class to implement
/// the API call methods.
class CashierWithdrawlCancelResponseExtended
    extends CashierWithdrawalCancelResponseModel {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetches the cashier payments.
  static Future<CashierWithdrawalCancelResponse> cancelCasWithdrawl({
    required CashierWithdrawalCancelRequest request,
  }) async {
    final CashierWithdrawalCancelReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return CashierWithdrawalCancelResponse.fromJson(
        response.cashierWithdrawalCancel);
  }
}
