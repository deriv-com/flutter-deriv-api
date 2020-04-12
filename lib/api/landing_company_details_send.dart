/// generated automatically from flutter_deriv_api|lib/api/landing_company_details_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'landing_company_details_send.g.dart';

/// JSON conversion for 'landing_company_details_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyDetailsRequest extends Request {
  /// Initialize LandingCompanyDetailsRequest
  LandingCompanyDetailsRequest({
    this.landingCompanyDetails,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory LandingCompanyDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyDetailsRequestFromJson(json);

  // Properties
  /// Landing company shortcode.
  final String landingCompanyDetails;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyDetailsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LandingCompanyDetailsRequest copyWith({
    String landingCompanyDetails,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      LandingCompanyDetailsRequest(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}
