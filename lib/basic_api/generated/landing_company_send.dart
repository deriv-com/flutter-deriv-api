/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// LandingCompanyRequest class
class LandingCompanyRequest extends Request {
  /// Initialize LandingCompanyRequest
  const LandingCompanyRequest({
    @required this.landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'landing_company',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LandingCompanyRequest.fromJson(Map<String, dynamic> json) =>
      LandingCompanyRequest(
        // ignore: avoid_as
        landingCompany: json['landing_company'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String landingCompany;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company': landingCompany,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyRequest copyWith({
    String landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LandingCompanyRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
