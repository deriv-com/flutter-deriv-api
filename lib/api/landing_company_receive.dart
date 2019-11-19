/// Autogenerated from flutter_deriv_api|lib/api/landing_company_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'landing_company_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyResponse {
  LandingCompanyResponse();
  factory LandingCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LandingCompanyResponseToJson(this);

  // Properties
  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Landing Company
  Map<String, dynamic> landingCompany;

  /// Action name of the request made.
  String msgType;

  /// Optional field sent in request to map to response, present only when request contains req_id.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
