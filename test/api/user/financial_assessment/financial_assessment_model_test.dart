import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/user/financial_assessment/financial_assessment.dart';

import 'financial_assessment_model_mock_data.dart';

void main() {
  test('financial assessment JSON parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(financialAssessmentModelMockData);
    final FinancialAssessment financialAssessment =
        FinancialAssessment.fromJson(mapData['get_financial_assessment']);

    expect(financialAssessment.accountTurnover, '120.0');
    expect(financialAssessment.binaryOptionsTradingExperience, '0-1 year');
    expect(financialAssessment.binaryOptionsTradingFrequency,
        '0-5 transactions in the past 12 months');
    expect(financialAssessment.cfdScore, 0);
    expect(financialAssessment.cfdTradingExperience, '0-1 year');
    expect(financialAssessment.cfdTradingFrequency,
        '0-5 transactions in the past 12 months');
    expect(financialAssessment.educationLevel, 'Primary');
    expect(financialAssessment.employmentIndustry, 'Construction');
    expect(financialAssessment.employmentStatus, 'part-time employee');
    expect(financialAssessment.estimatedWorth, 'Less than \$100,000');
    expect(financialAssessment.financialInformationScore, 0);
    expect(financialAssessment.forexTradingExperience, '0-1 year');
    expect(financialAssessment.forexTradingFrequency,
        '0-5 transactions in the past 12 months');
    expect(financialAssessment.incomeSource, 'Salaried Employee');
    expect(financialAssessment.netIncome, 'Less than \$25,000');
    expect(financialAssessment.occupation, 'Air Crew Officer');
    expect(financialAssessment.otherInstrumentsTradingExperience, '0-1 year');
    expect(financialAssessment.otherInstrumentsTradingFrequency,
        '0-5 transactions in the past 12 months');
    expect(financialAssessment.sourceOfWealth, 'Company Profit');
    expect(financialAssessment.totalScore, 0);
    expect(financialAssessment.tradingScore, 0);
  });
}
