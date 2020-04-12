/// generated automatically from flutter_deriv_api|lib/api/tnc_approval_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'tnc_approval_receive.g.dart';

/// JSON conversion for 'tnc_approval_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TncApprovalResponse extends Response {
  /// Initialize TncApprovalResponse
  const TncApprovalResponse({
    this.tncApproval,
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
  factory TncApprovalResponse.fromJson(Map<String, dynamic> json) =>
      _$TncApprovalResponseFromJson(json);

  // Properties
  /// Set terms and conditions 1: success
  final int tncApproval;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TncApprovalResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TncApprovalResponse copyWith({
    int tncApproval,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TncApprovalResponse(
        tncApproval: tncApproval ?? this.tncApproval,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
