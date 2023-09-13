/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Reality check request class.
class RealityCheckRequest extends Request {
  /// Initialize RealityCheckRequest.
  const RealityCheckRequest({
    this.realityCheck = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'reality_check',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory RealityCheckRequest.fromJson(Map<String, dynamic> json) =>
      RealityCheckRequest(
        realityCheck:
            json['reality_check'] == null ? null : json['reality_check'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? realityCheck;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'reality_check': realityCheck == null
            ? null
            : realityCheck!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckRequest copyWith({
    bool? realityCheck,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      RealityCheckRequest(
        realityCheck: realityCheck ?? this.realityCheck,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
