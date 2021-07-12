import '../../basic_api/generated/mt5_deposit_receive.dart';
import '../../basic_api/generated/mt5_deposit_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 deposit response model class.
abstract class Mt5DepositResponseModel {
  /// Initializes.
  Mt5DepositResponseModel({
    this.mt5Deposit,
    this.binaryTransactionId,
  });

  /// 1 on success
  final int? mt5Deposit;

  /// Withdrawal reference ID of Binary account
  final int? binaryTransactionId;
}

/// Mt5 deposit response class.
class Mt5DepositResponse extends Mt5DepositResponseModel {
  /// Initializes
  Mt5DepositResponse({
    int? mt5Deposit,
    int? binaryTransactionId,
  }) : super(
          mt5Deposit: mt5Deposit,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON
  factory Mt5DepositResponse.fromJson(
    dynamic mt5DepositJson,
    dynamic binaryTransactionIdJson,
  ) =>
      Mt5DepositResponse(
        mt5Deposit: mt5DepositJson,
        binaryTransactionId: binaryTransactionIdJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_deposit'] = mt5Deposit;
    resultMap['binary_transaction_id'] = binaryTransactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Allows deposit into MT5 account from binary account.
  ///
  /// For parameters information refer to [Mt5DepositRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5DepositResponse> deposit(Mt5DepositSend request) async {
    final Mt5DepositReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5DepositResponse.fromJson(
      response.mt5Deposit,
      response.binaryTransactionId,
    );
  }

  /// Creates a copy of instance with given parameters.
  Mt5DepositResponse copyWith({
    int? mt5Deposit,
    int? binaryTransactionId,
  }) =>
      Mt5DepositResponse(
        mt5Deposit: mt5Deposit ?? this.mt5Deposit,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
