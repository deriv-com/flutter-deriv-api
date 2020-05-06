/// generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'ticks_receive.g.dart';

/// JSON conversion for 'ticks_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TicksResponse extends Response {
  /// Initialize TicksResponse
  const TicksResponse({
    this.subscription,
    this.tick,
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
  factory TicksResponse.fromJson(Map<String, dynamic> json) =>
      _$TicksResponseFromJson(json);

  // Properties
  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Tick by tick list of streamed data
  final Map<String, dynamic> tick;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TicksResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> tick,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TicksResponse(
        subscription: subscription ?? this.subscription,
        tick: tick ?? this.tick,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
