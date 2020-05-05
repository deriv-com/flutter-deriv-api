/// generated automatically from flutter_deriv_api|lib/basic_api/generated/tnc_approval_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'tnc_approval_receive.g.dart';

/// JSON conversion for 'tnc_approval_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TncApprovalResponse extends Response {
  /// Initialize TncApprovalResponse
  const TncApprovalResponse({
    this.tncApproval,
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

  /// Creates an instance from json
  factory TncApprovalResponse.fromJson(Map<String, dynamic> json) =>
      _$TncApprovalResponseFromJson(json);

  // Properties
  /// Set terms and conditions 1: success
  final int tncApproval;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$TncApprovalResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TncApprovalResponse copyWith({
    int tncApproval,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TncApprovalResponse(
        tncApproval: tncApproval ?? this.tncApproval,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
