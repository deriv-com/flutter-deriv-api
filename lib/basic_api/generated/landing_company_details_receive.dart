/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Landing company details receive class.
class LandingCompanyDetailsReceive extends Response {
  /// Initialize LandingCompanyDetailsReceive.
  const LandingCompanyDetailsReceive({
    this.landingCompanyDetails,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LandingCompanyDetailsReceive.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailsReceive(
        landingCompanyDetails:
            json['landing_company_details'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The detailed information of the requested landing company.
  final Map<String, dynamic>? landingCompanyDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company_details': landingCompanyDetails,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyDetailsReceive copyWith({
    Map<String, dynamic>? landingCompanyDetails,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LandingCompanyDetailsReceive(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
