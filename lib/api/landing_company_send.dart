/// generated automatically from flutter_deriv_api|lib/api/landing_company_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'landing_company_send.g.dart';

/// JSON conversion for 'landing_company_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyRequest extends Request {
  /// Initialize LandingCompanyRequest
  const LandingCompanyRequest({
    this.landingCompany,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory LandingCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyRequestFromJson(json);

  // Properties
  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String landingCompany;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LandingCompanyRequest copyWith({
    String landingCompany,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      LandingCompanyRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
