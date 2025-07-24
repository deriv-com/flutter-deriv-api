import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/financial_assessment_questions_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/financial_assessment_questions_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/financial_assessment_questions_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';

/// Extended functionality for [FinancialAssessmentQuestionsResponse] class to implement API call methods.
class FinancialAssessmentQuestionsResponseExtended
    extends FinancialAssessmentQuestionsResponse {
  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Fetch Financial Assessment Questions.
  Future<FinancialAssessmentQuestionsResponse>
      fetchFinancialAssessmentQuestions({
    required FinancialAssessmentQuestionsRequest request,
  }) async {
    final FinancialAssessmentQuestionsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return FinancialAssessmentQuestionsResponse.fromJson(
      response.financialAssessmentQuestions,
    );
  }
}
