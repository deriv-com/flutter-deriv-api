/// Autogenerated from flutter_deriv_api|lib/api/landing_company_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'landing_company_send.g.dart';

/// JSON conversion for 'landing_company_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyRequest extends Request {
  /// Initialize LandingCompanyRequest
  LandingCompanyRequest(
      {this.landingCompany, Map<String, dynamic> passthrough, int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory LandingCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyRequestFromJson(json);

  // Properties
  /// Client's 2-letter country code (obtained from `residence_list` call).
  String landingCompany;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyRequestToJson(this);
}
