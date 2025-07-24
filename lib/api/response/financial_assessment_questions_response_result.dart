// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Financial assessment questions response model class.
abstract class FinancialAssessmentQuestionsResponseModel {
  /// Initializes Financial assessment questions response model class .
  const FinancialAssessmentQuestionsResponseModel({
    this.financialAssessmentQuestions,
  });

  /// The financial assessment questionnaire structure
  final FinancialAssessmentQuestions? financialAssessmentQuestions;
}

/// Financial assessment questions response class.
class FinancialAssessmentQuestionsResponse
    extends FinancialAssessmentQuestionsResponseModel {
  /// Initializes Financial assessment questions response class.
  const FinancialAssessmentQuestionsResponse({
    super.financialAssessmentQuestions,
  });

  /// Creates an instance from JSON.
  factory FinancialAssessmentQuestionsResponse.fromJson(
    dynamic financialAssessmentQuestionsJson,
  ) =>
      FinancialAssessmentQuestionsResponse(
        financialAssessmentQuestions: financialAssessmentQuestionsJson == null
            ? null
            : FinancialAssessmentQuestions.fromJson(
                financialAssessmentQuestionsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessmentQuestions != null) {
      resultMap['financial_assessment_questions'] =
          financialAssessmentQuestions!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialAssessmentQuestionsResponse copyWith({
    FinancialAssessmentQuestions? financialAssessmentQuestions,
  }) =>
      FinancialAssessmentQuestionsResponse(
        financialAssessmentQuestions:
            financialAssessmentQuestions ?? this.financialAssessmentQuestions,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "free_text": TypeEnum.freeText,
  "single_choice": TypeEnum.singleChoice,
  "multiple_choice": TypeEnum.multipleChoice,
};

/// Type Enum.
enum TypeEnum {
  /// free_text.
  freeText,

  /// single_choice.
  singleChoice,

  /// multiple_choice.
  multipleChoice,
}

/// Financial assessment questions model class.
abstract class FinancialAssessmentQuestionsModel {
  /// Initializes Financial assessment questions model class .
  const FinancialAssessmentQuestionsModel({
    this.questions,
    this.version,
  });

  /// Object containing the questions and possible answers
  final Map<String, QuestionsProperty>? questions;

  /// The version of the financial assessment questionnaire.
  final String? version;
}

/// Financial assessment questions class.
class FinancialAssessmentQuestions extends FinancialAssessmentQuestionsModel
    with EquatableMixin {
  /// Initializes Financial assessment questions class.
  const FinancialAssessmentQuestions({
    super.questions,
    super.version,
  });

  /// Creates an instance from JSON.
  factory FinancialAssessmentQuestions.fromJson(Map<String, dynamic> json) =>
      FinancialAssessmentQuestions(
        questions: json['questions'] == null
            ? null
            : Map<String, QuestionsProperty>.fromEntries(json['questions']
                .entries
                .map<MapEntry<String, QuestionsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, QuestionsProperty>(entry.key,
                            QuestionsProperty.fromJson(entry.value)))),
        version: json['version'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['questions'] = questions;
    resultMap['version'] = version;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialAssessmentQuestions copyWith({
    Map<String, QuestionsProperty>? questions,
    String? version,
  }) =>
      FinancialAssessmentQuestions(
        questions: questions ?? this.questions,
        version: version ?? this.version,
      );

  @override
  List<Object?> get props => [questions, version];
}

/// Questions property model class.
abstract class QuestionsPropertyModel {
  /// Initializes Questions property model class .
  const QuestionsPropertyModel({
    required this.type,
    required this.question,
    required this.hideIf,
    required this.answers,
  });

  /// The type of input required for this question
  final TypeEnum type;

  /// The question text to display
  final String question;

  /// Conditions that determine if this question should be hidden
  final List<String> hideIf;

  /// Array of possible answers for this question
  final List<AnswersItem> answers;
}

/// Questions property class.
class QuestionsProperty extends QuestionsPropertyModel with EquatableMixin {
  /// Initializes Questions property class.
  const QuestionsProperty({
    required super.answers,
    required super.hideIf,
    required super.question,
    required super.type,
  });

  /// Creates an instance from JSON.
  factory QuestionsProperty.fromJson(Map<String, dynamic> json) =>
      QuestionsProperty(
        answers: List<AnswersItem>.from(
          json['answers'].map(
            (dynamic item) => AnswersItem.fromJson(item),
          ),
        ),
        hideIf: List<String>.from(
          json['hide_if'].map(
            (dynamic item) => item,
          ),
        ),
        question: json['question'],
        type: typeEnumMapper[json['type']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['answers'] = answers
        .map<dynamic>(
          (AnswersItem item) => item.toJson(),
        )
        .toList();

    resultMap['hide_if'] = hideIf
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['question'] = question;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  QuestionsProperty copyWith({
    List<AnswersItem>? answers,
    List<String>? hideIf,
    String? question,
    TypeEnum? type,
  }) =>
      QuestionsProperty(
        answers: answers ?? this.answers,
        hideIf: hideIf ?? this.hideIf,
        question: question ?? this.question,
        type: type ?? this.type,
      );

  @override
  List<Object?> get props => [answers, hideIf, question, type];
}

/// Answers item model class.
abstract class AnswersItemModel {
  /// Initializes Answers item model class .
  const AnswersItemModel({
    required this.value,
    required this.key,
    required this.hideIf,
    this.nextNode,
  });

  /// Display text for this answer option
  final String value;

  /// The key for the answer option
  final String key;

  /// Array of conditions that determine if this answer should be hidden
  final List<String> hideIf;

  /// The next question to show after this answer is selected
  final String? nextNode;
}

/// Answers item class.
class AnswersItem extends AnswersItemModel with EquatableMixin {
  /// Initializes Answers item class.
  const AnswersItem({
    required super.hideIf,
    required super.key,
    required super.value,
    super.nextNode,
  });

  /// Creates an instance from JSON.
  factory AnswersItem.fromJson(Map<String, dynamic> json) => AnswersItem(
        hideIf: List<String>.from(
          json['hide_if'].map(
            (dynamic item) => item,
          ),
        ),
        key: json['key'],
        value: json['value'],
        nextNode: json['next_node'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['hide_if'] = hideIf
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['key'] = key;
    resultMap['value'] = value;
    resultMap['next_node'] = nextNode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AnswersItem copyWith({
    List<String>? hideIf,
    String? key,
    String? value,
    String? nextNode,
  }) =>
      AnswersItem(
        hideIf: hideIf ?? this.hideIf,
        key: key ?? this.key,
        value: value ?? this.value,
        nextNode: nextNode ?? this.nextNode,
      );

  @override
  List<Object?> get props => [hideIf, key, value, nextNode];
}
