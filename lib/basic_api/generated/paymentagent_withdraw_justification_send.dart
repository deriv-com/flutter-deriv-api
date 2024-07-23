/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_justification_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent withdraw justification request class.
class PaymentagentWithdrawJustificationRequest extends Request {
  /// Initialize PaymentagentWithdrawJustificationRequest.
  const PaymentagentWithdrawJustificationRequest({
    this.loginid,
    required this.message,
    this.paymentagentWithdrawJustification = true,
    super.msgType = 'paymentagent_withdraw_justification',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentWithdrawJustificationRequest.fromJson(
          Map<String, dynamic> json) =>
      PaymentagentWithdrawJustificationRequest(
        loginid: json['loginid'] as String?,
        message: json['message'] as String?,
        paymentagentWithdrawJustification:
            json['paymentagent_withdraw_justification'] == null
                ? null
                : json['paymentagent_withdraw_justification'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Reasons for needing to withdraw using a Payment Agent.
  final String? message;

  /// Must be `true`
  final bool? paymentagentWithdrawJustification;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'message': message,
        'paymentagent_withdraw_justification':
            paymentagentWithdrawJustification == null
                ? null
                : paymentagentWithdrawJustification!
                    ? 1
                    : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawJustificationRequest copyWith({
    String? loginid,
    String? message,
    bool? paymentagentWithdrawJustification,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentWithdrawJustificationRequest(
        loginid: loginid ?? this.loginid,
        message: message ?? this.message,
        paymentagentWithdrawJustification: paymentagentWithdrawJustification ??
            this.paymentagentWithdrawJustification,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
