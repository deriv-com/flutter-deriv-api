/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'get_financial_assessment_send.g.dart';

/// JSON conversion for 'get_financial_assessment_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class GetFinancialAssessmentRequest extends Request {
  /// Initialize GetFinancialAssessmentRequest
  const GetFinancialAssessmentRequest({
    this.getFinancialAssessment = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_financial_assessment',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFinancialAssessmentRequestFromJson(json);

  /// Must be `1`
  final int getFinancialAssessment;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$GetFinancialAssessmentRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentRequest copyWith({
    int getFinancialAssessment,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
