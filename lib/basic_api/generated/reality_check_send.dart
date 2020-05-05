/// generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'reality_check_send.g.dart';

/// JSON conversion for 'reality_check_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RealityCheckRequest extends Request {
  /// Initialize RealityCheckRequest
  const RealityCheckRequest({
    this.realityCheck = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'reality_check',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory RealityCheckRequest.fromJson(Map<String, dynamic> json) =>
      _$RealityCheckRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int realityCheck;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$RealityCheckRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckRequest copyWith({
    int realityCheck,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      RealityCheckRequest(
        realityCheck: realityCheck ?? this.realityCheck,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
