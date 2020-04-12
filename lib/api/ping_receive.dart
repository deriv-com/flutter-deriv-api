/// generated automatically from flutter_deriv_api|lib/api/ping_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'ping_receive.g.dart';

/// JSON conversion for 'ping_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PingResponse extends Response {
  /// Initialize PingResponse
  const PingResponse({
    this.ping,
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
  factory PingResponse.fromJson(Map<String, dynamic> json) =>
      _$PingResponseFromJson(json);

  // Properties
  /// Will return 'pong'
  final String ping;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PingResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PingResponse copyWith({
    String ping,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      PingResponse(
        ping: ping ?? this.ping,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
