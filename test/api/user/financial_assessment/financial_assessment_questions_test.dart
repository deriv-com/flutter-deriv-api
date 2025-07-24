import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/financial_assessment_questions_response_result.dart';
import 'package:flutter_deriv_api/api/response/financial_assessment_questions_response_result_extended.dart';
import 'package:flutter_deriv_api/basic_api/generated/financial_assessment_questions_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group(
    'Financial Assessment Questions Group -> ',
    () {
      test(
        'Fetch Financial Assessment Questions',
        () async {
          final FinancialAssessmentQuestionsResponseModel
              financialAssessmentQuestions =
              await FinancialAssessmentQuestionsResponseExtended()
                  .fetchFinancialAssessmentQuestions(
                      request: const FinancialAssessmentQuestionsRequest(
                          version: 'v1'));

          final FinancialAssessmentQuestions? faQuestions =
              financialAssessmentQuestions.financialAssessmentQuestions;

          expect(
            faQuestions?.questions?['account_turnover'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'less_than_25000',
                  value: 'Less than \$25,000',
                ),
              ],
              hideIf: <String>[],
              question: 'Anticipated annual turnover',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['education_level'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'primary',
                  value: 'Primary',
                  nextNode: 'net_income',
                ),
              ],
              hideIf: <String>[],
              question: 'Education level',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['employment_industry'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'construction',
                  value: 'Construction',
                  nextNode: 'occupation',
                ),
              ],
              hideIf: <String>[],
              question: 'Industry of employment',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['employment_status'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'employed',
                  value: 'Employed',
                  nextNode: 'employment_industry',
                ),
              ],
              hideIf: <String>[],
              question: 'Employment status',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['estimated_worth'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'less_than_100000',
                  value: 'Less than \$100,000',
                  nextNode: 'account_turnover',
                ),
              ],
              hideIf: <String>[],
              question: 'Estimated net worth',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['income_source'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'salaried_employee',
                  value: 'Salaried Employee',
                  nextNode: 'source_of_wealth',
                ),
              ],
              hideIf: <String>[],
              question: 'Source of income',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['net_income'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'less_than_25000',
                  value: 'Less than \$25,000',
                  nextNode: 'estimated_worth',
                ),
              ],
              hideIf: <String>[],
              question: 'Net annual income',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['occupation'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'chief_executives',
                  value: 'Chief Executives, Senior Officials and Legislators',
                  nextNode: 'income_source',
                ),
              ],
              hideIf: <String>[],
              question: 'Occupation',
              type: TypeEnum.singleChoice,
            ),
          );

          expect(
            faQuestions?.questions?['source_of_wealth'],
            const QuestionsProperty(
              answers: <AnswersItem>[
                AnswersItem(
                  hideIf: <String>[],
                  key: 'income_savings',
                  value: 'Accumulation of Income/Savings',
                  nextNode: 'education_level',
                ),
              ],
              hideIf: <String>[],
              question: 'Source of Wealth',
              type: TypeEnum.singleChoice,
            ),
          );
        },
      );
    },
  );
}
