/// generated automatically from flutter_deriv_api|lib/api/paymentagent_withdraw_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'paymentagent_withdraw_send.g.dart';

/// JSON conversion for 'paymentagent_withdraw_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentWithdrawRequest extends Request {
  /// Initialize PaymentagentWithdrawRequest
  const PaymentagentWithdrawRequest({
    this.amount,
    this.currency,
    this.description,
    this.dryRun,
    this.paymentagentLoginid,
    this.paymentagentWithdraw = 1,
    this.verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory PaymentagentWithdrawRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentWithdrawRequestFromJson(json);

  // Properties
  /// The amount to withdraw to the payment agent.
  final num amount;

  /// The currency code.
  final String currency;

  /// [Optional] Remarks about the withdraw. Only letters, numbers, space, period, comma, - ' are allowed.
  final String description;

  /// [Optional] If set to 1, just do validation.
  final int dryRun;

  /// The payment agent loginid received from the `paymentagent_list` call.
  final String paymentagentLoginid;

  /// Must be `1`
  final int paymentagentWithdraw;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String verificationCode;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentWithdrawRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PaymentagentWithdrawRequest copyWith({
    num amount,
    String currency,
    String description,
    int dryRun,
    String paymentagentLoginid,
    int paymentagentWithdraw,
    String verificationCode,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      PaymentagentWithdrawRequest(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        dryRun: dryRun ?? this.dryRun,
        paymentagentLoginid: paymentagentLoginid ?? this.paymentagentLoginid,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        verificationCode: verificationCode ?? this.verificationCode,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
