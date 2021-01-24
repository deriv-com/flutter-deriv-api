import 'package:meta/meta.dart';

import '../../basic_api/generated/paymentagent_transfer_receive.dart';
import '../../basic_api/generated/paymentagent_transfer_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Paymentagent transfer response model class
abstract class PaymentagentTransferResponseModel {
  /// Initializes
  PaymentagentTransferResponseModel({
    @required this.paymentagentTransfer,
    @required this.clientToFullName,
    @required this.clientToLoginid,
    @required this.transactionId,
  });

  /// If set to `1`, transfer success. If set to `2`, dry-run success.
  final int paymentagentTransfer;

  /// The `transfer_to` client full name
  final String clientToFullName;

  /// The `transfer_to` client loginid
  final String clientToLoginid;

  /// Reference ID of transfer performed
  final int transactionId;
}

/// Paymentagent transfer response class
class PaymentagentTransferResponse extends PaymentagentTransferResponseModel {
  /// Initializes
  PaymentagentTransferResponse({
    @required int paymentagentTransfer,
    @required String clientToFullName,
    @required String clientToLoginid,
    @required int transactionId,
  }) : super(
          paymentagentTransfer: paymentagentTransfer,
          clientToFullName: clientToFullName,
          clientToLoginid: clientToLoginid,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory PaymentagentTransferResponse.fromJson(
    dynamic paymentagentTransferJson,
    dynamic clientToFullNameJson,
    dynamic clientToLoginidJson,
    dynamic transactionIdJson,
  ) =>
      PaymentagentTransferResponse(
        paymentagentTransfer: paymentagentTransferJson,
        clientToFullName: clientToFullNameJson,
        clientToLoginid: clientToLoginidJson,
        transactionId: transactionIdJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['paymentagent_transfer'] = paymentagentTransfer;
    resultMap['client_to_full_name'] = clientToFullName;
    resultMap['client_to_loginid'] = clientToLoginid;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Payment Agent Transfer.
  ///
  /// This call is available only to accounts that are approved payment agents.
  /// For parameters information refer to [PaymentagentTransferRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentagentTransferResponse> transfer(
    PaymentagentTransferSend request,
  ) async {
    final PaymentagentTransferReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PaymentAgentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentagentTransferResponse.fromJson(
        response.paymentagentTransfer,
        response.clientToFullName,
        response.clientToLoginid,
        response.transactionId);
  }

  /// Creates a copy of instance with given parameters
  PaymentagentTransferResponse copyWith({
    int paymentagentTransfer,
    String clientToFullName,
    String clientToLoginid,
    int transactionId,
  }) =>
      PaymentagentTransferResponse(
        paymentagentTransfer: paymentagentTransfer ?? this.paymentagentTransfer,
        clientToFullName: clientToFullName ?? this.clientToFullName,
        clientToLoginid: clientToLoginid ?? this.clientToLoginid,
        transactionId: transactionId ?? this.transactionId,
      );
}
