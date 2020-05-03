import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/set_financial_assessment_model.dart';

import 'set_financial_assessment_model_mock_data.dart';

void main() {
  test('Set financial assessment JSON parsing', () {
    final Map<String, dynamic> setFinancialAssessmentMap =
        jsonDecode(setFinancialAssessmentJSON);
    final SetFinancialAssessmentModel financialAssessmentModel =
        SetFinancialAssessmentModel.fromJson(
            setFinancialAssessmentMap['set_financial_assessment']);

    expect(financialAssessmentModel.cfdScore, 926);
    expect(financialAssessmentModel.financialInformationScore, 751);
    expect(financialAssessmentModel.totalScore, 921);
    expect(financialAssessmentModel.tradingScore, 460);
  });
}
