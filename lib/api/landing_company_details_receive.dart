/// generated automatically from flutter_deriv_api|lib/api/landing_company_details_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'landing_company_details_receive.g.dart';

/// JSON conversion for 'landing_company_details_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyDetailsResponse extends Response {
  /// Initialize LandingCompanyDetailsResponse
  LandingCompanyDetailsResponse({
    this.landingCompanyDetails,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory LandingCompanyDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyDetailsResponseFromJson(json);

  // Properties
  /// The detailed information of the requested landing company.
  final Map<String, dynamic> landingCompanyDetails;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyDetailsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LandingCompanyDetailsResponse copyWith({
    Map<String, dynamic> landingCompanyDetails,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      LandingCompanyDetailsResponse(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
