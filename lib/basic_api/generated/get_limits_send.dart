/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_limits_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get limits request class.
class GetLimitsRequest extends Request {
  /// Initialize GetLimitsRequest.
  const GetLimitsRequest({
    this.getLimits = true,
    this.loginid,
    super.msgType = 'get_limits',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory GetLimitsRequest.fromJson(Map<String, dynamic> json) =>
      GetLimitsRequest(
        getLimits: json['get_limits'] == null ? null : json['get_limits'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getLimits;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_limits': getLimits == null
            ? null
            : getLimits!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetLimitsRequest copyWith({
    bool? getLimits,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetLimitsRequest(
        getLimits: getLimits ?? this.getLimits,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
