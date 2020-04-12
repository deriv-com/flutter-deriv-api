/// generated automatically from flutter_deriv_api|lib/api/reality_check_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'reality_check_receive.g.dart';

/// JSON conversion for 'reality_check_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RealityCheckResponse extends Response {
  /// Initialize RealityCheckResponse
  RealityCheckResponse({
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

  /// Creates instance from JSON
  factory RealityCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$RealityCheckResponseFromJson(json);

  // Properties
  /// Reality check summary of trades.
  final Map<String, dynamic> realityCheck;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RealityCheckResponseToJson(this);
}
