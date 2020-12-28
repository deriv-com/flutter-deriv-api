/// Set financial assessment receive model class
abstract class SetFinancialAssessmentReceiveModel {
  /// Initializes
  SetFinancialAssessmentReceiveModel({
    @required this.setFinancialAssessment,
  });

  /// The financial assessment score assigned to the submitted financial assessment
  final SetFinancialAssessment setFinancialAssessment;
}

/// Set financial assessment receive class
class SetFinancialAssessmentReceive extends SetFinancialAssessmentReceiveModel {
  /// Initializes
  SetFinancialAssessmentReceive({
    @required SetFinancialAssessment setFinancialAssessment,
  }) : super(
          setFinancialAssessment: setFinancialAssessment,
        );

  /// Creates an instance from JSON
  factory SetFinancialAssessmentReceive.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentReceive(
        setFinancialAssessment: json['set_financial_assessment'] == null
            ? null
            : SetFinancialAssessment.fromJson(json['set_financial_assessment']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (setFinancialAssessment != null) {
      result['set_financial_assessment'] = setFinancialAssessment.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetFinancialAssessmentReceive copyWith({
    SetFinancialAssessment setFinancialAssessment,
  }) =>
      SetFinancialAssessmentReceive(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
      );
}
/// Set financial assessment model class
abstract class SetFinancialAssessmentModel {
  /// Initializes
  SetFinancialAssessmentModel({
    @required this.cfdScore,
    @required this.financialInformationScore,
    @required this.totalScore,
    @required this.tradingScore,
  });

  /// CFD score based on answers
  final int cfdScore;

  /// Financial information score based on answers
  final int financialInformationScore;

  /// Financial Assessment score based on answers
  final int totalScore;

  /// Trading experience score based on answers
  final int tradingScore;
}

/// Set financial assessment class
class SetFinancialAssessment extends SetFinancialAssessmentModel {
  /// Initializes
  SetFinancialAssessment({
    @required int cfdScore,
    @required int financialInformationScore,
    @required int totalScore,
    @required int tradingScore,
  }) : super(
          cfdScore: cfdScore,
          financialInformationScore: financialInformationScore,
          totalScore: totalScore,
          tradingScore: tradingScore,
        );

  /// Creates an instance from JSON
  factory SetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessment(
        cfdScore: json['cfd_score'],
        financialInformationScore: json['financial_information_score'],
        totalScore: json['total_score'],
        tradingScore: json['trading_score'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['cfd_score'] = cfdScore;
    result['financial_information_score'] = financialInformationScore;
    result['total_score'] = totalScore;
    result['trading_score'] = tradingScore;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetFinancialAssessment copyWith({
    int cfdScore,
    int financialInformationScore,
    int totalScore,
    int tradingScore,
  }) =>
      SetFinancialAssessment(
        cfdScore: cfdScore ?? this.cfdScore,
        financialInformationScore:
            financialInformationScore ?? this.financialInformationScore,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );
}
