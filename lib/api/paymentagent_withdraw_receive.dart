/// generated automatically from flutter_deriv_api|lib/api/paymentagent_withdraw_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'paymentagent_withdraw_receive.g.dart';

/// JSON conversion for 'paymentagent_withdraw_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentWithdrawResponse extends Response {
  /// Initialize PaymentagentWithdrawResponse
  const PaymentagentWithdrawResponse({
    this.paymentagentName,
    this.paymentagentWithdraw,
    this.transactionId,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory PaymentagentWithdrawResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentWithdrawResponseFromJson(json);

  // Properties
  /// Payment agent name.
  final String paymentagentName;

  /// If set to `1`, withdrawal success. If set to `2`, dry-run success.
  final int paymentagentWithdraw;

  /// Reference ID of withdrawal performed.
  final int transactionId;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentWithdrawResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PaymentagentWithdrawResponse copyWith({
    String paymentagentName,
    int paymentagentWithdraw,
    int transactionId,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      PaymentagentWithdrawResponse(
        paymentagentName: paymentagentName ?? this.paymentagentName,
        paymentagentWithdraw: paymentagentWithdraw ?? this.paymentagentWithdraw,
        transactionId: transactionId ?? this.transactionId,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
