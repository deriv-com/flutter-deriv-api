/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get financial assessment request class.
class GetFinancialAssessmentRequest extends Request {
  /// Initialize GetFinancialAssessmentRequest.
  const GetFinancialAssessmentRequest({
    this.getFinancialAssessment = true,
    this.loginid,
    super.msgType = 'get_financial_assessment',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory GetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment: json['get_financial_assessment'] == null
            ? null
            : json['get_financial_assessment'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getFinancialAssessment;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_financial_assessment': getFinancialAssessment == null
            ? null
            : getFinancialAssessment!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentRequest copyWith({
    bool? getFinancialAssessment,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
