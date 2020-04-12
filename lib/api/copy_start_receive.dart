/// generated automatically from flutter_deriv_api|lib/api/copy_start_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'copy_start_receive.g.dart';

/// JSON conversion for 'copy_start_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopyStartResponse extends Response {
  /// Initialize CopyStartResponse
  const CopyStartResponse({
    this.copyStart,
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
  factory CopyStartResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyStartResponseFromJson(json);

  // Properties
  /// Copy start confirmation. Returns 1 is success.
  final int copyStart;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStartResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopyStartResponse copyWith({
    int copyStart,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      CopyStartResponse(
        copyStart: copyStart ?? this.copyStart,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
