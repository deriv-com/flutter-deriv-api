/// Get financial assessment send model class
abstract class GetFinancialAssessmentSendModel {
  /// Initializes
  GetFinancialAssessmentSendModel({
    @required this.getFinancialAssessment,
  });

  /// Must be `1`
  final int getFinancialAssessment;
}

/// Get financial assessment send class
class GetFinancialAssessmentSend extends GetFinancialAssessmentSendModel {
  /// Initializes
  GetFinancialAssessmentSend({
    @required int getFinancialAssessment,
  }) : super(
          getFinancialAssessment: getFinancialAssessment,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentSend.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentSend(
        getFinancialAssessment: json['get_financial_assessment'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['get_financial_assessment'] = getFinancialAssessment;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetFinancialAssessmentSend copyWith({
    int getFinancialAssessment,
  }) =>
      GetFinancialAssessmentSend(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
      );
}
