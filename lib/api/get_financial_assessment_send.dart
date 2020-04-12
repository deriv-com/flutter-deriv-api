/// generated automatically from flutter_deriv_api|lib/api/get_financial_assessment_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'get_financial_assessment_send.g.dart';

/// JSON conversion for 'get_financial_assessment_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetFinancialAssessmentRequest extends Request {
  /// Initialize GetFinancialAssessmentRequest
  const GetFinancialAssessmentRequest({
    this.getFinancialAssessment = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory GetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFinancialAssessmentRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int getFinancialAssessment;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetFinancialAssessmentRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetFinancialAssessmentRequest copyWith({
    int getFinancialAssessment,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
