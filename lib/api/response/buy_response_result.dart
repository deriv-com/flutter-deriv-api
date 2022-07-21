// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/contract_update_response_result.dart';
import 'package:flutter_deriv_api/api/response/proposal_open_contract_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/buy_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/buy_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/contract_update_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_open_contract_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_open_contract_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
/// Buy response model class.
abstract class BuyResponseModel {
  /// Initializes Buy response model class .
  const BuyResponseModel({
    this.buy,
    this.subscription,
  });

  /// Receipt confirmation for the purchase
  final Buy? buy;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Buy response class.
class BuyResponse extends BuyResponseModel {
  /// Initializes Buy response class.
  const BuyResponse({
    Buy? buy,
    Subscription? subscription,
  }) : super(
          buy: buy,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory BuyResponse.fromJson(
    dynamic buyJson,
    dynamic subscriptionJson,
  ) =>
      BuyResponse(
        buy: buyJson == null ? null : Buy.fromJson(buyJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (buy != null) {
      resultMap['buy'] = buy!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Buys a contract with parameters specified in given [BuyRequest]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<BuyResponse> buyMethod(BuyRequest request) async {
    final BuyReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return BuyResponse.fromJson(response.buy, response.subscription);
  }

  /// Buys contract with parameters specified in request and subscribes to it.
  ///
  /// Throws a [ContractOperationException] is API response contains an error
  static Stream<ProposalOpenContractResponse?> buyAndSubscribe(
    BuyRequest request, {
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

  /// Gets the current spot of the this bought contract as [Contract].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<ProposalOpenContractResponse> fetchState() =>
      ProposalOpenContractResponse.fetchContractState(
        ProposalOpenContractRequest(
          contractId: buy?.contractId,
        ),
      );

  /// Subscribes to this bought contract spot and returns its spot update as [ContractBaseModel].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<ProposalOpenContractResponse?> subscribeState({
    RequestCompareFunction? comparePredicate,
  }) =>
      ProposalOpenContractResponse.subscribeContractState(
        ProposalOpenContractRequest(contractId: buy?.contractId),
        comparePredicate: comparePredicate,
      );

  /// Updates this contract
  ///
  /// New [stopLoss] value for a contract. To cancel, pass null.
  /// New [takeProfit] value for a contract. To cancel, pass null.
  /// Throws a [ContractOperationException] if API response contains an error
  Future<ContractUpdateResponse> update({
    double? stopLoss,
    double? takeProfit,
  }) =>
      ContractUpdateResponse.updateContract(ContractUpdateRequest(
        contractId: buy?.contractId,
        limitOrder: <String, dynamic>{
          'stop_loss': stopLoss,
          'take_profit': takeProfit,
        },
      ));

  /// Creates a copy of instance with given parameters.
  BuyResponse copyWith({
    Buy? buy,
    Subscription? subscription,
  }) =>
      BuyResponse(
        buy: buy ?? this.buy,
        subscription: subscription ?? this.subscription,
      );
}
/// Buy model class.
abstract class BuyModel {
  /// Initializes Buy model class .
  const BuyModel({
    required this.transactionId,
    required this.startTime,
    required this.shortcode,
    required this.purchaseTime,
    required this.payout,
    required this.longcode,
    required this.contractId,
    required this.buyPrice,
    required this.balanceAfter,
  });

  /// Internal transaction identifier
  final int transactionId;

  /// Epoch value showing the expected start time of the contract
  final DateTime startTime;

  /// Compact description of the contract purchased
  final String shortcode;

  /// Epoch value of the transaction purchase time
  final DateTime purchaseTime;

  /// Proposed payout value
  final double payout;

  /// The description of contract purchased
  final String longcode;

  /// Internal contract identifier
  final int contractId;

  /// Actual effected purchase price
  final double buyPrice;

  /// The new account balance after completion of the purchase
  final double balanceAfter;
}

/// Buy class.
class Buy extends BuyModel {
  /// Initializes Buy class.
  const Buy({
    required double balanceAfter,
    required double buyPrice,
    required int contractId,
    required String longcode,
    required double payout,
    required DateTime purchaseTime,
    required String shortcode,
    required DateTime startTime,
    required int transactionId,
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

  /// Creates an instance from JSON.
  factory Buy.fromJson(Map<String, dynamic> json) => Buy(
        balanceAfter: getDouble(json['balance_after'])!,
        buyPrice: getDouble(json['buy_price'])!,
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: getDouble(json['payout'])!,
        purchaseTime: getDateTime(json['purchase_time'])!,
        shortcode: json['shortcode'],
        startTime: getDateTime(json['start_time'])!,
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_after'] = balanceAfter;
    resultMap['buy_price'] = buyPrice;
    resultMap['contract_id'] = contractId;
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['shortcode'] = shortcode;
    resultMap['start_time'] = getSecondsSinceEpochDateTime(startTime);
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Buy copyWith({
    double? balanceAfter,
    double? buyPrice,
    int? contractId,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    String? shortcode,
    DateTime? startTime,
    int? transactionId,
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
/// Subscription model class.
abstract class SubscriptionModel {
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
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
