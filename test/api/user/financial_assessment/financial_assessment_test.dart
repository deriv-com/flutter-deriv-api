import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_financial_assessment_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/get_financial_assessment_receive_result.dart';
import 'package:flutter_deriv_api/api/response/set_financial_assessment_receive_result.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Financial Assessment Group ->', () {
    test('Fetch Assessment Test', () async {
      final GetFinancialAssessmentResponse financialAssessmentResponse =
          await GetFinancialAssessmentResponse.fetchAssessment(
        const GetFinancialAssessmentSend(),
      );

      final financialAssessment =
          financialAssessmentResponse.getFinancialAssessment;

      expect(financialAssessment.accountTurnover, '120.0');
      expect(financialAssessment.binaryOptionsTradingExperience, '0-1 year');
      expect(
        financialAssessment.binaryOptionsTradingFrequency,
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment.cfdScore, 0);
      expect(financialAssessment.cfdTradingExperience, '0-1 year');
      expect(
        financialAssessment.cfdTradingFrequency,
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment.educationLevel, 'Primary');
      expect(financialAssessment.employmentIndustry, 'Construction');
      expect(financialAssessment.employmentStatus, 'part-time employee');
      expect(financialAssessment.estimatedWorth, 'Less than \$100,000');
      expect(financialAssessment.financialInformationScore, 0);
      expect(financialAssessment.forexTradingExperience, '0-1 year');
      expect(
        financialAssessment.forexTradingFrequency,
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment.incomeSource, 'Salaried Employee');
      expect(financialAssessment.netIncome, 'Less than \$25,000');
      expect(financialAssessment.occupation, 'Air Crew Officer');
      expect(financialAssessment.otherInstrumentsTradingExperience, '0-1 year');
      expect(
        financialAssessment.otherInstrumentsTradingFrequency,
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment.sourceOfWealth, 'Company Profit');
      expect(financialAssessment.totalScore, 0);
      expect(financialAssessment.tradingScore, 0);
    });

    test('Set Assessment Test', () async {
      final SetFinancialAssessmentResponse financialAssessmentModel =
          await SetFinancialAssessmentResponse.setAssessment(
        const SetFinancialAssessmentSend(
          educationLevel: 'Primary',
          estimatedWorth: 'Less than \$100,000',
          netIncome: 'Less than \$25,000',
          incomeSource: 'Salaried Employee',
          occupation: 'Air Crew Officer',
          employmentIndustry: 'Construction',
        ),
      );

      expect(financialAssessmentModel.setFinancialAssessment.cfdScore, 926);
      expect(
          financialAssessmentModel
              .setFinancialAssessment.financialInformationScore,
          751);
      expect(financialAssessmentModel.setFinancialAssessment.totalScore, 921);
      expect(financialAssessmentModel.setFinancialAssessment.tradingScore, 460);
    });
  });
}
