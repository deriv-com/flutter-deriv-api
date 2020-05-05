/// generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'landing_company_receive.g.dart';

/// JSON conversion for 'landing_company_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyResponse extends Response {
  /// Initialize LandingCompanyResponse
  const LandingCompanyResponse({
    this.landingCompany,
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

  /// Creates an instance from json
  factory LandingCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyResponseFromJson(json);

  // Properties
  /// Landing Company
  final Map<String, dynamic> landingCompany;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyResponse copyWith({
    Map<String, dynamic> landingCompany,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LandingCompanyResponse(
        landingCompany: landingCompany ?? this.landingCompany,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
