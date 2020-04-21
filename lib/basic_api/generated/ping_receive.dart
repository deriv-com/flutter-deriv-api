/// generated automatically from flutter_deriv_api|lib/basic_api/generated/ping_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'ping_receive.g.dart';

/// JSON conversion for 'ping_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PingResponse extends Response {
  /// Initialize PingResponse
  const PingResponse({
    this.ping,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PingResponse(
        ping: ping ?? this.ping,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
