import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/tick_model.dart';
import 'package:flutter_deriv_api/api/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/models/audit_detail_model.dart';

/// Model class for proposal open contract
class OpenContractModel extends BaseModel {
  /// Initializes
  OpenContractModel(
      {this.auditDetails,
      this.barrier,
      this.barrierCount,
      this.bidPrice,
      this.buyPrice,
      this.contractId,
      this.contractType,
      this.currency,
      this.currentSpot,
      this.currentSpotDisplayValue,
      this.currentSpotTime,
      this.dateExpiry,
      this.dateSettlement,
      this.dateStart,
      this.displayName,
      this.displayValue,
      this.entrySpot,
      this.entrySpotDisplayValue,
      this.entryTick,
      this.entryTickDisplayValue,
      this.entryTickTime,
      this.exitTick,
      this.exitTickDisplayValue,
      this.exitTickTime,
      this.highBarrier,
      this.id,
      this.isExpired,
      this.isForwardStarting,
      this.isIntraday,
      this.isPathDependent,
      this.isSettleable,
      this.isSold,
      this.isValidToSell,
      this.limitOrder,
      this.longcode,
      this.lowBarrier,
      this.multiplier,
      this.payout,
      this.profit,
      this.profitPercentage,
      this.purchaseTime,
      this.resetTime,
      this.sellPrice,
      this.sellSpot,
      this.sellSpotDisplayValue,
      this.sellSpotTime,
      this.sellTime,
      this.shortcode,
      this.status,
      this.tickCount,
      this.tickStream,
      this.transactionIds,
      this.underlying,
      this.validationError});

  /// Instance from JSON
  factory OpenContractModel.fromJson(Map<String, dynamic> json) =>
      OpenContractModel(
        auditDetails: json['audit_details'] == null
            ? null
            : AuditDetailModel.fromJson(json['audit_details']),
        barrier: json['barrier'],
        barrierCount: json['barrier_count']?.toDouble(),
        bidPrice: json['bid_price']?.toDouble(),
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: json['current_spot'],
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: json['current_spot_time'] == null
            ? null
            : getDateTime(json['current_spot_time']),
        dateExpiry: json['date_expiry'] == null
            ? null
            : getDateTime(json['date_expiry']),
        dateSettlement: json['date_settlement'] == null
            ? null
            : getDateTime(json['date_settlement']),
        dateStart:
            json['date_start'] == null ? null : getDateTime(json['date_start']),
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: json['entry_spot'],
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: json['entry_tick'],
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: json['entry_tick_time'] == null
            ? null
            : getDateTime(json['entry_tick_time']),
        exitTick: json['exit_tick'],
        exitTickDisplayValue: json['exit_tick_display_value'],
        exitTickTime: json['exit_tick_time'] == null
            ? null
            : getDateTime(json['exit_tick_time']),
        highBarrier: json['high_barrier'],
        id: json['id'],
        isExpired: json['is_expired'] == null ? null : json['is_expired'] == 1,
        isForwardStarting: json['is_forward_starting'] == null
            ? null
            : json['is_forward_starting'] == 1,
        isIntraday:
            json['is_intraday'] == null ? null : json['is_intraday'] == 1,
        isPathDependent: json['is_path_dependent'] == null
            ? null
            : json['is_path_dependent'] == 1,
        isSettleable:
            json['is_settleable'] == null ? null : json['is_settleable'] == 1,
        isSold: json['is_sold'] == null ? null : json['is_sold'] == 1,
        isValidToSell: json['is_valid_to_sell'] == null
            ? null
            : json['is_valid_to_sell'] == 1,
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrderModel.fromJson(json['limit_order']),
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        multiplier: json['multiplier'],
        payout: json['payout']?.toDouble(),
        profit: json['profit']?.toDouble(),
        profitPercentage: json['profit_percentage'],
        purchaseTime: json['purchase_time'] == null
            ? null
            : getDateTime(json['purchase_time']),
        resetTime:
            json['reset_time'] == null ? null : getDateTime(json['reset_time']),
        sellPrice: json['sell_price'],
        sellSpot: json['sell_spot'],
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: json['sell_spot_time'] == null
            ? null
            : getDateTime(json['sell_spot_time']),
        sellTime:
            json['sell_time'] == null ? null : getDateTime(json['sell_time']),
        shortcode: json['shortcode'],
        status: json['status'],
        tickCount: json['tick_count'],
        tickStream: json['tick_stream'] == null
            ? null
            : json['tick_stream']
                .map<TickModel>((dynamic entry) => TickModel.fromJson(entry))
                .toList(),
        transactionIds: json['transaction_ids'] == null
            ? null
            : TransactionIds.fromJson(json['transaction_ids']),
        underlying: json['underlying'],
        validationError: json['validation_error'],
      );

  /// Tick details around contract start and end time.
  final AuditDetailModel auditDetails;

  /// Barrier of the contract (if any).
  final String barrier;

  /// The number of barriers a contract has.
  final double barrierCount;

  /// Price at which the contract could be sold back to the company.
  final double bidPrice;

  /// Price at which contract was purchased
  final double buyPrice;

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
  final DateTime currentSpotTime;

  /// Expiry date (epoch) of the Contract. Please note that it is not applicable for tick trade contracts.
  final DateTime dateExpiry;

  /// Settlement date (epoch) of the contract.
  final DateTime dateSettlement;

  /// Start date (epoch) of the contract.
  final DateTime dateStart;

  /// Display name of underlying
  final String displayName;

  /// The `bid_price` with the correct precision
  final String displayValue;

  /// Same as `entry_tick`. For backwards compatibility.
  final double entrySpot;

  /// Same as `entry_tick_display_value`. For backwards compatibility.
  final String entrySpotDisplayValue;

  /// This is the entry spot of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final double entryTick;

  /// This is the entry spot with the correct precision of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final String entryTickDisplayValue;

  /// This is the epoch time of the entry tick.
  final DateTime entryTickTime;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final double exitTick;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final String exitTickDisplayValue;

  /// This is the epoch time of the exit tick. Note that since certain instruments don't tick every second, the exit tick time may be a few seconds before the end time.
  final DateTime exitTickTime;

  /// High barrier of the contract (if any).
  final String highBarrier;

  /// A stream ID that can be used to cancel this stream using the Forget request.
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

  /// Whether the contract can be sold back to the company.
  final bool isValidToSell;

  /// Orders are applicable to `MULTUP` and `MULTDOWN` only.
  final LimitOrderModel limitOrder;

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
  final DateTime purchaseTime;

  /// [Only for reset trades] The epoch time of a barrier reset.
  final DateTime resetTime;

  /// Price at which contract was sold, only available when contract has been sold.
  final double sellPrice;

  /// Latest spot value at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final double sellSpot;

  /// Latest spot value with the correct precision at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final String sellSpotDisplayValue;

  /// Epoch time of the sell spot. Note that since certain underlyings don't tick every second, the sell spot time may be a few seconds before the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final DateTime sellSpotTime;

  /// Epoch time of when the contract was sold (only present for contracts already sold)
  final DateTime sellTime;

  /// Coded description of the contract purchased.
  final String shortcode;

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final String status;

  /// Only for tick trades, number of ticks
  final int tickCount;

  /// Tick stream from entry to end time.
  final List<TickModel> tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIds transactionIds;

  /// The underlying symbol code.
  final String underlying;

  /// Error message if validation fails
  final String validationError;

  /// Clones a new instance
  OpenContractModel copyWith({
    String auditDetails,
    String barrier,
    double barrierCount,
    double bidPrice,
    double buyPrice,
    int contractId,
    String contractType,
    String currency,
    double currentSpot,
    String currentSpotDisplayValue,
    DateTime currentSpotTime,
    DateTime dateExpiry,
    DateTime dateSettlement,
    DateTime dateStart,
    String displayName,
    String displayValue,
    String entrySpot,
    String entrySpotDisplayValue,
    double entryTick,
    String entryTickDisplayValue,
    DateTime entryTickTime,
    double exitTick,
    String exitTickDisplayValue,
    DateTime exitTickTime,
    String highBarrier,
    String id,
    int isExpired,
    int isForwardStarting,
    int isIntraday,
    int isPathDependent,
    int isSettleable,
    int isSold,
    int isValidToSell,
    LimitOrderModel limitOrder,
    String longcode,
    String lowBarrier,
    double multiplier,
    double payout,
    double profit,
    double profitPercentage,
    DateTime purchaseTime,
    DateTime resetTime,
    double sellPrice,
    double sellSpot,
    String sellSpotDisplayValue,
    DateTime sellSpotTime,
    DateTime sellTime,
    String shortcode,
    String status,
    int tickCount,
    List<TickModel> tickStream,
    TransactionIds transactionIds,
    String underlying,
    String validationError,
  }) =>
      OpenContractModel(
          auditDetails: auditDetails ?? this.auditDetails,
          barrier: barrier ?? this.barrier,
          barrierCount: barrierCount ?? this.barrierCount,
          bidPrice: bidPrice ?? this.bidPrice,
          buyPrice: buyPrice ?? this.buyPrice,
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
          exitTickDisplayValue:
              exitTickDisplayValue ?? this.exitTickDisplayValue,
          exitTickTime: exitTickTime ?? this.exitTickTime,
          highBarrier: highBarrier ?? this.highBarrier,
          id: id ?? this.id,
          isExpired: isExpired ?? this.isExpired,
          isForwardStarting: isForwardStarting ?? this.isForwardStarting,
          isIntraday: isIntraday ?? this.isIntraday,
          isPathDependent: isPathDependent ?? this.isPathDependent,
          isSettleable: isSettleable ?? this.isSettleable,
          isSold: isSold ?? this.isSold,
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
          sellSpotDisplayValue:
              sellSpotDisplayValue ?? this.sellSpotDisplayValue,
          sellSpotTime: sellSpotTime ?? this.sellSpotTime,
          sellTime: sellTime ?? this.sellTime,
          shortcode: shortcode ?? this.shortcode,
          status: status ?? this.status,
          tickCount: tickCount ?? this.tickCount,
          tickStream: tickStream ?? this.tickStream,
          transactionIds: transactionIds ?? this.transactionIds,
          underlying: underlying ?? this.underlying,
          validationError: validationError ?? this.validationError);
}

/// Transaction id contract
class TransactionIds {
  /// Initializes
  TransactionIds(
    this.buyID,
    this.sellID,
  );

  /// From JSON
  factory TransactionIds.fromJson(
    Map<String, dynamic> json,
  ) =>
      TransactionIds(
        json['buy'],
        json['sell'],
      );

  /// Buy ID
  final int buyID;

  /// Sell ID
  final int sellID;

  /// Clones a new instance
  TransactionIds copyWith(
    int buyID,
    int sellID,
  ) =>
      TransactionIds(
        buyID ?? this.buyID,
        sellID ?? this.sellID,
      );
}
