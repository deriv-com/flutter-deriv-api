// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_withdraw_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/paymentagent_withdraw_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Paymentagent withdraw response model class.
abstract class PaymentagentWithdrawResponseModel {
  /// Initializes Paymentagent withdraw response model class .
  const PaymentagentWithdrawResponseModel({
    this.paymentagentWithdraw,
    this.paymentagentName,
    this.transactionId,
  });

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final int? paymentagentWithdraw;

  /// Payment agent name.
  final String? paymentagentName;

  /// Reference ID of withdrawal performed.
  final int? transactionId;
}

/// Paymentagent withdraw response class.
class PaymentagentWithdrawResponse extends PaymentagentWithdrawResponseModel {
  /// Initializes Paymentagent withdraw response class.
  const PaymentagentWithdrawResponse({
    int? paymentagentWithdraw,
    String? paymentagentName,
    int? transactionId,
  }) : super(
          paymentagentWithdraw: paymentagentWithdraw,
          paymentagentName: paymentagentName,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON.
  factory PaymentagentWithdrawResponse.fromJson(
    dynamic paymentagentWithdrawJson,
    dynamic paymentagentNameJson,
    dynamic transactionIdJson,
  ) =>
      PaymentagentWithdrawResponse(
        paymentagentWithdraw: paymentagentWithdrawJson,
        paymentagentName: paymentagentNameJson,
        transactionId: transactionIdJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['paymentagent_withdraw'] = paymentagentWithdraw;
    resultMap['paymentagent_name'] = paymentagentName;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Initiates a withdrawal to an approved payment agent.
  ///
  /// For parameters information refer to [PaymentagentWithdrawRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentagentWithdrawResponse> withdraw(
    PaymentagentWithdrawRequest request,
  ) async {
    final PaymentagentWithdrawReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          PaymentAgentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentagentWithdrawResponse.fromJson(response.paymentagentWithdraw,
        response.paymentagentName, response.transactionId);
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentWithdrawResponse copyWith({
    int? paymentagentWithdraw,
    String? paymentagentName,
    int? transactionId,
  }) =>
      PaymentagentWithdrawResponse(
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        paymentagentName: paymentagentName ?? this.paymentagentName,
        transactionId: transactionId ?? this.transactionId,
      );
}
