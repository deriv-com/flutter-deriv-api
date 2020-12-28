/// Buy receive model class
abstract class BuyReceiveModel {
  /// Initializes
  BuyReceiveModel({
    @required this.buy,
    @required this.subscription,
  });

  /// Receipt confirmation for the purchase
  final Buy buy;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Buy receive class
class BuyReceive extends BuyReceiveModel {
  /// Initializes
  BuyReceive({
    @required Buy buy,
    @required Subscription subscription,
  }) : super(
          buy: buy,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory BuyReceive.fromJson(Map<String, dynamic> json) => BuyReceive(
        buy: json['buy'] == null ? null : Buy.fromJson(json['buy']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (buy != null) {
      result['buy'] = buy.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  BuyReceive copyWith({
    Buy buy,
    Subscription subscription,
  }) =>
      BuyReceive(
        buy: buy ?? this.buy,
        subscription: subscription ?? this.subscription,
      );
}
/// Buy model class
abstract class BuyModel {
  /// Initializes
  BuyModel({
    @required this.balanceAfter,
    @required this.buyPrice,
    @required this.contractId,
    @required this.longcode,
    @required this.payout,
    @required this.purchaseTime,
    @required this.shortcode,
    @required this.startTime,
    @required this.transactionId,
  });

  /// The new account balance after completion of the purchase
  final double balanceAfter;

  /// Actual effected purchase price
  final double buyPrice;

  /// Internal contract identifier
  final int contractId;

  /// The description of contract purchased
  final String longcode;

  /// Proposed payout value
  final double payout;

  /// Epoch value of the transaction purchase time
  final int purchaseTime;

  /// Compact description of the contract purchased
  final String shortcode;

  /// Epoch value showing the expected start time of the contract
  final int startTime;

  /// Internal transaction identifier
  final int transactionId;
}

/// Buy class
class Buy extends BuyModel {
  /// Initializes
  Buy({
    @required double balanceAfter,
    @required double buyPrice,
    @required int contractId,
    @required String longcode,
    @required double payout,
    @required int purchaseTime,
    @required String shortcode,
    @required int startTime,
    @required int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          buyPrice: buyPrice,
          contractId: contractId,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortcode: shortcode,
          startTime: startTime,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory Buy.fromJson(Map<String, dynamic> json) => Buy(
        balanceAfter: getDouble(json['balance_after']),
        buyPrice: getDouble(json['buy_price']),
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: json['purchase_time'],
        shortcode: json['shortcode'],
        startTime: json['start_time'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance_after'] = balanceAfter;
    result['buy_price'] = buyPrice;
    result['contract_id'] = contractId;
    result['longcode'] = longcode;
    result['payout'] = payout;
    result['purchase_time'] = purchaseTime;
    result['shortcode'] = shortcode;
    result['start_time'] = startTime;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Buy copyWith({
    double balanceAfter,
    double buyPrice,
    int contractId,
    String longcode,
    double payout,
    int purchaseTime,
    String shortcode,
    int startTime,
    int transactionId,
  }) =>
      Buy(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortcode: shortcode ?? this.shortcode,
        startTime: startTime ?? this.startTime,
        transactionId: transactionId ?? this.transactionId,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
