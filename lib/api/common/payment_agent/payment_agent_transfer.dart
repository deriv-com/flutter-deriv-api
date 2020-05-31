import 'package:flutter_deriv_api/api/common/models/payment_agent_transfer_model.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/exceptions/payment_agent_exception.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Payment agent transfer class
class PaymentAgentTransfer extends PaymentAgentTransferModel {
  /// Initializes
  PaymentAgentTransfer({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) : super(
          paymentAgentTransfer: paymentAgentTransfer,
          clientToFullName: clientToFullName,
          clientToLoginId: clientToLoginId,
          transactionId: transactionId,
        );

  /// Creates an instance from response
  factory PaymentAgentTransfer.fromResponse(
    PaymentagentTransferResponse response,
  ) =>
      PaymentAgentTransfer(
        paymentAgentTransfer:
            PaymentResult.values[response.paymentagentTransfer],
        clientToFullName: response.clientToFullName,
        clientToLoginId: response.clientToLoginid,
        transactionId: response.transactionId,
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  PaymentAgentTransfer copyWith({
    PaymentResult paymentAgentTransfer,
    String clientToFullName,
    String clientToLoginId,
    int transactionId,
  }) =>
      PaymentAgentTransfer(
        paymentAgentTransfer: paymentAgentTransfer ?? this.paymentAgentTransfer,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginId: clientToLoginId ?? this.clientToLoginId,
        transactionId: transactionId ?? this.transactionId,
      );

  /// Payment Agent Transfer.
  ///
  /// This call is available only to accounts that are approved payment agents.
  /// For parameters information refer to [PaymentagentTransferRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentAgentTransfer> transfer(
    PaymentagentTransferRequest request,
  ) async {
    final PaymentagentTransferResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          PaymentAgentException(message: message),
    );

    return PaymentAgentTransfer.fromResponse(response);
  }
}
