import 'package:flutter_deriv_api/api/contract/models/audit_detail_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/open_contract_tick_model.dart';
import 'package:flutter_deriv_api/api/contract/models/transaction_ids_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

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
}
