/// generated automatically from flutter_deriv_api|lib/api/landing_company_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'landing_company_receive.g.dart';

/// JSON conversion for 'landing_company_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyResponse extends Response {
  /// Initialize LandingCompanyResponse
  LandingCompanyResponse({
    this.landingCompany,
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
  factory LandingCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyResponseFromJson(json);

  // Properties
  /// Landing Company
  final Map<String, dynamic> landingCompany;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LandingCompanyResponse copyWith({
    Map<String, dynamic> landingCompany,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      LandingCompanyResponse(
        landingCompany: landingCompany ?? this.landingCompany,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
