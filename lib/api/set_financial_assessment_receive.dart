/// Autogenerated from flutter_deriv_api|lib/api/set_financial_assessment_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'set_financial_assessment_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetFinancialAssessmentResponse {
  SetFinancialAssessmentResponse(
      {this.echoReq, this.msgType, this.reqId, this.setFinancialAssessment});
  factory SetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SetFinancialAssessmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SetFinancialAssessmentResponseToJson(this);

  // Properties
  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Action name of the request made.
  String msgType;

  /// Optional field sent in request to map to response, present only when request contains `req_id`.
  int reqId;

  /// The financial assessment score assigned to the submitted financial assessment
  Map<String, dynamic> setFinancialAssessment;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
