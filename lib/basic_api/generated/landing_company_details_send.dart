/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'landing_company_details_send.g.dart';

/// JSON conversion for 'landing_company_details_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyDetailsRequest extends Request {
  /// Initialize LandingCompanyDetailsRequest
  const LandingCompanyDetailsRequest({
    this.landingCompanyDetails,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'landing_company_details',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LandingCompanyDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyDetailsRequestFromJson(json);

  /// Landing company shortcode.
  final String landingCompanyDetails;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyDetailsRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyDetailsRequest copyWith({
    String landingCompanyDetails,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LandingCompanyDetailsRequest(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
