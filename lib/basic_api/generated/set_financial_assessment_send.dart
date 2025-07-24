/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Set financial assessment request class.
class SetFinancialAssessmentRequest extends Request {
  /// Initialize SetFinancialAssessmentRequest.
  const SetFinancialAssessmentRequest({
    this.financialInformation,
    this.financialInformationVersion,
    this.loginid,
    this.setFinancialAssessment = true,
    this.tradingExperience,
    this.tradingExperienceRegulated,
    super.msgType = 'set_financial_assessment',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentRequest(
        financialInformation:
            json['financial_information'] as Map<String, dynamic>?,
        financialInformationVersion:
            json['financial_information_version'] as String?,
        loginid: json['loginid'] as String?,
        setFinancialAssessment: json['set_financial_assessment'] == null
            ? null
            : json['set_financial_assessment'] == 1,
        tradingExperience: json['trading_experience'] as Map<String, dynamic>?,
        tradingExperienceRegulated:
            json['trading_experience_regulated'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The financial information of a client
  final Map<String, dynamic>? financialInformation;

  /// [Optional] The version of the financial information
  final String? financialInformationVersion;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// Must be `true`
  final bool? setFinancialAssessment;

  /// [Optional] The trading experience of a client
  final Map<String, dynamic>? tradingExperience;

  /// [Optional] The trading experience of a `maltainvest` client
  final Map<String, dynamic>? tradingExperienceRegulated;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'financial_information': financialInformation,
        'financial_information_version': financialInformationVersion,
        'loginid': loginid,
        'set_financial_assessment': setFinancialAssessment == null
            ? null
            : setFinancialAssessment!
                ? 1
                : 0,
        'trading_experience': tradingExperience,
        'trading_experience_regulated': tradingExperienceRegulated,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetFinancialAssessmentRequest copyWith({
    Map<String, dynamic>? financialInformation,
    String? financialInformationVersion,
    String? loginid,
    bool? setFinancialAssessment,
    Map<String, dynamic>? tradingExperience,
    Map<String, dynamic>? tradingExperienceRegulated,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SetFinancialAssessmentRequest(
        financialInformation: financialInformation ?? this.financialInformation,
        financialInformationVersion:
            financialInformationVersion ?? this.financialInformationVersion,
        loginid: loginid ?? this.loginid,
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        tradingExperience: tradingExperience ?? this.tradingExperience,
        tradingExperienceRegulated:
            tradingExperienceRegulated ?? this.tradingExperienceRegulated,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
