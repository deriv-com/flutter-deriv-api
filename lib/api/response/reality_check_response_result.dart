// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/reality_check_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/reality_check_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Reality check response model class.
abstract class RealityCheckResponseModel {
  /// Initializes Reality check response model class .
  RealityCheckResponseModel({
    this.realityCheck,
  });

  /// Reality check summary of trades.
  final RealityCheck? realityCheck;
}

/// Reality check response class.
class RealityCheckResponse extends RealityCheckResponseModel {
  /// Initializes Reality check response class.
  RealityCheckResponse({
    RealityCheck? realityCheck,
  }) : super(
          realityCheck: realityCheck,
        );

  /// Creates an instance from JSON.
  factory RealityCheckResponse.fromJson(
    dynamic realityCheckJson,
  ) =>
      RealityCheckResponse(
        realityCheck: realityCheckJson == null
            ? null
            : RealityCheck.fromJson(realityCheckJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (realityCheck != null) {
      resultMap['reality_check'] = realityCheck!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves summary of client's trades and account for the reality check facility.
  ///
  /// A `reality check` means a display of time elapsed since the session began, and associated client profit/loss.
  /// The reality check facility is a regulatory requirement for certain landing companies.
  /// For parameters information refer to [RealityCheckRequest].
  /// Throws a [RealityCheckException] if API response contains an error
  static Future<RealityCheckResponse> check([
    RealityCheckRequest? request,
  ]) async {
    final RealityCheckReceive response = await _api.call(
      request: request ?? const RealityCheckRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          RealityCheckException(baseExceptionModel: baseExceptionModel),
    );

    return RealityCheckResponse.fromJson(response.realityCheck);
  }

  /// Creates a copy of instance with given parameters.
  RealityCheckResponse copyWith({
    RealityCheck? realityCheck,
  }) =>
      RealityCheckResponse(
        realityCheck: realityCheck ?? this.realityCheck,
      );
}
/// Reality check model class.
abstract class RealityCheckModel {
  /// Initializes Reality check model class .
  RealityCheckModel({
    this.buyAmount,
    this.buyCount,
    this.currency,
    this.loginid,
    this.openContractCount,
    this.potentialProfit,
    this.sellAmount,
    this.sellCount,
    this.startTime,
  });

  /// Total amount of contract purchased.
  final double? buyAmount;

  /// Total count of contract purchased.
  final int? buyCount;

  /// Currency of client account i.e currency for trading
  final String? currency;

  /// Client loginid.
  final String? loginid;

  /// Total count of contracts that are not yet expired.
  final int? openContractCount;

  /// Indicative profit of contract as per current market price.
  final double? potentialProfit;

  /// Total amount of contracts sold.
  final double? sellAmount;

  /// Total count of contract sold.
  final int? sellCount;

  /// Reality check summary start time epoch
  final DateTime? startTime;
}

/// Reality check class.
class RealityCheck extends RealityCheckModel {
  /// Initializes Reality check class.
  RealityCheck({
    double? buyAmount,
    int? buyCount,
    String? currency,
    String? loginid,
    int? openContractCount,
    double? potentialProfit,
    double? sellAmount,
    int? sellCount,
    DateTime? startTime,
  }) : super(
          buyAmount: buyAmount,
          buyCount: buyCount,
          currency: currency,
          loginid: loginid,
          openContractCount: openContractCount,
          potentialProfit: potentialProfit,
          sellAmount: sellAmount,
          sellCount: sellCount,
          startTime: startTime,
        );

  /// Creates an instance from JSON.
  factory RealityCheck.fromJson(Map<String, dynamic> json) => RealityCheck(
        buyAmount: getDouble(json['buy_amount']),
        buyCount: json['buy_count'],
        currency: json['currency'],
        loginid: json['loginid'],
        openContractCount: json['open_contract_count'],
        potentialProfit: getDouble(json['potential_profit']),
        sellAmount: getDouble(json['sell_amount']),
        sellCount: json['sell_count'],
        startTime: getDateTime(json['start_time']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['buy_amount'] = buyAmount;
    resultMap['buy_count'] = buyCount;
    resultMap['currency'] = currency;
    resultMap['loginid'] = loginid;
    resultMap['open_contract_count'] = openContractCount;
    resultMap['potential_profit'] = potentialProfit;
    resultMap['sell_amount'] = sellAmount;
    resultMap['sell_count'] = sellCount;
    resultMap['start_time'] = getSecondsSinceEpochDateTime(startTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RealityCheck copyWith({
    double? buyAmount,
    int? buyCount,
    String? currency,
    String? loginid,
    int? openContractCount,
    double? potentialProfit,
    double? sellAmount,
    int? sellCount,
    DateTime? startTime,
  }) =>
      RealityCheck(
        buyAmount: buyAmount ?? this.buyAmount,
        buyCount: buyCount ?? this.buyCount,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        openContractCount: openContractCount ?? this.openContractCount,
        potentialProfit: potentialProfit ?? this.potentialProfit,
        sellAmount: sellAmount ?? this.sellAmount,
        sellCount: sellCount ?? this.sellCount,
        startTime: startTime ?? this.startTime,
      );
}
