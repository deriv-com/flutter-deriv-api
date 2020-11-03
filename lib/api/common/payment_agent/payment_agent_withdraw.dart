import 'package:flutter_deriv_api/api/common/models/payment_agent_withdraw_model.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/exceptions/payment_agent_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Payment agent withdraw class
class PaymentAgentWithdraw extends PaymentAgentWithdrawModel {
  /// Initializes
  PaymentAgentWithdraw({
    PaymentResult paymentAgentWithdraw,
    String paymentAgentName,
    int transactionId,
  }) : super(
          paymentAgentWithdraw: paymentAgentWithdraw,
          paymentAgentName: paymentAgentName,
          transactionId: transactionId,
        );

  /// Creates an instance from response
  factory PaymentAgentWithdraw.fromResponse(
    PaymentagentWithdrawResponse response,
  ) =>
      PaymentAgentWithdraw(
        paymentAgentWithdraw:
            PaymentResult.values[response.paymentagentWithdraw],
        paymentAgentName: response.paymentagentName,
        transactionId: response.transactionId,
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  PaymentAgentWithdraw copyWith({
    PaymentResult paymentAgentWithdraw,
    String paymentAgentName,
    int transactionId,
  }) =>
      PaymentAgentWithdraw(
        paymentAgentWithdraw: paymentAgentWithdraw ?? this.paymentAgentWithdraw,
        paymentAgentName: paymentAgentName ?? this.paymentAgentName,
        transactionId: transactionId ?? this.transactionId,
      );

  /// Initiates a withdrawal to an approved payment agent.
  ///
  /// For parameters information refer to [PaymentagentWithdrawRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentAgentWithdraw> withdraw(
    PaymentagentWithdrawRequest request,
  ) async {
    final PaymentagentWithdrawResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PaymentAgentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentAgentWithdraw.fromResponse(response);
  }
}
