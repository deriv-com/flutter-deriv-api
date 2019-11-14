/// Autogenerated from flutter_deriv_api|lib/api/get_financial_assessment_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'get_financial_assessment_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetFinancialAssessmentResponse {
  GetFinancialAssessmentResponse();
  factory GetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFinancialAssessmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetFinancialAssessmentResponseToJson(this);

  // Properties
  Map<String, dynamic> getFinancialAssessment;

  /// Client's financial asessment details
  Map<String, dynamic> echoReq;

  /// Echo of the request made.
  String msgType;

  /// Action name of the request made.
  int reqId;

  /// Optional field sent in request to map to response, present only when request contains req_id.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
