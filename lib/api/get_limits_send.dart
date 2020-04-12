/// generated automatically from flutter_deriv_api|lib/api/get_limits_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_limits_send.g.dart';

/// JSON conversion for 'get_limits_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetLimitsRequest extends Request {
  /// Initialize GetLimitsRequest
  const GetLimitsRequest({
    this.getLimits = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory GetLimitsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLimitsRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getLimits;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetLimitsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetLimitsRequest copyWith({
    int getLimits,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      GetLimitsRequest(
        getLimits: getLimits ?? this.getLimits,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
