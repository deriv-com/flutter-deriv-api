// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Paymentagent withdraw justification response model class.
abstract class PaymentagentWithdrawJustificationResponseModel {
  /// Initializes Paymentagent withdraw justification response model class .
  const PaymentagentWithdrawJustificationResponseModel({
    this.paymentagentWithdrawJustification,
  });

  /// 1 on success
  final int? paymentagentWithdrawJustification;
}

/// Paymentagent withdraw justification response class.
class PaymentagentWithdrawJustificationResponse
    extends PaymentagentWithdrawJustificationResponseModel {
  /// Initializes Paymentagent withdraw justification response class.
  const PaymentagentWithdrawJustificationResponse({
    super.paymentagentWithdrawJustification,
  });

  /// Creates an instance from JSON.
  factory PaymentagentWithdrawJustificationResponse.fromJson(
    dynamic paymentagentWithdrawJustificationJson,
  ) =>
      PaymentagentWithdrawJustificationResponse(
        paymentagentWithdrawJustification:
            paymentagentWithdrawJustificationJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['paymentagent_withdraw_justification'] =
        paymentagentWithdrawJustification;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentagentWithdrawJustificationResponse copyWith({
    int? paymentagentWithdrawJustification,
  }) =>
      PaymentagentWithdrawJustificationResponse(
        paymentagentWithdrawJustification: paymentagentWithdrawJustification ??
            this.paymentagentWithdrawJustification,
      );
}
