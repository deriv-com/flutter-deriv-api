/// generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_details_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'landing_company_details_receive.g.dart';

/// JSON conversion for 'landing_company_details_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class LandingCompanyDetailsResponse extends Response {
  /// Initialize LandingCompanyDetailsResponse
  const LandingCompanyDetailsResponse({
    this.landingCompanyDetails,
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
  factory LandingCompanyDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyDetailsResponseFromJson(json);

  // Properties
  /// The detailed information of the requested landing company.
  final Map<String, dynamic> landingCompanyDetails;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyDetailsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyDetailsResponse copyWith({
    Map<String, dynamic> landingCompanyDetails,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LandingCompanyDetailsResponse(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
