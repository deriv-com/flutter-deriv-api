/// generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'get_financial_assessment_receive.g.dart';

/// JSON conversion for 'get_financial_assessment_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetFinancialAssessmentResponse extends Response {
  /// Initialize GetFinancialAssessmentResponse
  const GetFinancialAssessmentResponse({
    this.getFinancialAssessment,
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
  factory GetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFinancialAssessmentResponseFromJson(json);

  // Properties
  /// Client's financial assessment details
  final Map<String, dynamic> getFinancialAssessment;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetFinancialAssessmentResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetFinancialAssessmentResponse copyWith({
    Map<String, dynamic> getFinancialAssessment,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
