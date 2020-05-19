/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/landing_company_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'landing_company_send.g.dart';

/// JSON conversion for 'landing_company_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyRequest extends Request {
  /// Initialize LandingCompanyRequest
  const LandingCompanyRequest({
    this.landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'landing_company',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory LandingCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyRequestFromJson(json);

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String landingCompany;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LandingCompanyRequest copyWith({
    String landingCompany,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      LandingCompanyRequest(
        landingCompany: landingCompany ?? this.landingCompany,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
