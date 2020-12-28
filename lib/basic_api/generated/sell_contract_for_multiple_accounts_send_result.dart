/// Sell contract for multiple accounts send model class
abstract class SellContractForMultipleAccountsSendModel {
  /// Initializes
  SellContractForMultipleAccountsSendModel({
    @required this.sellContractForMultipleAccounts,
    @required this.price,
    @required this.shortcode,
    @required this.tokens,
  });

  /// Must be `1`
  final int sellContractForMultipleAccounts;

  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final double price;

  /// An internal ID used to identify the contract which was originally bought. This is returned from the `buy` and `buy_contract_for_multiple_accounts` calls.
  final String shortcode;

  /// Authorisation tokens which select the accounts to sell use for the affected accounts.
  final List<String> tokens;
}

/// Sell contract for multiple accounts send class
class SellContractForMultipleAccountsSend
    extends SellContractForMultipleAccountsSendModel {
  /// Initializes
  SellContractForMultipleAccountsSend({
    @required int sellContractForMultipleAccounts,
    @required double price,
    @required String shortcode,
    @required List<String> tokens,
  }) : super(
          sellContractForMultipleAccounts: sellContractForMultipleAccounts,
          price: price,
          shortcode: shortcode,
          tokens: tokens,
        );

  /// Creates an instance from JSON
  factory SellContractForMultipleAccountsSend.fromJson(
          Map<String, dynamic> json) =>
      SellContractForMultipleAccountsSend(
        sellContractForMultipleAccounts:
            json['sell_contract_for_multiple_accounts'],
        price: getDouble(json['price']),
        shortcode: json['shortcode'],
        tokens: List<String>.from(json['tokens'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['sell_contract_for_multiple_accounts'] =
        sellContractForMultipleAccounts;
    result['price'] = price;
    result['shortcode'] = shortcode;
    result['tokens'] = tokens;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellContractForMultipleAccountsSend copyWith({
    int sellContractForMultipleAccounts,
    double price,
    String shortcode,
    List<String> tokens,
  }) =>
      SellContractForMultipleAccountsSend(
        sellContractForMultipleAccounts: sellContractForMultipleAccounts ??
            this.sellContractForMultipleAccounts,
        price: price ?? this.price,
        shortcode: shortcode ?? this.shortcode,
        tokens: tokens ?? this.tokens,
      );
}
