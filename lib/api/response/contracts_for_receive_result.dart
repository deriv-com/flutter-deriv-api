import '../../basic_api/generated/contracts_for_receive.dart';
import '../../basic_api/generated/contracts_for_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Contracts for response model class
abstract class ContractsForResponseModel {
  /// Initializes
  ContractsForResponseModel({
    this.contractsFor,
  });

  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final ContractsFor? contractsFor;
}

/// Contracts for response class
class ContractsForResponse extends ContractsForResponseModel {
  /// Initializes
  ContractsForResponse({
    ContractsFor? contractsFor,
  }) : super(
          contractsFor: contractsFor,
        );

  /// Creates an instance from JSON
  factory ContractsForResponse.fromJson(
    dynamic contractsForJson,
  ) =>
      ContractsForResponse(
        contractsFor: contractsForJson == null
            ? null
            : ContractsFor.fromJson(contractsForJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (contractsFor != null) {
      resultMap['contracts_for'] = contractsFor!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets available contracts for given symbol in [ContractsForRequest]
  ///
  /// Throws a [ContractsForSymbolException] if API response contains an error
  static Future<ContractsForResponse> fetchContractsForSymbol(
    ContractsForSend request,
  ) async {
    final ContractsForReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractsForSymbolException(baseExceptionModel: baseExceptionModel),
    );

    return ContractsForResponse.fromJson(response.contractsFor);
  }

  /// Creates a copy of instance with given parameters
  ContractsForResponse copyWith({
    ContractsFor? contractsFor,
  }) =>
      ContractsForResponse(
        contractsFor: contractsFor ?? this.contractsFor,
      );
}
/// Contracts for model class
abstract class ContractsForModel {
  /// Initializes
  ContractsForModel({
    required this.available,
    this.close,
    this.feedLicense,
    this.hitCount,
    this.open,
    this.spot,
  });

  /// Array of available contracts details
  final List<AvailableItem> available;

  /// Symbol's next market-close time as an epoch value
  final DateTime? close;

  /// Indicates the feed license for symbol, for example whether its realtime or delayed
  final String? feedLicense;

  /// Count of contracts available
  final double? hitCount;

  /// Symbol's next market-open time as an epoch value
  final DateTime? open;

  /// Current spot price for this underlying
  final double? spot;
}

/// Contracts for class
class ContractsFor extends ContractsForModel {
  /// Initializes
  ContractsFor({
    required List<AvailableItem> available,
    DateTime? close,
    String? feedLicense,
    double? hitCount,
    DateTime? open,
    double? spot,
  }) : super(
          available: available,
          close: close,
          feedLicense: feedLicense,
          hitCount: hitCount,
          open: open,
          spot: spot,
        );

  /// Creates an instance from JSON
  factory ContractsFor.fromJson(Map<String, dynamic> json) => ContractsFor(
        available: List<AvailableItem>.from(
          json['available'].map(
            (dynamic item) => AvailableItem.fromJson(item),
          ),
        ),
        close: getDateTime(json['close']),
        feedLicense: json['feed_license'],
        hitCount: getDouble(json['hit_count']),
        open: getDateTime(json['open']),
        spot: getDouble(json['spot']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['available'] = available
        .map<dynamic>(
          (AvailableItem item) => item.toJson(),
        )
        .toList();

    resultMap['close'] = getSecondsSinceEpochDateTime(close);
    resultMap['feed_license'] = feedLicense;
    resultMap['hit_count'] = hitCount;
    resultMap['open'] = getSecondsSinceEpochDateTime(open);
    resultMap['spot'] = spot;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ContractsFor copyWith({
    required List<AvailableItem> available,
    DateTime? close,
    String? feedLicense,
    double? hitCount,
    DateTime? open,
    double? spot,
  }) =>
      ContractsFor(
        available: available,
        close: close ?? this.close,
        feedLicense: feedLicense ?? this.feedLicense,
        hitCount: hitCount ?? this.hitCount,
        open: open ?? this.open,
        spot: spot ?? this.spot,
      );
}
/// Available item model class
abstract class AvailableItemModel {
  /// Initializes
  AvailableItemModel({
    required this.underlyingSymbol,
    required this.submarket,
    required this.startType,
    required this.sentiment,
    required this.minContractDuration,
    required this.maxContractDuration,
    required this.market,
    required this.expiryType,
    required this.exchangeName,
    required this.contractType,
    required this.contractCategoryDisplay,
    required this.contractCategory,
    required this.barriers,
    required this.barrierCategory,
    this.availableBarriers,
    this.contractDisplay,
    this.expiredBarriers,
    this.forwardStartingOptions,
    this.payoutLimit,
    this.tradingPeriod,
  });

  /// Symbol code
  final String underlyingSymbol;

  /// Type of submarket.
  final String submarket;

  /// Start Type.
  final String startType;

  /// Type of sentiment.
  final String sentiment;

  /// Minimum contract duration.
  final String minContractDuration;

  /// Maximum contract duration
  final String maxContractDuration;

  /// Type of market.
  final String market;

  /// Expiry Type.
  final String expiryType;

  /// Name of exchange
  final String exchangeName;

  /// Type of contract.
  final String contractType;

  /// Category of the contract.
  final String contractCategoryDisplay;

  /// Category of contract.
  final String contractCategory;

  /// Number of barriers.
  final double barriers;

  /// Category of barrier.
  final String barrierCategory;

  /// Array of available barriers for a predefined trading period
  final List<dynamic>? availableBarriers;

  /// Display name for the type of contract.
  final String? contractDisplay;

  /// Array of barriers already expired
  final List<dynamic>? expiredBarriers;

  /// Array of returned forward starting options
  final List<ForwardStartingOptionsItem>? forwardStartingOptions;

  /// Maximum payout.
  final double? payoutLimit;

  /// A hash of predefined trading period
  final Map<String, dynamic>? tradingPeriod;
}

/// Available item class
class AvailableItem extends AvailableItemModel {
  /// Initializes
  AvailableItem({
    required String barrierCategory,
    required double barriers,
    required String contractCategory,
    required String contractCategoryDisplay,
    required String contractType,
    required String exchangeName,
    required String expiryType,
    required String market,
    required String maxContractDuration,
    required String minContractDuration,
    required String sentiment,
    required String startType,
    required String submarket,
    required String underlyingSymbol,
    List<dynamic>? availableBarriers,
    String? contractDisplay,
    List<dynamic>? expiredBarriers,
    List<ForwardStartingOptionsItem>? forwardStartingOptions,
    double? payoutLimit,
    Map<String, dynamic>? tradingPeriod,
  }) : super(
          barrierCategory: barrierCategory,
          barriers: barriers,
          contractCategory: contractCategory,
          contractCategoryDisplay: contractCategoryDisplay,
          contractType: contractType,
          exchangeName: exchangeName,
          expiryType: expiryType,
          market: market,
          maxContractDuration: maxContractDuration,
          minContractDuration: minContractDuration,
          sentiment: sentiment,
          startType: startType,
          submarket: submarket,
          underlyingSymbol: underlyingSymbol,
          availableBarriers: availableBarriers,
          contractDisplay: contractDisplay,
          expiredBarriers: expiredBarriers,
          forwardStartingOptions: forwardStartingOptions,
          payoutLimit: payoutLimit,
          tradingPeriod: tradingPeriod,
        );

  /// Creates an instance from JSON
  factory AvailableItem.fromJson(Map<String, dynamic> json) => AvailableItem(
        barrierCategory: json['barrier_category'],
        barriers: getDouble(json['barriers'])!,
        contractCategory: json['contract_category'],
        contractCategoryDisplay: json['contract_category_display'],
        contractType: json['contract_type'],
        exchangeName: json['exchange_name'],
        expiryType: json['expiry_type'],
        market: json['market'],
        maxContractDuration: json['max_contract_duration'],
        minContractDuration: json['min_contract_duration'],
        sentiment: json['sentiment'],
        startType: json['start_type'],
        submarket: json['submarket'],
        underlyingSymbol: json['underlying_symbol'],
        availableBarriers: json['available_barriers'] == null
            ? null
            : List<dynamic>.from(
                json['available_barriers']?.map(
                  (dynamic item) => item,
                ),
              ),
        contractDisplay: json['contract_display'],
        expiredBarriers: json['expired_barriers'] == null
            ? null
            : List<dynamic>.from(
                json['expired_barriers']?.map(
                  (dynamic item) => item,
                ),
              ),
        forwardStartingOptions: json['forward_starting_options'] == null
            ? null
            : List<ForwardStartingOptionsItem>.from(
                json['forward_starting_options']?.map(
                  (dynamic item) => ForwardStartingOptionsItem.fromJson(item),
                ),
              ),
        payoutLimit: getDouble(json['payout_limit']),
        tradingPeriod: json['trading_period'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['barrier_category'] = barrierCategory;
    resultMap['barriers'] = barriers;
    resultMap['contract_category'] = contractCategory;
    resultMap['contract_category_display'] = contractCategoryDisplay;
    resultMap['contract_type'] = contractType;
    resultMap['exchange_name'] = exchangeName;
    resultMap['expiry_type'] = expiryType;
    resultMap['market'] = market;
    resultMap['max_contract_duration'] = maxContractDuration;
    resultMap['min_contract_duration'] = minContractDuration;
    resultMap['sentiment'] = sentiment;
    resultMap['start_type'] = startType;
    resultMap['submarket'] = submarket;
    resultMap['underlying_symbol'] = underlyingSymbol;
    if (availableBarriers != null) {
      resultMap['available_barriers'] = availableBarriers!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['contract_display'] = contractDisplay;
    if (expiredBarriers != null) {
      resultMap['expired_barriers'] = expiredBarriers!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    if (forwardStartingOptions != null) {
      resultMap['forward_starting_options'] = forwardStartingOptions!
          .map<dynamic>(
            (ForwardStartingOptionsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['payout_limit'] = payoutLimit;
    resultMap['trading_period'] = tradingPeriod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AvailableItem copyWith({
    required String barrierCategory,
    required double barriers,
    required String contractCategory,
    required String contractCategoryDisplay,
    required String contractType,
    required String exchangeName,
    required String expiryType,
    required String market,
    required String maxContractDuration,
    required String minContractDuration,
    required String sentiment,
    required String startType,
    required String submarket,
    required String underlyingSymbol,
    List<dynamic>? availableBarriers,
    String? contractDisplay,
    List<dynamic>? expiredBarriers,
    List<ForwardStartingOptionsItem>? forwardStartingOptions,
    double? payoutLimit,
    Map<String, dynamic>? tradingPeriod,
  }) =>
      AvailableItem(
        barrierCategory: barrierCategory,
        barriers: barriers,
        contractCategory: contractCategory,
        contractCategoryDisplay: contractCategoryDisplay,
        contractType: contractType,
        exchangeName: exchangeName,
        expiryType: expiryType,
        market: market,
        maxContractDuration: maxContractDuration,
        minContractDuration: minContractDuration,
        sentiment: sentiment,
        startType: startType,
        submarket: submarket,
        underlyingSymbol: underlyingSymbol,
        availableBarriers: availableBarriers ?? this.availableBarriers,
        contractDisplay: contractDisplay ?? this.contractDisplay,
        expiredBarriers: expiredBarriers ?? this.expiredBarriers,
        forwardStartingOptions:
            forwardStartingOptions ?? this.forwardStartingOptions,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        tradingPeriod: tradingPeriod ?? this.tradingPeriod,
      );
}
/// Forward starting options item model class
abstract class ForwardStartingOptionsItemModel {
  /// Initializes
  ForwardStartingOptionsItemModel({
    this.close,
    this.date,
    this.open,
  });

  /// The epoch value for the closing date of forward starting session.
  final String? close;

  /// The epoch value for the date of forward starting session.
  final String? date;

  /// The epoch value for the opening date of forward starting session.
  final String? open;
}

/// Forward starting options item class
class ForwardStartingOptionsItem extends ForwardStartingOptionsItemModel {
  /// Initializes
  ForwardStartingOptionsItem({
    String? close,
    String? date,
    String? open,
  }) : super(
          close: close,
          date: date,
          open: open,
        );

  /// Creates an instance from JSON
  factory ForwardStartingOptionsItem.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOptionsItem(
        close: json['close'],
        date: json['date'],
        open: json['open'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['close'] = close;
    resultMap['date'] = date;
    resultMap['open'] = open;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ForwardStartingOptionsItem copyWith({
    String? close,
    String? date,
    String? open,
  }) =>
      ForwardStartingOptionsItem(
        close: close ?? this.close,
        date: date ?? this.date,
        open: open ?? this.open,
      );
}
