/// Proposal open contract receive model class
abstract class ProposalOpenContractReceiveModel {
  /// Initializes
  ProposalOpenContractReceiveModel({
    @required this.proposalOpenContract,
    @required this.subscription,
  });

  /// Latest price and other details for an open contract
  final ProposalOpenContract proposalOpenContract;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Proposal open contract receive class
class ProposalOpenContractReceive extends ProposalOpenContractReceiveModel {
  /// Initializes
  ProposalOpenContractReceive({
    @required ProposalOpenContract proposalOpenContract,
    @required Subscription subscription,
  }) : super(
          proposalOpenContract: proposalOpenContract,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContractReceive.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContractReceive(
        proposalOpenContract: json['proposal_open_contract'] == null
            ? null
            : ProposalOpenContract.fromJson(json['proposal_open_contract']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (proposalOpenContract != null) {
      result['proposal_open_contract'] = proposalOpenContract.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProposalOpenContractReceive copyWith({
    ProposalOpenContract proposalOpenContract,
    Subscription subscription,
  }) =>
      ProposalOpenContractReceive(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
      );
}
/// Proposal open contract model class
abstract class ProposalOpenContractModel {
  /// Initializes
  ProposalOpenContractModel({
    this.auditDetails,
    this.barrier,
    @required this.barrierCount,
    @required this.bidPrice,
    @required this.buyPrice,
    @required this.cancellation,
    this.commision,
    @required this.contractId,
    @required this.contractType,
    @required this.currency,
    @required this.currentSpot,
    @required this.currentSpotDisplayValue,
    @required this.currentSpotTime,
    @required this.dateExpiry,
    @required this.dateSettlement,
    @required this.dateStart,
    @required this.displayName,
    @required this.displayValue,
    this.entrySpot,
    this.entrySpotDisplayValue,
    @required this.entryTick,
    @required this.entryTickDisplayValue,
    @required this.entryTickTime,
    @required this.exitTick,
    @required this.exitTickDisplayValue,
    @required this.exitTickTime,
    @required this.highBarrier,
    @required this.id,
    @required this.isExpired,
    @required this.isForwardStarting,
    @required this.isIntraday,
    @required this.isPathDependent,
    @required this.isSettleable,
    @required this.isSold,
    @required this.isValidToCancel,
    @required this.isValidToSell,
    @required this.limitOrder,
    @required this.longcode,
    @required this.lowBarrier,
    @required this.multiplier,
    @required this.payout,
    @required this.profit,
    @required this.profitPercentage,
    @required this.purchaseTime,
    @required this.resetTime,
    @required this.sellPrice,
    @required this.sellSpot,
    @required this.sellSpotDisplayValue,
    @required this.sellSpotTime,
    this.sellTime,
    @required this.shortcode,
    this.status,
    @required this.tickCount,
    @required this.tickStream,
    @required this.transactionIds,
    @required this.underlying,
    @required this.validationError,
  });

  /// Tick details around contract start and end time.
  final UNKNOWN_TYPE auditDetails;

  /// Barrier of the contract (if any).
  final UNKNOWN_TYPE barrier;

  /// The number of barriers a contract has.
  final double barrierCount;

  /// Price at which the contract could be sold back to the company.
  final double bidPrice;

  /// Price at which contract was purchased
  final double buyPrice;

  /// Contains information about contract cancellation option.
  final Cancellation cancellation;

  /// Commission in payout currency amount.
  final double commision;

  /// The internal contract identifier
  final int contractId;

  /// Contract type.
  final String contractType;

  /// The currency code of the contract.
  final String currency;

  /// Spot value if we have license to stream this symbol.
  final double currentSpot;

  /// Spot value with the correct precision if we have license to stream this symbol.
  final String currentSpotDisplayValue;

  /// The corresponding time of the current spot.
  final int currentSpotTime;

  /// Expiry date (epoch) of the Contract. Please note that it is not applicable for tick trade contracts.
  final int dateExpiry;

  /// Settlement date (epoch) of the contract.
  final int dateSettlement;

  /// Start date (epoch) of the contract.
  final int dateStart;

  /// Display name of underlying
  final String displayName;

  /// The `bid_price` with the correct precision
  final String displayValue;

  /// Same as `entry_tick`. For backwards compatibility.
  final double entrySpot;

  /// Same as `entry_tick_display_value`. For backwards compatibility.
  final UNKNOWN_TYPE entrySpotDisplayValue;

  /// This is the entry spot of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final double entryTick;

  /// This is the entry spot with the correct precision of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final String entryTickDisplayValue;

  /// This is the epoch time of the entry tick.
  final int entryTickTime;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final double exitTick;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final String exitTickDisplayValue;

  /// This is the epoch time of the exit tick. Note that since certain instruments don't tick every second, the exit tick time may be a few seconds before the end time.
  final int exitTickTime;

  /// High barrier of the contract (if any).
  final String highBarrier;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Whether the contract is expired or not.
  final bool isExpired;

  /// Whether the contract is forward-starting or not.
  final bool isForwardStarting;

  /// Whether the contract is an intraday contract.
  final bool isIntraday;

  /// Whether the contract expiry price will depend on the path of the market (e.g. One Touch contract).
  final bool isPathDependent;

  /// Whether the contract is settleable or not.
  final bool isSettleable;

  /// Whether the contract is sold or not.
  final bool isSold;

  /// Whether the contract can be cancelled.
  final bool isValidToCancel;

  /// Whether the contract can be sold back to the company.
  final bool isValidToSell;

  /// Orders are applicable to `MULTUP` and `MULTDOWN` contracts only.
  final LimitOrder limitOrder;

  /// Text description of the contract purchased, Example: Win payout if Volatility 100 Index is strictly higher than entry spot at 10 minutes after contract start time.
  final String longcode;

  /// Low barrier of the contract (if any).
  final String lowBarrier;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double multiplier;

  /// Payout value of the contract.
  final double payout;

  /// The latest bid price minus buy price.
  final double profit;

  /// Profit in percentage.
  final double profitPercentage;

  /// Epoch of purchase time, will be same as `date_start` for all contracts except forward starting contracts.
  final int purchaseTime;

  /// [Only for reset trades] The epoch time of a barrier reset.
  final int resetTime;

  /// Price at which contract was sold, only available when contract has been sold.
  final double sellPrice;

  /// Latest spot value at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final double sellSpot;

  /// Latest spot value with the correct precision at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final String sellSpotDisplayValue;

  /// Epoch time of the sell spot. Note that since certain underlyings don't tick every second, the sell spot time may be a few seconds before the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final int sellSpotTime;

  /// Epoch time of when the contract was sold (only present for contracts already sold)
  final double sellTime;

  /// Coded description of the contract purchased.
  final String shortcode;

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final UNKNOWN_TYPE status;

  /// Only for tick trades, number of ticks
  final int tickCount;

  /// Tick stream from entry to end time.
  final List<TickStream> tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIds transactionIds;

  /// The underlying symbol code.
  final String underlying;

  /// Error message if validation fails
  final String validationError;
}

/// Proposal open contract class
class ProposalOpenContract extends ProposalOpenContractModel {
  /// Initializes
  ProposalOpenContract({
    UNKNOWN_TYPE auditDetails,
    UNKNOWN_TYPE barrier,
    @required double barrierCount,
    @required double bidPrice,
    @required double buyPrice,
    @required Cancellation cancellation,
    double commision,
    @required int contractId,
    @required String contractType,
    @required String currency,
    @required double currentSpot,
    @required String currentSpotDisplayValue,
    @required int currentSpotTime,
    @required int dateExpiry,
    @required int dateSettlement,
    @required int dateStart,
    @required String displayName,
    @required String displayValue,
    double entrySpot,
    UNKNOWN_TYPE entrySpotDisplayValue,
    @required double entryTick,
    @required String entryTickDisplayValue,
    @required int entryTickTime,
    @required double exitTick,
    @required String exitTickDisplayValue,
    @required int exitTickTime,
    @required String highBarrier,
    @required String id,
    @required bool isExpired,
    @required bool isForwardStarting,
    @required bool isIntraday,
    @required bool isPathDependent,
    @required bool isSettleable,
    @required bool isSold,
    @required bool isValidToCancel,
    @required bool isValidToSell,
    @required LimitOrder limitOrder,
    @required String longcode,
    @required String lowBarrier,
    @required double multiplier,
    @required double payout,
    @required double profit,
    @required double profitPercentage,
    @required int purchaseTime,
    @required int resetTime,
    @required double sellPrice,
    @required double sellSpot,
    @required String sellSpotDisplayValue,
    @required int sellSpotTime,
    double sellTime,
    @required String shortcode,
    UNKNOWN_TYPE status,
    @required int tickCount,
    @required List<TickStream> tickStream,
    @required TransactionIds transactionIds,
    @required String underlying,
    @required String validationError,
  }) : super(
          auditDetails: auditDetails,
          barrier: barrier,
          barrierCount: barrierCount,
          bidPrice: bidPrice,
          buyPrice: buyPrice,
          cancellation: cancellation,
          commision: commision,
          contractId: contractId,
          contractType: contractType,
          currency: currency,
          currentSpot: currentSpot,
          currentSpotDisplayValue: currentSpotDisplayValue,
          currentSpotTime: currentSpotTime,
          dateExpiry: dateExpiry,
          dateSettlement: dateSettlement,
          dateStart: dateStart,
          displayName: displayName,
          displayValue: displayValue,
          entrySpot: entrySpot,
          entrySpotDisplayValue: entrySpotDisplayValue,
          entryTick: entryTick,
          entryTickDisplayValue: entryTickDisplayValue,
          entryTickTime: entryTickTime,
          exitTick: exitTick,
          exitTickDisplayValue: exitTickDisplayValue,
          exitTickTime: exitTickTime,
          highBarrier: highBarrier,
          id: id,
          isExpired: isExpired,
          isForwardStarting: isForwardStarting,
          isIntraday: isIntraday,
          isPathDependent: isPathDependent,
          isSettleable: isSettleable,
          isSold: isSold,
          isValidToCancel: isValidToCancel,
          isValidToSell: isValidToSell,
          limitOrder: limitOrder,
          longcode: longcode,
          lowBarrier: lowBarrier,
          multiplier: multiplier,
          payout: payout,
          profit: profit,
          profitPercentage: profitPercentage,
          purchaseTime: purchaseTime,
          resetTime: resetTime,
          sellPrice: sellPrice,
          sellSpot: sellSpot,
          sellSpotDisplayValue: sellSpotDisplayValue,
          sellSpotTime: sellSpotTime,
          sellTime: sellTime,
          shortcode: shortcode,
          status: status,
          tickCount: tickCount,
          tickStream: tickStream,
          transactionIds: transactionIds,
          underlying: underlying,
          validationError: validationError,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContract.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContract(
        auditDetails: json['audit_details'],
        barrier: json['barrier'],
        barrierCount: getDouble(json['barrier_count']),
        bidPrice: getDouble(json['bid_price']),
        buyPrice: getDouble(json['buy_price']),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        commision: getDouble(json['commision']),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: getDouble(json['current_spot']),
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: json['current_spot_time'],
        dateExpiry: json['date_expiry'],
        dateSettlement: json['date_settlement'],
        dateStart: json['date_start'],
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: getDouble(json['entry_spot']),
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: getDouble(json['entry_tick']),
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: json['entry_tick_time'],
        exitTick: getDouble(json['exit_tick']),
        exitTickDisplayValue: json['exit_tick_display_value'],
        exitTickTime: json['exit_tick_time'],
        highBarrier: json['high_barrier'],
        id: json['id'],
        isExpired: getBool(json['is_expired']),
        isForwardStarting: getBool(json['is_forward_starting']),
        isIntraday: getBool(json['is_intraday']),
        isPathDependent: getBool(json['is_path_dependent']),
        isSettleable: getBool(json['is_settleable']),
        isSold: getBool(json['is_sold']),
        isValidToCancel: getBool(json['is_valid_to_cancel']),
        isValidToSell: getBool(json['is_valid_to_sell']),
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        multiplier: getDouble(json['multiplier']),
        payout: getDouble(json['payout']),
        profit: getDouble(json['profit']),
        profitPercentage: getDouble(json['profit_percentage']),
        purchaseTime: json['purchase_time'],
        resetTime: json['reset_time'],
        sellPrice: getDouble(json['sell_price']),
        sellSpot: getDouble(json['sell_spot']),
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: json['sell_spot_time'],
        sellTime: getDouble(json['sell_time']),
        shortcode: json['shortcode'],
        status: json['status'],
        tickCount: json['tick_count'],
        tickStream: json['tick_stream'] == null
            ? null
            : json['tick_stream']
                .map<TickStream>((dynamic item) => TickStream.fromJson(item))
                .toList(),
        transactionIds: json['transaction_ids'] == null
            ? null
            : TransactionIds.fromJson(json['transaction_ids']),
        underlying: json['underlying'],
        validationError: json['validation_error'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['audit_details'] = auditDetails;
    result['barrier'] = barrier;
    result['barrier_count'] = barrierCount;
    result['bid_price'] = bidPrice;
    result['buy_price'] = buyPrice;
    if (cancellation != null) {
      result['cancellation'] = cancellation.toJson();
    }
    result['commision'] = commision;
    result['contract_id'] = contractId;
    result['contract_type'] = contractType;
    result['currency'] = currency;
    result['current_spot'] = currentSpot;
    result['current_spot_display_value'] = currentSpotDisplayValue;
    result['current_spot_time'] = currentSpotTime;
    result['date_expiry'] = dateExpiry;
    result['date_settlement'] = dateSettlement;
    result['date_start'] = dateStart;
    result['display_name'] = displayName;
    result['display_value'] = displayValue;
    result['entry_spot'] = entrySpot;
    result['entry_spot_display_value'] = entrySpotDisplayValue;
    result['entry_tick'] = entryTick;
    result['entry_tick_display_value'] = entryTickDisplayValue;
    result['entry_tick_time'] = entryTickTime;
    result['exit_tick'] = exitTick;
    result['exit_tick_display_value'] = exitTickDisplayValue;
    result['exit_tick_time'] = exitTickTime;
    result['high_barrier'] = highBarrier;
    result['id'] = id;
    result['is_expired'] = isExpired;
    result['is_forward_starting'] = isForwardStarting;
    result['is_intraday'] = isIntraday;
    result['is_path_dependent'] = isPathDependent;
    result['is_settleable'] = isSettleable;
    result['is_sold'] = isSold;
    result['is_valid_to_cancel'] = isValidToCancel;
    result['is_valid_to_sell'] = isValidToSell;
    if (limitOrder != null) {
      result['limit_order'] = limitOrder.toJson();
    }
    result['longcode'] = longcode;
    result['low_barrier'] = lowBarrier;
    result['multiplier'] = multiplier;
    result['payout'] = payout;
    result['profit'] = profit;
    result['profit_percentage'] = profitPercentage;
    result['purchase_time'] = purchaseTime;
    result['reset_time'] = resetTime;
    result['sell_price'] = sellPrice;
    result['sell_spot'] = sellSpot;
    result['sell_spot_display_value'] = sellSpotDisplayValue;
    result['sell_spot_time'] = sellSpotTime;
    result['sell_time'] = sellTime;
    result['shortcode'] = shortcode;
    result['status'] = status;
    result['tick_count'] = tickCount;
    if (tickStream != null) {
      result['tick_stream'] = tickStream.map((item) => item.toJson()).toList();
    }
    if (transactionIds != null) {
      result['transaction_ids'] = transactionIds.toJson();
    }
    result['underlying'] = underlying;
    result['validation_error'] = validationError;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProposalOpenContract copyWith({
    UNKNOWN_TYPE auditDetails,
    UNKNOWN_TYPE barrier,
    double barrierCount,
    double bidPrice,
    double buyPrice,
    Cancellation cancellation,
    double commision,
    int contractId,
    String contractType,
    String currency,
    double currentSpot,
    String currentSpotDisplayValue,
    int currentSpotTime,
    int dateExpiry,
    int dateSettlement,
    int dateStart,
    String displayName,
    String displayValue,
    double entrySpot,
    UNKNOWN_TYPE entrySpotDisplayValue,
    double entryTick,
    String entryTickDisplayValue,
    int entryTickTime,
    double exitTick,
    String exitTickDisplayValue,
    int exitTickTime,
    String highBarrier,
    String id,
    bool isExpired,
    bool isForwardStarting,
    bool isIntraday,
    bool isPathDependent,
    bool isSettleable,
    bool isSold,
    bool isValidToCancel,
    bool isValidToSell,
    LimitOrder limitOrder,
    String longcode,
    String lowBarrier,
    double multiplier,
    double payout,
    double profit,
    double profitPercentage,
    int purchaseTime,
    int resetTime,
    double sellPrice,
    double sellSpot,
    String sellSpotDisplayValue,
    int sellSpotTime,
    double sellTime,
    String shortcode,
    UNKNOWN_TYPE status,
    int tickCount,
    List<TickStream> tickStream,
    TransactionIds transactionIds,
    String underlying,
    String validationError,
  }) =>
      ProposalOpenContract(
        auditDetails: auditDetails ?? this.auditDetails,
        barrier: barrier ?? this.barrier,
        barrierCount: barrierCount ?? this.barrierCount,
        bidPrice: bidPrice ?? this.bidPrice,
        buyPrice: buyPrice ?? this.buyPrice,
        cancellation: cancellation ?? this.cancellation,
        commision: commision ?? this.commision,
        contractId: contractId ?? this.contractId,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        currentSpot: currentSpot ?? this.currentSpot,
        currentSpotDisplayValue:
            currentSpotDisplayValue ?? this.currentSpotDisplayValue,
        currentSpotTime: currentSpotTime ?? this.currentSpotTime,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateSettlement: dateSettlement ?? this.dateSettlement,
        dateStart: dateStart ?? this.dateStart,
        displayName: displayName ?? this.displayName,
        displayValue: displayValue ?? this.displayValue,
        entrySpot: entrySpot ?? this.entrySpot,
        entrySpotDisplayValue:
            entrySpotDisplayValue ?? this.entrySpotDisplayValue,
        entryTick: entryTick ?? this.entryTick,
        entryTickDisplayValue:
            entryTickDisplayValue ?? this.entryTickDisplayValue,
        entryTickTime: entryTickTime ?? this.entryTickTime,
        exitTick: exitTick ?? this.exitTick,
        exitTickDisplayValue: exitTickDisplayValue ?? this.exitTickDisplayValue,
        exitTickTime: exitTickTime ?? this.exitTickTime,
        highBarrier: highBarrier ?? this.highBarrier,
        id: id ?? this.id,
        isExpired: isExpired ?? this.isExpired,
        isForwardStarting: isForwardStarting ?? this.isForwardStarting,
        isIntraday: isIntraday ?? this.isIntraday,
        isPathDependent: isPathDependent ?? this.isPathDependent,
        isSettleable: isSettleable ?? this.isSettleable,
        isSold: isSold ?? this.isSold,
        isValidToCancel: isValidToCancel ?? this.isValidToCancel,
        isValidToSell: isValidToSell ?? this.isValidToSell,
        limitOrder: limitOrder ?? this.limitOrder,
        longcode: longcode ?? this.longcode,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        profit: profit ?? this.profit,
        profitPercentage: profitPercentage ?? this.profitPercentage,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        resetTime: resetTime ?? this.resetTime,
        sellPrice: sellPrice ?? this.sellPrice,
        sellSpot: sellSpot ?? this.sellSpot,
        sellSpotDisplayValue: sellSpotDisplayValue ?? this.sellSpotDisplayValue,
        sellSpotTime: sellSpotTime ?? this.sellSpotTime,
        sellTime: sellTime ?? this.sellTime,
        shortcode: shortcode ?? this.shortcode,
        status: status ?? this.status,
        tickCount: tickCount ?? this.tickCount,
        tickStream: tickStream ?? this.tickStream,
        transactionIds: transactionIds ?? this.transactionIds,
        underlying: underlying ?? this.underlying,
        validationError: validationError ?? this.validationError,
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

  /// Contain information where the contract will be closed automatically at the profit specified by the user.
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
/// Tick stream model class
abstract class TickStreamModel {
  /// Initializes
  TickStreamModel({
    @required this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final int epoch;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final UNKNOWN_TYPE tickDisplayValue;
}

/// Tick stream class
class TickStream extends TickStreamModel {
  /// Initializes
  TickStream({
    @required int epoch,
    double tick,
    UNKNOWN_TYPE tickDisplayValue,
  }) : super(
          epoch: epoch,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON
  factory TickStream.fromJson(Map<String, dynamic> json) => TickStream(
        epoch: json['epoch'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['epoch'] = epoch;
    result['tick'] = tick;
    result['tick_display_value'] = tickDisplayValue;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TickStream copyWith({
    int epoch,
    double tick,
    UNKNOWN_TYPE tickDisplayValue,
  }) =>
      TickStream(
        epoch: epoch ?? this.epoch,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
/// Transaction ids model class
abstract class TransactionIdsModel {
  /// Initializes
  TransactionIdsModel({
    @required this.buy,
    @required this.sell,
  });

  /// Buy transaction ID for that contract
  final int buy;

  /// Sell transaction ID for that contract, only present when contract is already sold.
  final int sell;
}

/// Transaction ids class
class TransactionIds extends TransactionIdsModel {
  /// Initializes
  TransactionIds({
    @required int buy,
    @required int sell,
  }) : super(
          buy: buy,
          sell: sell,
        );

  /// Creates an instance from JSON
  factory TransactionIds.fromJson(Map<String, dynamic> json) => TransactionIds(
        buy: json['buy'],
        sell: json['sell'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['buy'] = buy;
    result['sell'] = sell;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TransactionIds copyWith({
    int buy,
    int sell,
  }) =>
      TransactionIds(
        buy: buy ?? this.buy,
        sell: sell ?? this.sell,
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
