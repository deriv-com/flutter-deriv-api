import 'package:meta/meta.dart';

import '../../basic_api/generated/paymentagent_withdraw_receive.dart';
import '../../basic_api/generated/paymentagent_withdraw_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Paymentagent withdraw response model class
abstract class PaymentagentWithdrawResponseModel {
  /// Initializes
  PaymentagentWithdrawResponseModel({
    @required this.paymentagentWithdraw,
    @required this.paymentagentName,
    @required this.transactionId,
  });

  /// If set to `true`, withdrawal success. If set to `2`, dry-run success.
  final bool paymentagentWithdraw;

  /// Payment agent name.
  final String paymentagentName;

  /// Reference ID of withdrawal performed.
  final int transactionId;
}

/// Paymentagent withdraw response class
class PaymentagentWithdrawResponse extends PaymentagentWithdrawResponseModel {
  /// Initializes
  PaymentagentWithdrawResponse({
    @required bool paymentagentWithdraw,
    @required String paymentagentName,
    @required int transactionId,
  }) : super(
          paymentagentWithdraw: paymentagentWithdraw,
          paymentagentName: paymentagentName,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory PaymentagentWithdrawResponse.fromJson(
    dynamic paymentagentWithdrawJson,
    dynamic paymentagentNameJson,
    dynamic transactionIdJson,
  ) =>
      PaymentagentWithdrawResponse(
        paymentagentWithdraw: getBool(paymentagentWithdrawJson),
        paymentagentName: paymentagentNameJson,
        transactionId: transactionIdJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['paymentagent_withdraw'] = paymentagentWithdraw;
    resultMap['paymentagent_name'] = paymentagentName;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Initiates a withdrawal to an approved payment agent.
  ///
  /// For parameters information refer to [PaymentagentWithdrawRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentagentWithdrawResponse> withdraw(
    PaymentagentWithdrawSend request,
  ) async {
    final PaymentagentWithdrawReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PaymentAgentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentagentWithdrawResponse.fromJson(response.paymentagentWithdraw,
        response.paymentagentName, response.transactionId);
  }

  /// Creates a copy of instance with given parameters
  PaymentagentWithdrawResponse copyWith({
    bool paymentagentWithdraw,
    String paymentagentName,
    int transactionId,
  }) =>
      PaymentagentWithdrawResponse(
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        paymentagentName: paymentagentName ?? this.paymentagentName,
        transactionId: transactionId ?? this.transactionId,
      );
}
