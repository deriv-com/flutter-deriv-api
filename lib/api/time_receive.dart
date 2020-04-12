/// generated automatically from flutter_deriv_api|lib/api/time_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'time_receive.g.dart';

/// JSON conversion for 'time_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TimeResponse extends Response {
  /// Initialize TimeResponse
  TimeResponse({
    this.time,
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
  factory TimeResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeResponseFromJson(json);

  // Properties
  /// Epoch of server time.
  final int time;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TimeResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TimeResponse copyWith({
    int time,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TimeResponse(
        time: time ?? this.time,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
