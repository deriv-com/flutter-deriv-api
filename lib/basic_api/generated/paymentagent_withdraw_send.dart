/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// PaymentagentWithdrawRequest class
class PaymentagentWithdrawRequest extends Request {
  /// Initialize PaymentagentWithdrawRequest
  const PaymentagentWithdrawRequest({
    @required this.amount,
    @required this.currency,
    this.description,
    this.dryRun,
    @required this.paymentagentLoginid,
    this.paymentagentWithdraw = true,
    @required this.verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'paymentagent_withdraw',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentagentWithdrawRequest.fromJson(Map<String, dynamic> json) =>
      PaymentagentWithdrawRequest(
        // ignore: avoid_as
        amount: json['amount'] as num,
        // ignore: avoid_as
        currency: json['currency'] as String,
        // ignore: avoid_as
        description: json['description'] as String,
        dryRun: json['dry_run'] == null ? null : json['dry_run'] == 1,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        paymentagentLoginid: json['paymentagent_loginid'] as String,
        paymentagentWithdraw: json['paymentagent_withdraw'] == null
            ? null
            : json['paymentagent_withdraw'] == 1,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        verificationCode: json['verification_code'] as String,
      );

  /// The amount to withdraw to the payment agent.
  final num amount;

  /// The currency code.
  final String currency;

  /// [Optional] Remarks about the withdraw. Only letters, numbers, space, period, comma, - ' are allowed.
  final String description;

  /// [Optional] If set to 1, just do validation.
  final bool dryRun;

  /// The payment agent loginid received from the `paymentagent_list` call.
  final String paymentagentLoginid;

  /// Must be `true`
  final bool paymentagentWithdraw;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'currency': currency,
        'description': description,
        'dry_run': dryRun == null ? null : dryRun ? 1 : 0,
        'passthrough': passthrough,
        'paymentagent_loginid': paymentagentLoginid,
        'paymentagent_withdraw':
            paymentagentWithdraw == null ? null : paymentagentWithdraw ? 1 : 0,
        'req_id': reqId,
        'verification_code': verificationCode,
      };

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawRequest copyWith({
    num amount,
    String currency,
    String description,
    bool dryRun,
    String paymentagentLoginid,
    bool paymentagentWithdraw,
    String verificationCode,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PaymentagentWithdrawRequest(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
