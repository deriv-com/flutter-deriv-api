// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Get financial assessment response model class.
abstract class GetFinancialAssessmentResponseModel {
  /// Initializes Get financial assessment response model class .
  const GetFinancialAssessmentResponseModel({
    this.getFinancialAssessment,
  });

  /// Client's financial assessment details
  final Map<String, dynamic>? getFinancialAssessment;
}

/// Get financial assessment response class.
class GetFinancialAssessmentResponse
    extends GetFinancialAssessmentResponseModel {
  /// Initializes Get financial assessment response class.
  const GetFinancialAssessmentResponse({
    super.getFinancialAssessment,
  });

  /// Creates an instance from JSON.
  factory GetFinancialAssessmentResponse.fromJson(
    dynamic getFinancialAssessmentJson,
  ) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment: getFinancialAssessmentJson == null
            ? null
            : Map<String, dynamic>.fromEntries(getFinancialAssessmentJson
                .entries
                .map<MapEntry<String, dynamic>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, dynamic>(entry.key, entry.value))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['get_financial_assessment'] = getFinancialAssessment;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the financial assessment details.
  ///
  /// The 'financial assessment' is a questionnaire that clients of certain Landing Companies need to complete,
  /// due to regulatory and KYC (know your client) requirements.
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<GetFinancialAssessmentResponse> fetchAssessment(
    GetFinancialAssessmentRequest request,
  ) async {
    final GetFinancialAssessmentReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return GetFinancialAssessmentResponse.fromJson(
        response.getFinancialAssessment);
  }

  /// Creates a copy of instance with given parameters.
  GetFinancialAssessmentResponse copyWith({
    Map<String, dynamic>? getFinancialAssessment,
  }) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
      );
}
