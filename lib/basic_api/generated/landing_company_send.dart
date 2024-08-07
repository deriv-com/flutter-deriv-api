/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Landing company request class.
class LandingCompanyRequest extends Request {
  /// Initialize LandingCompanyRequest.
  const LandingCompanyRequest({
    required this.landingCompany,
    super.msgType = 'landing_company',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory LandingCompanyRequest.fromJson(Map<String, dynamic> json) =>
      LandingCompanyRequest(
        landingCompany: json['landing_company'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String? landingCompany;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'landing_company': landingCompany,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyRequest copyWith({
    String? landingCompany,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      LandingCompanyRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
