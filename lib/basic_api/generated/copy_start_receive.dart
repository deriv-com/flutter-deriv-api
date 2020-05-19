/// generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'copy_start_receive.g.dart';

/// JSON conversion for 'copy_start_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class CopyStartResponse extends Response {
  /// Initialize CopyStartResponse
  const CopyStartResponse({
    this.copyStart,
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
  factory CopyStartResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyStartResponseFromJson(json);

  // Properties
  /// Copy start confirmation. Returns 1 is success.
  final int copyStart;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStartResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  CopyStartResponse copyWith({
    int copyStart,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopyStartResponse(
        copyStart: copyStart ?? this.copyStart,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
