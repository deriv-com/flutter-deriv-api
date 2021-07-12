import '../../basic_api/generated/contract_update_history_receive.dart';
import '../../basic_api/generated/contract_update_history_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Contract update history response model class.
abstract class ContractUpdateHistoryResponseModel {
  /// Initializes.
  ContractUpdateHistoryResponseModel({
    this.contractUpdateHistory,
  });

  /// Contains the historical and the most recent update status of the contract
  final List<ContractUpdateHistoryItem>? contractUpdateHistory;
}

/// Contract update history response class.
class ContractUpdateHistoryResponse extends ContractUpdateHistoryResponseModel {
  /// Initializes
  ContractUpdateHistoryResponse({
    List<ContractUpdateHistoryItem>? contractUpdateHistory,
  }) : super(
          contractUpdateHistory: contractUpdateHistory,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryResponse.fromJson(
    dynamic contractUpdateHistoryJson,
  ) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory: contractUpdateHistoryJson == null
            ? null
            : List<ContractUpdateHistoryItem>.from(
                contractUpdateHistoryJson?.map(
                  (dynamic item) => ContractUpdateHistoryItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (contractUpdateHistory != null) {
      resultMap['contract_update_history'] = contractUpdateHistory!
          .map<dynamic>(
            (ContractUpdateHistoryItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets update history for contract as List of [HistorySpotPriceModel]
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<ContractUpdateHistoryResponse> fetchContractUpdateHistory(
    ContractUpdateHistorySend request,
  ) async {
    final ContractUpdateHistoryReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return ContractUpdateHistoryResponse.fromJson(
        response.contractUpdateHistory);
  }

  /// Creates a copy of instance with given parameters.
  ContractUpdateHistoryResponse copyWith({
    List<ContractUpdateHistoryItem>? contractUpdateHistory,
  }) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
      );
}
/// Contract update history item model class.
abstract class ContractUpdateHistoryItemModel {
  /// Initializes.
  ContractUpdateHistoryItemModel({
    this.displayName,
    this.orderAmount,
    this.orderDate,
    this.orderType,
    this.value,
  });

  /// Display name of the changed parameter.
  final String? displayName;

  /// The amount.
  final String? orderAmount;

  /// The epoch when the changed was done.
  final DateTime? orderDate;

  /// The contract parameter updated.
  final String? orderType;

  /// The pip-sized barrier value.
  final String? value;
}

/// Contract update history item class.
class ContractUpdateHistoryItem extends ContractUpdateHistoryItemModel {
  /// Initializes
  ContractUpdateHistoryItem({
    String? displayName,
    String? orderAmount,
    DateTime? orderDate,
    String? orderType,
    String? value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          orderType: orderType,
          value: value,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryItem.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryItem(
        displayName: json['display_name'],
        orderAmount: json['order_amount'],
        orderDate: getDateTime(json['order_date']),
        orderType: json['order_type'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['order_type'] = orderType;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractUpdateHistoryItem copyWith({
    String? displayName,
    String? orderAmount,
    DateTime? orderDate,
    String? orderType,
    String? value,
  }) =>
      ContractUpdateHistoryItem(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        orderType: orderType ?? this.orderType,
        value: value ?? this.value,
      );
}
