import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/get_financial_assessment_response_result.dart';
import 'package:flutter_deriv_api/api/response/set_financial_assessment_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_financial_assessment_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('Financial Assessment Group ->', () {
    test('Fetch Assessment Test', () async {
      final GetFinancialAssessmentResponse financialAssessmentResponse =
          await GetFinancialAssessmentResponse.fetchAssessment(
        const GetFinancialAssessmentRequest(),
      );

      final Map<String, dynamic>? financialAssessment =
          financialAssessmentResponse.getFinancialAssessment!;

      expect(financialAssessment?['account_turnover'], '120.0');
      expect(financialAssessment?['binary_options_trading_experience'],
          '0-1 year');
      expect(
        financialAssessment?['binary_options_trading_frequency'],
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment?['cfd_score'], 0);
      expect(financialAssessment?['cfd_trading_experience'], '0-1 year');
      expect(
        financialAssessment?['cfd_trading_frequency'],
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment?['education_level'], 'Primary');
      expect(financialAssessment?['employment_industry'], 'Construction');
      expect(financialAssessment?['employment_status'], 'part-time employee');
      expect(financialAssessment?['estimated_worth'], 'Less than \$100,000');
      expect(financialAssessment?['financial_information_score'], 0);
      expect(financialAssessment?['financial_information_version'], 'v1');
      expect(financialAssessment?['forex_trading_experience'], '0-1 year');
      expect(
        financialAssessment?['forex_trading_frequency'],
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment?['income_source'], 'Salaried Employee');
      expect(financialAssessment?['net_income'], 'Less than \$25,000');
      expect(financialAssessment?['occupation'], 'Air Crew Officer');
      expect(financialAssessment?['other_instruments_trading_experience'],
          '0-1 year');
      expect(
        financialAssessment?['other_instruments_trading_frequency'],
        '0-5 transactions in the past 12 months',
      );
      expect(financialAssessment?['source_of_wealth'], 'Company Profit');
      expect(financialAssessment?['total_score'], 0);
      expect(financialAssessment?['trading_score'], 0);
    });

    test('Set Assessment Test', () async {
      final SetFinancialAssessmentResponse financialAssessmentModel =
          await SetFinancialAssessmentResponse.setAssessment(
        const SetFinancialAssessmentRequest(
            financialInformation: <String, String>{
              'educationLevel': 'Primary',
              'estimatedWorth': 'Less than \$100,000',
              'netIncome': 'Less than \$25,000',
              'incomeSource': 'Salaried Employee',
              'occupation': 'Air Crew Officer',
              'employmentIndustry': 'Construction',
            }),
      );

      expect(financialAssessmentModel.setFinancialAssessment?.cfdScore, 926);
      expect(
          financialAssessmentModel
              .setFinancialAssessment?.financialInformationScore,
          751);
      expect(financialAssessmentModel.setFinancialAssessment?.totalScore, 921);
      expect(
          financialAssessmentModel.setFinancialAssessment?.tradingScore, 460);
    });
  });
}
