/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Landing company receive class.
class LandingCompanyReceive extends Response {
  /// Initialize LandingCompanyReceive.
  const LandingCompanyReceive({
    this.landingCompany,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyReceive.fromJson(Map<String, dynamic> json) =>
      LandingCompanyReceive(
        landingCompany: json['landing_company'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Landing Company
  final Map<String, dynamic>? landingCompany;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company': landingCompany,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyReceive copyWith({
    Map<String, dynamic>? landingCompany,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      LandingCompanyReceive(
        landingCompany: landingCompany ?? this.landingCompany,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
