import 'package:flutter_deriv_api/api/contract/models/cancellation_info_model.dart';
import 'package:flutter_deriv_api/api/contract/models/limit_order_model.dart';
import 'package:flutter_deriv_api/api/contract/models/price_proposal_model.dart';
import 'package:flutter_deriv_api/api/contract/operation/buy_contract.dart';
import 'package:flutter_deriv_api/api/contract/operation/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

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
  factory PriceProposal.fromJson(Map<String, dynamic> json) => PriceProposal(
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
        subscriptionInformation:
            SubscriptionModel.fromJson(json['subscription']),
      );

  /// Subscription Information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the price proposal for contract
  /// For parameters information refer to [ProposalRequest]
  static Future<PriceProposal> getPriceForContract({
    ProposalRequest request,
  }) async {
    final ProposalResponse response = await _api.call(request: request);

    checkForException(
      response: response,
      exceptionCreator: (String message) => ContractOperationException(
        message: message,
      ),
    );

    return PriceProposal.fromJson(response.proposal);
  }

  /// Gets the price proposal for contract
  /// For parameters information refer to [ProposalRequest]
  static Stream<PriceProposal> subscribePriceForContract({
    ProposalRequest request,
  }) =>
      _api.subscribe(request: request).map<PriceProposal>(
        (Response response) {
          checkForException(
            response: response,
            exceptionCreator: (String message) => ContractOperationException(
              message: message,
            ),
          );

          return response is ProposalResponse
              ? PriceProposal.fromJson(response.proposal)
              : null;
        },
      );

  /// Buys this proposal contract with [price] specified
  Future<BuyContract> buy({double price}) => BuyContract.buy(BuyRequest(
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
