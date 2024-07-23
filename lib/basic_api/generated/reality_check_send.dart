/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reality_check_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Reality check request class.
class RealityCheckRequest extends Request {
  /// Initialize RealityCheckRequest.
  const RealityCheckRequest({
    this.loginid,
    this.realityCheck = true,
    super.msgType = 'reality_check',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory RealityCheckRequest.fromJson(Map<String, dynamic> json) =>
      RealityCheckRequest(
        loginid: json['loginid'] as String?,
        realityCheck:
            json['reality_check'] == null ? null : json['reality_check'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? realityCheck;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
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
    String? loginid,
    bool? realityCheck,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      RealityCheckRequest(
        loginid: loginid ?? this.loginid,
        realityCheck: realityCheck ?? this.realityCheck,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
