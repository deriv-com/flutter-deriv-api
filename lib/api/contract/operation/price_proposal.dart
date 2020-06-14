import 'package:flutter/cupertino.dart';
import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/price_proposal_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'contract.dart';
import 'exceptions/contract_operations_exception.dart';

/// Implementation of [PriceProposalModel]
class PriceProposal extends PriceProposalModel {
  /// Initializes
  PriceProposal({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    DateTime dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longCode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
    this.subscriptionInformation,
  }) : super(
          askPrice,
          cancellation,
          commission,
          dateStart,
          displayValue,
          id,
          limitOrder,
          longCode,
          multiplier,
          payout,
          spot,
          spotTime,
        );

  /// Generates an instance from JSON
  factory PriceProposal.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      PriceProposal(
        askPrice: json['ask_price']?.toDouble(),
        cancellation: getItemFromMap(
          json['cancellation'],
          itemToTypeCallback: (dynamic item) =>
              CancellationInfoModel.fromJson(item),
        ),
        commission: json['commission'],
        dateStart: getDateTime(json['date_start']),
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: getItemFromMap(
          json['limit_order'],
          itemToTypeCallback: (dynamic item) => LimitOrderModel.fromJson(item),
        ),
        longCode: json['longcode'],
        multiplier: json['multiplier'],
        payout: json['payout']?.toDouble(),
        spot: json['spot'],
        spotTime: getDateTime(json['spot_time']),
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription Information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the price proposal for contract
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<PriceProposal> fetchPriceForContract(
    ProposalRequest request,
  ) async {
    final ProposalResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          ContractOperationException(message: message),
    );

    return PriceProposal.fromJson(response.proposal);
  }

  /// Gets the price proposal for contract.
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<PriceProposal> subscribePriceForContract(
    ProposalRequest request,
  ) =>
      _api.subscribe(request: request).map<PriceProposal>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: (String message) =>
                ContractOperationException(message: message),
          );

          return response is ProposalResponse
              ? PriceProposal.fromJson(
                  response.proposal,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from price proposal subscription.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<Forget> unsubscribeProposal() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          ContractOperationException(message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all proposal subscriptions.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllProposal() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.proposal);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          ContractOperationException(message: message),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Buys this proposal contract with [price] specified.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<Contract> buy({@required double price}) => Contract.buy(BuyRequest(
        buy: id,
        price: price ?? askPrice,
      ));

  /// Buys this proposal contract with [price] specified and subscribes to it.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<Contract> buyAndSubscribe({@required double price}) =>
      Contract.buyAndSubscribe(BuyRequest(
        buy: id,
        price: price ?? askPrice,
      ));

  /// Generates a copy of instance with given parameters
  PriceProposal copyWith({
    double askPrice,
    CancellationInfoModel cancellation,
    double commission,
    int dateStart,
    String displayValue,
    String id,
    LimitOrderModel limitOrder,
    String longCode,
    int multiplier,
    double payout,
    double spot,
    DateTime spotTime,
  }) =>
      PriceProposal(
        askPrice: askPrice ?? this.askPrice,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        limitOrder: limitOrder ?? this.limitOrder,
        longCode: longCode ?? this.longCode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
      );
}
