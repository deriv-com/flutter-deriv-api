/// generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'reality_check_receive.g.dart';

/// JSON conversion for 'reality_check_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RealityCheckResponse extends Response {
  /// Initialize RealityCheckResponse
  const RealityCheckResponse({
    this.realityCheck,
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

  /// Creates an instance from json
  factory RealityCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$RealityCheckResponseFromJson(json);

  // Properties
  /// Reality check summary of trades.
  final Map<String, dynamic> realityCheck;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$RealityCheckResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckResponse copyWith({
    Map<String, dynamic> realityCheck,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      RealityCheckResponse(
        realityCheck: realityCheck ?? this.realityCheck,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
