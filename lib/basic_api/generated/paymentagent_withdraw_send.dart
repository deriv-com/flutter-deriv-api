/// generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'paymentagent_withdraw',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
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

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$PaymentagentWithdrawRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawRequest copyWith({
    num amount,
    String currency,
    String description,
    int dryRun,
    String paymentagentLoginid,
    int paymentagentWithdraw,
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
