import 'package:meta/meta.dart';

import '../../basic_api/generated/mt5_withdrawal_receive.dart';
import '../../basic_api/generated/mt5_withdrawal_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 withdrawal response model class
abstract class Mt5WithdrawalResponseModel {
  /// Initializes
  Mt5WithdrawalResponseModel({
    @required this.mt5Withdrawal,
    @required this.binaryTransactionId,
  });

  /// `1` on success
  final int mt5Withdrawal;

  /// Deposit reference ID of Binary account.
  final int binaryTransactionId;
}

/// Mt5 withdrawal response class
class Mt5WithdrawalResponse extends Mt5WithdrawalResponseModel {
  /// Initializes
  Mt5WithdrawalResponse({
    @required int mt5Withdrawal,
    @required int binaryTransactionId,
  }) : super(
          mt5Withdrawal: mt5Withdrawal,
          binaryTransactionId: binaryTransactionId,
        );

  /// Creates an instance from JSON
  factory Mt5WithdrawalResponse.fromJson(
    dynamic mt5WithdrawalJson,
    dynamic binaryTransactionIdJson,
  ) =>
      Mt5WithdrawalResponse(
        mt5Withdrawal: mt5WithdrawalJson,
        binaryTransactionId: binaryTransactionIdJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_withdrawal'] = mt5Withdrawal;
    resultMap['binary_transaction_id'] = binaryTransactionId;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Allows withdrawal from MT5 account to Binary account.
  ///
  /// For parameters information refer to [Mt5WithdrawalRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5WithdrawalResponse> withdraw(
    Mt5WithdrawalSend request,
  ) async {
    final Mt5WithdrawalReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5WithdrawalResponse.fromJson(
      response.mt5Withdrawal,
      response.binaryTransactionId,
    );
  }

  /// Creates a copy of instance with given parameters
  Mt5WithdrawalResponse copyWith({
    int mt5Withdrawal,
    int binaryTransactionId,
  }) =>
      Mt5WithdrawalResponse(
        mt5Withdrawal: mt5Withdrawal ?? this.mt5Withdrawal,
        binaryTransactionId: binaryTransactionId ?? this.binaryTransactionId,
      );
}
