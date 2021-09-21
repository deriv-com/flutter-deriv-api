// ignore_for_file: prefer_single_quotes


/// Sell contract for multiple accounts response model class.
abstract class SellContractForMultipleAccountsResponseModel {
  /// Initializes Sell contract for multiple accounts response model class .
  SellContractForMultipleAccountsResponseModel({
    this.sellContractForMultipleAccounts,
  });

  /// Status information for each affected account.
  final SellContractForMultipleAccounts? sellContractForMultipleAccounts;
}

/// Sell contract for multiple accounts response class.
class SellContractForMultipleAccountsResponse
    extends SellContractForMultipleAccountsResponseModel {
  /// Initializes Sell contract for multiple accounts response class.
  SellContractForMultipleAccountsResponse({
    SellContractForMultipleAccounts? sellContractForMultipleAccounts,
  }) : super(
          sellContractForMultipleAccounts: sellContractForMultipleAccounts,
        );

  /// Creates an instance from JSON.
  factory SellContractForMultipleAccountsResponse.fromJson(
    dynamic sellContractForMultipleAccountsJson,
  ) =>
      SellContractForMultipleAccountsResponse(
        sellContractForMultipleAccounts:
            sellContractForMultipleAccountsJson == null
                ? null
                : SellContractForMultipleAccounts.fromJson(
                    sellContractForMultipleAccountsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (sellContractForMultipleAccounts != null) {
      resultMap['sell_contract_for_multiple_accounts'] =
          sellContractForMultipleAccounts!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SellContractForMultipleAccountsResponse copyWith({
    SellContractForMultipleAccounts? sellContractForMultipleAccounts,
  }) =>
      SellContractForMultipleAccountsResponse(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
      );
}
/// Sell contract for multiple accounts model class.
abstract class SellContractForMultipleAccountsModel {
  /// Initializes Sell contract for multiple accounts model class .
  SellContractForMultipleAccountsModel({
    this.result,
  });

  /// The result of sell for multiple accounts request.
  final List<Map<String, dynamic>>? result;
}

/// Sell contract for multiple accounts class.
class SellContractForMultipleAccounts
    extends SellContractForMultipleAccountsModel {
  /// Initializes Sell contract for multiple accounts class.
  SellContractForMultipleAccounts({
    List<Map<String, dynamic>>? result,
  }) : super(
          result: result,
        );

  /// Creates an instance from JSON.
  factory SellContractForMultipleAccounts.fromJson(Map<String, dynamic> json) =>
      SellContractForMultipleAccounts(
        result: json['result'] == null
            ? null
            : List<Map<String, dynamic>>.from(
                json['result']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (result != null) {
      resultMap['result'] = result!
          .map<dynamic>(
            (Map<String, dynamic> item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SellContractForMultipleAccounts copyWith({
    List<Map<String, dynamic>>? result,
  }) =>
      SellContractForMultipleAccounts(
        result: result ?? this.result,
      );
}
