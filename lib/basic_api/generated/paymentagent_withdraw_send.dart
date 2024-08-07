/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Paymentagent withdraw request class.
class PaymentagentWithdrawRequest extends Request {
  /// Initialize PaymentagentWithdrawRequest.
  const PaymentagentWithdrawRequest({
    required this.amount,
    required this.currency,
    this.description,
    this.dryRun,
    this.loginid,
    required this.paymentagentLoginid,
    this.paymentagentWithdraw = true,
    required this.verificationCode,
    super.msgType = 'paymentagent_withdraw',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PaymentagentWithdrawRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentWithdrawRequest(
        amount: json['amount'] as num?,
        currency: json['currency'] as String?,
        description: json['description'] as String?,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        loginid: json['loginid'] as String?,
        paymentagentLoginid: json['paymentagent_loginid'] as String?,
        paymentagentWithdraw: json['paymentagent_withdraw'] == null
            ? null
            : json['paymentagent_withdraw'] == 1,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The amount to withdraw to the payment agent.
  final num? amount;

  /// The currency code.
  final String? currency;

  /// [Optional] Remarks about the withdraw. Only letters, numbers, space, period, comma, - ' are allowed.
  final String? description;

  /// [Optional] If set to `true`, just do validation.
  final bool? dryRun;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// The payment agent loginid received from the `paymentagent_list` call.
  final String? paymentagentLoginid;

  /// Must be `true`
  final bool? paymentagentWithdraw;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
        'description': description,
        'dry_run': dryRun == null
            ? null
            : dryRun!
                ? 1
                : 0,
        'loginid': loginid,
        'paymentagent_loginid': paymentagentLoginid,
        'paymentagent_withdraw': paymentagentWithdraw == null
            ? null
            : paymentagentWithdraw!
                ? 1
                : 0,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawRequest copyWith({
    num? amount,
    String? currency,
    String? description,
    bool? dryRun,
    String? loginid,
    String? paymentagentLoginid,
    bool? paymentagentWithdraw,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PaymentagentWithdrawRequest(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        loginid: loginid ?? this.loginid,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
