import 'package:meta/meta.dart';

import '../../basic_api/generated/buy_send.dart';
import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/proposal_receive.dart';
import '../../basic_api/generated/proposal_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/contract_operations_exception.dart';
import '../models/base_exception_model.dart';
import '../models/enums.dart';
import 'buy_receive_result.dart';
import 'forget_all_receive_result.dart';
import 'forget_receive_result.dart';
import 'proposal_open_contract_receive_result.dart';

/// Proposal response model class
abstract class ProposalResponseModel {
  /// Initializes
  ProposalResponseModel({
    @required this.subscription,
    @required this.proposal,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// Latest price and other details for a given contract
  final Proposal proposal;
}

/// Proposal response class
class ProposalResponse extends ProposalResponseModel {
  /// Initializes
  ProposalResponse({
    @required Proposal proposal,
    @required Subscription subscription,
  }) : super(
          proposal: proposal,
          subscription: subscription,
        );

  /// Creates an instance from JSON
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (proposal != null) {
      resultMap['proposal'] = proposal.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the price proposal for contract
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ProposalResponse> fetchPriceForContract(
    ProposalSend request,
  ) async {
    final ProposalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ProposalResponse.fromJson(response.proposal, response.subscription);
  }

  /// Gets the price proposal for contract.
  ///
  /// For parameters information refer to [ProposalRequest]
  /// Throws a [ContractOperationException] if API response contains an error
  static Stream<ProposalResponse> subscribePriceForContract(
    ProposalSend request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<ProposalResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
  Future<ForgetResponse> unsubscribeProposal() async {
    if (subscription?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Buys this proposal contract with [price] specified.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Future<BuyResponse> buy({@required double price}) =>
      BuyResponse.buyMethod(BuySend(
        buy: proposal.id,
        price: price ?? proposal.askPrice,
      ));

  /// Buys this proposal contract with [price] specified and subscribes to it.
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  Stream<ProposalOpenContractResponse> buyAndSubscribe(
          {@required double price}) =>
      BuyResponse.buyAndSubscribe(BuySend(
        buy: proposal.id,
        price: price ?? proposal.askPrice,
      ));

  /// Creates a copy of instance with given parameters
  ProposalResponse copyWith({
    Proposal proposal,
    Subscription subscription,
  }) =>
      ProposalResponse(
        proposal: proposal ?? this.proposal,
        subscription: subscription ?? this.subscription,
      );
}
/// Proposal model class
abstract class ProposalModel {
  /// Initializes
  ProposalModel({
    @required this.spotTime,
    @required this.spot,
    @required this.payout,
    @required this.multiplier,
    @required this.longcode,
    @required this.limitOrder,
    @required this.id,
    @required this.displayValue,
    @required this.dateStart,
    @required this.cancellation,
    @required this.askPrice,
    this.commission,
  });

  /// The corresponding time of the spot value.
  final DateTime spotTime;

  /// Spot value (if there are no Exchange data-feed licensing restrictions for the underlying symbol).
  final double spot;

  /// The payout amount of the contract.
  final double payout;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double multiplier;

  /// Example: Win payout if Random 100 Index is strictly higher than entry spot at 15 minutes after contract start time.
  final String longcode;

  /// Contains limit order information. (Only applicable for contract with limit order).
  final LimitOrder limitOrder;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Same as `ask_price`.
  final String displayValue;

  /// The start date of the contract.
  final DateTime dateStart;

  /// Contains information about contract cancellation option.
  final Cancellation cancellation;

  /// The ask price.
  final double askPrice;

  /// Commission changed in percentage (%).
  final double commission;
}

/// Proposal class
class Proposal extends ProposalModel {
  /// Initializes
  Proposal({
    @required double askPrice,
    @required Cancellation cancellation,
    @required DateTime dateStart,
    @required String displayValue,
    @required String id,
    @required LimitOrder limitOrder,
    @required String longcode,
    @required double multiplier,
    @required double payout,
    @required double spot,
    @required DateTime spotTime,
    double commission,
  }) : super(
          askPrice: askPrice,
          cancellation: cancellation,
          dateStart: dateStart,
          displayValue: displayValue,
          id: id,
          limitOrder: limitOrder,
          longcode: longcode,
          multiplier: multiplier,
          payout: payout,
          spot: spot,
          spotTime: spotTime,
          commission: commission,
        );

  /// Creates an instance from JSON
  factory Proposal.fromJson(Map<String, dynamic> json) => Proposal(
        askPrice: getDouble(json['ask_price']),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        dateStart: getDateTime(json['date_start']),
        displayValue: json['display_value'],
        id: json['id'],
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        longcode: json['longcode'],
        multiplier: getDouble(json['multiplier']),
        payout: getDouble(json['payout']),
        spot: getDouble(json['spot']),
        spotTime: getDateTime(json['spot_time']),
        commission: getDouble(json['commission']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask_price'] = askPrice;
    if (cancellation != null) {
      resultMap['cancellation'] = cancellation.toJson();
    }
    resultMap['date_start'] = getSecondsSinceEpochDateTime(dateStart);
    resultMap['display_value'] = displayValue;
    resultMap['id'] = id;
    if (limitOrder != null) {
      resultMap['limit_order'] = limitOrder.toJson();
    }
    resultMap['longcode'] = longcode;
    resultMap['multiplier'] = multiplier;
    resultMap['payout'] = payout;
    resultMap['spot'] = spot;
    resultMap['spot_time'] = getSecondsSinceEpochDateTime(spotTime);
    resultMap['commission'] = commission;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Proposal copyWith({
    double askPrice,
    Cancellation cancellation,
    DateTime dateStart,
    String displayValue,
    String id,
    LimitOrder limitOrder,
    String longcode,
    double multiplier,
    double payout,
    double spot,
    DateTime spotTime,
    double commission,
  }) =>
      Proposal(
        askPrice: askPrice ?? this.askPrice,
        cancellation: cancellation ?? this.cancellation,
        dateStart: dateStart ?? this.dateStart,
        displayValue: displayValue ?? this.displayValue,
        id: id ?? this.id,
        limitOrder: limitOrder ?? this.limitOrder,
        longcode: longcode ?? this.longcode,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        spot: spot ?? this.spot,
        spotTime: spotTime ?? this.spotTime,
        commission: commission ?? this.commission,
      );
}
/// Cancellation model class
abstract class CancellationModel {
  /// Initializes
  CancellationModel({
    @required this.dateExpiry,
    @required this.askPrice,
  });

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;

  /// Ask price of contract cancellation option.
  final double askPrice;
}

/// Cancellation class
class Cancellation extends CancellationModel {
  /// Initializes
  Cancellation({
    @required double askPrice,
    @required DateTime dateExpiry,
  }) : super(
          askPrice: askPrice,
          dateExpiry: dateExpiry,
        );

  /// Creates an instance from JSON
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        askPrice: getDouble(json['ask_price']),
        dateExpiry: getDateTime(json['date_expiry']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask_price'] = askPrice;
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Cancellation copyWith({
    double askPrice,
    DateTime dateExpiry,
  }) =>
      Cancellation(
        askPrice: askPrice ?? this.askPrice,
        dateExpiry: dateExpiry ?? this.dateExpiry,
      );
}
/// Limit order model class
abstract class LimitOrderModel {
  /// Initializes
  LimitOrderModel({
    @required this.takeProfit,
    @required this.stopOut,
    @required this.stopLoss,
  });

  /// Contains information where the contract will be closed automatically at the profit specified by the user.
  final LimitOrderTakeProfit takeProfit;

  /// Contains information where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final StopOut stopOut;

  /// Contains information where the contract will be closed automatically at the loss specified by the user.
  final LimitOrderStopLoss stopLoss;
}

/// Limit order class
class LimitOrder extends LimitOrderModel {
  /// Initializes
  LimitOrder({
    @required LimitOrderStopLoss stopLoss,
    @required StopOut stopOut,
    @required LimitOrderTakeProfit takeProfit,
  }) : super(
          stopLoss: stopLoss,
          stopOut: stopOut,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        stopLoss: json['stop_loss'] == null
            ? null
            : LimitOrderStopLoss.fromJson(json['stop_loss']),
        stopOut: json['stop_out'] == null
            ? null
            : StopOut.fromJson(json['stop_out']),
        takeProfit: json['take_profit'] == null
            ? null
            : LimitOrderTakeProfit.fromJson(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (stopLoss != null) {
      resultMap['stop_loss'] = stopLoss.toJson();
    }
    if (stopOut != null) {
      resultMap['stop_out'] = stopOut.toJson();
    }
    if (takeProfit != null) {
      resultMap['take_profit'] = takeProfit.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LimitOrder copyWith({
    LimitOrderStopLoss stopLoss,
    StopOut stopOut,
    LimitOrderTakeProfit takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
/// Limit order stop loss model class
abstract class LimitOrderStopLossModel {
  /// Initializes
  LimitOrderStopLossModel({
    @required this.orderDate,
    @required this.displayName,
    this.orderAmount,
    this.value,
  });

  /// Stop loss order epoch
  final DateTime orderDate;

  /// Localized display name
  final String displayName;

  /// Stop loss amount
  final double orderAmount;

  /// Pip-sized barrier value
  final String value;
}

/// Limit order stop loss class
class LimitOrderStopLoss extends LimitOrderStopLossModel {
  /// Initializes
  LimitOrderStopLoss({
    @required String displayName,
    @required DateTime orderDate,
    double orderAmount,
    String value,
  }) : super(
          displayName: displayName,
          orderDate: orderDate,
          orderAmount: orderAmount,
          value: value,
        );

  /// Creates an instance from JSON
  factory LimitOrderStopLoss.fromJson(Map<String, dynamic> json) =>
      LimitOrderStopLoss(
        displayName: json['display_name'],
        orderDate: getDateTime(json['order_date']),
        orderAmount: getDouble(json['order_amount']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['order_amount'] = orderAmount;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LimitOrderStopLoss copyWith({
    String displayName,
    DateTime orderDate,
    double orderAmount,
    String value,
  }) =>
      LimitOrderStopLoss(
        displayName: displayName ?? this.displayName,
        orderDate: orderDate ?? this.orderDate,
        orderAmount: orderAmount ?? this.orderAmount,
        value: value ?? this.value,
      );
}
/// Stop out model class
abstract class StopOutModel {
  /// Initializes
  StopOutModel({
    @required this.value,
    @required this.orderDate,
    @required this.orderAmount,
    @required this.displayName,
  });

  /// Pip-sized barrier value
  final String value;

  /// Stop out order epoch
  final DateTime orderDate;

  /// Stop out amount
  final double orderAmount;

  /// Localized display name
  final String displayName;
}

/// Stop out class
class StopOut extends StopOutModel {
  /// Initializes
  StopOut({
    @required String displayName,
    @required double orderAmount,
    @required DateTime orderDate,
    @required String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopOut.fromJson(Map<String, dynamic> json) => StopOut(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  StopOut copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      StopOut(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Limit order take profit model class
abstract class LimitOrderTakeProfitModel {
  /// Initializes
  LimitOrderTakeProfitModel({
    @required this.orderDate,
    @required this.displayName,
    this.orderAmount,
    this.value,
  });

  /// Take profit order epoch
  final DateTime orderDate;

  /// Localized display name
  final String displayName;

  /// Take profit amount
  final double orderAmount;

  /// Pip-sized barrier value
  final String value;
}

/// Limit order take profit class
class LimitOrderTakeProfit extends LimitOrderTakeProfitModel {
  /// Initializes
  LimitOrderTakeProfit({
    @required String displayName,
    @required DateTime orderDate,
    double orderAmount,
    String value,
  }) : super(
          displayName: displayName,
          orderDate: orderDate,
          orderAmount: orderAmount,
          value: value,
        );

  /// Creates an instance from JSON
  factory LimitOrderTakeProfit.fromJson(Map<String, dynamic> json) =>
      LimitOrderTakeProfit(
        displayName: json['display_name'],
        orderDate: getDateTime(json['order_date']),
        orderAmount: getDouble(json['order_amount']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['order_amount'] = orderAmount;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LimitOrderTakeProfit copyWith({
    String displayName,
    DateTime orderDate,
    double orderAmount,
    String value,
  }) =>
      LimitOrderTakeProfit(
        displayName: displayName ?? this.displayName,
        orderDate: orderDate ?? this.orderDate,
        orderAmount: orderAmount ?? this.orderAmount,
        value: value ?? this.value,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
