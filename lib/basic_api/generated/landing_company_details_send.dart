/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Landing company details request class.
class LandingCompanyDetailsRequest extends Request {
  /// Initialize LandingCompanyDetailsRequest.
  const LandingCompanyDetailsRequest({
    this.country,
    required this.landingCompanyDetails,
    super.msgType = 'landing_company_details',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LandingCompanyDetailsRequest.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailsRequest(
        country: json['country'] as String?,
        landingCompanyDetails: json['landing_company_details'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Will return an extra field `tin_not_mandatory` indicating if the landing company does not require tax identification number for the provided country.
  final String? country;

  /// Landing company shortcode.
  final String? landingCompanyDetails;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country': country,
        'landing_company_details': landingCompanyDetails,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyDetailsRequest copyWith({
    String? country,
    String? landingCompanyDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LandingCompanyDetailsRequest(
        country: country ?? this.country,
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
