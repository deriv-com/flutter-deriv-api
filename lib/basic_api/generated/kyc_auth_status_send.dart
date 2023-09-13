/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/kyc_auth_status_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Kyc auth status request class.
class KycAuthStatusRequest extends Request {
  /// Initialize KycAuthStatusRequest.
  const KycAuthStatusRequest({
    this.kycAuthStatus = true,
    super.msgType = 'kyc_auth_status',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatusRequest.fromJson(Map<String, dynamic> json) =>
      KycAuthStatusRequest(
        kycAuthStatus: json['kyc_auth_status'] == null
            ? null
            : json['kyc_auth_status'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? kycAuthStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'kyc_auth_status': kycAuthStatus == null
            ? null
            : kycAuthStatus!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  KycAuthStatusRequest copyWith({
    bool? kycAuthStatus,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      KycAuthStatusRequest(
        kycAuthStatus: kycAuthStatus ?? this.kycAuthStatus,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
