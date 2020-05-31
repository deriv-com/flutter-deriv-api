/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_withdraw_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'paymentagent_withdraw_receive.g.dart';

/// JSON conversion for 'paymentagent_withdraw_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class PaymentagentWithdrawResponse extends Response {
  /// Initialize PaymentagentWithdrawResponse
  const PaymentagentWithdrawResponse({
    this.paymentagentName,
    this.paymentagentWithdraw,
    this.transactionId,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory PaymentagentWithdrawResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentWithdrawResponseFromJson(json);

  /// Payment agent name.
  final String paymentagentName;

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final int paymentagentWithdraw;

  /// Reference ID of withdrawal performed.
  final int transactionId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentWithdrawResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentWithdrawResponse copyWith({
    String paymentagentName,
    int paymentagentWithdraw,
    int transactionId,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentWithdrawResponse(
        paymentagentName: paymentagentName ?? this.paymentagentName,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        transactionId: transactionId ?? this.transactionId,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
