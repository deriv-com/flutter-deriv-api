/// generated automatically from flutter_deriv_api|lib/api/copy_stop_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'copy_stop_receive.g.dart';

/// JSON conversion for 'copy_stop_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopyStopResponse extends Response {
  /// Initialize CopyStopResponse
  CopyStopResponse({
    this.copyStop,
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
  factory CopyStopResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyStopResponseFromJson(json);

  // Properties
  /// Copy stopping confirmation. Returns 1 is success.
  final int copyStop;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStopResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopyStopResponse copyWith({
    int copyStop,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      CopyStopResponse(
        copyStop: copyStop ?? this.copyStop,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
