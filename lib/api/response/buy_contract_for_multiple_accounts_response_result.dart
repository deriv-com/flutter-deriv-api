// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';


/// Buy contract for multiple accounts response model class.
abstract class BuyContractForMultipleAccountsResponseModel extends Equatable {
  /// Initializes Buy contract for multiple accounts response model class .
  const BuyContractForMultipleAccountsResponseModel({
    this.buyContractForMultipleAccounts,
  });

  /// Receipt confirmation for the purchase
  final BuyContractForMultipleAccounts? buyContractForMultipleAccounts;
}

/// Buy contract for multiple accounts response class.
class BuyContractForMultipleAccountsResponse
    extends BuyContractForMultipleAccountsResponseModel {
  /// Initializes Buy contract for multiple accounts response class.
  const BuyContractForMultipleAccountsResponse({
    BuyContractForMultipleAccounts? buyContractForMultipleAccounts,
  }) : super(
          buyContractForMultipleAccounts: buyContractForMultipleAccounts,
        );

  /// Creates an instance from JSON.
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

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (buyContractForMultipleAccounts != null) {
      resultMap['buy_contract_for_multiple_accounts'] =
          buyContractForMultipleAccounts!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BuyContractForMultipleAccountsResponse copyWith({
    BuyContractForMultipleAccounts? buyContractForMultipleAccounts,
  }) =>
      BuyContractForMultipleAccountsResponse(
        buyContractForMultipleAccounts: buyContractForMultipleAccounts ??
            this.buyContractForMultipleAccounts,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Buy contract for multiple accounts model class.
abstract class BuyContractForMultipleAccountsModel extends Equatable {
  /// Initializes Buy contract for multiple accounts model class .
  const BuyContractForMultipleAccountsModel({
    required this.result,
  });

  /// List of results containing transactions and/or errors for the bought contracts.
  final List<Map<String, dynamic>> result;
}

/// Buy contract for multiple accounts class.
class BuyContractForMultipleAccounts
    extends BuyContractForMultipleAccountsModel {
  /// Initializes Buy contract for multiple accounts class.
  const BuyContractForMultipleAccounts({
    required List<Map<String, dynamic>> result,
  }) : super(
          result: result,
        );

  /// Creates an instance from JSON.
  factory BuyContractForMultipleAccounts.fromJson(Map<String, dynamic> json) =>
      BuyContractForMultipleAccounts(
        result: List<Map<String, dynamic>>.from(
          json['result'].map(
            (dynamic item) => item,
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['result'] = result
        .map<dynamic>(
          (Map<String, dynamic> item) => item,
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BuyContractForMultipleAccounts copyWith({
    required List<Map<String, dynamic>> result,
  }) =>
      BuyContractForMultipleAccounts(
        result: result,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
