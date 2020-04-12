/// generated automatically from flutter_deriv_api|lib/api/reality_check_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'reality_check_receive.g.dart';

/// JSON conversion for 'reality_check_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RealityCheckResponse extends Response {
  /// Initialize RealityCheckResponse
  const RealityCheckResponse({
    this.realityCheck,
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
  factory RealityCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$RealityCheckResponseFromJson(json);

  // Properties
  /// Reality check summary of trades.
  final Map<String, dynamic> realityCheck;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RealityCheckResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  RealityCheckResponse copyWith({
    Map<String, dynamic> realityCheck,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      RealityCheckResponse(
        realityCheck: realityCheck ?? this.realityCheck,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
