// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Change email response model class.
abstract class ChangeEmailResponseModel extends Equatable {
  /// Initializes Change email response model class .
  const ChangeEmailResponseModel({
    this.changeEmail,
  });

  /// `true`: email changed sucssesfully, `false`: failed to change email
  final bool? changeEmail;
}

/// Change email response class.
class ChangeEmailResponse extends ChangeEmailResponseModel {
  /// Initializes Change email response class.
  const ChangeEmailResponse({
    bool? changeEmail,
  }) : super(
          changeEmail: changeEmail,
        );

  /// Creates an instance from JSON.
  factory ChangeEmailResponse.fromJson(
    dynamic changeEmailJson,
  ) =>
      ChangeEmailResponse(
        changeEmail: getBool(changeEmailJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['change_email'] = changeEmail;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ChangeEmailResponse copyWith({
    bool? changeEmail,
  }) =>
      ChangeEmailResponse(
        changeEmail: changeEmail ?? this.changeEmail,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
