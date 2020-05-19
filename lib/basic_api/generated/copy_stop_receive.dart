/// generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'copy_stop_receive.g.dart';

/// JSON conversion for 'copy_stop_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class CopyStopResponse extends Response {
  /// Initialize CopyStopResponse
  const CopyStopResponse({
    this.copyStop,
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
  factory CopyStopResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyStopResponseFromJson(json);

  // Properties
  /// Copy stopping confirmation. Returns 1 is success.
  final int copyStop;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStopResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  CopyStopResponse copyWith({
    int copyStop,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopyStopResponse(
        copyStop: copyStop ?? this.copyStop,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
