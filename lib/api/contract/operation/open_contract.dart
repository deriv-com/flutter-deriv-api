import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/models/audit_detail_model.dart';
import 'package:flutter_deriv_api/api/contract/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_tick_model.dart';
import 'package:flutter_deriv_api/api/contract/models/transaction_ids_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'contract.dart';
import 'exceptions/contract_operations_exception.dart';

/// Open contract class
class OpenContract extends Contract {
  /// Initializes
  OpenContract({
    this.auditDetails,
    this.barrier,
    this.barrierCount,
    this.bidPrice,
    this.contractType,
    this.cancellation,
    this.commission,
    this.currency,
    this.currentSpot,
    this.currentSpotDisplayValue,
    this.currentSpotTime,
    this.dateExpiry,
    this.dateSettlement,
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
    this.isValidToCancel,
    this.isValidToSell,
    this.limitOrder,
    this.lowBarrier,
    this.multiplier,
    this.profit,
    this.profitPercentage,
    this.resetTime,
    this.sellPrice,
    this.sellSpot,
    this.sellSpotDisplayValue,
    this.sellSpotTime,
    this.sellTime,
    this.status,
    this.tickCount,
    this.tickStream,
    this.transactionIds,
    this.underlying,
    this.validationError,
    double balanceAfter,
    double buyPrice,
    int contractId,
    DateTime dateStart,
    String longCode,
    double payout,
    DateTime purchaseTime,
    String shortCode,
    int transactionId,
    SubscriptionModel subscriptionInformation,
  }) : super(
          balanceAfter: balanceAfter,
          buyPrice: buyPrice,
          contractId: contractId,
          dateStart: dateStart,
          longCode: longCode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortCode: shortCode,
          transactionId: transactionId,
          subscriptionInformation: subscriptionInformation,
        );

  /// Generates an instance from JSON
  factory OpenContract.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      OpenContract(
        auditDetails: getItemFromMap(
          json['audit_details'],
          itemToTypeCallback: (dynamic item) => AuditDetailModel.fromJson(item),
        ),
        barrier: json['barrier'],
        barrierCount: json['barrier_count']?.toDouble(),
        bidPrice: json['bid_price']?.toDouble(),
        cancellation: getItemFromMap(
          json['cancellation'],
          itemToTypeCallback: (dynamic item) =>
              CancellationInfoModel.fromJson(item),
        ),
        commission: json['commision']?.toDouble(),
        contractType: getEnumFromString(
          values: ContractType.values,
          name: json['contract_type'],
          enumCase: EnumCase.upperCase,
        ),
        currency: json['currency'],
        currentSpot: json['current_spot']?.toDouble(),
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: getDateTime(json['current_spot_time']),
        dateExpiry: getDateTime(json['date_expiry']),
        dateSettlement: getDateTime(json['date_settlement']),
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: json['entry_spot']?.toDouble(),
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: json['entry_tick']?.toDouble(),
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: getDateTime(json['entry_tick_time']),
        exitTick: json['exit_tick']?.toDouble(),
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
        isValidToCancel: getBool(json['is_valid_to_cancel']),
        isValidToSell: getBool(json['is_valid_to_sell']),
        limitOrder: getItemFromMap(
          json['limit_order'],
          itemToTypeCallback: (dynamic item) => LimitOrderModel.fromJson(item),
        ),
        lowBarrier: json['low_barrier'],
        multiplier: json['multiplier']?.toDouble(),
        profit: json['profit']?.toDouble(),
        profitPercentage: json['profit_percentage'],
        resetTime: getDateTime(json['reset_time']),
        sellPrice: json['sell_price']?.toDouble(),
        sellSpot: json['sell_spot']?.toDouble(),
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: getDateTime(json['sell_spot_time']),
        sellTime: getDateTime(json['sell_time']),
        status: getEnumFromString(
          values: ContractStatus.values,
          name: json['status'],
        ),
        tickCount: json['tick_count'],
        tickStream: getListFromMap(
          json['tick_stream'],
          itemToTypeCallback: (dynamic item) =>
              ContractTickModel.fromJson(item),
        ),
        transactionIds: getItemFromMap(
          json['transaction_ids'],
          itemToTypeCallback: (dynamic item) =>
              TransactionIdsModel.fromJson(item),
        ),
        underlying: json['underlying'],
        validationError: json['validation_error'],
        balanceAfter: json['balanceAfter']?.toDouble(),
        buyPrice: json['buy_price']?.toDouble(),
        contractId: json['contract_id'],
        dateStart: json['start_time'] == null
            ? getDateTime(json['date_start'])
            : getDateTime(json['start_time']),
        longCode: json['longcode'],
        payout: json['payout']?.toDouble(),
        purchaseTime: getDateTime(json['purchase_time']),
        shortCode: json['shortcode'],
        transactionId: json['transaction_id'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Tick details around contract start and end time.
  final AuditDetailModel auditDetails;

  /// Barrier of the contract (if any).
  final String barrier;

  /// The number of barriers a contract has.
  final double barrierCount;

  /// Price at which the contract could be sold back to the company.
  final double bidPrice;

  /// Contains information about contract cancellation option.
  final CancellationInfoModel cancellation;

  /// Commission in payout currency
  final double commission;

  /// Contract type.
  final ContractType contractType;

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

  /// Whether the contract can be cancelled.
  final bool isValidToCancel;

  /// Whether the contract can be sold back to the company.
  final bool isValidToSell;

  /// Orders are applicable to `MULTUP` and `MULTDOWN` only.
  final LimitOrderModel limitOrder;

  /// Low barrier of the contract (if any).
  final String lowBarrier;

  /// [Only for look back trades] Multiplier applies when calculating the final payoff for each type of look back. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double multiplier;

  /// The latest bid price minus buy price.
  final double profit;

  /// Profit in percentage.
  final double profitPercentage;

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

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final ContractStatus status;

  /// Only for tick trades, number of ticks
  final int tickCount;

  /// Tick stream from entry to end time.
  final List<ContractTickModel> tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIdsModel transactionIds;

  /// The underlying symbol code.
  final String underlying;

  /// Error message if validation fails
  final String validationError;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the current spot of the the bought contract specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains any error
  static Future<OpenContract> fetchContractState(
    ProposalOpenContractRequest request,
  ) async {
    final ProposalOpenContractResponse response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          ContractOperationException(code: code, message: message),
    );

    return OpenContract.fromJson(
      response.proposalOpenContract,
    );
  }

  /// Subscribes to the bought contract state specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<OpenContract> subscribeContractState(
    ProposalOpenContractRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<OpenContract>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({String code, String message}) =>
                ContractOperationException(code: code, message: message),
          );

          return response is ProposalOpenContractResponse
              ? OpenContract.fromJson(
                  response.proposalOpenContract,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from open contract subscription.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<Forget> unsubscribeOpenContract() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          ContractOperationException(code: code, message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all open contract subscriptions.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllOpenContract() async {
    final ForgetAllResponse response = await _api.unsubscribeAll(
      method: ForgetStreamType.proposalOpenContract,
    );

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          ContractOperationException(code: code, message: message),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Generates a copy of instance with given parameters
  @override
  OpenContract copyWith({
    AuditDetailModel auditDetails,
    String barrier,
    double barrierCount,
    double bidPrice,
    CancellationInfoModel cancellation,
    String commission,
    ContractType contractType,
    String currency,
    double currentSpot,
    String currentSpotDisplayValue,
    DateTime currentSpotTime,
    DateTime dateExpiry,
    DateTime dateSettlement,
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
    bool isValidToCancel,
    LimitOrderModel limitOrder,
    String lowBarrier,
    double multiplier,
    double profit,
    double profitPercentage,
    DateTime resetTime,
    double sellPrice,
    double sellSpot,
    String sellSpotDisplayValue,
    DateTime sellSpotTime,
    DateTime sellTime,
    ContractStatus status,
    int tickCount,
    List<ContractTickModel> tickStream,
    TransactionIdsModel transactionIds,
    String underlying,
    String validationError,
    double balanceAfter,
    double buyPrice,
    int contractId,
    DateTime dateStart,
    String longCode,
    double payout,
    DateTime purchaseTime,
    String shortCode,
    int transactionId,
    SubscriptionModel subscriptionInformation,
  }) =>
      OpenContract(
        auditDetails: auditDetails ?? this.auditDetails,
        barrier: barrier ?? this.barrier,
        barrierCount: barrierCount ?? this.barrierCount,
        bidPrice: bidPrice ?? this.bidPrice,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        currentSpot: currentSpot ?? this.currentSpot,
        currentSpotDisplayValue:
            currentSpotDisplayValue ?? this.currentSpotDisplayValue,
        currentSpotTime: currentSpotTime ?? this.currentSpotTime,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateSettlement: dateSettlement ?? this.dateSettlement,
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
        isValidToCancel: isValidToCancel ?? this.isValidToCancel,
        limitOrder: limitOrder ?? this.limitOrder,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        multiplier: multiplier ?? this.multiplier,
        profit: profit ?? this.profit,
        profitPercentage: profitPercentage ?? this.profitPercentage,
        resetTime: resetTime ?? this.resetTime,
        sellPrice: sellPrice ?? this.sellPrice,
        sellSpot: sellSpot ?? this.sellSpot,
        sellSpotDisplayValue: sellSpotDisplayValue ?? this.sellSpotDisplayValue,
        sellSpotTime: sellSpotTime ?? this.sellSpotTime,
        sellTime: sellTime ?? this.sellTime,
        status: status ?? this.status,
        tickCount: tickCount ?? this.tickCount,
        tickStream: tickStream ?? this.tickStream,
        transactionIds: transactionIds ?? this.transactionIds,
        underlying: underlying ?? this.underlying,
        validationError: validationError ?? this.validationError,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        dateStart: dateStart ?? this.dateStart,
        longCode: longCode ?? this.longCode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortCode: shortCode ?? this.shortCode,
        transactionId: transactionId ?? this.transactionId,
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
