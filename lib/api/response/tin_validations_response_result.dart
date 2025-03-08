// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Tin validations response model class.
abstract class TinValidationsResponseModel {
  /// Initializes Tin validations response model class .
  const TinValidationsResponseModel({
    this.tinValidations,
  });

  /// Validations for Tax Identification Numbers (TIN)
  final TinValidations? tinValidations;
}

/// Tin validations response class.
class TinValidationsResponse extends TinValidationsResponseModel {
  /// Initializes Tin validations response class.
  const TinValidationsResponse({
    super.tinValidations,
  });

  /// Creates an instance from JSON.
  factory TinValidationsResponse.fromJson(
    dynamic tinValidationsJson,
  ) =>
      TinValidationsResponse(
        tinValidations: tinValidationsJson == null
            ? null
            : TinValidations.fromJson(tinValidationsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tinValidations != null) {
      resultMap['tin_validations'] = tinValidations!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TinValidationsResponse copyWith({
    TinValidations? tinValidations,
  }) =>
      TinValidationsResponse(
        tinValidations: tinValidations ?? this.tinValidations,
      );
}
/// Tin validations model class.
abstract class TinValidationsModel {
  /// Initializes Tin validations model class .
  const TinValidationsModel({
    this.invalidPatterns,
    this.isTinMandatory,
    this.tinEmploymentStatusBypass,
    this.tinFormat,
  });

  /// Invalid regex patterns for tin validation
  final List<String>? invalidPatterns;

  /// Whether the TIN is mandatory for the selected country
  final bool? isTinMandatory;

  /// List of employment statuses that bypass TIN requirements for the selected country
  final List<String>? tinEmploymentStatusBypass;

  /// Country tax identifier formats.
  final List<String>? tinFormat;
}

/// Tin validations class.
class TinValidations extends TinValidationsModel {
  /// Initializes Tin validations class.
  const TinValidations({
    super.invalidPatterns,
    super.isTinMandatory,
    super.tinEmploymentStatusBypass,
    super.tinFormat,
  });

  /// Creates an instance from JSON.
  factory TinValidations.fromJson(Map<String, dynamic> json) => TinValidations(
        invalidPatterns: json['invalid_patterns'] == null
            ? null
            : List<String>.from(
                json['invalid_patterns']?.map(
                  (dynamic item) => item,
                ),
              ),
        isTinMandatory: getBool(json['is_tin_mandatory']),
        tinEmploymentStatusBypass: json['tin_employment_status_bypass'] == null
            ? null
            : List<String>.from(
                json['tin_employment_status_bypass']?.map(
                  (dynamic item) => item,
                ),
              ),
        tinFormat: json['tin_format'] == null
            ? null
            : List<String>.from(
                json['tin_format']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (invalidPatterns != null) {
      resultMap['invalid_patterns'] = invalidPatterns!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['is_tin_mandatory'] = isTinMandatory;
    if (tinEmploymentStatusBypass != null) {
      resultMap['tin_employment_status_bypass'] = tinEmploymentStatusBypass!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (tinFormat != null) {
      resultMap['tin_format'] = tinFormat!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TinValidations copyWith({
    List<String>? invalidPatterns,
    bool? isTinMandatory,
    List<String>? tinEmploymentStatusBypass,
    List<String>? tinFormat,
  }) =>
      TinValidations(
        invalidPatterns: invalidPatterns ?? this.invalidPatterns,
        isTinMandatory: isTinMandatory ?? this.isTinMandatory,
        tinEmploymentStatusBypass:
            tinEmploymentStatusBypass ?? this.tinEmploymentStatusBypass,
        tinFormat: tinFormat ?? this.tinFormat,
      );
}
