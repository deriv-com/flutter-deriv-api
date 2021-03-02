import 'package:meta/meta.dart';

import '../../helpers/helpers.dart';

/// Buy contract for multiple accounts response model class
abstract class BuyContractForMultipleAccountsResponseModel {
  /// Initializes
  BuyContractForMultipleAccountsResponseModel({
    @required this.buyContractForMultipleAccounts,
  });

  /// Receipt confirmation for the purchase
  final BuyContractForMultipleAccounts buyContractForMultipleAccounts;
}

/// Buy contract for multiple accounts response class
class BuyContractForMultipleAccountsResponse
    extends BuyContractForMultipleAccountsResponseModel {
  /// Initializes
  BuyContractForMultipleAccountsResponse({
    @required BuyContractForMultipleAccounts buyContractForMultipleAccounts,
  }) : super(
          buyContractForMultipleAccounts: buyContractForMultipleAccounts,
        );

  /// Creates an instance from JSON
  factory BuyContractForMultipleAccountsResponse.fromJson(
    dynamic buyContractForMultipleAccountsJson,
  ) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts:
            buyContractForMultipleAccountsJson == null
                ? null
                : BuyContractForMultipleAccounts.fromJson(
                    buyContractForMultipleAccountsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (buyContractForMultipleAccounts != null) {
      resultMap['buy_contract_for_multiple_accounts'] =
          buyContractForMultipleAccounts.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  BuyContractForMultipleAccountsResponse copyWith({
    BuyContractForMultipleAccounts buyContractForMultipleAccounts,
  }) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
      );
}
/// Buy contract for multiple accounts model class
abstract class BuyContractForMultipleAccountsModel {
  /// Initializes
  BuyContractForMultipleAccountsModel({
    @required this.result,
  });

  /// List of results containing transactions and/or errors for the bought contracts.
  final List<dynamic> result;
}

/// Buy contract for multiple accounts class
class BuyContractForMultipleAccounts
    extends BuyContractForMultipleAccountsModel {
  /// Initializes
  BuyContractForMultipleAccounts({
    @required List<dynamic> result,
  }) : super(
          result: result,
        );

  /// Creates an instance from JSON
  factory BuyContractForMultipleAccounts.fromJson(Map<String, dynamic> json) =>
      BuyContractForMultipleAccounts(
        result: json['result'] == null
            ? null
            : List<dynamic>.from(json['result'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (result != null) {
      resultMap['result'] =
          result.map<dynamic>((dynamic item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  BuyContractForMultipleAccounts copyWith({
    List<dynamic> result,
  }) =>
      BuyContractForMultipleAccounts(
        result: result ?? this.result,
      );
}
