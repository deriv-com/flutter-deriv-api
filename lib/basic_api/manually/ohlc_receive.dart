import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'ohlc_receive.g.dart';

/// JSON conversion for OHLC response
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class OHLCResponse extends Response {
  /// Initialize OHLCResponse
  const OHLCResponse({
    this.subscription,
    this.ohlc,
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
  factory OHLCResponse.fromJson(Map<String, dynamic> json) =>
      _$OHLCResponseFromJson(json);

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Tick by tick list of streamed ohlc data
  final Map<String, dynamic> ohlc;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$OHLCResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  OHLCResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> ohlc,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      OHLCResponse(
        subscription: subscription ?? this.subscription,
        ohlc: ohlc ?? this.ohlc,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
