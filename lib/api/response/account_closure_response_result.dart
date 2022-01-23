// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Account closure response model class.
abstract class AccountClosureResponseModel extends Equatable {
  /// Initializes Account closure response model class .
  const AccountClosureResponseModel({
    this.accountClosure,
  });

  /// If set to `true`, all accounts are closed.
  final bool? accountClosure;
}

/// Account closure response class.
class AccountClosureResponse extends AccountClosureResponseModel {
  /// Initializes Account closure response class.
  const AccountClosureResponse({
    bool? accountClosure,
  }) : super(
          accountClosure: accountClosure,
        );

  /// Creates an instance from JSON.
  factory AccountClosureResponse.fromJson(
    dynamic accountClosureJson,
  ) =>
      AccountClosureResponse(
        accountClosure: getBool(accountClosureJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_closure'] = accountClosure;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountClosureResponse copyWith({
    bool? accountClosure,
  }) =>
      AccountClosureResponse(
        accountClosure: accountClosure ?? this.accountClosure,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
