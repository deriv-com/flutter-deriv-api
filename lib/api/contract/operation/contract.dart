import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/models/audit_detail_model.dart';
import 'package:flutter_deriv_api/api/contract/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
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

import 'cancel_contract.dart';
import 'exceptions/contract_operations_exception.dart';
import 'sell_contract.dart';
import 'update_contract.dart';

/// Open contract class
class Contract extends ContractModel {
  /// Initializes
  Contract({
    AuditDetailModel auditDetails,
    double balanceAfter,
    String barrier,
    double barrierCount,
    double bidPrice,
    double buyPrice,
    int contractId,
    CancellationInfoModel cancellation,
    double commission,
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
    double entrySpot,
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
    bool isValidToCancel,
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
    List<ContractTickModel> tickStream,
    int transactionId,
    TransactionIdsModel transactionIds,
    String underlying,
    String validationError,
    this.subscriptionInformation,
  }) : super(
          auditDetails: auditDetails,
          balanceAfter: balanceAfter,
          barrier: barrier,
          barrierCount: barrierCount,
          bidPrice: bidPrice,
          buyPrice: buyPrice,
          cancellation: cancellation,
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
          longCode: longCode,
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
          shortCode: shortCode,
          status: status,
          tickCount: tickCount,
          tickStream: tickStream,
          transactionId: transactionId,
          transactionIds: transactionIds,
          underlying: underlying,
          validationError: validationError,
        );

  /// Generates an instance from JSON
  factory Contract.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      Contract(
        auditDetails: getItemFromMap(
          json['audit_details'],
          itemToTypeCallback: (dynamic item) => AuditDetailModel.fromJson(item),
        ),
        balanceAfter: json['balanceAfter']?.toDouble(),
        barrier: json['barrier'],
        barrierCount: json['barrier_count']?.toDouble(),
        bidPrice: json['bid_price']?.toDouble(),
        buyPrice: json['buy_price']?.toDouble(),
        cancellation: getItemFromMap(
          json['cancellation'],
          itemToTypeCallback: (dynamic item) =>
              CancellationInfoModel.fromJson(item),
        ),
        commission: json['commision'],
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: json['current_spot'],
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: getDateTime(json['current_spot_time']),
        dateExpiry: getDateTime(json['date_expiry']),
        dateSettlement: getDateTime(json['date_settlement']),
        dateStart: json['start_time'] == null
            ? getDateTime(json['date_start'])
            : getDateTime(json['start_time']),
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
        isValidToCancel: getBool(json['is_valid_to_cancel']),
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
              ContractTickModel.fromJson(item),
        ),
        transactionId: json['transaction_id'],
        transactionIds: getItemFromMap(
          json['transaction_ids'],
          itemToTypeCallback: (dynamic item) =>
              TransactionIdsModel.fromJson(item),
        ),
        underlying: json['underlying'],
        validationError: json['validation_error'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  /// Buys a contract with parameters specified in given [BuyRequest]
  ///
  /// - Following field will be retrieved by this method:
  ///   [balanceAfter], [buyPrice], [contractId], [longCode], [payout],
  ///   [purchaseTime], [shortCode], [dateStart], [transactionId]
  ///
  /// - For getting the rest of the field call [fetchState]/ [subscribeState]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<Contract> buy(BuyRequest request) async {
    final BuyResponse response = await _api.call(
      request: request,
    );

    _checkForException(response);

    return Contract.fromJson(response.buy);
  }

  /// Buys a contract with parameters specified in given [BuyRequest] and subscribes to it.
  ///
  /// - First instance in stream will contain:
  ///   [balanceAfter], [buyPrice], [contractId], [longCode], [payout],
  ///   [purchaseTime], [shortCode], [dateStart], [transactionId]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<Contract> buyAndSubscribe(
    BuyRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<Contract>(
        (Response response) {
          _checkForException(response);

          return response is BuyResponse
              ? Contract.fromJson(
                  response.buy,
                  subscriptionJson: response.subscription,
                )
              : response is ProposalOpenContractResponse
                  ? Contract.fromJson(
                      response.proposalOpenContract,
                      subscriptionJson: response.subscription,
                    )
                  : null;
        },
      );

  /// Gets the current spot of the this bought contract as [Contract].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<Contract> fetchState() => Contract.fetchContractState(
        ProposalOpenContractRequest(
          contractId: contractId,
        ),
      );

  /// Subscribes to this bought contract spot and returns its spot update as [ContractModel].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<Contract> subscribeState({
    RequestCompareFunction comparePredicate,
  }) =>
      Contract.subscribeContractState(
        ProposalOpenContractRequest(contractId: contractId),
        comparePredicate: comparePredicate,
      );

  /// Sells this contract.
  ///
  /// [price] is the Minimum price at which to sell the contract,
  /// Default be 0 for 'sell at market'.
  /// Throws a [ContractOperationException] if API response contains an error
  Future<SellContract> sell({double price = 0}) =>
      SellContract.sellContract(SellRequest(sell: contractId, price: price));

  /// Cancels this contract
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<CancelContract> cancel() =>
      CancelContract.cancelContract(CancelRequest(cancel: contractId));

  /// Updates this contract
  ///
  /// New [stopLoss] value for a contract. To cancel, pass null.
  /// New [takeProfit] value for a contract. To cancel, pass null.
  /// Throws a [ContractOperationException] if API response contains an error
  Future<UpdateContract> update({
    double stopLoss,
    double takeProfit,
  }) =>
      UpdateContract.updateContract(ContractUpdateRequest(
        contractId: contractId,
        limitOrder: <String, dynamic>{
          'stop_loss': stopLoss,
          'take_profit': takeProfit,
        },
      ));

  /// Gets the current spot of the the bought contract specified in [ProposalOpenContractRequest]
  static Future<Contract> fetchContractState(
    ProposalOpenContractRequest request,
  ) async {
    final ProposalOpenContractResponse response = await _api.call(
      request: request,
    );

    _checkForException(response);

    return Contract.fromJson(
      response.proposalOpenContract,
    );
  }

  /// Subscribes to the bought contract state specified in [ProposalOpenContractRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<Contract> subscribeContractState(
    ProposalOpenContractRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<Contract>(
        (Response response) {
          _checkForException(response);

          return response is ProposalOpenContractResponse
              ? Contract.fromJson(
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

    _checkForException(response);

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all open contract subscriptions.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllOpenContract() async {
    final ForgetAllResponse response = await _api.unsubscribeAll(
      method: ForgetStreamType.proposalOpenContract,
    );

    _checkForException(response);

    return ForgetAll.fromResponse(response);
  }

  static void _checkForException(Response response) => checkException(
        response: response,
        exceptionCreator: (String message) =>
            ContractOperationException(message: message),
      );

  /// Generate a copy of instance with given parameters
  Contract copyWith({
    AuditDetailModel auditDetails,
    String barrier,
    double barrierCount,
    double bidPrice,
    double buyPrice,
    int contractId,
    CancellationInfoModel cancellation,
    double commission,
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
    bool isValidToCancel,
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
    List<ContractTickModel> tickStream,
    TransactionIdsModel transactionIds,
    String underlying,
    String validationError,
  }) =>
      Contract(
        auditDetails: auditDetails ?? this.auditDetails,
        barrier: barrier ?? this.barrier,
        barrierCount: barrierCount ?? this.barrierCount,
        bidPrice: bidPrice ?? this.bidPrice,
        buyPrice: buyPrice ?? this.buyPrice,
        cancellation: cancellation ?? this.cancellation,
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
