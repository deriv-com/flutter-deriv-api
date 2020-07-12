/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_receive.json

import '../response.dart';

/// LandingCompanyResponse class
class LandingCompanyResponse extends Response {
  /// Initialize LandingCompanyResponse
  const LandingCompanyResponse({
    this.landingCompany,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LandingCompanyResponse.fromJson(Map<String, dynamic> json) =>
      LandingCompanyResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        landingCompany: json['landing_company'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Landing Company
  final Map<String, dynamic> landingCompany;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'landing_company': landingCompany,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyResponse copyWith({
    Map<String, dynamic> landingCompany,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LandingCompanyResponse(
        landingCompany: landingCompany ?? this.landingCompany,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
