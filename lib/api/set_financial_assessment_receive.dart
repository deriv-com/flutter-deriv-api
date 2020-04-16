/// generated automatically from flutter_deriv_api|lib/api/set_financial_assessment_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'set_financial_assessment_receive.g.dart';

/// JSON conversion for 'set_financial_assessment_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetFinancialAssessmentResponse extends Response {
  /// Initialize SetFinancialAssessmentResponse
  const SetFinancialAssessmentResponse({
    this.setFinancialAssessment,
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

  /// Creates instance from JSON
  factory SetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SetFinancialAssessmentResponseFromJson(json);

  // Properties
  /// The financial assessment score assigned to the submitted financial assessment
  final Map<String, dynamic> setFinancialAssessment;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetFinancialAssessmentResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SetFinancialAssessmentResponse copyWith({
    Map<String, dynamic> setFinancialAssessment,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetFinancialAssessmentResponse(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
