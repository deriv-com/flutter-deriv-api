/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_send.json
// ignore_for_file: avoid_as, always_specify_types

import '../request.dart';

/// Reality check request class
class RealityCheckRequest extends Request {
  /// Initialize RealityCheckRequest
  const RealityCheckRequest({
    this.realityCheck = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'reality_check',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory RealityCheckRequest.fromJson(Map<String, dynamic> json) =>
      RealityCheckRequest(
        passthrough: json['passthrough'] as Map<String, dynamic>,
        realityCheck:
            json['reality_check'] == null ? null : json['reality_check'] == 1,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool realityCheck;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'reality_check': realityCheck == null ? null : realityCheck ? 1 : 0,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RealityCheckRequest copyWith({
    bool realityCheck,
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
