/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Landing company details send class.
class LandingCompanyDetailsSend extends Request {
  /// Initialize LandingCompanyDetailsSend.
  const LandingCompanyDetailsSend({
    required this.landingCompanyDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'landing_company_details',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyDetailsSend.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailsSend(
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
  LandingCompanyDetailsSend copyWith({
    String? landingCompanyDetails,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LandingCompanyDetailsSend(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
