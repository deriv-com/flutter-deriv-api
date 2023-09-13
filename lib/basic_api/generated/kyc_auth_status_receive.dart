/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/kyc_auth_status_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Kyc auth status receive class.
class KycAuthStatusReceive extends Response {
  /// Initialize KycAuthStatusReceive.
  const KycAuthStatusReceive({
    this.kycAuthStatus,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatusReceive.fromJson(Map<String, dynamic> json) =>
      KycAuthStatusReceive(
        kycAuthStatus: json['kyc_auth_status'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Proof of Identity (POI) and Proof of Address (POA) authentication status details.
  final Map<String, dynamic>? kycAuthStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'kyc_auth_status': kycAuthStatus,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  KycAuthStatusReceive copyWith({
    Map<String, dynamic>? kycAuthStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      KycAuthStatusReceive(
        kycAuthStatus: kycAuthStatus ?? this.kycAuthStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
