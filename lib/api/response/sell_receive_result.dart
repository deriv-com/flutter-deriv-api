
import '../../basic_api/generated/sell_expired_receive.dart';
import '../../basic_api/generated/sell_expired_send.dart';
import '../../basic_api/generated/sell_receive.dart';
import '../../basic_api/generated/sell_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import 'sell_expired_receive_result.dart';

/// Sell response model class
abstract class SellResponseModel {
  /// Initializes
  SellResponseModel({
    this.sell,
  });

  /// Receipt for the transaction
  final Sell? sell;
}

/// Sell response class
class SellResponse extends SellResponseModel {
  /// Initializes
  SellResponse({
    Sell? sell,
  }) : super(
          sell: sell,
        );

  /// Creates an instance from JSON
  factory SellResponse.fromJson(
    dynamic sellJson,
  ) =>
      SellResponse(
        sell: sellJson == null ? null : Sell.fromJson(sellJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (sell != null) {
      resultMap['sell'] = sell!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Sells a contract with parameters specified in [SellRequest].
  ///
  /// Throws a [ContractOperationException] if API response contains an error
  static Future<SellResponse> sellContract(SellSend request) async {
    final SellReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellResponse.fromJson(response.sell);
  }

  /// tries to sell any expired contracts and returns the number of sold contracts as [SellExpiredContractModel].
  ///
  /// Throws [ContractOperationException] if API response contains an error
  static Future<SellExpiredResponse> sellExpiredContracts([
    SellExpiredSend? request,
  ]) async {
    final SellExpiredReceive response = await _api.call(
      request: request ?? const SellExpiredSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ContractOperationException(baseExceptionModel: baseExceptionModel),
    );

    return SellExpiredResponse.fromJson(response.sellExpired);
  }

  /// Creates a copy of instance with given parameters
  SellResponse copyWith({
    Sell? sell,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
      );
}
/// Sell model class
abstract class SellModel {
  /// Initializes
  SellModel({
    this.balanceAfter,
    this.contractId,
    this.referenceId,
    this.soldFor,
    this.transactionId,
  });

  /// New account balance after completion of the sale
  final double? balanceAfter;

  /// Internal contract identifier for the sold contract
  final int? contractId;

  /// Internal transaction identifier for the corresponding buy transaction
  final int? referenceId;

  /// Actual effected sale price
  final double? soldFor;

  /// Internal transaction identifier for the sale transaction
  final int? transactionId;
}

/// Sell class
class Sell extends SellModel {
  /// Initializes
  Sell({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          contractId: contractId,
          referenceId: referenceId,
          soldFor: soldFor,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
        balanceAfter: getDouble(json['balance_after']),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: getDouble(json['sold_for']),
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_after'] = balanceAfter;
    resultMap['contract_id'] = contractId;
    resultMap['reference_id'] = referenceId;
    resultMap['sold_for'] = soldFor;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Sell copyWith({
    double? balanceAfter,
    int? contractId,
    int? referenceId,
    double? soldFor,
    int? transactionId,
  }) =>
      Sell(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
