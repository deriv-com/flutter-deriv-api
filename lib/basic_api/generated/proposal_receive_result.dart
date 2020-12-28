/// Proposal receive model class
abstract class ProposalReceiveModel {
  /// Initializes
  ProposalReceiveModel({
    @required this.proposal,
    @required this.subscription,
  });

  /// Latest price and other details for a given contract
  final Proposal proposal;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Proposal receive class
class ProposalReceive extends ProposalReceiveModel {
  /// Initializes
  ProposalReceive({
    @required Proposal proposal,
    @required Subscription subscription,
  }) : super(
          proposal: proposal,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory ProposalReceive.fromJson(Map<String, dynamic> json) =>
      ProposalReceive(
        proposal: json['proposal'] == null
            ? null
            : Proposal.fromJson(json['proposal']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (proposal != null) {
      result['proposal'] = proposal.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProposalReceive copyWith({
    Proposal proposal,
    Subscription subscription,
  }) =>
      ProposalReceive(
        proposal: proposal ?? this.proposal,
        subscription: subscription ?? this.subscription,
      );
}
/// Proposal model class
abstract class ProposalModel {
  /// Initializes
  ProposalModel({
    @required this.askPrice,
    @required this.cancellation,
    this.commission,
    @required this.dateStart,
    @required this.displayValue,
    @required this.id,
    @required this.limitOrder,
    @required this.longcode,
    @required this.multiplier,
    @required this.payout,
    @required this.spot,
    @required this.spotTime,
  });

  /// The ask price.
  final double askPrice;

  /// Contains information about contract cancellation option.
  final Cancellation cancellation;

  /// Commission changed in percentage (%).
  final double commission;

  /// The start date of the contract.
  final int dateStart;

  /// Same as `ask_price`.
  final String displayValue;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Contains limit order information. (Only applicable for contract with limit order).
  final LimitOrder limitOrder;

  /// Example: Win payout if Random 100 Index is strictly higher than entry spot at 15 minutes after contract start time.
  final String longcode;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double multiplier;

  /// The payout amount of the contract.
  final double payout;

  /// Spot value (if there are no Exchange data-feed licensing restrictions for the underlying symbol).
  final double spot;

  /// The corresponding time of the spot value.
  final int spotTime;
}

/// Proposal class
class Proposal extends ProposalModel {
  /// Initializes
  Proposal({
    @required double askPrice,
    @required Cancellation cancellation,
    double commission,
    @required int dateStart,
    @required String displayValue,
    @required String id,
    @required LimitOrder limitOrder,
    @required String longcode,
    @required double multiplier,
    @required double payout,
    @required double spot,
    @required int spotTime,
  }) : super(
          askPrice: askPrice,
          cancellation: cancellation,
          commission: commission,
          dateStart: dateStart,
          displayValue: displayValue,
          id: id,
          limitOrder: limitOrder,
          longcode: longcode,
          multiplier: multiplier,
          payout: payout,
          spot: spot,
          spotTime: spotTime,
        );

  /// Creates an instance from JSON
  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        askPrice: getDouble(json['ask_price']),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        commission: getDouble(json['commission']),
        dateStart: json['date_start'],
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        longcode: json['longcode'],
        multiplier: getDouble(json['multiplier']),
        payout: getDouble(json['payout']),
        spot: getDouble(json['spot']),
        spotTime: json['spot_time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ask_price'] = askPrice;
    if (cancellation != null) {
      result['cancellation'] = cancellation.toJson();
    }
    result['commission'] = commission;
    result['date_start'] = dateStart;
    result['display_value'] = displayValue;
    result['id'] = id;
    if (limitOrder != null) {
      result['limit_order'] = limitOrder.toJson();
    }
    result['longcode'] = longcode;
    result['multiplier'] = multiplier;
    result['payout'] = payout;
    result['spot'] = spot;
    result['spot_time'] = spotTime;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Proposal copyWith({
    double askPrice,
    Cancellation cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrder limitOrder,
    String longcode,
    double multiplier,
    double payout,
    double spot,
    int spotTime,
  }) =>
      Proposal(
        askPrice: askPrice ?? this.askPrice,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        limitOrder: limitOrder ?? this.limitOrder,
        longcode: longcode ?? this.longcode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
      );
}
/// Cancellation model class
abstract class CancellationModel {
  /// Initializes
  CancellationModel({
    @required this.askPrice,
    @required this.dateExpiry,
  });

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final int dateExpiry;
}

/// Cancellation class
class Cancellation extends CancellationModel {
  /// Initializes
  Cancellation({
    @required double askPrice,
    @required int dateExpiry,
  }) : super(
          askPrice: askPrice,
          dateExpiry: dateExpiry,
        );

  /// Creates an instance from JSON
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        askPrice: getDouble(json['ask_price']),
        dateExpiry: json['date_expiry'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['ask_price'] = askPrice;
    result['date_expiry'] = dateExpiry;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Cancellation copyWith({
    double askPrice,
    int dateExpiry,
  }) =>
      Cancellation(
        askPrice: askPrice ?? this.askPrice,
        dateExpiry: dateExpiry ?? this.dateExpiry,
      );
}
/// Limit order model class
abstract class LimitOrderModel {
  /// Initializes
  LimitOrderModel({
    @required this.stopLoss,
    @required this.stopOut,
    @required this.takeProfit,
  });

  /// Contains information where the contract will be closed automatically at the loss specified by the user.
  final StopLoss stopLoss;

  /// Contains information where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final StopOut stopOut;

  /// Contains information where the contract will be closed automatically at the profit specified by the user.
  final TakeProfit takeProfit;
}

/// Limit order class
class LimitOrder extends LimitOrderModel {
  /// Initializes
  LimitOrder({
    @required StopLoss stopLoss,
    @required StopOut stopOut,
    @required TakeProfit takeProfit,
  }) : super(
          stopLoss: stopLoss,
          stopOut: stopOut,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        stopLoss: json['stop_loss'] == null
            ? null
            : StopLoss.fromJson(json['stop_loss']),
        stopOut: json['stop_out'] == null
            ? null
            : StopOut.fromJson(json['stop_out']),
        takeProfit: json['take_profit'] == null
            ? null
            : TakeProfit.fromJson(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (stopLoss != null) {
      result['stop_loss'] = stopLoss.toJson();
    }
    if (stopOut != null) {
      result['stop_out'] = stopOut.toJson();
    }
    if (takeProfit != null) {
      result['take_profit'] = takeProfit.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  LimitOrder copyWith({
    StopLoss stopLoss,
    StopOut stopOut,
    TakeProfit takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
/// Stop loss model class
abstract class StopLossModel {
  /// Initializes
  StopLossModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Stop loss amount
  final double orderAmount;

  /// Stop loss order epoch
  final int orderDate;

  /// Pip-sized barrier value
  final UNKNOWN_TYPE value;
}

/// Stop loss class
class StopLoss extends StopLossModel {
  /// Initializes
  StopLoss({
    @required String displayName,
    double orderAmount,
    @required int orderDate,
    UNKNOWN_TYPE value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopLoss.fromJson(Map<String, dynamic> json) => StopLoss(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: json['order_date'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StopLoss copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    UNKNOWN_TYPE value,
  }) =>
      StopLoss(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Stop out model class
abstract class StopOutModel {
  /// Initializes
  StopOutModel({
    @required this.displayName,
    @required this.orderAmount,
    @required this.orderDate,
    @required this.value,
  });

  /// Localized display name
  final String displayName;

  /// Stop out amount
  final double orderAmount;

  /// Stop out order epoch
  final int orderDate;

  /// Pip-sized barrier value
  final String value;
}

/// Stop out class
class StopOut extends StopOutModel {
  /// Initializes
  StopOut({
    @required String displayName,
    @required double orderAmount,
    @required int orderDate,
    @required String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopOut.fromJson(Map<String, dynamic> json) => StopOut(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: json['order_date'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StopOut copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    String value,
  }) =>
      StopOut(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Take profit model class
abstract class TakeProfitModel {
  /// Initializes
  TakeProfitModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Take profit amount
  final double orderAmount;

  /// Take profit order epoch
  final int orderDate;

  /// Pip-sized barrier value
  final UNKNOWN_TYPE value;
}

/// Take profit class
class TakeProfit extends TakeProfitModel {
  /// Initializes
  TakeProfit({
    @required String displayName,
    double orderAmount,
    @required int orderDate,
    UNKNOWN_TYPE value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: json['order_date'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TakeProfit copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    UNKNOWN_TYPE value,
  }) =>
      TakeProfit(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
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
