// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Cashier withdrawal cancel response model class.
abstract class CashierWithdrawalCancelResponseModel {
  /// Initializes Cashier withdrawal cancel response model class .
  const CashierWithdrawalCancelResponseModel({
    this.cashierWithdrawalCancel,
  });

  /// Cancellation details
  final CashierWithdrawalCancel? cashierWithdrawalCancel;
}

/// Cashier withdrawal cancel response class.
class CashierWithdrawalCancelResponse
    extends CashierWithdrawalCancelResponseModel {
  /// Initializes Cashier withdrawal cancel response class.
  const CashierWithdrawalCancelResponse({
    super.cashierWithdrawalCancel,
  });

  /// Creates an instance from JSON.
  factory CashierWithdrawalCancelResponse.fromJson(
    dynamic cashierWithdrawalCancelJson,
  ) =>
      CashierWithdrawalCancelResponse(
        cashierWithdrawalCancel: cashierWithdrawalCancelJson == null
            ? null
            : CashierWithdrawalCancel.fromJson(cashierWithdrawalCancelJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (cashierWithdrawalCancel != null) {
      resultMap['cashier_withdrawal_cancel'] =
          cashierWithdrawalCancel!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierWithdrawalCancelResponse copyWith({
    CashierWithdrawalCancel? cashierWithdrawalCancel,
  }) =>
      CashierWithdrawalCancelResponse(
        cashierWithdrawalCancel:
            cashierWithdrawalCancel ?? this.cashierWithdrawalCancel,
      );
}

/// StatusCodeEnum mapper.
final Map<String, StatusCodeEnum> statusCodeEnumMapper =
    <String, StatusCodeEnum>{
  "CANCELLED": StatusCodeEnum.cancelled,
};

/// StatusCode Enum.
enum StatusCodeEnum {
  /// CANCELLED.
  cancelled,
}
/// Cashier withdrawal cancel model class.
abstract class CashierWithdrawalCancelModel {
  /// Initializes Cashier withdrawal cancel model class .
  const CashierWithdrawalCancelModel({
    required this.statusCode,
    required this.id,
  });

  /// The status code of the cancellation.
  final StatusCodeEnum statusCode;

  /// The unique identifier for the transaction.
  final String id;
}

/// Cashier withdrawal cancel class.
class CashierWithdrawalCancel extends CashierWithdrawalCancelModel {
  /// Initializes Cashier withdrawal cancel class.
  const CashierWithdrawalCancel({
    required super.id,
    required super.statusCode,
  });

  /// Creates an instance from JSON.
  factory CashierWithdrawalCancel.fromJson(Map<String, dynamic> json) =>
      CashierWithdrawalCancel(
        id: json['id'],
        statusCode: statusCodeEnumMapper[json['status_code']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['status_code'] = statusCodeEnumMapper.entries
        .firstWhere((MapEntry<String, StatusCodeEnum> entry) =>
            entry.value == statusCode)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CashierWithdrawalCancel copyWith({
    String? id,
    StatusCodeEnum? statusCode,
  }) =>
      CashierWithdrawalCancel(
        id: id ?? this.id,
        statusCode: statusCode ?? this.statusCode,
      );
}
