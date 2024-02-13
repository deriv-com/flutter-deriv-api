// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Jtoken create response model class.
abstract class JtokenCreateResponseModel {
  /// Initializes Jtoken create response model class .
  const JtokenCreateResponseModel({
    this.jtokenCreate,
  });

  /// The JToken created.
  final String? jtokenCreate;
}

/// Jtoken create response class.
class JtokenCreateResponse extends JtokenCreateResponseModel {
  /// Initializes Jtoken create response class.
  const JtokenCreateResponse({
    super.jtokenCreate,
  });

  /// Creates an instance from JSON.
  factory JtokenCreateResponse.fromJson(
    dynamic jtokenCreateJson,
  ) =>
      JtokenCreateResponse(
        jtokenCreate: jtokenCreateJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['jtoken_create'] = jtokenCreate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  JtokenCreateResponse copyWith({
    String? jtokenCreate,
  }) =>
      JtokenCreateResponse(
        jtokenCreate: jtokenCreate ?? this.jtokenCreate,
      );
}
