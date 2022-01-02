// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/cancel_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/sell_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/cancel_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_open_contract_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_open_contract_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/sell_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
/// Proposal open contract response model class.
abstract class ProposalOpenContractResponseModel extends Equatable {
  /// Initializes Proposal open contract response model class .
  const ProposalOpenContractResponseModel({
    this.proposalOpenContract,
    this.subscription,
  });

  /// Latest price and other details for an open contract
  final ProposalOpenContract? proposalOpenContract;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Proposal open contract response class.
class ProposalOpenContractResponse extends ProposalOpenContractResponseModel {
  /// Initializes Proposal open contract response class.
  const ProposalOpenContractResponse({
    ProposalOpenContract? proposalOpenContract,
    Subscription? subscription,
  }) : super(
          proposalOpenContract: proposalOpenContract,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory ProposalOpenContractResponse.fromJson(
    dynamic proposalOpenContractJson,
    dynamic subscriptionJson,
  ) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContractJson == null
            ? null
            : ProposalOpenContract.fromJson(proposalOpenContractJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (proposalOpenContract != null) {
      resultMap['proposal_open_contract'] = proposalOpenContract!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the current spot of the the bought contract specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains any error
  static Future<ProposalOpenContractResponse> fetchContractState(
    ProposalOpenContractRequest request,
  ) async {
    final ProposalOpenContractReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ProposalOpenContractResponse.fromJson(
        response.proposalOpenContract, response.subscription);
  }

  /// Subscribes to the bought contract state specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<ProposalOpenContractResponse?> subscribeContractState(
    ProposalOpenContractRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<ProposalOpenContractResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                ContractOperationException(
                    baseExceptionModel: baseExceptionModel),
          );

          return response is ProposalOpenContractReceive
              ? ProposalOpenContractResponse.fromJson(
                  response.proposalOpenContract,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from open contract subscription.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<ForgetResponse?> unsubscribeOpenContract() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all open contract subscriptions.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOpenContract() async {
    final ForgetAllReceive response = await _api.unsubscribeAll(
      method: ForgetStreamType.proposalOpenContract,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Sells this contract.
  ///
  /// [price] is the Minimum price at which to sell the contract,
  /// Default be 0 for 'sell at market'.
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<SellResponse> sell(
          {required int contractId, double price = 0}) =>
      SellResponse.sellContract(SellRequest(sell: contractId, price: price));

  /// Cancels this contract
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<CancelResponse> cancel(int contractId) =>
      CancelResponse.cancelContract(CancelRequest(cancel: contractId));

  /// Creates a copy of instance with given parameters.
  ProposalOpenContractResponse copyWith({
    ProposalOpenContract? proposalOpenContract,
    Subscription? subscription,
  }) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "open": StatusEnum.open,
  "sold": StatusEnum.sold,
  "won": StatusEnum.won,
  "lost": StatusEnum.lost,
  "cancelled": StatusEnum.cancelled,
  "null": StatusEnum._null,
};

/// Status Enum.
enum StatusEnum {
  /// open.
  open,

  /// sold.
  sold,

  /// won.
  won,

  /// lost.
  lost,

  /// cancelled.
  cancelled,

  /// null.
  _null,
}
/// Proposal open contract model class.
abstract class ProposalOpenContractModel extends Equatable {
  /// Initializes Proposal open contract model class .
  const ProposalOpenContractModel({
    this.accountId,
    this.auditDetails,
    this.barrier,
    this.barrierCount,
    this.bidPrice,
    this.buyPrice,
    this.cancellation,
    this.commision,
    this.commission,
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
    this.expiryTime,
    this.highBarrier,
    this.id,
    this.isExpired,
    this.isForwardStarting,
    this.isIntraday,
    this.isPathDependent,
    this.isSettleable,
    this.isSold,
    this.isValidToCancel,
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
    this.validationError,
  });

  /// Account Id
  final double? accountId;

  /// Tick details around contract start and end time.
  final AuditDetails? auditDetails;

  /// Barrier of the contract (if any).
  final String? barrier;

  /// The number of barriers a contract has.
  final double? barrierCount;

  /// Price at which the contract could be sold back to the company.
  final double? bidPrice;

  /// Price at which contract was purchased
  final double? buyPrice;

  /// Contains information about contract cancellation option.
  final Cancellation? cancellation;

  /// Commission in payout currency amount.
  final double? commision;

  /// Commission in payout currency amount.
  final double? commission;

  /// The internal contract identifier
  final int? contractId;

  /// Contract type.
  final String? contractType;

  /// The currency code of the contract.
  final String? currency;

  /// Spot value if we have license to stream this symbol.
  final double? currentSpot;

  /// Spot value with the correct precision if we have license to stream this symbol.
  final String? currentSpotDisplayValue;

  /// The corresponding time of the current spot.
  final DateTime? currentSpotTime;

  /// Expiry date (epoch) of the Contract. Please note that it is not applicable for tick trade contracts.
  final DateTime? dateExpiry;

  /// Settlement date (epoch) of the contract.
  final DateTime? dateSettlement;

  /// Start date (epoch) of the contract.
  final DateTime? dateStart;

  /// Display name of underlying
  final String? displayName;

  /// The `bid_price` with the correct precision
  final String? displayValue;

  /// Same as `entry_tick`. For backwards compatibility.
  final double? entrySpot;

  /// Same as `entry_tick_display_value`. For backwards compatibility.
  final String? entrySpotDisplayValue;

  /// This is the entry spot of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final double? entryTick;

  /// This is the entry spot with the correct precision of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final String? entryTickDisplayValue;

  /// This is the epoch time of the entry tick.
  final DateTime? entryTickTime;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final double? exitTick;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final String? exitTickDisplayValue;

  /// This is the epoch time of the exit tick. Note that since certain instruments don't tick every second, the exit tick time may be a few seconds before the end time.
  final DateTime? exitTickTime;

  /// This is the expiry time.
  final DateTime? expiryTime;

  /// High barrier of the contract (if any).
  final String? highBarrier;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String? id;

  /// Whether the contract is expired or not.
  final bool? isExpired;

  /// Whether the contract is forward-starting or not.
  final bool? isForwardStarting;

  /// Whether the contract is an intraday contract.
  final bool? isIntraday;

  /// Whether the contract expiry price will depend on the path of the market (e.g. One Touch contract).
  final bool? isPathDependent;

  /// Whether the contract is settleable or not.
  final bool? isSettleable;

  /// Whether the contract is sold or not.
  final bool? isSold;

  /// Whether the contract can be cancelled.
  final bool? isValidToCancel;

  /// Whether the contract can be sold back to the company.
  final bool? isValidToSell;

  /// Orders are applicable to `MULTUP` and `MULTDOWN` contracts only.
  final LimitOrder? limitOrder;

  /// Text description of the contract purchased, Example: Win payout if Volatility 100 Index is strictly higher than entry spot at 10 minutes after contract start time.
  final String? longcode;

  /// Low barrier of the contract (if any).
  final String? lowBarrier;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double? multiplier;

  /// Payout value of the contract.
  final double? payout;

  /// The latest bid price minus buy price.
  final double? profit;

  /// Profit in percentage.
  final double? profitPercentage;

  /// Epoch of purchase time, will be same as `date_start` for all contracts except forward starting contracts.
  final DateTime? purchaseTime;

  /// [Only for reset trades] The epoch time of a barrier reset.
  final DateTime? resetTime;

  /// Price at which contract was sold, only available when contract has been sold.
  final double? sellPrice;

  /// Latest spot value at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final double? sellSpot;

  /// Latest spot value with the correct precision at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final String? sellSpotDisplayValue;

  /// Epoch time of the sell spot. Note that since certain underlyings don't tick every second, the sell spot time may be a few seconds before the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final DateTime? sellSpotTime;

  /// Epoch time of when the contract was sold (only present for contracts already sold)
  final DateTime? sellTime;

  /// Coded description of the contract purchased.
  final String? shortcode;

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final StatusEnum? status;

  /// Only for tick trades, number of ticks
  final int? tickCount;

  /// Tick stream from entry to end time.
  final List<TickStreamItem>? tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIds? transactionIds;

  /// The underlying symbol code.
  final String? underlying;

  /// Error message if validation fails
  final String? validationError;
}

/// Proposal open contract class.
class ProposalOpenContract extends ProposalOpenContractModel {
  /// Initializes Proposal open contract class.
  const ProposalOpenContract({
    double? accountId,
    AuditDetails? auditDetails,
    String? barrier,
    double? barrierCount,
    double? bidPrice,
    double? buyPrice,
    Cancellation? cancellation,
    double? commision,
    double? commission,
    int? contractId,
    String? contractType,
    String? currency,
    double? currentSpot,
    String? currentSpotDisplayValue,
    DateTime? currentSpotTime,
    DateTime? dateExpiry,
    DateTime? dateSettlement,
    DateTime? dateStart,
    String? displayName,
    String? displayValue,
    double? entrySpot,
    String? entrySpotDisplayValue,
    double? entryTick,
    String? entryTickDisplayValue,
    DateTime? entryTickTime,
    double? exitTick,
    String? exitTickDisplayValue,
    DateTime? exitTickTime,
    DateTime? expiryTime,
    String? highBarrier,
    String? id,
    bool? isExpired,
    bool? isForwardStarting,
    bool? isIntraday,
    bool? isPathDependent,
    bool? isSettleable,
    bool? isSold,
    bool? isValidToCancel,
    bool? isValidToSell,
    LimitOrder? limitOrder,
    String? longcode,
    String? lowBarrier,
    double? multiplier,
    double? payout,
    double? profit,
    double? profitPercentage,
    DateTime? purchaseTime,
    DateTime? resetTime,
    double? sellPrice,
    double? sellSpot,
    String? sellSpotDisplayValue,
    DateTime? sellSpotTime,
    DateTime? sellTime,
    String? shortcode,
    StatusEnum? status,
    int? tickCount,
    List<TickStreamItem>? tickStream,
    TransactionIds? transactionIds,
    String? underlying,
    String? validationError,
  }) : super(
          accountId: accountId,
          auditDetails: auditDetails,
          barrier: barrier,
          barrierCount: barrierCount,
          bidPrice: bidPrice,
          buyPrice: buyPrice,
          cancellation: cancellation,
          commision: commision,
          commission: commission,
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
          expiryTime: expiryTime,
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

  /// Creates an instance from JSON.
  factory ProposalOpenContract.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContract(
        accountId: getDouble(json['account_id']),
        auditDetails: json['audit_details'] == null
            ? null
            : AuditDetails.fromJson(json['audit_details']),
        barrier: json['barrier'],
        barrierCount: getDouble(json['barrier_count']),
        bidPrice: getDouble(json['bid_price']),
        buyPrice: getDouble(json['buy_price']),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        commision: getDouble(json['commision']),
        commission: getDouble(json['commission']),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: getDouble(json['current_spot']),
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: getDateTime(json['current_spot_time']),
        dateExpiry: getDateTime(json['date_expiry']),
        dateSettlement: getDateTime(json['date_settlement']),
        dateStart: getDateTime(json['date_start']),
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: getDouble(json['entry_spot']),
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: getDouble(json['entry_tick']),
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: getDateTime(json['entry_tick_time']),
        exitTick: getDouble(json['exit_tick']),
        exitTickDisplayValue: json['exit_tick_display_value'],
        exitTickTime: getDateTime(json['exit_tick_time']),
        expiryTime: getDateTime(json['expiry_time']),
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
        purchaseTime: getDateTime(json['purchase_time']),
        resetTime: getDateTime(json['reset_time']),
        sellPrice: getDouble(json['sell_price']),
        sellSpot: getDouble(json['sell_spot']),
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: getDateTime(json['sell_spot_time']),
        sellTime: getDateTime(json['sell_time']),
        shortcode: json['shortcode'],
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']],
        tickCount: json['tick_count'],
        tickStream: json['tick_stream'] == null
            ? null
            : List<TickStreamItem>.from(
                json['tick_stream']?.map(
                  (dynamic item) => TickStreamItem.fromJson(item),
                ),
              ),
        transactionIds: json['transaction_ids'] == null
            ? null
            : TransactionIds.fromJson(json['transaction_ids']),
        underlying: json['underlying'],
        validationError: json['validation_error'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_id'] = accountId;
    if (auditDetails != null) {
      resultMap['audit_details'] = auditDetails!.toJson();
    }
    resultMap['barrier'] = barrier;
    resultMap['barrier_count'] = barrierCount;
    resultMap['bid_price'] = bidPrice;
    resultMap['buy_price'] = buyPrice;
    if (cancellation != null) {
      resultMap['cancellation'] = cancellation!.toJson();
    }
    resultMap['commision'] = commision;
    resultMap['commission'] = commission;
    resultMap['contract_id'] = contractId;
    resultMap['contract_type'] = contractType;
    resultMap['currency'] = currency;
    resultMap['current_spot'] = currentSpot;
    resultMap['current_spot_display_value'] = currentSpotDisplayValue;
    resultMap['current_spot_time'] =
        getSecondsSinceEpochDateTime(currentSpotTime);
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);
    resultMap['date_settlement'] = getSecondsSinceEpochDateTime(dateSettlement);
    resultMap['date_start'] = getSecondsSinceEpochDateTime(dateStart);
    resultMap['display_name'] = displayName;
    resultMap['display_value'] = displayValue;
    resultMap['entry_spot'] = entrySpot;
    resultMap['entry_spot_display_value'] = entrySpotDisplayValue;
    resultMap['entry_tick'] = entryTick;
    resultMap['entry_tick_display_value'] = entryTickDisplayValue;
    resultMap['entry_tick_time'] = getSecondsSinceEpochDateTime(entryTickTime);
    resultMap['exit_tick'] = exitTick;
    resultMap['exit_tick_display_value'] = exitTickDisplayValue;
    resultMap['exit_tick_time'] = getSecondsSinceEpochDateTime(exitTickTime);
    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['high_barrier'] = highBarrier;
    resultMap['id'] = id;
    resultMap['is_expired'] = isExpired;
    resultMap['is_forward_starting'] = isForwardStarting;
    resultMap['is_intraday'] = isIntraday;
    resultMap['is_path_dependent'] = isPathDependent;
    resultMap['is_settleable'] = isSettleable;
    resultMap['is_sold'] = isSold;
    resultMap['is_valid_to_cancel'] = isValidToCancel;
    resultMap['is_valid_to_sell'] = isValidToSell;
    if (limitOrder != null) {
      resultMap['limit_order'] = limitOrder!.toJson();
    }
    resultMap['longcode'] = longcode;
    resultMap['low_barrier'] = lowBarrier;
    resultMap['multiplier'] = multiplier;
    resultMap['payout'] = payout;
    resultMap['profit'] = profit;
    resultMap['profit_percentage'] = profitPercentage;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['reset_time'] = getSecondsSinceEpochDateTime(resetTime);
    resultMap['sell_price'] = sellPrice;
    resultMap['sell_spot'] = sellSpot;
    resultMap['sell_spot_display_value'] = sellSpotDisplayValue;
    resultMap['sell_spot_time'] = getSecondsSinceEpochDateTime(sellSpotTime);
    resultMap['sell_time'] = getSecondsSinceEpochDateTime(sellTime);
    resultMap['shortcode'] = shortcode;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['tick_count'] = tickCount;
    if (tickStream != null) {
      resultMap['tick_stream'] = tickStream!
          .map<dynamic>(
            (TickStreamItem item) => item.toJson(),
          )
          .toList();
    }
    if (transactionIds != null) {
      resultMap['transaction_ids'] = transactionIds!.toJson();
    }
    resultMap['underlying'] = underlying;
    resultMap['validation_error'] = validationError;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ProposalOpenContract copyWith({
    double? accountId,
    AuditDetails? auditDetails,
    String? barrier,
    double? barrierCount,
    double? bidPrice,
    double? buyPrice,
    Cancellation? cancellation,
    double? commision,
    double? commission,
    int? contractId,
    String? contractType,
    String? currency,
    double? currentSpot,
    String? currentSpotDisplayValue,
    DateTime? currentSpotTime,
    DateTime? dateExpiry,
    DateTime? dateSettlement,
    DateTime? dateStart,
    String? displayName,
    String? displayValue,
    double? entrySpot,
    String? entrySpotDisplayValue,
    double? entryTick,
    String? entryTickDisplayValue,
    DateTime? entryTickTime,
    double? exitTick,
    String? exitTickDisplayValue,
    DateTime? exitTickTime,
    DateTime? expiryTime,
    String? highBarrier,
    String? id,
    bool? isExpired,
    bool? isForwardStarting,
    bool? isIntraday,
    bool? isPathDependent,
    bool? isSettleable,
    bool? isSold,
    bool? isValidToCancel,
    bool? isValidToSell,
    LimitOrder? limitOrder,
    String? longcode,
    String? lowBarrier,
    double? multiplier,
    double? payout,
    double? profit,
    double? profitPercentage,
    DateTime? purchaseTime,
    DateTime? resetTime,
    double? sellPrice,
    double? sellSpot,
    String? sellSpotDisplayValue,
    DateTime? sellSpotTime,
    DateTime? sellTime,
    String? shortcode,
    StatusEnum? status,
    int? tickCount,
    List<TickStreamItem>? tickStream,
    TransactionIds? transactionIds,
    String? underlying,
    String? validationError,
  }) =>
      ProposalOpenContract(
        accountId: accountId ?? this.accountId,
        auditDetails: auditDetails ?? this.auditDetails,
        barrier: barrier ?? this.barrier,
        barrierCount: barrierCount ?? this.barrierCount,
        bidPrice: bidPrice ?? this.bidPrice,
        buyPrice: buyPrice ?? this.buyPrice,
        cancellation: cancellation ?? this.cancellation,
        commision: commision ?? this.commision,
        commission: commission ?? this.commission,
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
        expiryTime: expiryTime ?? this.expiryTime,
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Audit details model class.
abstract class AuditDetailsModel extends Equatable {
  /// Initializes Audit details model class .
  const AuditDetailsModel({
    this.allTicks,
    this.contractEnd,
    this.contractStart,
  });

  /// Ticks for tick expiry contract from start time till expiry.
  final List<AllTicksItem>? allTicks;

  /// Ticks around contract end time.
  final List<ContractEndItem>? contractEnd;

  /// Ticks around contract start time.
  final List<ContractStartItem>? contractStart;
}

/// Audit details class.
class AuditDetails extends AuditDetailsModel {
  /// Initializes Audit details class.
  const AuditDetails({
    List<AllTicksItem>? allTicks,
    List<ContractEndItem>? contractEnd,
    List<ContractStartItem>? contractStart,
  }) : super(
          allTicks: allTicks,
          contractEnd: contractEnd,
          contractStart: contractStart,
        );

  /// Creates an instance from JSON.
  factory AuditDetails.fromJson(Map<String, dynamic> json) => AuditDetails(
        allTicks: json['all_ticks'] == null
            ? null
            : List<AllTicksItem>.from(
                json['all_ticks']?.map(
                  (dynamic item) => AllTicksItem.fromJson(item),
                ),
              ),
        contractEnd: json['contract_end'] == null
            ? null
            : List<ContractEndItem>.from(
                json['contract_end']?.map(
                  (dynamic item) => ContractEndItem.fromJson(item),
                ),
              ),
        contractStart: json['contract_start'] == null
            ? null
            : List<ContractStartItem>.from(
                json['contract_start']?.map(
                  (dynamic item) => ContractStartItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (allTicks != null) {
      resultMap['all_ticks'] = allTicks!
          .map<dynamic>(
            (AllTicksItem item) => item.toJson(),
          )
          .toList();
    }
    if (contractEnd != null) {
      resultMap['contract_end'] = contractEnd!
          .map<dynamic>(
            (ContractEndItem item) => item.toJson(),
          )
          .toList();
    }
    if (contractStart != null) {
      resultMap['contract_start'] = contractStart!
          .map<dynamic>(
            (ContractStartItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AuditDetails copyWith({
    List<AllTicksItem>? allTicks,
    List<ContractEndItem>? contractEnd,
    List<ContractStartItem>? contractStart,
  }) =>
      AuditDetails(
        allTicks: allTicks ?? this.allTicks,
        contractEnd: contractEnd ?? this.contractEnd,
        contractStart: contractStart ?? this.contractStart,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// All ticks item model class.
abstract class AllTicksItemModel extends Equatable {
  /// Initializes All ticks item model class .
  const AllTicksItemModel({
    this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime? epoch;

  /// A flag used to highlight the record in front-end applications.
  final String? flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String? name;

  /// The spot value at the given epoch.
  final double? tick;

  /// The spot value with the correct precision at the given epoch.
  final String? tickDisplayValue;
}

/// All ticks item class.
class AllTicksItem extends AllTicksItemModel {
  /// Initializes All ticks item class.
  const AllTicksItem({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON.
  factory AllTicksItem.fromJson(Map<String, dynamic> json) => AllTicksItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AllTicksItem copyWith({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) =>
      AllTicksItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Contract end item model class.
abstract class ContractEndItemModel extends Equatable {
  /// Initializes Contract end item model class .
  const ContractEndItemModel({
    this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime? epoch;

  /// A flag used to highlight the record in front-end applications.
  final String? flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String? name;

  /// The spot value at the given epoch.
  final double? tick;

  /// The spot value with the correct precision at the given epoch.
  final String? tickDisplayValue;
}

/// Contract end item class.
class ContractEndItem extends ContractEndItemModel {
  /// Initializes Contract end item class.
  const ContractEndItem({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON.
  factory ContractEndItem.fromJson(Map<String, dynamic> json) =>
      ContractEndItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractEndItem copyWith({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) =>
      ContractEndItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Contract start item model class.
abstract class ContractStartItemModel extends Equatable {
  /// Initializes Contract start item model class .
  const ContractStartItemModel({
    this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime? epoch;

  /// A flag used to highlight the record in front-end applications.
  final String? flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String? name;

  /// The spot value at the given epoch.
  final double? tick;

  /// The spot value with the correct precision at the given epoch.
  final String? tickDisplayValue;
}

/// Contract start item class.
class ContractStartItem extends ContractStartItemModel {
  /// Initializes Contract start item class.
  const ContractStartItem({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON.
  factory ContractStartItem.fromJson(Map<String, dynamic> json) =>
      ContractStartItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractStartItem copyWith({
    DateTime? epoch,
    String? flag,
    String? name,
    double? tick,
    String? tickDisplayValue,
  }) =>
      ContractStartItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Cancellation model class.
abstract class CancellationModel extends Equatable {
  /// Initializes Cancellation model class .
  const CancellationModel({
    this.askPrice,
    this.dateExpiry,
  });

  /// Ask price of contract cancellation option.
  final double? askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime? dateExpiry;
}

/// Cancellation class.
class Cancellation extends CancellationModel {
  /// Initializes Cancellation class.
  const Cancellation({
    double? askPrice,
    DateTime? dateExpiry,
  }) : super(
          askPrice: askPrice,
          dateExpiry: dateExpiry,
        );

  /// Creates an instance from JSON.
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        askPrice: getDouble(json['ask_price']),
        dateExpiry: getDateTime(json['date_expiry']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask_price'] = askPrice;
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Cancellation copyWith({
    double? askPrice,
    DateTime? dateExpiry,
  }) =>
      Cancellation(
        askPrice: askPrice ?? this.askPrice,
        dateExpiry: dateExpiry ?? this.dateExpiry,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[askPrice, dateExpiry];
}
/// Limit order model class.
abstract class LimitOrderModel extends Equatable {
  /// Initializes Limit order model class .
  const LimitOrderModel({
    this.stopLoss,
    this.stopOut,
    this.takeProfit,
  });

  /// Contains information where the contract will be closed automatically at the loss specified by the user.
  final StopLoss? stopLoss;

  /// Contains information where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final StopOut? stopOut;

  /// Contain information where the contract will be closed automatically at the profit specified by the user.
  final TakeProfit? takeProfit;
}

/// Limit order class.
class LimitOrder extends LimitOrderModel {
  /// Initializes Limit order class.
  const LimitOrder({
    StopLoss? stopLoss,
    StopOut? stopOut,
    TakeProfit? takeProfit,
  }) : super(
          stopLoss: stopLoss,
          stopOut: stopOut,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON.
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

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (stopLoss != null) {
      resultMap['stop_loss'] = stopLoss!.toJson();
    }
    if (stopOut != null) {
      resultMap['stop_out'] = stopOut!.toJson();
    }
    if (takeProfit != null) {
      resultMap['take_profit'] = takeProfit!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LimitOrder copyWith({
    StopLoss? stopLoss,
    StopOut? stopOut,
    TakeProfit? takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[stopLoss, stopOut, takeProfit];
}
/// Stop loss model class.
abstract class StopLossModel extends Equatable {
  /// Initializes Stop loss model class .
  const StopLossModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Localized display name
  final String? displayName;

  /// Stop loss amount
  final double? orderAmount;

  /// Stop loss order epoch
  final DateTime? orderDate;

  /// Pip-sized barrier value
  final String? value;
}

/// Stop loss class.
class StopLoss extends StopLossModel {
  /// Initializes Stop loss class.
  const StopLoss({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON.
  factory StopLoss.fromJson(Map<String, dynamic> json) => StopLoss(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StopLoss copyWith({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) =>
      StopLoss(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[displayName, orderAmount];
}
/// Stop out model class.
abstract class StopOutModel extends Equatable {
  /// Initializes Stop out model class .
  const StopOutModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Localized display name
  final String? displayName;

  /// Stop out amount
  final double? orderAmount;

  /// Stop out order epoch
  final DateTime? orderDate;

  /// Pip-sized barrier value
  final String? value;
}

/// Stop out class.
class StopOut extends StopOutModel {
  /// Initializes Stop out class.
  const StopOut({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON.
  factory StopOut.fromJson(Map<String, dynamic> json) => StopOut(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StopOut copyWith({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) =>
      StopOut(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[displayName, orderAmount];
}
/// Take profit model class.
abstract class TakeProfitModel extends Equatable {
  /// Initializes Take profit model class .
  const TakeProfitModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.value,
  });

  /// Localized display name
  final String? displayName;

  /// Take profit amount
  final double? orderAmount;

  /// Take profit order epoch
  final DateTime? orderDate;

  /// Pip-sized barrier value
  final String? value;
}

/// Take profit class.
class TakeProfit extends TakeProfitModel {
  /// Initializes Take profit class.
  const TakeProfit({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON.
  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TakeProfit copyWith({
    String? displayName,
    double? orderAmount,
    DateTime? orderDate,
    String? value,
  }) =>
      TakeProfit(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[displayName, orderAmount];
}
/// Tick stream item model class.
abstract class TickStreamItemModel extends Equatable {
  /// Initializes Tick stream item model class .
  const TickStreamItemModel({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime? epoch;

  /// The spot value at the given epoch.
  final double? tick;

  /// The spot value with the correct precision at the given epoch.
  final String? tickDisplayValue;
}

/// Tick stream item class.
class TickStreamItem extends TickStreamItemModel {
  /// Initializes Tick stream item class.
  const TickStreamItem({
    DateTime? epoch,
    double? tick,
    String? tickDisplayValue,
  }) : super(
          epoch: epoch,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON.
  factory TickStreamItem.fromJson(Map<String, dynamic> json) => TickStreamItem(
        epoch: getDateTime(json['epoch']),
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TickStreamItem copyWith({
    DateTime? epoch,
    double? tick,
    String? tickDisplayValue,
  }) =>
      TickStreamItem(
        epoch: epoch ?? this.epoch,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Transaction ids model class.
abstract class TransactionIdsModel extends Equatable {
  /// Initializes Transaction ids model class .
  const TransactionIdsModel({
    this.buy,
    this.sell,
  });

  /// Buy transaction ID for that contract
  final int? buy;

  /// Sell transaction ID for that contract, only present when contract is already sold.
  final int? sell;
}

/// Transaction ids class.
class TransactionIds extends TransactionIdsModel {
  /// Initializes Transaction ids class.
  const TransactionIds({
    int? buy,
    int? sell,
  }) : super(
          buy: buy,
          sell: sell,
        );

  /// Creates an instance from JSON.
  factory TransactionIds.fromJson(Map<String, dynamic> json) => TransactionIds(
        buy: json['buy'],
        sell: json['sell'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['buy'] = buy;
    resultMap['sell'] = sell;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransactionIds copyWith({
    int? buy,
    int? sell,
  }) =>
      TransactionIds(
        buy: buy ?? this.buy,
        sell: sell ?? this.sell,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Subscription model class.
abstract class SubscriptionModel extends Equatable {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    required String id,
  }) =>
      Subscription(
        id: id,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
