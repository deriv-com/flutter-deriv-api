import 'package:flutter_deriv_api/api/contract/models/audit_detail_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/open_contract_tick_model.dart';
import 'package:flutter_deriv_api/api/contract/models/transaction_ids_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Model class for proposal open contract
class OpenContractModel extends APIBaseModel {
  /// Initializes
  OpenContractModel({
    this.auditDetails,
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
    this.longCode,
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
    this.shortCode,
    this.status,
    this.tickCount,
    this.tickStream,
    this.transactionIds,
    this.underlying,
    this.validationError,
  });

  /// Generate an instance from json
  factory OpenContractModel.fromJson(Map<String, dynamic> json) =>
      OpenContractModel(
        auditDetails: getItemFromMap(
          json['audit_details'],
          itemToTypeCallback: (dynamic item) => AuditDetailModel.fromJson(item),
        ),
        barrier: json['barrier'],
        barrierCount: json['barrier_count']?.toDouble(),
        bidPrice: json['bid_price']?.toDouble(),
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: json['current_spot'],
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: getDateTime(json['current_spot_time']),
        dateExpiry: getDateTime(json['date_expiry']),
        dateSettlement: getDateTime(json['date_settlement']),
        dateStart: getDateTime(json['date_start']),
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: json['entry_spot'],
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: json['entry_tick'],
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: getDateTime(json['entry_tick_time']),
        exitTick: json['exit_tick'],
        exitTickDisplayValue: json['exit_tick_display_value'],
        exitTickTime: getDateTime(json['exit_tick_time']),
        highBarrier: json['high_barrier'],
        id: json['id'],
        isExpired: getBool(json['is_expired']),
        isForwardStarting: getBool(json['is_forward_starting']),
        isIntraday: getBool(json['is_intraday']),
        isPathDependent: getBool(json['is_path_dependent']),
        isSettleable: getBool(json['is_settleable']),
        isSold: getBool(json['is_sold']),
        isValidToSell: getBool(json['is_valid_to_sell']),
        limitOrder: getItemFromMap(
          json['limit_order'],
          itemToTypeCallback: (dynamic item) => LimitOrderModel.fromJson(item),
        ),
        longCode: json['longcode'],
        lowBarrier: json['low_barrier'],
        multiplier: json['multiplier'],
        payout: json['payout']?.toDouble(),
        profit: json['profit']?.toDouble(),
        profitPercentage: json['profit_percentage'],
        purchaseTime: getDateTime(json['purchase_time']),
        resetTime: getDateTime(json['reset_time']),
        sellPrice: json['sell_price'],
        sellSpot: json['sell_spot'],
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: getDateTime(json['sell_spot_time']),
        sellTime: getDateTime(json['sell_time']),
        shortCode: json['shortcode'],
        status: getEnumFromString(
          values: ContractStatus.values,
          name: json['status'],
        ),
        tickCount: json['tick_count'],
        tickStream: getListFromMap(
          json['tick_stream'],
          itemToTypeCallback: (dynamic item) =>
              OpenContractTickModel.fromJson(item),
        ),
        transactionIds: getItemFromMap(
          json['transaction_ids'],
          itemToTypeCallback: (dynamic item) =>
              TransactionIdsModel.fromJson(item),
        ),
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
  final String longCode;

  /// Low barrier of the contract (if any).
  final String lowBarrier;

  /// [Only for look back trades] Multiplier applies when calculating the final payoff for each type of look back. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
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
  final String shortCode;

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final ContractStatus status;

  /// Only for tick trades, number of ticks
  final int tickCount;

  /// Tick stream from entry to end time.
  final List<OpenContractTickModel> tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIdsModel transactionIds;

  /// The underlying symbol code.
  final String underlying;

  /// Error message if validation fails
  final String validationError;

  /// Generate a copy of instance with given parameters
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
    bool isExpired,
    bool isForwardStarting,
    bool isIntraday,
    bool isPathDependent,
    bool isSettleable,
    bool isSold,
    bool isValidToSell,
    LimitOrderModel limitOrder,
    String longCode,
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
    String shortCode,
    ContractStatus status,
    int tickCount,
    List<OpenContractTickModel> tickStream,
    TransactionIdsModel transactionIds,
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
        isValidToSell: isValidToSell ?? this.isValidToSell,
        limitOrder: limitOrder ?? this.limitOrder,
        longCode: longCode ?? this.longCode,
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
        shortCode: shortCode ?? this.shortCode,
        status: status ?? this.status,
        tickCount: tickCount ?? this.tickCount,
        tickStream: tickStream ?? this.tickStream,
        transactionIds: transactionIds ?? this.transactionIds,
        underlying: underlying ?? this.underlying,
        validationError: validationError ?? this.validationError,
      );
}
