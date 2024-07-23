/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/affiliate_register_person_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Affiliate register person receive class.
class AffiliateRegisterPersonReceive extends Response {
  /// Initialize AffiliateRegisterPersonReceive.
  const AffiliateRegisterPersonReceive({
    this.success,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AffiliateRegisterPersonReceive.fromJson(Map<String, dynamic> json) =>
      AffiliateRegisterPersonReceive(
        success: json['success'] == null ? null : json['success'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Affiliate was successfully added, `false`:unsuccessful `true`:successful
  final bool? success;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': success == null
            ? null
            : success!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AffiliateRegisterPersonReceive copyWith({
    bool? success,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AffiliateRegisterPersonReceive(
        success: success ?? this.success,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
