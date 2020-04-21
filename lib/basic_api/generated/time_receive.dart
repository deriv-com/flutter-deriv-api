/// generated automatically from flutter_deriv_api|lib/basic_api/generated/time_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'time_receive.g.dart';

/// JSON conversion for 'time_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TimeResponse extends Response {
  /// Initialize TimeResponse
  const TimeResponse({
    this.time,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TimeResponse(
        time: time ?? this.time,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
