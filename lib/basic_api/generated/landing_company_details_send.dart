/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_send.json

import '../request.dart';

/// Landing company details request class
class LandingCompanyDetailsRequest extends Request {
  /// Initialize LandingCompanyDetailsRequest
  const LandingCompanyDetailsRequest({
    @required this.landingCompanyDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'landing_company_details',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LandingCompanyDetailsRequest.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailsRequest(
        landingCompanyDetails: json['landing_company_details'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Landing company shortcode.
  final String? landingCompanyDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company_details': landingCompanyDetails,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyDetailsRequest copyWith({
    String? landingCompanyDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LandingCompanyDetailsRequest(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
