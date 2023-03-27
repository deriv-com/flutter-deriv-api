// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/contract_operations_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/buy_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/proposal_open_contract_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/buy_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/proposal_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Proposal response model class.
abstract class ProposalResponseModel {
  /// Initializes Proposal response model class .
  const ProposalResponseModel({
    this.proposal,
    this.subscription,
  });

  /// Latest price and other details for a given contract
  final Proposal? proposal;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Proposal response class.
class ProposalResponse extends ProposalResponseModel {
  /// Initializes Proposal response class.
  const ProposalResponse({
    Proposal? proposal,
    Subscription? subscription,
  }) : super(
          proposal: proposal,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory ProposalResponse.fromJson(
    dynamic proposalJson,
    dynamic subscriptionJson,
  ) =>
      ProposalResponse(
        proposal: proposalJson == null ? null : Proposal.fromJson(proposalJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (proposal != null) {
      resultMap['proposal'] = proposal!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the price proposal for contract
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ProposalResponse> fetchPriceForContract(
    ProposalRequest request,
  ) async {
    final ProposalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ProposalResponse.fromJson(response.proposal, response.subscription);
  }

  /// Gets the price proposal for contract.
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<ProposalResponse?> subscribePriceForContract(
    ProposalRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<ProposalResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                ContractOperationException(
                    baseExceptionModel: baseExceptionModel),
          );

          return response is ProposalReceive
              ? ProposalResponse.fromJson(
                  response.proposal,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from price proposal subscription.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<ForgetResponse?> unsubscribeProposal() async {
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

  /// Unsubscribes all proposal subscriptions.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllProposal() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.proposal);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Buys this proposal contract with [price] specified.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<BuyResponse> buy({double? price}) => BuyResponse.buyMethod(BuyRequest(
        buy: proposal?.id,
        price: price ?? proposal?.askPrice,
      ));

  /// Buys this proposal contract with [price] specified and subscribes to it.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<ProposalOpenContractResponse?> buyAndSubscribe({double? price}) =>
      BuyResponse.buyAndSubscribe(BuyRequest(
        buy: proposal?.id,
        price: price ?? proposal?.askPrice,
      ));

  /// Creates a copy of instance with given parameters.
  ProposalResponse copyWith({
    Proposal? proposal,
    Subscription? subscription,
  }) =>
      ProposalResponse(
        proposal: proposal ?? this.proposal,
        subscription: subscription ?? this.subscription,
      );
}

/// Proposal model class.
abstract class ProposalModel extends Equatable {
  /// Initializes Proposal model class .
  const ProposalModel({
    required this.spotTime,
    required this.spot,
    required this.payout,
    required this.longcode,
    required this.id,
    required this.displayValue,
    required this.dateStart,
    required this.askPrice,
    this.barrierChoices,
    this.cancellation,
    this.commission,
    this.contractDetails,
    this.dateExpiry,
    this.limitOrder,
    this.maxStake,
    this.minStake,
    this.multiplier,
    this.numberOfContracts,
  });

  /// The corresponding time of the spot value.
  final DateTime spotTime;

  /// Spot value (if there are no Exchange data-feed licensing restrictions for the underlying symbol).
  final double spot;

  /// The payout amount of the contract.
  final double payout;

  /// Example: Win payout if Random 100 Index is strictly higher than entry spot at 15 minutes after contract start time.
  final String longcode;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Same as `ask_price`.
  final String displayValue;

  /// The start date of the contract.
  final DateTime dateStart;

  /// The ask price.
  final double askPrice;

  /// [Only for vanilla options] The choices of predefined strike price for client to choose
  final List<dynamic>? barrierChoices;

  /// Contains information about contract cancellation option.
  final Cancellation? cancellation;

  /// Commission changed in percentage (%).
  final double? commission;

  /// Contains contract information. (Only applicable for accumulator).
  final ContractDetails? contractDetails;

  /// The end date of the contract.
  final DateTime? dateExpiry;

  /// Contains limit order information. (Only applicable for contract with limit order).
  final LimitOrder? limitOrder;

  /// [Only for vanilla options] Maximum stakes allowed
  final double? maxStake;

  /// [Only for vanilla options] Minimum stakes allowed
  final double? minStake;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double? multiplier;

  /// [Only for vanilla options] The implied number of contracts
  final double? numberOfContracts;
}

/// Proposal class.
class Proposal extends ProposalModel {
  /// Initializes Proposal class.
  const Proposal({
    required double askPrice,
    required DateTime dateStart,
    required String displayValue,
    required String id,
    required String longcode,
    required double payout,
    required double spot,
    required DateTime spotTime,
    List<dynamic>? barrierChoices,
    Cancellation? cancellation,
    double? commission,
    ContractDetails? contractDetails,
    DateTime? dateExpiry,
    LimitOrder? limitOrder,
    double? maxStake,
    double? minStake,
    double? multiplier,
    double? numberOfContracts,
  }) : super(
          askPrice: askPrice,
          dateStart: dateStart,
          displayValue: displayValue,
          id: id,
          longcode: longcode,
          payout: payout,
          spot: spot,
          spotTime: spotTime,
          barrierChoices: barrierChoices,
          cancellation: cancellation,
          commission: commission,
          contractDetails: contractDetails,
          dateExpiry: dateExpiry,
          limitOrder: limitOrder,
          maxStake: maxStake,
          minStake: minStake,
          multiplier: multiplier,
          numberOfContracts: numberOfContracts,
        );

  /// Creates an instance from JSON.
  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        askPrice: getDouble(json['ask_price'])!,
        dateStart: getDateTime(json['date_start'])!,
        displayValue: json['display_value'],
        id: json['id'],
        longcode: json['longcode'],
        payout: getDouble(json['payout'])!,
        spot: getDouble(json['spot'])!,
        spotTime: getDateTime(json['spot_time'])!,
        barrierChoices: json['barrier_choices'] == null
            ? null
            : List<dynamic>.from(
                json['barrier_choices']?.map(
                  (dynamic item) => item,
                ),
              ),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        commission: getDouble(json['commission']),
        contractDetails: json['contract_details'] == null
            ? null
            : ContractDetails.fromJson(json['contract_details']),
        dateExpiry: getDateTime(json['date_expiry']),
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        maxStake: getDouble(json['max_stake']),
        minStake: getDouble(json['min_stake']),
        multiplier: getDouble(json['multiplier']),
        numberOfContracts: getDouble(json['number_of_contracts']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask_price'] = askPrice;
    resultMap['date_start'] = getSecondsSinceEpochDateTime(dateStart);
    resultMap['display_value'] = displayValue;
    resultMap['id'] = id;
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['spot'] = spot;
    resultMap['spot_time'] = getSecondsSinceEpochDateTime(spotTime);
    if (barrierChoices != null) {
      resultMap['barrier_choices'] = barrierChoices!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    if (cancellation != null) {
      resultMap['cancellation'] = cancellation!.toJson();
    }
    resultMap['commission'] = commission;
    if (contractDetails != null) {
      resultMap['contract_details'] = contractDetails!.toJson();
    }
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);
    if (limitOrder != null) {
      resultMap['limit_order'] = limitOrder!.toJson();
    }
    resultMap['max_stake'] = maxStake;
    resultMap['min_stake'] = minStake;
    resultMap['multiplier'] = multiplier;
    resultMap['number_of_contracts'] = numberOfContracts;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Proposal copyWith({
    double? askPrice,
    DateTime? dateStart,
    String? displayValue,
    String? id,
    String? longcode,
    double? payout,
    double? spot,
    DateTime? spotTime,
    List<dynamic>? barrierChoices,
    Cancellation? cancellation,
    double? commission,
    ContractDetails? contractDetails,
    DateTime? dateExpiry,
    LimitOrder? limitOrder,
    double? maxStake,
    double? minStake,
    double? multiplier,
    double? numberOfContracts,
  }) =>
      Proposal(
        askPrice: askPrice ?? this.askPrice,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
        barrierChoices: barrierChoices ?? this.barrierChoices,
        cancellation: cancellation ?? this.cancellation,
        commission: commission ?? this.commission,
        contractDetails: contractDetails ?? this.contractDetails,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        limitOrder: limitOrder ?? this.limitOrder,
        maxStake: maxStake ?? this.maxStake,
        minStake: minStake ?? this.minStake,
        multiplier: multiplier ?? this.multiplier,
        numberOfContracts: numberOfContracts ?? this.numberOfContracts,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[
        id,
        askPrice,
        commission,
        dateExpiry,
        multiplier,
        cancellation,
        limitOrder,
      ];
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
  List<Object?> get props => <Object?>[
        askPrice,
        dateExpiry,
      ];
}

/// Contract details model class.
abstract class ContractDetailsModel {
  /// Initializes Contract details model class .
  const ContractDetailsModel({
    this.highBarrier,
    this.lastTickEpoch,
    this.lowBarrier,
    this.maximumPayout,
    this.maximumTicks,
    this.tickSizeBarrier,
    this.ticksStayedIn,
  });

  /// High barrier calculated based on current spot
  final String? highBarrier;

  /// Epoch of last tick considered for stat chart
  final DateTime? lastTickEpoch;

  /// Low barrier calculated based on current spot
  final String? lowBarrier;

  /// Maximum payout that user can get out of a contract, contract will close automatically if payout reaches this number
  final double? maximumPayout;

  /// Maximum duration that a contract can last, contract will close automatically after this number of ticks
  final int? maximumTicks;

  /// Tick size barrier for Accumulator contracts
  final double? tickSizeBarrier;

  /// An array of numbers  to build a stat chart - each number represents the duration that spot stayed between barries
  final List<int>? ticksStayedIn;
}

/// Contract details class.
class ContractDetails extends ContractDetailsModel {
  /// Initializes Contract details class.
  const ContractDetails({
    String? highBarrier,
    DateTime? lastTickEpoch,
    String? lowBarrier,
    double? maximumPayout,
    int? maximumTicks,
    double? tickSizeBarrier,
    List<int>? ticksStayedIn,
  }) : super(
          highBarrier: highBarrier,
          lastTickEpoch: lastTickEpoch,
          lowBarrier: lowBarrier,
          maximumPayout: maximumPayout,
          maximumTicks: maximumTicks,
          tickSizeBarrier: tickSizeBarrier,
          ticksStayedIn: ticksStayedIn,
        );

  /// Creates an instance from JSON.
  factory ContractDetails.fromJson(Map<String, dynamic> json) =>
      ContractDetails(
        highBarrier: json['high_barrier'],
        lastTickEpoch: getDateTime(json['last_tick_epoch']),
        lowBarrier: json['low_barrier'],
        maximumPayout: getDouble(json['maximum_payout']),
        maximumTicks: json['maximum_ticks'],
        tickSizeBarrier: getDouble(json['tick_size_barrier']),
        ticksStayedIn: json['ticks_stayed_in'] == null
            ? null
            : List<int>.from(
                json['ticks_stayed_in']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['high_barrier'] = highBarrier;
    resultMap['last_tick_epoch'] = getSecondsSinceEpochDateTime(lastTickEpoch);
    resultMap['low_barrier'] = lowBarrier;
    resultMap['maximum_payout'] = maximumPayout;
    resultMap['maximum_ticks'] = maximumTicks;
    resultMap['tick_size_barrier'] = tickSizeBarrier;
    if (ticksStayedIn != null) {
      resultMap['ticks_stayed_in'] = ticksStayedIn!
          .map<dynamic>(
            (int item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractDetails copyWith({
    String? highBarrier,
    DateTime? lastTickEpoch,
    String? lowBarrier,
    double? maximumPayout,
    int? maximumTicks,
    double? tickSizeBarrier,
    List<int>? ticksStayedIn,
  }) =>
      ContractDetails(
        highBarrier: highBarrier ?? this.highBarrier,
        lastTickEpoch: lastTickEpoch ?? this.lastTickEpoch,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        maximumPayout: maximumPayout ?? this.maximumPayout,
        maximumTicks: maximumTicks ?? this.maximumTicks,
        tickSizeBarrier: tickSizeBarrier ?? this.tickSizeBarrier,
        ticksStayedIn: ticksStayedIn ?? this.ticksStayedIn,
      );
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

  /// Contains information where the contract will be closed automatically at the profit specified by the user.
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
  List<Object?> get props => <Object?>[
        stopLoss,
        stopOut,
        takeProfit,
      ];
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
  List<Object?> get props => <Object?>[
        displayName,
        orderAmount,
      ];
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
  List<Object?> get props => <Object?>[
        displayName,
        orderAmount,
      ];
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
  List<Object?> get props => <Object?>[
        displayName,
        orderAmount,
      ];
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
